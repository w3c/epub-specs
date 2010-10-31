<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs rng xd dcterms z rdf zrng zsd a x sch" version="2.0"
	xmlns="http://www.w3.org/1999/xhtml" xmlns:dcterms="http://purl.org/dc/terms/"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rng="http://relaxng.org/ns/structure/1.0" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:z="http://www.daisy.org/ns/z3986/annotations/#"
	xmlns:zrng="http://www.daisy.org/ns/rng/annotations" xmlns:x="http://www.w3.org/1999/xhtml"
	xmlns:zsd="http://www.daisy.org/ns/rng/schemadoc"
	xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
	xmlns:sch="http://purl.oclc.org/dsdl/schematron"
	xmlns:db="http://docbook.org/ns/docbook"
	xpath-default-namespace="http://relaxng.org/ns/structure/1.0">

	<xsl:function name="zsd:elementVariant" as="xs:string">
		<xsl:param name="element" as="element()" />
		<xsl:value-of select="($element/@zsd:context,&quot;UNDEFINED&quot;)[1]" />
	</xsl:function>
	
	<xsl:function name="zsd:elementNamespacePrefix" as="xs:string?">
		<xsl:param name="ns-uri" as="xs:string" />
		<xsl:value-of select="$SCHEMA.NAMESPACE-MAP//zsd:ns[@ns-uri eq $ns-uri]/@prefix" />
	</xsl:function>
	
	<xsl:function name="zsd:elementNamespaceURI" as="xs:string?">
		<xsl:param name="ns-prefix" as="xs:string" />
		<xsl:value-of select="$SCHEMA.NAMESPACE-MAP//zsd:ns[@prefix eq $ns-prefix]/@ns-uri" />
	</xsl:function>
	
	<xsl:function name="zsd:adjustURI" as="xs:string">
		<xsl:param name="uri" as="xs:string" />
		<xsl:param name="ensureTrailingSlash" as="xs:boolean" />
		
		<!-- replace \ with /, and store in $uriA -->
		<xsl:variable name="uriA" as="xs:string" select="translate($uri,'\','/')" />
		
		<!-- Add suitable 'file:' prefix, and store in $uriB -->
		<xsl:variable name="uriB" as="xs:string">
			<xsl:choose>
				<xsl:when test="starts-with($uriA,'file:')">
					<!-- URI starts with 'file:', so let's assume it's okay -->
					<xsl:value-of select="$uriA" />
				</xsl:when>
				<xsl:when test="starts-with($uriA,'/')">
					<!-- URI starts with a slash, so just add 'file:' -->
					<xsl:value-of select="concat('file:',$uriA)" />
				</xsl:when>
				<xsl:otherwise>
					<!-- Not starting with slash nor 'file:', so $uriSlash is likely to be on the form 'x:/foo/bar...' -->
					<xsl:value-of select="concat('file:/',$uriA)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<!-- Ensure trailing slash, if required -->
		<xsl:choose>
			<xsl:when test="$ensureTrailingSlash and not(ends-with($uriB,'/'))">
				<xsl:value-of select="concat($uriB,'/')" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$uriB" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
</xsl:stylesheet>
