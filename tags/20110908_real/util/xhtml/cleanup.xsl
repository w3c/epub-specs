<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"    
    xmlns:x="http://www.w3.org/1999/xhtml"
    xmlns:db="http://docbook.org/ns/docbook">

    <xsl:output method="xml" encoding="UTF-8" indent="no"/>
    
    <!-- cleanup xhtml output by oxygen pretty-printed docbook, run through docbook xslt suite -->  
    
    <xsl:template match="text()">
        <xsl:variable name="normalized" select="normalize-space(.)"/>
        <xsl:choose>
            <xsl:when test="parent::x:pre">
                <xsl:value-of select="." />
            </xsl:when>
            <xsl:when test="preceding-sibling::x:a and $normalized='.'">
                <xsl:text>. </xsl:text>
            </xsl:when>
            <xsl:when test="$normalized = ''">
                <xsl:text> </xsl:text>
            </xsl:when>
            <xsl:when test="$normalized != ''">
                <xsl:value-of select="replace(.,'\s+',' ')" />
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    
    <xsl:template match="x:p[@class='para']|x:code[@class='code']|x:abbr[@class='abbrev']">
        <xsl:element namespace="{namespace-uri(.)}" name="{local-name(.)}">
            <xsl:copy-of select="@*[not(name()='class')]"/>
            <xsl:apply-templates />
        </xsl:element> 
    </xsl:template>    
    
    <xsl:template match="x:span[@class='emphasis' and count(child::node())=1 and local-name(./*)='em']">        
        <xsl:apply-templates select="./*" />
    </xsl:template>

    <xsl:template match="*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
