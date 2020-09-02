

# Overview #

This wiki page represents a consolidation of all issues opened against the Structural Semantics Vocabulary in the 3.0.1 issue tracker.

The information on this page will be used as a starting point for further discussions of changes to the document.

# Issues #

[Filtered list of open issues.](https://code.google.com/p/epub-revision/issues/list?can=2&q=spec=StructureVocab)

## General Clarification ##

  * [Issue 266](https://code.google.com/p/epub-revision/issues/detail?id=266)

> That the HTML usage contexts are only recommendations needs to be made clearer, as there are (edge) cases that don't always fit, causing confusion for content creators about the validity

> The second sentence in the About section indicates that reading systems may ignore semantics not used according to the html usage context, but the first sentence's "is considered relevant" is not a normative requirement that the contexts must be respected.

> The second sentence was intended to provide guidance to authors that these semantics should not be abused (e.g., div and span documents with semantics), but a pointer to the spec prose would help clarify this point better.

> Propose the following new text to clarify:

> The HTML usage context fields indicate contexts in HTML5 documents where the given property is considered relevant. Authors may use the properties on HTML5 markup elements not specifically listed, but must ensure that the semantics they express represent a subset of the carrying element's semantics and do not attach an existing element's meaning to a semantically neutral element, as required in [EPUB Content Documents](http://www.idpf.org/epub/30/spec/epub30-contentdocs.html#sec-xhtml-content-type-attribute).

> When processing HTML5 documents, Reading Systems may ignore such non-compliant properties, unless their usage context is explicitly overridden or extended by the host specification.

## Property Changes ##

### Clarifications ###

  * [Issue 197](https://code.google.com/p/epub-revision/issues/detail?id=197) -- Clarify that bodymatter term is not equivalent of XHTML body element
> The definitions for all three -matter elements need to be standardized. Propose using "main content of a publication" as noted, avoiding repeating "body" and causing confusion with the tag:

> frontmatter

> Preliminary material to the main content of a publication, such as tables of contents, dedications, etc.

> bodymatter

> The main content of a publication.

> backmatter

> Ancillary material occurring after the main content of a publication, such as indices, appendices, etc.
  * [Issue 198](https://code.google.com/p/epub-revision/issues/detail?id=198) -- Is it possible to use afterword for a postscript or concluding note
> An afterword can be a postscript or concluding note from the author, so this is consistent. The current wording is perhaps not clear enough that it can be author written. Propose the following text:

> afterword

> A closing statement from the author or a person of importance to the story, typically providing insight into how the story came to be written, its significance or related events that have transpired since its timeline.

  * [Issue 222](https://code.google.com/p/epub-revision/issues/detail?id=222) -- Clarify relationship/use of note in relation to endnote and footnote properties (also raised in [Issue 266](https://code.google.com/p/epub-revision/issues/detail?id=266))
> The requirement that note be a rearnote or footnote is the source of confusion, as this linkage makes it unclear why note is needed, which is to move away from legacy print spatial locations. The definition should be reworded as:

> A note. This property does not carry spatial positioning semantics, as do the footnote and rearnote properties. It can be used to identify footnotes, rear notes, marginal notes, inline notes, and similar when legacy naming conventions are not desired.

  * [Issue 266](https://code.google.com/p/epub-revision/issues/detail?id=266) -- Plural forms are sometimes missing, like with practice when a section may contain more than one
> Propose adding a new "practices" semantic for sections of practice questions and broadening the allowed usage context for practice to include lists, paragraphs and divs to account for block contexts within a section of practices.
  * [Issue 266](https://code.google.com/p/epub-revision/issues/detail?id=266) -- Clearly define the meaning of marginalia: is it content in the margin or a type of annotation/note. Propose clarifying that marginalia indicates the placement of content in the margin:

> Content, both textual and graphical, that is offset in the margin.

### Typos ###

  * loi - change "if of" to "of"

### Additions ###

_The following section summarizes all the requested additions from the issue tracker and the comments field that will be considered in the 3.0.1 revision._

#### Covers ####
Additional cover semantics will not be tackled during the 301 revision.
<strike>
<ul><li>frontcover<br>
</li><li>spine<br>
</li><li>backcover<br>
</li><li>insidecover<br>
</li><li>flaps<br>
</strike></li></ul>

#### Titles ####
  * <strike>divisionaltitlepage</strike> - request withdrawn
  * <strike>flytitlepage</strike> - request withdrawn

  * **title** - The primary name of a work, section or component.
> HTML usage context: h1-h6,  phrasing content descendants of h1-h6
  * **subtitle** - A secondary name of a work, section or component that supplements or augments the title.
> HTML usage context: h1-h6,  phrasing content descendants of h1-h6, paragraphs and divs
  * **heading-label** - The text label that precedes a heading number (e.g., 'Chapter' or 'Part').
> HTML usage context: Phrasing content descendants of h1-h6
  * **heading-number** - The numeric or alphabetic identifier component of a heading.
> HTML usage context: Phrasing content descendants of h1-h6

#### Navigation ####
  * **loa** - A listing of audio clips included in the work.
> HTML usage context: sectioning content
  * **lov** - A listing of video clips included in the work.
> HTML usage context: sectioning content

#### Education ####
  * **learning-objective** - An explicit designation or description of a learning objective or a reference to an explicit learning objective.
> HTML usage context: Flow content or phrase content
  * **learning-resource** - A resource provided to enhance learning, or a reference to such a resource.
> HTML usage context: Flow content
  * **outcome** - The understanding or ability a student is expected to achieve as a result of a lesson or activity.
> HTML usage context: Flow content
  * **standard** - In education, a formal set of expectations or requirements typically issued by a government or a standards body.
> HTML usage context: sectioning content or phrase content
  * **assessment** - A test, quiz, or other activity that helps measure a student's understanding of what is being taught.
> HTML usage context: sectioning content
  * **qna** - A question and answer section.
> HTML usage context: lists, sectioning content

#### Indexes and Dictionaries ####

Additions to the vocab pertaining to Indexes and Dictionaries will be submitted separately.

#### AHL ####

Additions to the vocab pertaining to AHL will be submitted separately.

#### Poetry ####
<strike>
<ul><li>poem, strophe, line defined in <a href='http://www.w3.org/html/wg/wiki/PoeticSemantics'>W3C Poetic Semantics Proposal</a>, as are poem:freeForm, poem:experiemental, poem:foundPoetry, poem:concretePoetry<br>
</li><li>poem, song, hymn, lyrics defined in z39.98<br>
</strike></li></ul>

Poetry will not be tackled during the 3.0.1 revision.

#### Miscellaneous ####
  * **revision-history** - A record of changes made to a work.
> HTML usage context: lists, sectioning content
  * **figure** - An illustration, diagram, photo, code listing or similar, referenced from the text of a work, and typically annotated with a title, caption and/or credits.
> HTML usage context: Deprecated

> Media Overlays usage context: Identifies a seq or par as an escapable or skippable figure.

### List of Issues ###

  * [Issue 198](https://code.google.com/p/epub-revision/issues/detail?id=198) -- Add additional terms for cover elements (front/back/flaps)
  * [Issue 198](https://code.google.com/p/epub-revision/issues/detail?id=198) -- Add additional term for chapter/division title pages
  * [Issue 198](https://code.google.com/p/epub-revision/issues/detail?id=198) -- Add additional term for revision histories
  * [Issue 223](https://code.google.com/p/epub-revision/issues/detail?id=223) -- Add semantics for individual parts of a title (number/title/subtitle)
  * [Issue 229](https://code.google.com/p/epub-revision/issues/detail?id=229) -- Add list of audio and list of video properties for nav doc use
  * [Issue 261](https://code.google.com/p/epub-revision/issues/detail?id=261) -- Add figure semantic for media overlays (also reqested for indexes in issue [Issue 297](https://code.google.com/p/epub-revision/issues/detail?id=297))
  * [Issue 266](https://code.google.com/p/epub-revision/issues/detail?id=266) -- Add more properties for educational producers (learning objective/learning outcome/standard and assessment (question & answer) are specifically noted)
  * [Issue 296](https://code.google.com/p/epub-revision/issues/detail?id=296) -- General request by index group to expand property list (photograph, flowchart, graph, code-example, equation, map were cited)
  * [Issue 297](https://code.google.com/p/epub-revision/issues/detail?id=297) -- Add properties defined in the index/dictionary work to the structure vocab to avoid prefixing