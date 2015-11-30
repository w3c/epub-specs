<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:db="http://docbook.org/ns/docbook" xmlns:fn="http://idpf.org/fn"
    xmlns:epub="http://www.idpf.org/2011/epub" xmlns:xlink="http://www.w3.org/1999/xlink">
    
    <xsl:param name="spec-name" required="yes"/>

    <xsl:output method="xml" encoding="UTF-8" exclude-result-prefixes="db" indent="no"/>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="db:biblioentry[matches('refEPUB3refOverview3refPackages3refOCF3refOverlays3refContentDocs3',@xml:id)]/db:title/db:link">
        <xsl:copy>
            <xsl:attribute name="xlink:href">
                <xsl:choose>
                    <xsl:when test="$spec-name eq 'idx'">
                        <xsl:choose>
                            <xsl:when test="parent::db:biblioentry/@xml:id = 'refEPUBCFI'">../linking/cfi/</xsl:when>
                            <xsl:otherwise>../31/spec/</xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$spec-name eq 'vocab'">
                        <xsl:choose>
                            <xsl:when test="parent::db:biblioentry/@xml:id = 'refEPUBCFI'">../../linking/cfi/</xsl:when>
                            <xsl:otherwise>../../31/spec/</xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$spec-name eq 'cfi'">
                        <xsl:text>../../31/spec/</xsl:text>
                    </xsl:when>
                </xsl:choose>
                <xsl:value-of select="@xlink:href"/>
            </xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
