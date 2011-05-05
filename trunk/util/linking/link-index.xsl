<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:db="http://docbook.org/ns/docbook"
    exclude-result-prefixes="xs db"
    version="2.0">
    
    <xsl:param name="file-list" required="yes" as="xs:string"/>
    <xsl:param name="build-dir" required="yes"/>
    <xsl:param name="base-uri" required="yes"/>
    
    <xsl:variable name="os-safe-spec-dir" select="translate($build-dir, '\\', '/')"/>
    <xsl:variable name="files" select="tokenize(translate($file-list,'\','/'), ';')"/>
    
    <xsl:output indent="yes" encoding="UTF-8" method="xml" omit-xml-declaration="no" />
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>EPUB Linking Scheme Registry</title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <link type="text/css" rel="stylesheet" href="../css/epub-spec.css"/>
            </head>
            <body>
                <h1>EPUB Linking Scheme Registry</h1>
                
                <p>This document lists the available schemes that can be used to provide linking functionality
                    into and between EPUB&#174; 3 Publications.</p>
                
                <p>These schemes are not a normative part of the EPUB 3 collection of specifications, but are
                    maintained separately by the IPDF. The available schemes are subject to change independent 
                    of the EPUB 3 specification revision cycle.</p>
                
                <p>For more information regarding normative support for these schemes in Reading Systems, 
                    please refer to <a href="../30/spec/epub3-contentdocs.html">EPUB 3 Content Documents</a>.</p>
                
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