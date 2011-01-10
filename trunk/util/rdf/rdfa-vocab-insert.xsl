<xsl:stylesheet version="2.0" xmlns="http://docbook.org/ns/docbook"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xhtm="http://www.w3.org/1999/xhtml"
	exclude-result-prefixes="xsl xsd xhtm">
	
	<xsl:param name="vocab-file" as="xsd:string" required="yes"/>
	<xsl:param name="vocab-name" as="xsd:string" required="yes"/>

	<xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes"/>
	
	<xsl:variable name="vocab-filepath-corrected" select="concat('file:///', translate($vocab-file, '\\', '/'))"/>
	<xsl:variable name="vocab" select="document($vocab-filepath-corrected)/xhtm:html"/>
	
	<!-- name of the PIs to replace for this vocab -->
	<xsl:variable name="vocab-pi" select="concat('insert-',$vocab-name,'-vocab')"/>
	
	<xsl:template match="processing-instruction()[name()=$vocab-pi]" priority="1">
		<xsl:variable name="bag-name" select="."/>
		
		<!-- strip the -props extension on bag names for use in table id -->
		<xsl:variable name="bag-nicename" select="replace($bag-name, '-props', '')"/>
		
		<xsl:choose>
			<xsl:when test="not($vocab//xhtm:div[@id=$bag-name])">
				<xsl:message>ERROR: No matching bag found for <xsl:value-of select="$bag-name"/></xsl:message>
			</xsl:when>
			<xsl:otherwise>
				<informaltable>
					<xsl:attribute name="xml:id">tbl-opf-meta-property-values-<xsl:value-of select="$bag-nicename"/></xsl:attribute>
					<xsl:attribute name="title"><xsl:value-of select="$vocab//xhtm:div[@id=$bag-name]/xhtm:h2"/></xsl:attribute>
					<thead>
						<tr>
							<th>property name</th>
							<th>definition</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="$vocab//xhtm:div[@id=$bag-name]/xhtm:dl/xhtm:dt">
							<tr>
								<td>
									<literal><xsl:value-of select="."/></literal>
								</td>
								<td>
									<xsl:value-of select="following-sibling::xhtm:dd[1]/node()"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</informaltable>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
