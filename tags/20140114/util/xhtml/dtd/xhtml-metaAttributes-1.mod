<!-- ...................................................................... -->
<!-- XHTML MetaAttributes Module  ......................................... -->
<!-- file: xhtml-metaAttributes-1.mod

     This is XHTML-RDFa, modules to annotate XHTML family documents.
     Copyright 2007-2008 W3C (MIT, ERCIM, Keio), All Rights Reserved.
     Revision: $Id: xhtml-metaAttributes-1.mod,v 1.6 2008/08/01 20:01:00 smccarro Exp $

     This DTD module is identified by the PUBLIC and SYSTEM identifiers:

       PUBLIC "-//W3C//ENTITIES XHTML MetaAttributes 1.0//EN"
       SYSTEM "http://www.w3.org/MarkUp/DTD/xhtml-metaAttributes-1.mod"

     Revisions:
     (none)
     ....................................................................... -->

<!ENTITY % XHTML.global.attrs.prefixed "IGNORE" >

<!-- Placeholder Compact URI-related types -->
<!ENTITY % CURIE.datatype "CDATA" >
<!ENTITY % CURIEs.datatype "CDATA" >
<!ENTITY % SafeCURIE.datatype "CDATA" >
<!ENTITY % SafeCURIEs.datatype "CDATA" >
<!ENTITY % URIorSafeCURIE.datatype "CDATA" >
<!ENTITY % URIorSafeCURIEs.datatype "CDATA" >

<!-- Common Attributes

     This module declares a collection of meta-information related 
     attributes.

     %NS.decl.attrib; is declared in the XHTML Qname module.

	 This file also includes declarations of "global" versions of the 
     attributes.  The global versions of the attributes are for use on 
     elements in other namespaces.  
-->

<!ENTITY % about.attrib
     "about        %URIorSafeCURIE.datatype;             #IMPLIED"
>

<![%XHTML.global.attrs.prefixed;[
<!ENTITY % XHTML.global.about.attrib
     "%XHTML.prefix;:about           %URIorSafeCURIE.datatype;        #IMPLIED"
>
]]>

<!ENTITY % typeof.attrib
     "typeof        %CURIEs.datatype;             #IMPLIED"
>

<![%XHTML.global.attrs.prefixed;[
<!ENTITY % XHTML.global.typeof.attrib
     "%XHTML.prefix;:typeof           %CURIEs.datatype;        #IMPLIED"
>
]]>

<!ENTITY % property.attrib
     "property        %CURIEs.datatype;             #IMPLIED"
>

<![%XHTML.global.attrs.prefixed;[
<!ENTITY % XHTML.global.property.attrib
     "%XHTML.prefix;:property           %CURIEs.datatype;        #IMPLIED"
>
]]>

<!ENTITY % resource.attrib
     "resource        %URIorSafeCURIE.datatype;             #IMPLIED"
>

<![%XHTML.global.attrs.prefixed;[
<!ENTITY % XHTML.global.resource.attrib
     "%XHTML.prefix;:resource           %URIorSafeCURIE.datatype;        #IMPLIED"
>
]]>

<!ENTITY % content.attrib
     "content        CDATA             #IMPLIED"
>

<![%XHTML.global.attrs.prefixed;[
<!ENTITY % XHTML.global.content.attrib
     "%XHTML.prefix;:content           CDATA        #IMPLIED"
>
]]>

<!ENTITY % datatype.attrib
     "datatype        %CURIE.datatype;             #IMPLIED"
>

<![%XHTML.global.attrs.prefixed;[
<!ENTITY % XHTML.global.datatype.attrib
     "%XHTML.prefix;:datatype           %CURIE.datatype;        #IMPLIED"
>
]]>

<!ENTITY % rel.attrib
     "rel        %CURIEs.datatype;             #IMPLIED"
>

<![%XHTML.global.attrs.prefixed;[
<!ENTITY % XHTML.global.rel.attrib
     "%XHTML.prefix;:rel           %CURIEs.datatype;        #IMPLIED"
>
]]>

<!ENTITY % rev.attrib
     "rev        %CURIEs.datatype;             #IMPLIED"
>

<![%XHTML.global.attrs.prefixed;[
<!ENTITY % XHTML.global.rev.attrib
     "%XHTML.prefix;:rev           %CURIEs.datatype;        #IMPLIED"
>
]]>

<!ENTITY % Metainformation.extra.attrib "" >

<!ENTITY % Metainformation.attrib
     "%about.attrib;
      %content.attrib;
      %datatype.attrib;
      %typeof.attrib;
      %property.attrib;
      %rel.attrib;
      %resource.attrib;
      %rev.attrib;
      %Metainformation.extra.attrib;"
>

<!ENTITY % XHTML.global.metainformation.extra.attrib "" >

<![%XHTML.global.attrs.prefixed;[

<!ENTITY % XHTML.global.metainformation.attrib
     "%XHTML.global.about.attrib;
      %XHTML.global.content.attrib;
      %XHTML.global.datatype.attrib;
      %XHTML.global.typeof.attrib;
      %XHTML.global.property.attrib;
      %XHTML.global.rel.attrib;
      %XHTML.global.resource.attrib;
      %XHTML.global.rev.attrib;
      %XHTML.global.metainformation.extra.attrib;"
>
]]>

<!ENTITY % XHTML.global.metainformation.attrib "" >


<!-- end of xhtml-metaAttributes-1.mod -->
