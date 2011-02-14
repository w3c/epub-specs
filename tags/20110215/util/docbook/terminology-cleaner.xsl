<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:db="http://docbook.org/ns/docbook" xmlns:fn="http://idpf.org/fn">

    <xsl:output method="xml" encoding="UTF-8" exclude-result-prefixes="db"/>

    <!-- remove all db:glossentry that are not referenced from body (via @linkend) -->
    <!-- sort the remaining entries alphabetically by glossterm -->

    <xsl:variable name="linkends" select="//*[@linkend]" as="element()*"/>

    <xsl:template match="db:glosslist">
        <xsl:variable name="glossentries" select="fn:strip($linkends, .)" as="element()*"/>        
        <xsl:if test="count($glossentries) &gt; 0">
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:apply-templates/>                                                
                <xsl:for-each select="$glossentries">
                    <!--<xsl:sort select="db:glossterm"/>-->
                    <xsl:copy-of select="current()"/>
                </xsl:for-each>
            </xsl:copy>
        </xsl:if>
    </xsl:template>

    <xsl:template match="db:glossentry"/>

    <xsl:function name="fn:strip" as="element()*">
        <xsl:param name="linkends" as="element()*"/>
        <xsl:param name="parent" as="element()"/>
        <xsl:sequence
            select="$parent//db:glossentry[some $node in $linkends satisfies $node/@linkend eq @xml:id]"
        />
    </xsl:function>

    <xsl:template match="*|comment()">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
