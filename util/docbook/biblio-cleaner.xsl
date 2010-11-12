<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:db="http://docbook.org/ns/docbook" xmlns:fn="http://much-fun.org/fn">

    <xsl:output method="xml" encoding="UTF-8" exclude-result-prefixes="db"/>

    <!-- remove all db:biblioentry that are not referenced from body (via @linkend) -->
    <!-- also remove bibliography or bibliodiv that end up empty -->
    <!-- sort the remaining entries alphabetically by abbrev -->
    
    <xsl:variable name="linkends" select="//*[@linkend]" as="element()*"/>
    
    <xsl:template match="db:bibliography">                
        <xsl:if test="count(fn:strip($linkends, .)) &gt; 0">
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:apply-templates />
                <xsl:for-each select="./db:bibliodiv">
                    <xsl:variable name="entries" select="fn:strip($linkends, current())" as="element()*"/>
                        <xsl:if test="count($entries) &gt; 0">
                            <xsl:copy>        
                                <xsl:copy-of select="@*"/>
                                <xsl:apply-templates />    
                                <xsl:for-each select="$entries">
                                    <xsl:sort select="db:abbrev"/>
                                    <xsl:copy-of select="current()"/>
                                </xsl:for-each>
                            </xsl:copy>
                        </xsl:if>                  
                </xsl:for-each>
            </xsl:copy>
        </xsl:if>        
    </xsl:template>    
    
    <xsl:template match="db:bibliodiv"/>
    <xsl:template match="db:biblioentry"/>  
    
    <xsl:function name="fn:strip" as="element()*">
        <xsl:param name="linkends" as="element()*"/>        
        <xsl:param name="parent" as="element()"/>   
        <xsl:sequence select="$parent//db:biblioentry[some $node in $linkends satisfies $node/@linkend eq @xml:id]" />
    </xsl:function>
    
    <xsl:template match="*">
        <xsl:copy>
            <xsl:copy-of select="@*" />
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
