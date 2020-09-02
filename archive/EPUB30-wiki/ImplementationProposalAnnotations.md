

# Introduction #

This is a wiki page to collaboratively edit an implementation proposal for the "annotations" part of the revision of the EPUB standard. This document is in inception phase.

Please refer to the [annotations requirements page](Annotations.md) (http://code.google.com/p/epub-revision/wiki/Annotations)

# Editors / Contributors #

  * Will Manis
  * Daniel Weck
  * (add your name here)

# Basic Concepts, Terminology #

## EPUB Publication ##

In this implementation proposal we will use the term "**EPUB Publication**" to refer to the document that gets annotated (i.e. for which annotations are specifically authored).

We make the following assumptions:

  * There exists a way for the **EPUB Publication** to be uniquely-identified, so that annotations can reference the published document without ambiguity (dc:Identifier, ISBN, etc.). See the **Publication ID** section below.
  * Data within the **EPUB Publication** is immutable (guaranteed to remain unchanged after publication), so that annotations can reliably point to specific parts of the document.
  * The **EPUB Publication** defines a "spine" of OPS files (HTML5 or any other compliant EPUB markup grammar), declared in the OCF manifest in a way that makes them uniquely-identifiable, such as a path relative to the root folder of the EPUB file structure (e.g. $ROOT$/contents/chapter1.html).

### Publication ID ###

The concept of **EPUB Publication** needs to be defined not only in terms of a given physical unit issued by a particular publisher, but also from the standpoint of multiple editions from the same publisher, or even from completely different content producers.

For example, a set of annotations may have been originally designed for a very specific physical publication, but as time passes, updated editions of the same book may be published, without necessarily modifying the fundamental characteristics of the text (the updates might just be related to book cover, metadata, etc.). Moreover, a given body of work (e.g. "Alice In Wonderland") may exist in various forms, issued from various publishers. Yet it is very desirable that annotations written for a particular edition can be used with other editions too.

**UPDATE**: the prose below is obsoleted by several concrete proposals. References:

http://code.google.com/p/epub-revision/wiki/ImplementationProposalFragmentIdentifier

http://groups.google.com/group/epub-21-working-group/browse_thread/thread/e03520104dde278

http://blog.threepress.org/2010/10/21/developing-an-epub-linking-spec/

http://groups.google.com/group/epub-21-working-group/browse_thread/thread/c3f8f2fa988a7b27#msg_20af934710bf5efc

This comment is still valid though:

Instead of inventing a syntax using slashes to separate fields, I would take advantage of URI syntax for ISBNs: for example, "urn:isbn:0-486-27557-4".  In theory each edition of a work gets its own ISBN, so you shouldn't need an edition number.  However, a revision number could still be useful, either as a way of distinguishing various working copies from stages of the publication process or as a way of identifying incremental changes to a continuously updated publication.

Obsoleted prose:

The proposed method to achieve this goal is to define a URL/URI/IRI mechanism that constructs an identifier based on several forward-slash-separated fields, including:

  * a "root namespace", such as www.isbn.com
  * a unique identifier recognizable in the given namespace, such as an ISBN string of characters
  * a number specifying a particular edition
  * a revision number (similar to a build increment in the software world)

## EPUB Annotation ##

In this implementation proposal we will use the term "**EPUB Annotation**" to refer to the dataset that defines the actual annotation content + some associated metadata + the specification of the targeted portion(s) of document within the **EPUB Publication**.

### Annotation Content ###

#### Simple Assets ####

This is a list of typical media objects used to annotate content:

  * Plain text (UTF-8)
  * XML text (HTML5 markup, HTML4 ? DTBOOK ?)
  * Video (webcam recording, pre-recorded clip, etc.)
  * Audio (voice recording, soundtrack, music, etc.)
  * Image (screen capture, touch/pen scribble, etc.)
  * Vector graphics (static image-like rendering or animated graphics)

#### Composed Assets ####

In some cases, an annotation may require composing several basic media object (as described above). In this proposal we recommend the use of the EPUB OPS as a container for richly-structured annotations (e.g., a video with a short textual description bundled inside an HTML5 document).

### Annotation Target ###

An **Annotation Target** defines the portion of source content within an **EPUB Publication** that the **Annotation Content** refers to.
A given Annotation Content can have several Annotation Targets (e.g. a "fix typo" marker applied to several items in the targeted document).
A given Annotation Target may be used by several distinct Annotation Content (i.e. several annotations for exactly the same location in the target document).
Annotation Targets may overlap in the target document, so Reading Systems should ensure that a user-interface is available for the reader to visualize annotations in a convenient way.

In the draft specification below, any item marked with "FAIL" means that the **Annotation Target** cannot be fully resolved, resulting in associated annotation(s) failing to be processed / rendered by User Agents (i.e. they get skipped / ignored by Reading Systems).

An Annotation Target is defined as follows: **Publication ID** AND **Document ID** AND (**Point** XOR **Range**) AND **Signature**, where Point is **Element** AND-optional (**Char-Offset** XOR **Time-Offset**), where Range is (see below), where Signature is (see below).

  * **Publication ID**: a unique identifier string, referencing an existing EPUB publication FAIL: if the given UID doesn't resolve to a known and retrievable publication
  * **Document ID**: a unique identifier pointing to a "text" file (XML document / HTML5 ?) within the context publication, i.e. a relative path within internal EPUB folder structure. FAIL: if the given path doesn't resolve to a valid file from the OCF manifest's spine
  * **Element**: XPath expression to reference a single element inside the target XML document (or HTML5, etc.). FAIL: if XPath expression resolves to anything other than a single XML element. FAIL: if XPath expression doesn't correspond to anything in the target document
  * **Char-Offset**: a positive (or zero) integer to define a Unicode character offset within the text contained in the referenced base ELEMENT. FAIL: if the base ELEMENT doesn't have any descendant XML TEXT node(s). FAIL: if given integer is greater than the number of Unicode characters in the context text string, which is made of the concatenation of all descendant XML TEXT nodes in lexical document order (depth-first tree traversal)
  * **Time Offset**: a positive time offset (using the SMIL Timing notation) relative to the beginning of the referenced media element (audio, video). FAIL: if the referenced base ELEMENT is not one of the valid media elements: video, audio. FAIL: if the given time offset is greater than the duration of the referenced media asset
  * **Range**: defines an ordered combination of 2 Points ((P1, P2)). A Range containing 2 identical Points should effectively resolve to a single Point. FAIL: if P2 before P1. A Point P1 is said to be situated "before" a Point P2 if:
    * **Element** of P1 is before **Element** of P2 in the lexical XML document order (depth-first tree traversal)
    * **Char-Offset** of P1 is less than (but not equal) to **Char-Offset** of P2
    * **Time-Offset** of P1 is less than (but not equal) to **Time-Offset** of P2
  * **Signature**: a checksum / hash (string of characters encoded in base64) representing the unique "signature" of the annotation target, in terms of its referenced content and of neighboring content (TO BE DEFINED, Will demo)

Note that the element() and xpointer() schemes of the W3C XPointer recommendation (and draft specification, respectively) are not recommended for use in this implementation proposal. Neither is the non-XPointer xpath1() scheme which is defined in a non-normative manner.

Note that support for the graphical space domain (2D canvas drawing area used to render images, video, etc.) is not included in this proposal. There is therefore no capabilities to select part of a visible area rendered with known fixed dimensions (e.g. like YouTube graphical annotations).

Note that the W3C Media Fragments syntax ( http://www.w3.org/TR/media-frags/ ) is not suitable for use in this implementation proposal, as it is designed to point to well-defined parts of resources via a URL/URI/IRI mechanism, not what we are trying to achieve here.

# EPUB Annotation Packaging #

One of the benefits of using EPUB to package a set of annotations is that the publishing process for such annotations can rely on a conventional EPUB workflow (i.e. a rich set of annotations can be published as a separate product). Furthermore, this enables the "annotations of annotations" use-case (recursive behavior), which may be needed by interactive reading systems that implement social/collaborative annotations (i.e. a published **EPUB Annotation** should be uniquely-identifiable and discoverable, so that it can in turn be annotated).

For a given **EPUB Publication**, there may be many **EPUB Annotations** provided by a large number of individual contributors => this may lead to a non-negligible overhead if each independent annotation is effectively a fully-fledge EPUB document (e.g. processing overhead on the client side, to discover and render annotations for a given page of the book being read). It appears to be an authoring issue though: online services or web-connected reading devices that enable the production of annotations by readers themselves, should ensure, for example, that all the annotations created by a single reader for a given publication are stored in the same EPUB document.

## Abstract Container ##

```
META-INF/
   container.xml – Note: includes multiple <rootfile> elements
   [manifest.xml]
   [metadata.xml]
   [signatures.xml]
   [encryption.xml]
   [rights.xml]
***[annotations.xml]***
OEBPS/
   Great Expectations.opf
   cover.html
   chapters/
      chapter01.html
      chapter02.html
      … other OPS files for the remaining chapters …
```

An annotation itself would refer to annotated content and the annotators content, which could be co-located or contained in other documents. It is probably reasonable to limit the annotators content to be local to the container holding the annotations.

The example below illustrates a textual annotation on textual content.
Need examples for:
  1. ink annotation of text
  1. ink annotation of image or svg
  1. annotation of audio/video

## Example: annotations.xml ##

```
<annotations xmlns="http://www.idpf.org/2011/annotation">

  <annotation id="uuid">
    <!-- ANNOT_R1.1 -->
    <annotationauthor>
      <name>Mark Twain</name>
      <identity/>
      <profile/>
    </annotationauthor>
    <created>2010-10-17</created>
    <modified>2010-10-17</modified>

    <referenceddocument>
      <!-- 
        DANIEL: should "referenceddocument" be renamed to "annotationtargets" 
        (note the proposed plural form), to be consistent with 
        "annotationcontent" ? 
        -->
      <documentidentifier>
        <!-- ANNOT_R3 -->
        ISBN, DOI, etc.
      </documentidentifier>
      <additionaldocumentidentifiers>
        <!--
           these exist primarily for humans, in the event
           the documentidentifier fails this information
           can help a human locate the referenceddocument
          -->
        <title></title>
        <author></author>
        <publicationdate></publicationdate>
      </additionaldocumentidentifiers>

      <!-- ANNOT_R4, ANNOT_R4.9 -->
      <ranges>
        <range>
          <contentsignature>
            <!-- ANNOT_R1 -->
            <!-- 
              a dsig (SHA1) over the referenced content or a superset of the content,
              used to determine if content has changed since the annotation was made,
              SHA1 should be sufficient, this digest does not require high levels
              of security
             -->
          </contentsignature>
          <start>
            <location>
              <part>part in ocf container</part>
              <subpart>
                <!--
                  the order of these should indicate
                  preference for reestablishing annotation
                  location
                -->
                <path>
                  <xpath>
                    <!--
                      this should probably be a subset
                      of xpath steps and position only in
                      static documents
                      (e.g. /html/body/div[position()=4]/div[position()=2]/child::text())
                      -->
                  </xpath>
                  <charOffset></charOffset>
                </path>
                <id>
                  <!-- an html id -->
                </id>
                <uniqueString>
                  <!--
                     this is a string of sufficient length to
                     uniquely identify a point within the range
                     if all other identifiers are lost,
                     typically in English this probably has to
                     be somewhere between 8-12 consecutive
                     words
                    -->
                </uniqueString>
                <!--
                    ANNOT_R4.1, ANNOT_R4.2, ANNOT_R4.3,
                    ANNOT_R4.4, we will need additional info in
                    location to cover ANNOT_R4.6, R4.7, R4.8, 
                  -->
              </subpart>
            </location>
          </start>
          <end>
            <location></location>
          </end>
        </range>
        <range>
          .
          .
          .
        </range>
      </ranges>

      or

      <point>
        <!--
          if the annotation reference only a point in the
          document
          -->
        <part>part in ocf container</part>
        <location>...</location>
      </point>


      <renderinginfo>
        <!--  ANNOT_TW_R1 -->
        <hilight>yellow</hilight>
        <ink></ink>
      </renderinginfo>

    </referenceddocument>

    <annotationcontent>

      <annotationstring xml:lang="en-us">
        <!--
           the annotation may be a simple string, embedded in the
           annotation structure, or content in an epub file
        -->
      </annotationstring>

      or

      <range>
        <!-- ANNOT_R8 -->
        <!--
           this points to content in what is nominally an
           epub file, which may be the same epub as the
           referenceddocument
        -->
        <start>
          <part>part in ocf container</part>
          <location></location>
        </start>
        <end>
          <part>part in ocf container</part>
          <location></location>
        </end>
      </range>

      <renderinginfo>
        <balloon/>
      </renderinginfo>

    </annotationcontent>
  </annotation>

  <annotation id="uuid">
    .
    .
    .
  </annotation>

</annotations>
```

# Other Proposals #

Adobe Digital Editions: [ImplementationProposalSimpleAnnotations](ImplementationProposalSimpleAnnotations.md)

ASTRI: [ImplementationProposal4AnnotationsbyASTRI](ImplementationProposal4AnnotationsbyASTRI.md)

# Schemas #

See [ImplementationProposalAnnotations\_Schemas](ImplementationProposalAnnotations_Schemas.md)