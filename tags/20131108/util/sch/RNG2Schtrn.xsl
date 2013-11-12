<?xml version="1.0" encoding="UTF-8"?>
<!--
	Stylesheet for extracting Schematron information from a RELAX-NG schema.
	Based on the stylesheet for extracting Schematron information from W3C XML Schema.
	Created by Eddie Robertsson 2002/06/01
-->
<!-- 
	2007/04/24      George Bina: Handle both ISO Schematron and old Schematron schemas
-->
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:sch="http://www.ascc.net/xml/schematron" 
	xmlns:rng="http://relaxng.org/ns/structure/1.0"
	xmlns:iso="http://purl.oclc.org/dsdl/schematron"
	exclude-result-prefixes="sch iso rng">
	<!-- Set the output to be XML with an XML declaration and use indentation -->
	<xsl:output method="xml" omit-xml-declaration="no" indent="yes" standalone="yes"/>
	<!-- -->
	<!-- match schema and call recursive template to extract included schemas -->
	<!-- -->
	<xsl:template match="/rng:grammar | /rng:element">
		<!-- call the schema definition template ... -->
		<xsl:call-template name="gatherSchemaRNG">
			<!-- ... with current node as the $schemas parameter ... -->
			<xsl:with-param name="schemas" select="."/>
			<!-- ... and any includes in the $include parameter -->
			<xsl:with-param name="includes" select="document(/rng:grammar/rng:include/@href
| //rng:externalRef/@href)"/>
		</xsl:call-template>
	</xsl:template>
	<!-- -->
	<!-- gather all included schemas into a single parameter variable -->
	<!-- -->
	<xsl:template name="gatherSchemaRNG">
		<xsl:param name="schemas"/>
		<xsl:param name="includes"/>
		<xsl:choose>
			<xsl:when test="count($schemas) &lt; count($schemas | $includes)">
				<!-- when $includes includes something new, recurse ... -->
				<xsl:call-template name="gatherSchemaRNG">
					<!-- ... with current $includes added to the $schemas parameter ... -->
					<xsl:with-param name="schemas" select="$schemas | $includes"/>
					<!-- ... and any *new* includes in the $include parameter -->
					<xsl:with-param name="includes" select="document($includes/rng:grammar/rng:include/@href
| $includes//rng:externalRef/@href)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<!-- we have the complete set of included schemas, so now let's output the embedded schematron -->
				<xsl:call-template name="outputRNG">
					<xsl:with-param name="schemas" select="$schemas"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- -->
	<!-- output the schematron information -->
	<!-- -->
	<xsl:template name="outputRNG">
		<xsl:param name="schemas"/>
		<!-- -->
		<xsl:choose>
			<xsl:when test="$schemas//iso:*">
				<iso:schema queryBinding="xslt2">
					<!-- get header-type elements - eg title and especially ns -->
					<!-- title (just one) -->
					<xsl:copy-of select="$schemas//iso:title[1]"/>
					<!-- get remaining schematron schema children -->
					<!-- get non-blank namespace elements, dropping duplicates -->
					<xsl:for-each select="$schemas//iso:ns">
						<xsl:if test="generate-id(.) = generate-id($schemas//iso:ns[@prefix = current()/@prefix][1])">
							<xsl:copy-of select="."/>
						</xsl:if>
					</xsl:for-each>
					<xsl:copy-of select="$schemas//iso:phase"/>
					<xsl:copy-of select="$schemas//iso:pattern"/>
					<iso:diagnostics>
						<xsl:copy-of select="$schemas//iso:diagnostics/*"/>
					</iso:diagnostics>
				</iso:schema>
			</xsl:when>
			<xsl:otherwise>
				<sch:schema>
					<!-- get header-type elements - eg title and especially ns -->
					<!-- title (just one) -->
					<xsl:copy-of select="$schemas//sch:title[1]"/>
					<!-- get remaining schematron schema children -->
					<!-- get non-blank namespace elements, dropping duplicates -->
					<xsl:for-each select="$schemas//sch:ns">
						<xsl:if test="generate-id(.) = generate-id($schemas//sch:ns[@prefix = current()/@prefix][1])">
							<xsl:copy-of select="."/>
						</xsl:if>
					</xsl:for-each>
					<xsl:copy-of select="$schemas//sch:phase"/>
					<xsl:copy-of select="$schemas//sch:pattern"/>
					<sch:diagnostics>
						<xsl:copy-of select="$schemas//sch:diagnostics/*"/>
					</sch:diagnostics>
				</sch:schema>
			</xsl:otherwise>
		</xsl:choose>
		

	</xsl:template>
	<!-- -->
</xsl:transform>