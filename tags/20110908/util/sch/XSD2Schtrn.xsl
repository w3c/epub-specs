<?xml version="1.0" encoding="UTF-8"?>
<!--
        based on an original transform by Eddie Robertsson
        2001/04/21      fn: added support for included schemas
        2001/06/27      er: changed XMl Schema prefix from xsd: to xs: and changed to the Rec namespace
-->
<!-- 
        2007/04/24      George Bina: Handle both ISO Schematron and old Schematron schemas
-->
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:sch="http://www.ascc.net/xml/schematron" 
        xmlns:iso="http://purl.oclc.org/dsdl/schematron"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        exclude-result-prefixes="sch iso xs"
        >
        <!-- Set the output to be XML with an XML declaration and use indentation -->
        <xsl:output method="xml" omit-xml-declaration="no" indent="yes" standalone="yes"/>
        <!-- -->
        <!-- match schema and call recursive template to extract included schemas -->
        <!-- -->
        <xsl:template match="xs:schema">
                <!-- call the schema definition template ... -->
                <xsl:call-template name="gatherSchemaXSD">
                        <!-- ... with current current root as the $schemas parameter ... -->
                        <xsl:with-param name="schemas" select="/"/>
                        <!-- ... and any includes in the $include parameter -->
                        <xsl:with-param name="includes" 
                                select="document(/xs:schema/xs:*[self::xs:include or self::xs:import or self::xs:redefine]/@schemaLocation)"/>
                </xsl:call-template>
        </xsl:template>
        <!-- -->
        <!-- gather all included schemas into a single parameter variable -->
        <!-- -->
        <xsl:template name="gatherSchemaXSD">
                <xsl:param name="schemas"/>
                <xsl:param name="includes"/>
                <xsl:choose>
                        <xsl:when test="count($schemas) &lt; count($schemas | $includes)">
                                <!-- when $includes includes something new, recurse ... -->
                                <xsl:call-template name="gatherSchemaXSD">
                                        <!-- ... with current $includes added to the $schemas parameter ... -->
                                        <xsl:with-param name="schemas" select="$schemas | $includes"/>
                                        <!-- ... and any *new* includes in the $include parameter -->
                                        <xsl:with-param name="includes" 
                                                select="document($includes/xs:schema/xs:*[self::xs:include or self::xs:import or self::xs:redefine]/@schemaLocation)"/>
                                </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                                <!-- we have the complete set of included schemas, 
                                        so now let's output the embedded schematron -->
                                <xsl:call-template name="outputXSD">
                                        <xsl:with-param name="schemas" select="$schemas"/>
                                </xsl:call-template>
                        </xsl:otherwise>
                </xsl:choose>
        </xsl:template>
        <!-- -->
        <!-- output the schematron information -->
        <!-- -->
        <xsl:template name="outputXSD">
                <xsl:param name="schemas"/>
                <!-- -->
                <xsl:choose>
                        <!-- Check if we have elements in the ISO namespace -->
                        <xsl:when test="$schemas//iso:*">
                                <iso:schema queryBinding="xslt2">
                                        <!-- get header-type elements - eg title and especially ns -->
                                        <!-- title (just one) -->
                                        <xsl:copy-of select="$schemas//xs:appinfo/iso:title[1]"/>
                                        <!-- get remaining schematron schema children -->
                                        <!-- get non-blank namespace elements, dropping duplicates -->
                                        <xsl:for-each select="$schemas//xs:appinfo/iso:ns">
                                                <xsl:if test="generate-id(.) = 
                                                        generate-id($schemas//xs:appinfo/iso:ns[@prefix = current()/@prefix][1])">
                                                        <xsl:copy-of select="."/>
                                                </xsl:if>
                                        </xsl:for-each>
                                        <xsl:copy-of select="$schemas//xs:appinfo/iso:phase"/>
                                        <xsl:copy-of select="$schemas//xs:appinfo/iso:pattern"/>
                                        <iso:diagnostics>
                                                <xsl:copy-of select="$schemas//xs:appinfo/iso:diagnostics/*"/>
                                        </iso:diagnostics>
                                </iso:schema>
                        </xsl:when>
                        <xsl:otherwise>
                                <sch:schema>
                                        <!-- get header-type elements - eg title and especially ns -->
                                        <!-- title (just one) -->
                                        <xsl:copy-of select="$schemas//xs:appinfo/sch:title[1]"/>
                                        <!-- get remaining schematron schema children -->
                                        <!-- get non-blank namespace elements, dropping duplicates -->
                                        <xsl:for-each select="$schemas//xs:appinfo/sch:ns">
                                                <xsl:if test="generate-id(.) = 
                                                        generate-id($schemas//xs:appinfo/sch:ns[@prefix = current()/@prefix][1])">
                                                        <xsl:copy-of select="."/>
                                                </xsl:if>
                                        </xsl:for-each>
                                        <xsl:copy-of select="$schemas//xs:appinfo/sch:phase"/>
                                        <xsl:copy-of select="$schemas//xs:appinfo/sch:pattern"/>
                                        <sch:diagnostics>
                                                <xsl:copy-of select="$schemas//xs:appinfo/sch:diagnostics/*"/>
                                        </sch:diagnostics>
                                </sch:schema>                
                        </xsl:otherwise>
                </xsl:choose>
        </xsl:template>
        <!-- -->
</xsl:transform>