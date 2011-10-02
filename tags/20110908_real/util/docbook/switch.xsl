<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:db="http://docbook.org/ns/docbook" xmlns:fn="http://idpf.org/fn" xmlns:epub="http://www.idpf.org/2011/epub">

    <xsl:output method="xml" encoding="UTF-8" exclude-result-prefixes="db" indent="no"/>
     
    <xsl:variable name="current-spec-token">           
        <xsl:choose>
            <xsl:when test="ends-with(document-uri(/), 'changes.xml')">changes</xsl:when>
            <xsl:when test="ends-with(document-uri(/), 'contentdocs.xml')">contentdocs</xsl:when>
            <xsl:when test="ends-with(document-uri(/), 'mediaoverlays.xml')">mediaoverlays</xsl:when>
            <xsl:when test="ends-with(document-uri(/), 'ocf.xml')">ocf</xsl:when>
            <xsl:when test="ends-with(document-uri(/), 'overview.xml')">overview</xsl:when>
            <xsl:when test="ends-with(document-uri(/), 'publications.xml')">publications</xsl:when>
            <xsl:when test="ends-with(document-uri(/), 'cfi.xml')">cfi</xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">no match for $current-spec-token in match.xsl</xsl:message>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:variable> 
    
    <!-- dont copy if we have value 'default' but a match on spec token on a sibling -->
    <xsl:template match="*[@epub:spec-include and @epub:spec-include eq 'default' and ../*[@epub:spec-include eq $current-spec-token]]" />
    
    <!-- dont copy if we have value other than 'default' and other than spec token -->
    <xsl:template match="*[@epub:spec-include and not(@epub:spec-include eq 'default') and not(@epub:spec-include eq $current-spec-token)]" />
                
    <xsl:template match="*|comment()">
        <xsl:copy>
            <xsl:copy-of select="@*[not(namespace-uri() eq 'http://www.idpf.org/2011/epub')]"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
