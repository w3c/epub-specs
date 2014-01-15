<?xml version="1.0" encoding="utf-8"?>
<s:schema xmlns:s="http://www.ascc.net/xml/schematron"
          xmlns:db="http://docbook.org/ns/docbook">
   <s:ns prefix="db" uri="http://docbook.org/ns/docbook"/>
   
   <s:pattern name="values for @conformance">
      <s:rule context="*[@conformance]">
         <s:assert test="@conformance = 'informative'">@conformance should only take the value 'informative'.</s:assert>
      </s:rule>
   </s:pattern>
   
</s:schema>