Note: this proposal merely aims to document existing Adobe annotation format. It does not try to address all the requirements that annotation subgroup gathered.

# Annotation discovery #

This proposal does not address how annotations for a document are discovered (i.e. how to go from a document to its annotation file(s)). Annotation files do contain target document identifying info and as such can be matched to a particular book in a collection.

# Annotation file syntax #

```
<annotationSet xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns="http://ns.adobe.com/digitaleditions/annotations">

  <!-- container for info to identify annotated document; 
         first identifier listed here should be epub's unique identifier, other
         elements can be taken from metadata section "as is" -->
  <publication>
    <dc:identifier>...</dc:identifier>
    <dc:title>...</dc:title>
    <dc:creator>...</dc:creator>
    ...
  </publication>

  <!-- list of annotations -->

  <annotation>
    <dc:identifier>[uuid of this annotation itself for sync]</dc:identifier>
    <dc:date>[annotation creation date]</dc:date>
    <dc:creator>[annotation author]</dc:creator>

    <target>

      <!-- place in the target document which is annotated -->
      <fragment start="[start pos]" end="[end pos]">
        <text>[optional plain text snippet from the target document]</text>
        <!-- possibly other methods of identifying target fragment -->
      </fragment>

      <!-- potentially more fragments for multi-target annotation (not implemented) -->
    </target>

    <!-- annotation content -->
    <content>
      <dc:date>[date of content modification]</dc:date>

      <!-- use text for plain text content;
         potentially xhtml:body for XHTML content, etc. -->
      <text>[plain text annotation text]</text>
    </content>
  </annotation>

</annotationSet>
```

# Identifying positions in the document #

A string which identifies a position in the EPUB (sometimes called bookmark) has the following structure:

```
full-path-to-resource#point(/N/N/N:N)
```

where N after slash is a child in the DOM tree starting from the document node and counting both element and text nodes. N after semicolon (optional) is byte offset in utf8-encoded text node.