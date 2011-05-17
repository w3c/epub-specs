<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml"
    version="2.0">

    <xsl:output encoding="UTF-8" indent="no" method="xml"/>
    <xsl:param name="target" required="yes"/>
    <xsl:param name="title" required="yes"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>
                    <xsl:value-of select="$title"/>
                </title>
                <meta http-equiv="refresh" content="0;URL='{$target}'"/>
            </head>
            <body>
                <p>This page is an alias for <a href="{$target}"><xsl:value-of select="$target"
                        /></a>.</p>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
