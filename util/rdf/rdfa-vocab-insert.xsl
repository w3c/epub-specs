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
									<xsl:apply-templates select="rdfs:comment/node()"/>
								</td>
							</tr>
							<tr>
								<th>Allowed value(s):</th>
								<td>
									<xsl:choose>
										<xsl:when test="not(child::zt:value)">xsd:string</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="child::zt:value/node()"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<th>Applies to:</th>
								<td>
									<xsl:choose>
										<xsl:when test="not(child::zt:for)">all</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="child::zt:for">
												<xsl:if test="not(position()=1)">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="."/>
											</xsl:for-each>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</tbody>
					</informaltable>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
