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

	<!-- START: mode="get-root" -->
	<xsl:template match="text()" mode="get-root" />
	<!-- We don't want text nodes to be part of the name of the root element -->
	<xsl:template match="*" mode="get-root">
		<xsl:apply-templates mode="get-root" />
	</xsl:template>
	<xsl:template match="ref" mode="get-root">
		<xsl:apply-templates mode="get-root" select="//define[@name eq current()/@name]" />
	</xsl:template>
	<xsl:template match="element" mode="get-root">
		<xsl:value-of select="@name" />
	</xsl:template>
	<!-- END: mode="get-root" -->
	
	
	<!-- Start: mode="menu-present-other-feature-stuff" -->
	<xsl:template match="*" mode="menu-present-other-feature-stuff">
		<div class="indent">
			<strong>
				<xsl:value-of select="local-name()" />
				<xsl:text>: </xsl:text>
			</strong>
			<br />
			<xsl:apply-templates mode="menu-present-other-feature-stuff" />
		</div>
	</xsl:template>
	<xsl:template match="text()" mode="menu-present-other-feature-stuff">
		<code class="text">
			<xsl:value-of select="." />
		</code>
	</xsl:template>
	
	<xsl:template match="value" mode="menu-present-other-feature-stuff">
		<xsl:variable name="host" as="element()"
			select="
			(
			$SCHEMA.REORGANIZED/rng-element-list-grouped//*[@zsd:define-name eq current()/@zsd:define-name],
			$SCHEMA.REORGANIZED/rng-attribute-list-grouped//*[@zsd:define-name eq current()/@zsd:define-name]
			)[1]
			" />
		<xsl:text>The value </xsl:text>
		<code>
			<xsl:value-of select="." />
		</code>
		<xsl:text>, added to the </xsl:text>
		<a href="{concat($documentation.subfolder,$host/@zsd:doc-pointer)}">
			<code>
				<xsl:value-of select="$host/@zsd:qname" />
			</code>
			<xsl:text> attribute</xsl:text>
		</a>
	</xsl:template>
	<!-- End: mode="menu-present-other-feature-stuff" -->
	
	
	<!-- Start: mode="toc01" -->
	<xsl:template match="x:h1 | x:h2 | x:h3 | x:h4 | x:h5 | x:h6" mode="toc01">
		<li class="{local-name()}">
			<a href="{concat('#',if (@id) then @id else generate-id())}">
				<xsl:value-of select="." />
			</a>
		</li>
	</xsl:template>
	<!-- End: mode="toc01" -->
	
	<!-- Start: mode="toc02" -->
	<xsl:template match="x:h1 | x:h2 | x:h3 | x:h4 | x:h5 | x:h6" mode="toc02">
		<!-- Copy the element, but also add a unique id -->
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:if test="not(@id)">
				<xsl:attribute name="id" select="generate-id()" />
			</xsl:if>
			<xsl:apply-templates mode="toc02" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="*" mode="toc02">
		<!-- Copy the element, with no extras -->
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates mode="toc02" />
		</xsl:copy>
	</xsl:template>
	<!-- End: mode="toc02" -->
	
</xsl:stylesheet>
