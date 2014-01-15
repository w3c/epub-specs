<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:db="http://docbook.org/ns/docbook" 
   xmlns:rng="http://relaxng.org/ns/structure/1.0"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
   xmlns:z="http://www.daisy.org/ns/z3986/annotations/#"
   xmlns:zf="http://www.daisy.org/ns/xslt/functions" 
   xmlns:xlink="http://www.w3.org/1999/xlink"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" 
   xmlns:xhtml="http://www.w3.org/1999/xhtml"
   exclude-result-prefixes="z zf xhtml xs db rng rdf dcterms rdfs">
   
   <xsl:output method="xml" encoding="UTF-8"/>
   
   <xsl:template name="wiki-links-to-plain-text">
      <xsl:param name="text" as="text()"/>
      <xsl:call-template name="parse-wiki-links">
         <xsl:with-param name="text" select="$text"/>
         <xsl:with-param name="mode" select="string('plaintext')"/>
      </xsl:call-template>
   </xsl:template>   
      
   <xsl:template name="wiki-links-to-docbook">
      <xsl:param name="text" as="text()"/>
      <xsl:call-template name="parse-wiki-links">
         <xsl:with-param name="text" select="$text"/>
         <xsl:with-param name="mode" select="string('docbook')"/>
      </xsl:call-template>
   </xsl:template>   
   
   <xsl:template name="wiki-links-to-xhtml">
      <xsl:param name="text" as="text()"/>
      <xsl:choose>
         <xsl:when test="contains($text,'[[')">            
            <xsl:call-template name="parse-wiki-links">
               <xsl:with-param name="text" select="$text"/>
               <xsl:with-param name="mode" select="string('xhtml')"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:otherwise>            
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>            
   </xsl:template>
      
   <xsl:template name="parse-wiki-links">
            
      <!-- inparam: a text node, possibly containing 1..n '[[link label]]' subsegments, where label is optional -->
      <xsl:param name="text" as="text()"/>
      <xsl:param name="mode" as="xs:string"/> <!-- 'plaintext'|'docbook'|'xhtml'  -->
      
      <!-- force each '[[' to appear on its own line to get the friggin regex to work-->
      <xsl:analyze-string select="replace(normalize-space($text),'\[\[','&#xA;[[')" regex="\[{{2}}.+\]{{2}}">
         <xsl:matching-substring>            
            <!-- get the string inside the [[...]] delimiters -->
            <xsl:variable name="string" select="normalize-space(replace(replace(.,'\[\[',''),'\]\]',''))"/>
            <!-- try to get the link segment, may fail if given string is [[#fragmenturi]] -->
            <xsl:variable name="link" select="string(substring-before($string,' '))" as="xs:string"/>
            <!-- try to get the label segment, may fail if given string is [[#fragmenturi]]-->
            <xsl:variable name="label" select="string(substring-after($string,' '))" as="xs:string" />
            
            <xsl:choose>
               <xsl:when test="$mode eq 'plaintext'">
                  <xsl:text> </xsl:text>
                  <xsl:choose>
                     <xsl:when test="string-length($label)>0">                        
                        <xsl:value-of select="normalize-space($label)"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <!-- replace '#', 'z3986.' and '.attrib' with null to increase chances of
                           a legible constructed label -->
                        <xsl:value-of 
                           select="normalize-space(
                              replace(replace(replace($string,'#',''),'z3986.',''),'.attrib','')
                              )"/>
                     </xsl:otherwise>
                  </xsl:choose>
                  <xsl:text> </xsl:text>
               </xsl:when>                
               <xsl:when test="$mode eq 'docbook'">               
                  <!-- if we have an explicit label, use db:link, else db:xref -->
                  <xsl:choose>
                     <xsl:when test="string-length($label)>0">
                        <xsl:choose>
                           <xsl:when test="starts-with($link,'#')">
                              <db:link linkend="{substring-after($link,'#')}"> <xsl:value-of select="$label"/></db:link>
                           </xsl:when>
                           <xsl:otherwise>
                              <db:link xlink:href="{$link}"> <xsl:value-of select="$label"/></db:link>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:choose>
                           <xsl:when test="starts-with($string,'#')">
                              <db:xref linkend="{substring-after($string,'#')}"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:message terminate="yes">Cant use xref links for non-IDREF link types: <xsl:value-of select="$string" /> </xsl:message>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:when>
               
               <xsl:when test="$mode eq 'xhtml'">
                  <xsl:choose>
                     <xsl:when test="string-length($label)>0">
                        <xsl:text> </xsl:text>
                        <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                           <xsl:attribute name="href" select="$link"/>
                           <xsl:value-of select="$label"/>
                        </xsl:element>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:choose>
                           <xsl:when test="starts-with($string,'#')">
                              <xsl:text> </xsl:text>
                              <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                                 <xsl:attribute name="href" select="$string"/>
                                 <xsl:value-of select="substring-after($string,'#')"/>
                              </xsl:element>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text> </xsl:text>
                              <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                                 <xsl:attribute name="href" select="$string"/>
                                 <xsl:value-of select="$string"/>                                 
                              </xsl:element>
                              <xsl:text> </xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:when>
            </xsl:choose>
         </xsl:matching-substring>
         <xsl:non-matching-substring>
            <xsl:value-of select="."/>
            <!-- <xsl:value-of select="normalize-space(concat(' ',normalize-space(.), ' '))"/> -->
         </xsl:non-matching-substring>
      </xsl:analyze-string>
   </xsl:template>

</xsl:stylesheet>
