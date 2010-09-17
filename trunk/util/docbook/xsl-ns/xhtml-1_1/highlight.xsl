<?xml version="1.0" encoding="ASCII"?>
<!--This file was created automatically by html2xhtml-->
<!--from the HTML stylesheets.-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook"
xmlns:xslthl="http://xslthl.sf.net" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xslthl d" version="1.0">

<!-- ********************************************************************
     $Id: highlight.xsl 8419 2009-04-29 20:37:52Z kosek $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://docbook.sf.net/release/xsl/current/ for
     and other information.

     ******************************************************************** -->

<xsl:import href="../highlighting/common.xsl"/>

<xsl:template match="xslthl:keyword" mode="xslthl">
  <xsl:apply-templates mode="xslthl"/>
</xsl:template>

<xsl:template match="xslthl:string" mode="xslthl">
  <xsl:apply-templates mode="xslthl"/>
</xsl:template>

<xsl:template match="xslthl:comment" mode="xslthl">
  <xsl:apply-templates mode="xslthl"/>
</xsl:template>

<xsl:template match="xslthl:directive" mode="xslthl">
  <span class="hl-directive" style="color: maroon"><xsl:apply-templates mode="xslthl"/></span>
</xsl:template>

<xsl:template match="xslthl:tag" mode="xslthl">
  <xsl:apply-templates mode="xslthl"/>
</xsl:template>

<xsl:template match="xslthl:attribute" mode="xslthl">
  <span class="hl-attribute" style="color: #F5844C"><xsl:apply-templates mode="xslthl"/></span>
</xsl:template>

<xsl:template match="xslthl:value" mode="xslthl">
  <span class="hl-value" style="color: #993300"><xsl:apply-templates mode="xslthl"/></span>
</xsl:template>

<xsl:template match="xslthl:html" mode="xslthl">
  <xsl:apply-templates mode="xslthl"/>
</xsl:template>

<xsl:template match="xslthl:xslt" mode="xslthl">
  <xsl:apply-templates mode="xslthl"/>
</xsl:template>

<!-- Not emitted since XSLTHL 2.0 -->
<xsl:template match="xslthl:section" mode="xslthl">
  <xsl:apply-templates mode="xslthl"/>
</xsl:template>

<xsl:template match="xslthl:number" mode="xslthl">
  <span class="hl-number"><xsl:apply-templates mode="xslthl"/></span>
</xsl:template>

<xsl:template match="xslthl:annotation" mode="xslthl">
  <span class="hl-annotation" style="color: gray"><xsl:apply-templates mode="xslthl"/></span>
</xsl:template>

<!-- Not sure which element will be in final XSLTHL 2.0 -->
<xsl:template match="xslthl:doccomment|xslthl:doctype" mode="xslthl">
  <xsl:apply-templates mode="xslthl"/>
</xsl:template>

</xsl:stylesheet>
