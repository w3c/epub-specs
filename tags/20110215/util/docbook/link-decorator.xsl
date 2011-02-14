<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:db="http://docbook.org/ns/docbook" 
    xmlns:fn="http://idpf.org/fn" 
    xmlns:epub="http://www.idpf.org/2011/epub">

    <xsl:output method="xml" encoding="UTF-8" exclude-result-prefixes="db"/>
    
    <!-- decorate links with different roles in order to be able to style them differently -->
    
    <xsl:template match="*[@linkend]">
        <xsl:variable name="ref"><xsl:value-of select="@linkend"/></xsl:variable>
        <xsl:variable name="target" select="//*[@xml:id eq $ref]" />
        
        <xsl:if test="not($target)">
            <xsl:message terminate="yes">No target found for '<xsl:value-of select="$ref"/>' </xsl:message>
        </xsl:if>
        
        <xsl:element name="{local-name(.)}" namespace="http://docbook.org/ns/docbook">
            <xsl:copy-of select="@*"/>
            <xsl:choose>
                <xsl:when test="local-name($target) eq 'glossentry'">
                    <xsl:attribute name="role">glossterm</xsl:attribute>
                </xsl:when>
                <xsl:when test="local-name($target) eq 'biblioentry'">
                    <xsl:attribute name="role">biblioref</xsl:attribute>
                </xsl:when>
            </xsl:choose>            
            <xsl:apply-templates/>
        </xsl:element>
                
    </xsl:template>    
    
    <xsl:template match="*|comment()">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
