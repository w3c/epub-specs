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
                
                <p>This registry of linking schemes is maintained by the IDPF to promote and encourage
                    the development of linking mechanisms for use with EPUB® Publications.</p>
                
                <h2>Overview</h2>
                
                <p>Although content authors have always been able to take advantage of the hyperlinking 
                    capabilities the Web makes available, linking to the Internet only addresses one dimension 
                    of a Publication. This registry focuses instead on specialized linking capabilities 
                    that more fully address the range of needs and requirements unique to Publications,
                    to layer in the missing functionality and open up the insides of Publications both for
                    linking into from outside and for referencing from within.</p>
                
                <p>The schemes listed in this registry are not a normative part of the EPUB suite of specifications. 
                    The available schemes are subject to change independent of the EPUB specification revision cycle 
                    and may or may not be compatible with past, present or future versions of the specification. 
                    Please consult each document for more information on the version(s) supported.</p>
                
                <h2>Linking Schemes</h2>
                
                <xsl:call-template name="add-schemes"/>

                <h2>Contribute</h2>
                
                <p>If you would like to suggest or submit a new scheme for consideration by the IDPF,
                    please use the <span class="todo">TODO: issue tracker/contact form?</span></p>
                
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