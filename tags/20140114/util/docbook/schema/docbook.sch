<?xml version="1.0" encoding="utf-8"?>
<s:schema xmlns:s="http://www.ascc.net/xml/schematron"
          xmlns:db="http://docbook.org/ns/docbook">
   <s:ns prefix="db" uri="http://docbook.org/ns/docbook"/>
   <s:pattern name="Glossary 'firstterm' type constraint">
      <s:rule context="db:firstterm[@linkend]">
         <s:assert test="local-name(//*[@xml:id=current()/@linkend]) = 'glossentry' and namespace-uri(//*[@xml:id=current()/@linkend]) = 'http://docbook.org/ns/docbook'">@linkend on firstterm must point to a glossentry.</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern name="Footnote reference type constraint">
      <s:rule context="db:footnoteref">
         <s:assert test="local-name(//*[@xml:id=current()/@linkend]) = 'footnote' and namespace-uri(//*[@xml:id=current()/@linkend]) = 'http://docbook.org/ns/docbook'">@linkend on footnoteref must point to a footnote.</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern name="Glossary 'glossterm' type constraint">
      <s:rule context="db:glossterm[@linkend]">
         <s:assert test="local-name(//*[@xml:id=current()/@linkend]) = 'glossentry' and namespace-uri(//*[@xml:id=current()/@linkend]) = 'http://docbook.org/ns/docbook'">@linkend on glossterm must point to a glossentry.</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern name="Synopsis fragment type constraint">
      <s:rule context="db:synopfragmentref">
         <s:assert test="local-name(//*[@xml:id=current()/@linkend]) = 'synopfragment' and namespace-uri(//*[@xml:id=current()/@linkend]) = 'http://docbook.org/ns/docbook'">@linkend on synopfragmentref must point to a synopfragment.</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern name="Glosssary 'see' type constraint">
      <s:rule context="db:glosssee[@otherterm]">
         <s:assert test="local-name(//*[@xml:id=current()/@otherterm]) = 'glossentry' and namespace-uri(//*[@xml:id=current()/@otherterm]) = 'http://docbook.org/ns/docbook'">@otherterm on glosssee must point to a glossentry.</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern name="Glossary 'seealso' type constraint">
      <s:rule context="db:glossseealso[@otherterm]">
         <s:assert test="local-name(//*[@xml:id=current()/@otherterm]) = 'glossentry' and namespace-uri(//*[@xml:id=current()/@otherterm]) = 'http://docbook.org/ns/docbook'">@otherterm on glossseealso must point to a glossentry.</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern name="Glossary term definition constraint">
      <s:rule context="db:termdef">
         <s:assert test="count(db:firstterm) = 1">A termdef must contain exactly one firstterm</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern name="Root must have version">
      <s:rule context="/db:procedure">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:step">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:stepalternatives">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:sidebar">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:abstract">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:personblurb">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:blockquote">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:epigraph">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:formalpara">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:para">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:simpara">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:itemizedlist">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:orderedlist">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:segmentedlist">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:simplelist">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:variablelist">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:example">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:informalexample">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:literallayout">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:screen">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:screenshot">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:figure">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:informalfigure">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:mediaobject">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:inlinemediaobject">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:videoobject">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:audioobject">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:imageobject">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:textobject">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:videodata">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:audiodata">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:imagedata">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:textdata">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:caption">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:address">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:legalnotice">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:revhistory">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:set">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:book">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:dedication">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:acknowledgements">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:colophon">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:appendix">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:chapter">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:part">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:preface">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:partintro">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:section">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:simplesect">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:article">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:annotation">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:sect1">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:sect2">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:sect3">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:sect4">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:sect5">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:reference">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:refentry">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:refsynopsisdiv">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:refsection">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:refsect1">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:refsect2">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:refsect3">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:glosslist">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:glossary">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:glossdiv">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:bibliography">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:bibliodiv">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:bibliolist">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:index">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:setindex">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:indexdiv">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:toc">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:tocdiv">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:task">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:tasksummary">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:taskprerequisites">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:taskrelated">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:calloutlist">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:programlistingco">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:screenco">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:imageobjectco">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:productionset">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:constraintdef">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:table">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:informaltable">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:msgset">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:msg">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:msgmain">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:msgsub">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:msgrel">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:msgexplan">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:qandaset">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:qandadiv">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:qandaentry">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:equation">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:informalequation">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:cmdsynopsis">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:synopsis">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:funcsynopsis">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:funcsynopsisinfo">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:classsynopsis">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:classsynopsisinfo">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:fieldsynopsis">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:constructorsynopsis">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:destructorsynopsis">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:methodsynopsis">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:programlisting">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:caution">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:important">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:note">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:tip">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:warning">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:topic">
         <s:assert test="@version">If this element is the root element, it must have a version attribute.</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern name="Cardinality of segments and titles">
      <s:rule context="db:seglistitem">
         <s:assert test="count(db:seg) = count(../db:segtitle)">The number of seg elements must be the same as the number of segtitle elements in the parent segmentedlist</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern name="Element exclusion">
      <s:rule context="db:annotation">
         <s:assert test="not(.//db:annotation)">annotation must not occur among the children or descendants of annotation</s:assert>
      </s:rule>
      <s:rule context="db:caution">
         <s:assert test="not(.//db:caution)">caution must not occur among the children or descendants of caution</s:assert>
         <s:assert test="not(.//db:important)">important must not occur among the children or descendants of caution</s:assert>
         <s:assert test="not(.//db:note)">note must not occur among the children or descendants of caution</s:assert>
         <s:assert test="not(.//db:tip)">tip must not occur among the children or descendants of caution</s:assert>
         <s:assert test="not(.//db:warning)">warning must not occur among the children or descendants of caution</s:assert>
      </s:rule>
      <s:rule context="db:important">
         <s:assert test="not(.//db:caution)">caution must not occur among the children or descendants of important</s:assert>
         <s:assert test="not(.//db:important)">important must not occur among the children or descendants of important</s:assert>
         <s:assert test="not(.//db:note)">note must not occur among the children or descendants of important</s:assert>
         <s:assert test="not(.//db:tip)">tip must not occur among the children or descendants of important</s:assert>
         <s:assert test="not(.//db:warning)">warning must not occur among the children or descendants of important</s:assert>
      </s:rule>
      <s:rule context="db:note">
         <s:assert test="not(.//db:caution)">caution must not occur among the children or descendants of note</s:assert>
         <s:assert test="not(.//db:important)">important must not occur among the children or descendants of note</s:assert>
         <s:assert test="not(.//db:note)">note must not occur among the children or descendants of note</s:assert>
         <s:assert test="not(.//db:tip)">tip must not occur among the children or descendants of note</s:assert>
         <s:assert test="not(.//db:warning)">warning must not occur among the children or descendants of note</s:assert>
      </s:rule>
      <s:rule context="db:tip">
         <s:assert test="not(.//db:caution)">caution must not occur among the children or descendants of tip</s:assert>
         <s:assert test="not(.//db:important)">important must not occur among the children or descendants of tip</s:assert>
         <s:assert test="not(.//db:note)">note must not occur among the children or descendants of tip</s:assert>
         <s:assert test="not(.//db:tip)">tip must not occur among the children or descendants of tip</s:assert>
         <s:assert test="not(.//db:warning)">warning must not occur among the children or descendants of tip</s:assert>
      </s:rule>
      <s:rule context="db:warning">
         <s:assert test="not(.//db:caution)">caution must not occur among the children or descendants of warning</s:assert>
         <s:assert test="not(.//db:important)">important must not occur among the children or descendants of warning</s:assert>
         <s:assert test="not(.//db:note)">note must not occur among the children or descendants of warning</s:assert>
         <s:assert test="not(.//db:tip)">tip must not occur among the children or descendants of warning</s:assert>
         <s:assert test="not(.//db:warning)">warning must not occur among the children or descendants of warning</s:assert>
      </s:rule>
      <s:rule context="db:caption">
         <s:assert test="not(.//db:caution)">caution must not occur among the children or descendants of caption</s:assert>
         <s:assert test="not(.//db:equation)">equation must not occur among the children or descendants of caption</s:assert>
         <s:assert test="not(.//db:example)">example must not occur among the children or descendants of caption</s:assert>
         <s:assert test="not(.//db:figure)">figure must not occur among the children or descendants of caption</s:assert>
         <s:assert test="not(.//db:important)">important must not occur among the children or descendants of caption</s:assert>
         <s:assert test="not(.//db:note)">note must not occur among the children or descendants of caption</s:assert>
         <s:assert test="not(.//db:sidebar)">sidebar must not occur among the children or descendants of caption</s:assert>
         <s:assert test="not(.//db:table)">table must not occur among the children or descendants of caption</s:assert>
         <s:assert test="not(.//db:task)">task must not occur among the children or descendants of caption</s:assert>
         <s:assert test="not(.//db:tip)">tip must not occur among the children or descendants of caption</s:assert>
         <s:assert test="not(.//db:warning)">warning must not occur among the children or descendants of caption</s:assert>
      </s:rule>
      <s:rule context="db:equation">
         <s:assert test="not(.//db:caution)">caution must not occur among the children or descendants of equation</s:assert>
         <s:assert test="not(.//db:equation)">equation must not occur among the children or descendants of equation</s:assert>
         <s:assert test="not(.//db:example)">example must not occur among the children or descendants of equation</s:assert>
         <s:assert test="not(.//db:figure)">figure must not occur among the children or descendants of equation</s:assert>
         <s:assert test="not(.//db:important)">important must not occur among the children or descendants of equation</s:assert>
         <s:assert test="not(.//db:note)">note must not occur among the children or descendants of equation</s:assert>
         <s:assert test="not(.//db:table)">table must not occur among the children or descendants of equation</s:assert>
         <s:assert test="not(.//db:tip)">tip must not occur among the children or descendants of equation</s:assert>
         <s:assert test="not(.//db:warning)">warning must not occur among the children or descendants of equation</s:assert>
      </s:rule>
      <s:rule context="db:example">
         <s:assert test="not(.//db:caution)">caution must not occur among the children or descendants of example</s:assert>
         <s:assert test="not(.//db:equation)">equation must not occur among the children or descendants of example</s:assert>
         <s:assert test="not(.//db:example)">example must not occur among the children or descendants of example</s:assert>
         <s:assert test="not(.//db:figure)">figure must not occur among the children or descendants of example</s:assert>
         <s:assert test="not(.//db:important)">important must not occur among the children or descendants of example</s:assert>
         <s:assert test="not(.//db:note)">note must not occur among the children or descendants of example</s:assert>
         <s:assert test="not(.//db:table)">table must not occur among the children or descendants of example</s:assert>
         <s:assert test="not(.//db:tip)">tip must not occur among the children or descendants of example</s:assert>
         <s:assert test="not(.//db:warning)">warning must not occur among the children or descendants of example</s:assert>
      </s:rule>
      <s:rule context="db:figure">
         <s:assert test="not(.//db:caution)">caution must not occur among the children or descendants of figure</s:assert>
         <s:assert test="not(.//db:equation)">equation must not occur among the children or descendants of figure</s:assert>
         <s:assert test="not(.//db:example)">example must not occur among the children or descendants of figure</s:assert>
         <s:assert test="not(.//db:figure)">figure must not occur among the children or descendants of figure</s:assert>
         <s:assert test="not(.//db:important)">important must not occur among the children or descendants of figure</s:assert>
         <s:assert test="not(.//db:note)">note must not occur among the children or descendants of figure</s:assert>
         <s:assert test="not(.//db:table)">table must not occur among the children or descendants of figure</s:assert>
         <s:assert test="not(.//db:tip)">tip must not occur among the children or descendants of figure</s:assert>
         <s:assert test="not(.//db:warning)">warning must not occur among the children or descendants of figure</s:assert>
      </s:rule>
      <s:rule context="db:table">
         <s:assert test="not(.//db:caution)">caution must not occur among the children or descendants of table</s:assert>
         <s:assert test="not(.//db:equation)">equation must not occur among the children or descendants of table</s:assert>
         <s:assert test="not(.//db:example)">example must not occur among the children or descendants of table</s:assert>
         <s:assert test="not(.//db:figure)">figure must not occur among the children or descendants of table</s:assert>
         <s:assert test="not(.//db:important)">important must not occur among the children or descendants of table</s:assert>
         <s:assert test="not(.//db:note)">note must not occur among the children or descendants of table</s:assert>
         <s:assert test="not(.//db:tip)">tip must not occur among the children or descendants of table</s:assert>
         <s:assert test="not(.//db:warning)">warning must not occur among the children or descendants of table</s:assert>
      </s:rule>
      <s:rule context="db:footnote">
         <s:assert test="not(.//db:caution)">caution must not occur among the children or descendants of footnote</s:assert>
         <s:assert test="not(.//db:epigraph)">epigraph must not occur among the children or descendants of footnote</s:assert>
         <s:assert test="not(.//db:equation)">equation must not occur among the children or descendants of footnote</s:assert>
         <s:assert test="not(.//db:example)">example must not occur among the children or descendants of footnote</s:assert>
         <s:assert test="not(.//db:figure)">figure must not occur among the children or descendants of footnote</s:assert>
         <s:assert test="not(.//db:footnote)">footnote must not occur among the children or descendants of footnote</s:assert>
         <s:assert test="not(.//db:important)">important must not occur among the children or descendants of footnote</s:assert>
         <s:assert test="not(.//db:note)">note must not occur among the children or descendants of footnote</s:assert>
         <s:assert test="not(.//db:sidebar)">sidebar must not occur among the children or descendants of footnote</s:assert>
         <s:assert test="not(.//db:table)">table must not occur among the children or descendants of footnote</s:assert>
         <s:assert test="not(.//db:task)">task must not occur among the children or descendants of footnote</s:assert>
         <s:assert test="not(.//db:tip)">tip must not occur among the children or descendants of footnote</s:assert>
         <s:assert test="not(.//db:warning)">warning must not occur among the children or descendants of footnote</s:assert>
      </s:rule>
      <s:rule context="db:sidebar">
         <s:assert test="not(.//db:sidebar)">sidebar must not occur among the children or descendants of sidebar</s:assert>
      </s:rule>
      <s:rule context="db:entry">
         <s:assert test="not(.//db:informaltable)">informaltable must not occur among the children or descendants of entry</s:assert>
         <s:assert test="not(.//db:table)">table must not occur among the children or descendants of entry</s:assert>
      </s:rule>
   </s:pattern>
</s:schema>