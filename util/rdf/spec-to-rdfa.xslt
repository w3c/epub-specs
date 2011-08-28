<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xhtm="http://www.w3.org/1999/xhtml" 
	exclude-result-prefixes="xsl xhtm">

	<xsl:output method="xml" version="1.0" 
		encoding="UTF-8" 
		omit-xml-declaration="no" 
		indent="no"/>

	<!-- the canonical URI of the vocab being rendered -->
	<xsl:param name="vocab-canonical-uri" required="yes"/>

	<!-- vocab name -->
	<xsl:param name="vocab-name" required="yes"/>
	
	<xsl:template match="/">
		<html xml:lang="en-US" version="XHTML+RDFa 1.0"
			xmlns:dcterms="http://purl.org/dc/terms/"
			xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
			xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
			xmlns:xsd="http://www.w3.org/2001/XMLSchema">
			<head>
				<xsl:apply-templates select="xhtm:html/xhtm:head/*"/>
			</head>
			<body>
				<xsl:apply-templates select="xhtm:html/xhtm:body/@*|xhtm:html/xhtm:body/*"/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="xhtm:div[starts-with(@id, 'rdfa-vocab')]">
		<xsl:element name="div">
			<xsl:variable name="id" select="substring(@id, 12)"/>
			<xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
			<xsl:attribute name="typeof">rdf:Bag</xsl:attribute>
			<xsl:attribute name="about">#<xsl:value-of select="$id"/></xsl:attribute>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="xhtm:td[@class='rdfa-property']">
		<xsl:element name="td">
			<xsl:apply-templates select="@*"/>
			<xsl:variable name="bag-id" select="substring(ancestor::xhtm:div[starts-with(@id, 'rdfa-vocab')]/@id, 12)"/>
			<xsl:attribute name="rev">rdfs:member</xsl:attribute>
			<xsl:attribute name="about">#<xsl:value-of select="$bag-id"/></xsl:attribute>
			<xsl:element name="code">
				<xsl:apply-templates select="xhtm:code/@*"/>
				<xsl:element name="span">
					<xsl:apply-templates select="xhtm:code/xhtm:span/@*|xhtm:code/xhtm:span/xhtm:a/@title"/>
					<xsl:value-of select="xhtm:code/xhtm:span/xhtm:a"/>
				</xsl:element>
				<xsl:text> </xsl:text>
				<xsl:element name="span">
					<xsl:variable name="id"><xsl:value-of select="ancestor::xhtm:table/@id"/></xsl:variable>
					<xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
					<xsl:attribute name="typeof">rdf:Property</xsl:attribute>
					<xsl:attribute name="about">#<xsl:value-of select="$id"/></xsl:attribute>
					<xsl:apply-templates select="xhtm:code/node()[normalize-space()][not(self::xhtm:span)]"/>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="xhtm:td[@class='rdfa-property-desc']">
		<xsl:element name="td">
			<xsl:variable name="id"><xsl:value-of select="ancestor::xhtm:table/@id"/></xsl:variable>
			<xsl:attribute name="property">rdfs:comment</xsl:attribute>
			<xsl:attribute name="about">#<xsl:value-of select="$id"/></xsl:attribute>
			<xsl:attribute name="datatype">xsd:string</xsl:attribute>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="@id[parent::xhtm:table[descendant::xhtm:td[@class='rdfa-property']] or parent::xhtm:div[starts-with(@id, 'rdfa-vocab')]]"/>
	
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
</xsl:stylesheet>
