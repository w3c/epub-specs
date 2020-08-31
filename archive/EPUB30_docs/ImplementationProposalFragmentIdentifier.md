# Canonical Fragment Identifiers for EPUB #

Fragment Identifier is a part of URI that defines a location in a resource. Syntactically it is a part of URI that starts with # and is appended at the end of the URI of the file itself. For HTML documents, ids and named anchors are used as fragment identifiers.

This proposal defines syntax for identifying a location inside EPUB file (or any ZIP-packaged cross-referenced XML for that matter, as long as the root document and referencing semantics is defined). Note that only one particular fragment identifier scheme ("canonical fragment identifier" or "CFI") is defined, more schemes for EPUB could be added in parallel or in the future.

These considerations has been used in the design:
  * each location in the file can be identified
  * no two different fragment identifiers point to the same location in the file
  * it is possible to do as much manipulation of fragment identifiers as possible without access to the file (in particular compare, to determine which location comes first)
  * identifier resolution is reasonably efficient (e.g. processing of the first chapter is not required to resolve a fragment identifier that points to the last chapter)

Example:

`#epubcfi(/2/6/4!/2/4/10/3:10)`

Syntax:

```
fragment : "#epubcfi(" [navstep]+ [termstep]? [side]? ")"
navstep : "/" integer | "!" ["/"]? integer
termstep :  ":" integer | "@" number "," number | "~" number
side : "b" | "a"
number : ["-"]? digit+ ["." digit+]?
integer: digit+
```

CFI fragment identifier consists of the hash symbol ("#") which identifies it as a fragment identifier, initial sequence "epubcfi" that identifies a particular scheme,  and a sequence of steps in parentheses. Steps can either be navigational, which can be repeated or terminating, which must come last in the sequence. In addition, an optional side designator can come after the step sequence. This is needed to identify a location which sticks to the content which comes before ("b") or content that comes after ("a") a location. This is needed, for instance, in cases when a location falls right on the page boundary and it is impossible to determine the correct page without knowing what is the "sticky" side.

Note that "epub" is added to the name of the scheme, so that more generic CFI-like scheme could be potentially defined in future for all XML+ZIP-based file formats.

Leading zeros are not allowed for numbers and integers except to represent zero, trailing zeros are not allowed in number fractional part (this ensures uniqueness).

Canonical Fragment Identifier is processed in the following manner. Assume that all documents are parsed in W3C DOM (this is not needed for actual implementation). Start with the root (document) XML node of OPF file (NB: perhaps we should start with META-INF/container.xml instead?). Process each step one by one, applying the following rules.

Slash-number step refers to a child node(s) in the following manner:
  * each element or PI (except <?xml ...> PI) is assigned an _even_ positive index; first element/PI is given index 2, second element/PI - 4, etc.
  * each (possibly empty) collection of nodes before the first element/PI, between elements/PIs, and after last element/PI are given _odd_ indices according to their position.
This indexing scheme insures that nodes are not sensitive to XML parser handling of whitespace, entity references, and CDATA sections.

Column-number step refers to a character offset. If we are dealing with an element, we have a UTF-16 codepoint index in the element's intrinsic textual value. It is empty for most elements, except for XHTML img tag where alt attribute value is used. If we are dealing with a text node or a collection of nodes, UTF-16 codepoint index is calculated after concatenating text data from all the nodes. Position is zero-based and always refers to a place _between_ characters, so 0 means before the first character, and number equal to the total UTF-16 length means position after the last character.

Exclamation sign step means following a reference. Next step should be applied starting from the target node (root node when complete XML document is referenced). These specific references are honored:
  * opf:itemref refers to the file referenced by href attribute of the item element with the given id.
  * for HTML img, iframe, embed elements references are defined by src attribute
  * for HTML object element, reference is defined by data attribute
  * for SVG image and use elements references are defined by by xlink:href attribute
Note that this schema does not take into account hyperlinks, only "embedding" references; thus it is illegal to follow links from XHTML (or SVG) a element.

At-number step means 2D spacial position (e.g. on an image) using x and y in image's natural coordinate system: 1 bitmap pixel for bitmap images with origin in top left corner, x going right, y going down; 1 logical unit for vector images; in particular for SVG, coordinate system inside svg element is used (not viewport coordinate system which is too layout-dependent).

Tilde-number step means temporal position for audio/video, measured in seconds.

Spacial and temporal positions can be combined together, but not other types. Temporal step must always precede spacial syntactically.

No other steps can follow character offset and spacial/temporal position steps.

Note that some elements can allow more than one of the steps defined above.

Sorting rules:
  * steps that come earlier in the sequence are more important
  * XML children nodes, character offsets and temporal positions are sorted in natural order
  * y position is more important than x
  * omitted spacial position precedes all other spacial positions
  * omitted temporal position precedes all other temporal positions
  * temporal position is more important than spacial
  * different step types come in the following order from least important to more important: character offset, child, temporal/spacial, link.

In the example above, if the opf file looks like this:
```
<?xml version="1.0"?>
<package version="2.0" unique-identifier="bookid" xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns="http://www.idpf.org/2007/opf" xmlns:opf="http://www.idpf.org/2007/opf">
  <metadata>
   <dc:title>...</dc:title> 
   <dc:identifier id="bookid">...</dc:identifier>
   <dc:creator>...</dc:creator> 
   <dc:language>en</dc:language> 
 </metadata>
 <manifest>
  <item id="ncxtoc" href="toc.ncx" media-type="application/x-dtbncx+xml"/>
  <item id="titlepage" href="titlepage.xhtml" media-type="application/xhtml+xml"/>
  <item id="chapter01" href="chapter01.xhtml" media-type="application/xhtml+xml"/>
  <item id="chapter02" href="chapter02.xhtml" media-type="application/xhtml+xml"/>
  <item id="chapter03" href="chapter03.xhtml" media-type="application/xhtml+xml"/>
  <item id="chapter04" href="chapter04.xhtml" media-type="application/xhtml+xml"/>
 </manifest>
 <spine toc="ncxtoc">
  <itemref idref="titlepage"/>
  <itemref idref="chapter01"/>
  <itemref idref="chapter02"/>
  <itemref idref="chapter03"/>
  <itemref idref="chapter04"/>
 </spine>
</package>
```

and chapter01.xhtml like this:

```
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>...</title>
</head>
<body>
<p>...</p>
<p>...</p>
<p>...</p>
<p>...</p>
<p>aaa <em>bbb</em>0123456789</p>
<p>...</p>
<p>...</p>
<img src="foo.svg"/>
<p>...</p>
<p>...</p>
</body>
</html>
```

Then the given fragment identifier refers to the position right after the digit 9.

When producing CFIs for text locations, unless the text is defined by img element's alt tag, one should always start with the text node or text node collection (even if it empty) that corresponds to the location and then trace the ancestor and reference chain to the OPF file root. Here are some examples:

| `#epubcfi(/2/6/4!/2/4/16)` | img element |
|:---------------------------|:------------|
| `#epubcfi(/2/6/4!/2/4/16!/2/2)` | first child element of the root svg element in foo.svg |
| `#epubcfi(/2/6/4!/2/4/10/1:0)` | location just before aaa |
| `#epubcfi(/2/6/4!/2/4/10/2/1:0)` | location just before bbb |
| `#epubcfi(/2/6/4!/2/4/10/2/1:3b)` | location just after bbb, sticking "before" |

CFI can be also used to cross-reference XML content inside the EPUB package. In that case, a relative reference to a particular resource in the spine should be given (as usual), followed by CFI which should be resolved starting from the document root. For instance, chapter02.xhtml might give a reference to the last location in the previous example like this:

```
...
<a href="chapter01.xhtml#epubcfi(/2/4/10/2/1:3b)">location</a>
...
```

# ID-Based Fragment Identifiers for EPUB #

Canonical fragment identifiers solve the problem of addressing every possible location inside EPUB document without imposing a requirement on content author, however they are very dependent on the document structure.  In some cases, a different approach is desired, where a stable identifier can be assigned by a document author which can be referenced across multiple revisions of the document. This is the model which is typically used on the Web today.

Such fragment identifier conventionally have a simple syntax of a hash symbol ("#") followed by an identifier (more precisely an "XML name").

The proposal is that for EPUB files such fragment identifiers are resolved using navigation ("table-of-content") resource in EPUB package. Navigation document (which is XHTML for EPUB3) is searched for the given ID and the closest following `<a>` element is used to navigate to the actual content.

Note that usable IDs can be exposed using either entries in table of content, or page list, or "navlist".

