<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:saxon="http://icl.com/saxon" xmlns:exsl="http://exslt.org/common"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
    xmlns:xtbl="xalan://com.nwalsh.xalan.Table" xmlns:lxslt="http://xml.apache.org/xslt"
    xmlns:ptbl="http://nwalsh.com/xslt/ext/xsltproc/python/Table"
    xmlns:stbl="http://nwalsh.com/xslt/ext/com.nwalsh.saxon.Table"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="doc stbl xtbl lxslt ptbl saxon exsl xlink">
    
    <!-- suppress top nav on first page -->
    <xsl:param name="navig.header.on.first.page">0</xsl:param>
    <xsl:param name="navig.user.header.on.first.page">0</xsl:param>
    
    <xsl:template name="chunk-element-content">
        <xsl:param name="prev"/>
        <xsl:param name="next"/>
        <xsl:param name="nav.context"/>
        <xsl:param name="content">
            <xsl:apply-imports/>
        </xsl:param>
        
        <html>
            <xsl:call-template name="html.head">
                <xsl:with-param name="prev" select="$prev"/>
                <xsl:with-param name="next" select="$next"/>
            </xsl:call-template>
            
            <body>
                <xsl:call-template name="body.attributes"/>
                <xsl:call-template name="user.header.navigation"/>
                
                <xsl:if test="$prev or $navig.header.on.first.page != 0">
                    <xsl:call-template name="header.navigation">
                        <xsl:with-param name="prev" select="$prev"/>
                        <xsl:with-param name="next" select="$next"/>
                        <xsl:with-param name="nav.context" select="$nav.context"/>
                    </xsl:call-template>
                </xsl:if>
                
                <xsl:if test="$prev or $navig.user.header.on.first.page != 0">
                    <xsl:call-template name="user.header.content"/>
                </xsl:if>
                
                <xsl:copy-of select="$content"/>
                
                <xsl:call-template name="user.footer.content"/>
                
                <xsl:call-template name="footer.navigation">
                    <xsl:with-param name="prev" select="$prev"/>
                    <xsl:with-param name="next" select="$next"/>
                    <xsl:with-param name="nav.context" select="$nav.context"/>
                </xsl:call-template>
                
                <xsl:call-template name="user.footer.navigation"/>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>