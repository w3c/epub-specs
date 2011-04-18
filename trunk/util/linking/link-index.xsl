<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:db="http://docbook.org/ns/docbook"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:param name="file-list" required="yes" as="xs:string"/>
    <xsl:param name="build-dir" required="yes"/>
    <xsl:param name="base-uri" required="yes"/>
    
    <xsl:variable name="os-safe-spec-dir" select="translate($build-dir, '\\', '/')"/>
    <xsl:variable name="files" select="tokenize(translate($file-list,'\','/'), ';')"/>
    
    <xsl:output indent="yes" encoding="UTF-8" method="html" />
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>EPUB Linking Scheme Registry</title>
                <link type="text/css" rel="stylesheet" href="epub-spec.css"/>
            </head>
            <body>
                <h1>EPUB Linking Scheme Registry</h1>
                
                <p>This document ... </p>
                
                <h2>Linking Schemes</h2>
                
                <xsl:call-template name="add-schemes"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="add-schemes">
        <dl>
            <xsl:for-each select="$files">
                <xsl:variable name="file-path" select="concat('file:///', $os-safe-spec-dir, translate(current(), '\\', '/'))"/>
                <xsl:variable name="spec" select="doc($file-path)/db:book"/>
                <xsl:variable name="spec-location" select="concat(replace(current(), '.*epub-(.*).xml', '$1'), '/', replace(current(), '.xml', '.html'))"/>
                <dt>
                    <a>
                        <xsl:attribute name="href"><xsl:value-of select="$spec-location"/></xsl:attribute>
                        <xsl:value-of select="$spec/db:title"/>
                    </a>
                </dt>
                <dd>
                    <xsl:apply-templates select="$spec//db:abstract[@role='index-description']/node()"/>
                </dd>
            </xsl:for-each>
        </dl>
    </xsl:template>
    
    <xsl:template match="db:para">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>