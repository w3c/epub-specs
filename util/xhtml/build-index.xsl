<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.fn.org/"
    xmlns:html="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    version="2.0">
    
    <xsl:param name="file-list"/>
    <xsl:param name="base"/>
    
    <xsl:template match="/">        
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <title>EPUB3 Drafts - Index</title>
                <link rel="stylesheet" type="text/css" href="epub-spec.css" />
            </head>    
            <body>
                <h1>EPUB3 Drafts - Index</h1>
                <dl>
                <dt>Specifications</dt>                
                <xsl:for-each select="tokenize($file-list,';')">
                    <xsl:variable name="path" select="current()"/>
                    <xsl:choose>
                        <xsl:when test="starts-with($path, 'spec/')">
                            <dd>
                                <a href="{$path}"><xsl:value-of select="fn:get-title($path)"/></a>
                            </dd>
                        </xsl:when>                        
                    </xsl:choose>                    
                </xsl:for-each>
                </dl>
                <dl>
                    <dt>Schemas</dt>                
                    <xsl:for-each select="tokenize($file-list,';')">                        
                        <xsl:variable name="path" select="current()"/>
                        <xsl:choose>
                            <xsl:when test="starts-with($path, 'schema/') and not(starts-with($path, 'schema/mod')) and not(contains($path, 'ncx'))">
                                <dd>
                                    <a href="{$path}"><xsl:value-of select="substring-after($path,'/')"/></a>
                                </dd>
                            </xsl:when>                        
                        </xsl:choose>                    
                    </xsl:for-each>
                </dl>
                <!--
                <dl>
                    <dt>Metadata Vocabularies</dt>                
                    <xsl:for-each select="tokenize($file-list,';')">                        
                        <xsl:variable name="path" select="current()"/>
                        <xsl:choose>
                            <xsl:when test="starts-with($path, 'vocab/')">
                                <dd>
                                    <a href="{$path}"><xsl:value-of select="fn:get-title($path)"/></a>
                                </dd>
                            </xsl:when>                        
                        </xsl:choose>                    
                    </xsl:for-each>
                </dl>
                -->
            </body>
        </html>        
    </xsl:template>
        
    <xsl:function name="fn:get-title" as="xs:string">
        <xsl:param name="path" as="xs:string"/>        
        <xsl:variable name="file" select="resolve-uri($path, $base)"></xsl:variable>                
        <xsl:value-of select="doc($file)//html:head/html:title"/>
        
    </xsl:function>
    
</xsl:stylesheet>