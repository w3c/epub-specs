<xsl:stylesheet version="2.0" xmlns="http://docbook.org/ns/docbook"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:dcterms="http://purl.org/dc/terms/"
	xmlns:zt="http://www.daisy.org/ns/rdf/property#"
	exclude-result-prefixes="xsl xsd rdf rdfs dcterms zt">
	
	<xsl:param name="vocab-file" as="xsd:string" required="yes"/>
	<xsl:param name="vocab-name" as="xsd:string" required="yes"/>

	<xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes"/>
	
	<xsl:variable name="vocab-filepath-corrected" select="concat('file:///', translate($vocab-file, '\\', '/'))"/>
	<xsl:variable name="vocab" select="document($vocab-filepath-corrected)/rdf:RDF"/>
	
	<!-- name of the PIs to replace for this vocab -->
	<xsl:variable name="vocab-pi" select="concat('insert-',$vocab-name,'-vocab')"/>
	
	<xsl:template match="processing-instruction()[name()=$vocab-pi]" priority="1">
		<xsl:variable name="bag-name" select="."/>
		
		<!-- strip the -props extension on bag names for use in table id -->
		<xsl:variable name="bag-nicename" select="replace($bag-name, '-props', '')"/>
		
		<xsl:choose>
			<xsl:when test="not($vocab/rdf:Bag[@rdf:ID=$bag-name])">
				<xsl:message>ERROR: No matching bag found for <xsl:value-of select="$bag-name"/></xsl:message>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="$vocab/rdf:Bag[@rdf:ID=$bag-name]/rdf:Description">
					<informaltable class="property-table" cellspacing="0" cellpadding="0">
						<xsl:attribute name="xml:id">tbl-opf-meta-property-<xsl:value-of select="rdfs:label"/></xsl:attribute>
						<xsl:attribute name="title"><xsl:value-of select="$vocab//rdf:Bag[@rdf:ID=$bag-name]/dcterms:title"/></xsl:attribute>
						<tbody>
							<tr>
								<td class="rdfa-prop-label" colspan="2">
									<literal><xsl:value-of select="rdfs:label"/></literal>
								</td>
							</tr>
							<tr>
								<th>Description:</th>
								<td>
									<xsl:call-template name="wikiParse">
										<xsl:with-param name="str" select="rdfs:comment/node()"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<th>Used with:</th>
								<td>
									<xsl:choose>
										<xsl:when test="child::zt:for">
											<literal><xsl:value-of select="child::zt:for"/></literal>
										</xsl:when>
										<xsl:otherwise><literal>meta</literal></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<xsl:if test="not(child::zt:value='N/A')">
								<tr>
									<th>Allowed value(s):</th>
									<td>
										<xsl:choose>
											<xsl:when test="not(child::zt:value)"><literal>xsd:string</literal></xsl:when>
											<xsl:otherwise>
												<xsl:choose>
													<xsl:when test="starts-with(child::zt:value, 'xsd')">
														<literal><xsl:value-of select="child::zt:value/node()"/></literal>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="wikiParse">
															<xsl:with-param name="str" select="child::zt:value/node()"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="child::zt:extends">
								<tr>
									<th>Extends:</th>
									<td>
										<xsl:choose>
											<xsl:when test="child::zt:extends = 'all'">All properties.</xsl:when>
											<xsl:otherwise>
												<xsl:for-each select="child::zt:extends">
													<xsl:if test="not(position()=1)">
														<xsl:text>, </xsl:text>
													</xsl:if>
													<literal><xsl:value-of select="."/></literal>
												</xsl:for-each>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</informaltable>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="wikiParse">
		<xsl:param name="str"/>
		
		<xsl:variable name="new">
			<xsl:choose>
				<xsl:when test="contains($str, '{')">
					<xsl:variable name="st" select="substring-before($str, '{')"/>
					<xsl:variable name="end" select="substring-after($str, '}')"/>
					<xsl:variable name="substr-len" select="string-length($str)-string-length($st)-string-length($end)-2"/>
					<xsl:copy-of select="$st"/>
					<literal>
						<xsl:copy-of select="substring($str, string-length($st)+2, $substr-len)"/>
					</literal>
				</xsl:when>
				<!-- note - this is a hack to temporarily add comments to the spec - remove before release! -->
				<xsl:when test="contains($str, '!')">
					<xsl:variable name="st" select="substring-before($str, '!')"/>
					<xsl:variable name="end" select="substring-after($str, '^')"/>
					<xsl:variable name="substr-len" select="string-length($str)-string-length($st)-string-length($end)-2"/>
					<xsl:copy-of select="$st"/>
					<remark role="todo">
						<xsl:value-of select="substring($str, string-length($st)+2, $substr-len)"/>
					</remark>
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="$str"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:copy-of select="$new"/>
		
		<xsl:variable name="toparse">
			<xsl:choose>
				<xsl:when test="contains($str, '{')">
					<xsl:copy-of select="substring-after($str, '}')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="substring-after($str, '%')"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:choose>
			<xsl:when test="contains($toparse, '{')">
				<xsl:call-template name="wikiParse">
					<xsl:with-param name="str">
						<xsl:copy-of select="$toparse"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="contains($toparse, '!')">
				<xsl:call-template name="wikiParse">
					<xsl:with-param name="str">
						<xsl:copy-of select="$toparse"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="$toparse"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
