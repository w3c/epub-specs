<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" queryBinding="xslt2">

  <ns uri="http://www.w3.org/1999/xhtml" prefix="h"/>
  <ns uri="http://www.idpf.org/2007/ops" prefix="epub"/>

  <pattern id="glossary-occurrence">
    <rule context="h:html">
      <assert test="exists(.//h:*[tokenize(@epub:type,'\s+')='glossary'])">At least one element of
        type 'glossary' must be present</assert>
    </rule>
  </pattern>

  <pattern id="glossary">
    <rule context="h:*[tokenize(@epub:type,'\s+')='glossary']">
      <assert
        test="self::h:body | self::h:dl | self::h:section | self::h:article | self::h:aside | self::h:nav"
        >The 'glossary' type is only allowed on 'body' or 'dl' or sectioning content
        elements.</assert>
    </rule>
  </pattern>

</schema>
