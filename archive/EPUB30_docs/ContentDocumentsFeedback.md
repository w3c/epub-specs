

## 1.5 ##

State that other prefixes may be used.

| Please clarify. This section does not exclude the occurrence of other prefixes, merely establishes a convention for code examples in the spec. |
|:-----------------------------------------------------------------------------------------------------------------------------------------------|

## 2.1.3.2.1 Overview ##

This subclause should be made non-normative.

| It contains a normative "should"; but will see if this can be fixed somehow. |
|:-----------------------------------------------------------------------------|

## 2.1.3.2.2 ##

Can @ssml:ph control the alt attribute of the img element?

| Done - [Issue 127](https://code.google.com/p/epub-revision/issues/detail?id=127) |
|:---------------------------------------------------------------------------------|

## 2.1.3.3 The epub:trigger Element ##

The XML events spec does not define the set of permissible event types, but does mention DOM2EVENTS.

> This specification does not normatively specify how
> language designers should name events (i.e., the values
> used in the event attribute).
> ...
> A number of event types are defined in DOM2 [DOM2EVENTS](DOM2EVENTS.md), to
> which you should refer for their names and semantics.

DOM2 defines some permissible event types.  We believe that the EPUB3 Content Documents spec should explicitly specify which event type is allowed.

| The intent has been to inherit the XML Events a) open position re event naming and b) informal reference to DOM2EVENTS. Is this a problem?  |
|:--------------------------------------------------------------------------------------------------------------------------------------------|

Some event types (e.g., DOMActivate, DOMNodeRemoved) defined in DOM2 might be too much for EPUB.  We might also want to define our own event types (e.g., nextPage, previousPage, currentPage).

| Agree that some events (like DOM modifications) do not make sense, but recommend that not using them be considered fodder for authoring guidelines rather than requirements. EPUB-specific events is not a target for EPUB3; this may be approached in future revisions.|
|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

What does "visibility property" mean?  Reference DOM as the definition.

| Changed, see [trigger section in spec](http://epub-revision.googlecode.com/svn/trunk/build/30/spec/epub30-contentdocs.html#sec-xhtml-epub-trigger)). _TODO may be a more appropriate way to state this_ |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## 2.1.4.1.4 Reading System Conformance ##

The precedence of altimg is unclear.  When it is used?

| The spec says "For Reading System forward compatibility purposes, fallback images may be provided using the altimg attribute on the m:math element." (section 2.1.4.1.4) Does this need further clarification?  |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## 2.1.4.1.3 Reading System Conformance ##

Do not make the support of MathML (even Presentational) mandatory, since
EPUB3 viewers dedicated to Manga will not support it.

> It must regard the mathml [Publications30](Publications30.md) property of the Package
> Document manifest item element as the authoritative definition of
> whether an XHTML Content Document includes embedded MathML.

| The WG decision to make RS support for MathML mandatory stands. Note that it has been clarified that mechanisms for formalized subsetting is a future workitem for the IDPF. Note also that support for Content MathML is optional (and only allowed inside the annotation-xml element) |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

What happens when a package file contains an item element does not announce "MathML", but the XHTML content referenced by the item element does have it?  We propose to syntactically disallow such EPUB publications.

| It is already disallowed; see 4.3.4 in Publications _"... Must be set if and only if the criterion specified ... "_ |
|:--------------------------------------------------------------------------------------------------------------------|

## 2.1.4.2 SVG ##

Remove the 2nd note since it adds nothing to the last para ("Reading Systems must ...").

| Done. |
|:------|

Why should the @src attribute of the iframe element reference XHTML?  Any problems in referencing SVG or PNG?

| [Issue 129](https://code.google.com/p/epub-revision/issues/detail?id=129). |
|:---------------------------------------------------------------------------|

## 2.2.4.1 ##

Replace "the href IRI attribute " by "the href attribute " and replace "IRI" in the bullet before last by "relative IRI reference".

| Done. |
|:------|

We propose to use UL rather than OL.  If numbers are not usually generated, the use of OL looks strange.  Moreover, when the nav document is viewed by the browser, it will generate numbers when OL is used.

| The WG decision to use OL has already been taken; see [this email](http://groups.google.com/group/epub-working-group/msg/9df50cc8b9077645) and [this email](http://groups.google.com/group/epub-working-group/msg/028d911ec9865621) |
|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## 2.2.4.2 ##

The EPUB 3 Structural Semantics Vocabulary has many values, and most of them are probably inappropriate for the nav element.  Make clear which of the values can be used for the nav elements.

| In order to support domain-specific semantic inflection, there are no restrictions (the toc, page-list and landmarks types have elevated status and occurrence restrictions, but beyond that, this is intentionally open-ended). Section 2.2.4.2 has been amended to make this more clear. |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## 3.3.1 ##

Why do we need "Reading Systems that have a CSS Viewport must support the font-family property."

| TODO @Brady |
|:------------|

## 3.3.2 ##

Drop "Additional details on these list styles can be found in [CSS3Lists](CSS3Lists.md)." unless an updated WD is published before the publication of EPUB3.  We know  that this is suboptimcal, but we can do nothing else.

| Done. |
|:------|

## 3.3.4 ##

There are some "characters" that can be rendered appropriately by SVG fonts but by nothing else.  For such characters, it is not possible for authors to "reference a generic font using the font-family property."

Also, "Such fallback must be a Core Media Type embedded font or generic font reference." in 5.2.3.2 CSS Style Sheets of EPUB3 Publications should be reworded as advice rather than a requirement.

| The section on font fallbacks is revised. In ContentDocs, it is now merely a note reference to the overarching "Publication Resource Type Restrictions and Fallback" section in the Publications spec, which references the generic CSS3 Fonts mechanism and nothing else. |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## 3.3.9 ##

Replace "will become" in the last note by "may become"
| Done. |
|:------|

## 3.3.10 ##

Deprecate oeb-page-foot and oeb-page-head, since it has not been widely implemented and nobody would like to promote them.

| Done as per wg decision, not deprecated but example updated with fallback  |
|:---------------------------------------------------------------------------|

## 4.2 ##

"MIME string" should be "media type".

| Done. |
|:------|

Is it OK to create a PLS document that is never associated with XHTML contents?

| Yes, there are no restrictions anywhere in EPUB that forbids inclusion (in container or manifest) of resources that are "not used". Note also that due to scripting support/possibilities for DOM manipulation, it is not possible or at least very complicated to tell in a static context whether or not a resource is actually used. |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## 4.2 ##

What does "PLS Documents must be represented and located as defined in EPUB Publication -- Content Conformance [Publications30](Publications30.md) ."
Declaration in the manifest?

| Yes, it refers to declaration in manifest and rules for resource locations (in container or remote), all which is specified if the links are followed. An attempt to make this more clear has been committed. _TODO Will attempt to make even more clear_  |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## B.4.1.3 Features ##

In the para after the table, replace "1.0" by "3.0", since 1 is neither the version of EPUB nor that of DOM/CSS.

| Markus: I assume the intent has been to reflect a version 1.0 of the epubReadingSystem object. Is this a problem? |
|:------------------------------------------------------------------------------------------------------------------|

We are puzzled by the current choice of required epubReadingSystem features.
We would like to suggest more features:

T2S
PLS
Media-Overlay
Mathml
vertical-lr
vertical-rl
horizontal-tb
direction-ltr
direction-rtl
page-progression-direction-rtl
page-progression-direciton-ltr
two-page-spread
video-aware
audio-aware
MPEG4
color

| The epubReadingSystem JavaScript object is intended to provide content creators a mechanism for determining the level of scripting support available to them on a particular reading system. Since this is an area where no specification provides interoperability requirements, the scripting subgroup recommended adding such a required object so content creators could experiment with scripts on a variety of platforms. In this initial implementation, it is not intended as a general-purpose feature detection module. Since some reading systems will not support any scripting, it would be a controversial mechanism for such discovery. However, we may in future versions decide to incorporate additional tests into the object.|
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|