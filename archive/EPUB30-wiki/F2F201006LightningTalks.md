



---


# Enhanced Global Language Support #

## Minimal Requirements for Japanese Text Layout ##
Takeshi Kanai, Sony, Murata Makoto, JEPA.

PowerPoint slides: [epubCJK.pptx](http://dl.dropbox.com/u/1007541/epub/f2f-201006/epubCJK.pptx)



# Accessibility #
## Accessibility and EPUB ##
George Kerscher and Kenny  Johar
### 1. Who Wants Access to eBooks ###
  * Blind and low vision (.3.3 of 1%)
  * Dyslexic (guessing 2%)
  * Learning Disabled (guessing 6%)
    * not all LD require accessibility techniques
  * Physically disabled, such as quadriplegics
  * Cognitively disabled

### 2. Legal Considerations ###
  * United Nations Convention on the Rights of Persons with Disabilities
  * Laws in countries, such as 508 and 504 in the USA
  * Department of Justice (DOJ)  and settlements
  * Voluntary refusals to not use inaccessible technologies

### 3.  The Handshake between semantically Rich, Structured  content and reading systems ###
  * Content must be accessible AND  Reading System UI must be accessible
  * Websites for purchasing must be accessible (W3C - Web Content Accessibility Guidelines 2.0)
  * Semantically rich  structured content is essential
  * Intelligent reading Systems use the semantics

### 4. Techniques ###
  * Structure the content using semantics
  * Identify content based on what it is, e.g. a paragraph is not a heading!
  * Order the content for correct reading order, i.e. the way it appears in a DOM
  * Images, flow charts, etc. require short and long descriptions
  * Video must support captioning and descriptive audio channel
  * Interactivity must be accessible, which is a big question

### 5. Key Benefits of incorporating accessibility ###

  * Legislative compliance.
  * Corporate Social Responsibility.
  * Highly sophisticated navigation scenarios can be created for semantically rich content i.e. gestures or keystrokes to jump to different landmarks in the book e.g. headings, footnotes, long descriptions ...
  * Highly sophisticated user interfaces can be created for semantically rich content on different devices e.g. an epub reader on a mobile phone that displays the long description for an image in a layered panel when the user moves her finger over the image.


---

## Speech Synthesizer support ##
Markus Gylling

  * An increasing number of reading systems ship with built-in TTS
  * For the print disabled in particular, this is a crucial feature
  * But good (read: low rate of mispronunciation, near-correct prosody (stress, intonation) is a general reading system usability concern

### Problems ###
The use of TTS within the DAISY realm over the past decade has identified the following core problems:
  * While TTS quality has improved, the quality varies dramatically between languages (the bigger the language, the larger the market for TTS vendors)
  * For academic and specific-domain content, most TTS's fail miserably (too many terms not covered by hardwired lexicon). For professionals and students, this means that consuming content using TTS is painful at best and impossible at worst.

### Requirements ###
  * A way to link to publication and/or document-wide pronunciation lexica
  * A way to specify atomic pronunciation and prosody rules inline (lexicon-provided generalizations are not sufficient)

### Solutions ###
Existing languages that we can reuse:
#### SSML ####
  * [PLS](http://www.w3.org/TR/pronunciation-lexicon/) defines a lexicon document type for pronunciation instructions
  * [SSML 1.1](http://www.w3.org/TR/speech-synthesis11/) defines a set of elements that can be adapted for inline usage. (see also Z3986-AI which defines an [attribute-axis-only adaption](http://www.daisy.org/z3986/2011/schema/mod/ssml-phoneme-attrib.rng) for SSML-based pronunciation instructions).

... note: SSML is partially or fully supported by TTS engines such as [cepstral](http://cepstral.com/cgi-bin/support?page=ssml), [AT&amp;T](http://vhost.oddcast.com/vhost_minisite/support/ssml/ssml.php?engine=1), [Loquendo](http://vhost.oddcast.com/vhost_minisite/support/ssml/ssml.php?engine=2), [neospeech](http://www.neospeech.com/), and more.

#### CSS3 ####
  * http://www.w3.org/TR/css3-speech/



---

# Metadata #


## Metadata in EPUB ##
Bill Kasdorf, Apex CoVantage

  * It’s not whether metadata belongs, but which metadata belongs
  * What is essential?
  * What is stable (ideally, permanent)?
  * What vocabularies are widely used?

### Standards are only part of the story ###
  * Most standards are created for specific purposes
  * Often have aspects useful to ePub
  * Usually have way more than we’d want to include
  * Usage is incomplete and inconsistent

### Examples ###
  * MARC records—libraries
  * Dublin Core—universal, flexible, incl. non-text content
  * PRISM—publication (esp. magazine) oriented
  * XMP, IPTC, Exif, PSIR, etc.—image metadata formats
  * ONIX—bookselling

### My focus today: ONIX ###
  * A communication or messaging format
  * Focused on selling books (print, eBooks, audio, etc.)
  * Very rich model—publishers use only a fraction of it
  * Mainly a marketing function
  * Constantly updated by publishers—periodic feeds

### ONIX 3.0 (4/2009): Modular, enhanced for e-books ###
  * Message header
  * Record & product identity (13 identifier types)
  * Descriptive detail
    * `<ProductFormDetail>`EPUB`</ProductFormDetail>`
    * `<EpubTechnicalProtection>` (none; DRM; digital watermark; Adobe DRM)
    * `<EpubUsageConstraint>` types & limits (e.g., preview, print, copy/paste, share, text-to-speech)
    * Collection/part info
    * Title types and detail
    * Authorship/contributor info
    * Language
    * Extents, illustration info
    * Subject info (keywords, BISAC, BIC, LC, Dewey, MeSH, etc. (many international schemes))
    * Audience info
  * Collateral detail (descriptions, cited content, links, prizes)
  * Content detail (incl. page numbering, etc.)
  * Publishing detail (incl. © info, territorial rights)
  * Related material
  * Product supply info (markets, distributors, prices, etc.)

### Organisations we should collaborate with on this ###
  * DAISY
  * BISG
  * BIC
  * Editeur
  * NISO


---


## Issues with Magazines and Serial Publications ##

### Dianne Kennedy, Peter Meirs ###

### A Note ###

  * IDEAlliance PRISM has recommended XML metadata for publisher/aggregator interchange of articles
  * IDEAlliance is currently working to update XML metadata for delivery of article/magazines to eReaders
  * Working in coordination with IDPF



### Issues ###

  * Title (is this the magazine title?  The article title? How can we differentiate?)
  * In addition to publisher, Magazines need to identify the “corporateEntity” of the publisher
  * We also need “productCode”and “IssueIdentifier” in addition to dc:identifier unless these can be handled with opf:scheme
  * Dates: Magazines require a number of dates:
    * prism:coverDate
    * prism:coverDisplayDate
    * prism:publicationDate

### Issues Article Identification Metadata ###

  * Identifiers for an article
    * prism:volume
    * prism:number
    * prism:issueName
    * prism:edition
    * prism:versionIdentifier
    * prism:startingPage
    * prism:endingPage
    * prism:pageRange

### Issue: Article Subject Metadata ###

  * Article subject metadata
    * dc:subject
    * prism:keyword
    * dc:description
    * prism:event
    * prism:industry
    * prism:location
    * prism:object
    * prism:organization
    * prism:person
    * prism:timePeriod
    * prism:ticker
    * prism:genre

### Recommendation ###

**Develop mechanism to include PRISM metadata for serial publications within ePub** We prefer to have ePub develop an extension mechanism to enable inclusion of PRISM metadata set for e-Readers than for IDEAlliance to develop a competing standard


---




# Semantics #
## Dictionaries ##
Jeff Alexander, Intangible Press

### Problems ###
  * EPUB is currently designed for books that are read from beginning to end, rather than for books that are used for very fast information lookup:
    * Dictionaries
    * Encyclopedias
    * Medical books such as drug information or diagnostic guides (ie, for looking up a drug by generic name "acetaminophen" or brand name "Tylenol", or a disease name in an alphabetical listing)
    * Possibly other types of books such as cookbooks, travel guides, etc.
  * Standard "find"-type search features are not sufficient for dictionary lookup
  * Two main use cases for dictionaries: 1) lookup while reading another book, 2) free-form lookup
  * Use case for glossary: lookup that is tied to a particular book
  * Dictionaries are complicated
  * Dictionaries contain a much wider range of special characters than other books
  * Dictionary data sets range from large to enormous
### Requirements ###
  * A way to associate one or more search terms with a particular content region (a "dictionary entry")
  * A way to associate several types of searchable words with a dictionary entry:
    * Alternate spellings (eg, colour, color)
    * Derived forms (eg, "accessorize" at the end of an "accessory" entry)
    * Inflected forms which need to be searched but not displayed (eg, "runs, running, ran" for English "to run", or dozens of forms for verbs in French, Spanish, etc.)
    * Single word represented in multiple writing systems (eg, a Japanese dictionary gives both katakana and kanji forms)
  * A way for reading system to identify an ebook as a dictionary (eg, from metadata)
  * Accommodate both bilingual and monolingual dictionaries

### Solution Guidelines ###
  * Performance!  Must enable fast lookup, and it should take approximately the same time to look up "aardvark" and "zoo"
  * Flexibility to handle a variety of lookup-oriented content
  * Adaptable to a range of languages and to non-Latin writing systems


---

## Book semantics in XHTML and the future of DTBook ##
Markus Gylling, DAISY

  * EPUB 2.0: DAISY XML (DTBook) as a text content format, alternative to XHTML 1.1
  * Ongoing revision to the DAISY standard (ANSI/NISO Z39.86-2011): distinct format-level separation between authoring and distribution
    * for authoring purposes, using a dedicated XML grammar (public draft at http://www.daisy.org/z3986/2011/)
    * for distribution purposes, intending to use a derivative of XHTML

### Migration rationale ###
The cost-benefit ratio of using a non-XHTML-family grammar for distribution:
  * challenging to make use of web browsers as rendering components (increases cost and negatively impacts user experience)
  * AT created for the web not tuned to adapting behavior to elements in foreign namespaces
  * Semantics of XHTML are pretty close to DTBook anyway; in the minimal case, only a few extensions needed

### Migration success criteria ###
Accessibility- and content integrity-wise, the following are success criteria for moving from DTBook to XHTML:
  * (accessibility of rich media and interactivity left aside in this talk)
  * ability to express content model restrictions (maintaining strict(er) requirements on document structure)
  * ability to extend the semantics (see below)

... think of the idea as a "strict profile" of EPUB XHTML with a few extensions, suitable for textbook domain content.

### Building the list of extension needs ###
Remember: rich and predictable semantics is a fundamental requirement for building an intelligent reading system (the way DAISY defines "intelligent")

  * noting that (X)HTML5 is a better starting point than XHTML1.x given its (likely) inclusion of elements such as section, aside, hgroup, figure, math, ruby
  * general textbook domain elements identified as missing include:
    * notes and note references
    * annotations (original marginalia) and annotation references
    * equivalent of docbook:bridgehead (non-structurally-significant heading)
    * glossaries/dictionaries (in the backmatter sense, cf. [#Dictionaries](#Dictionaries.md))
    * image groups (and rich (read:marked up) textual descriptions of images)
    * pagebreaks (authoring-time concern mainly)

> ... but of course, the list can be extended depending on whether drama, poetry and other types of content are included.

### Solution options ###
Note that CDI (namespace-based extension) isn't the only alternative; attribute-axis semantic inflections can be used as well in some cases.

### Consequences for EPUB ###
A win-win situation: instead of having to support two distinctly separate grammars, we move towards a situation where namespaces and (fundamental) markup models are shared. This reduces cost of implementation for reading systems/authoring tools/AT.


---


## PRISM and Articles ##

### Dianne Kennedy, Peter Meirs ###

### A Note ###

  * IDEAlliance PRISM has recommended XML metadata for publisher/aggregator interchange of articles
  * IDEAlliance is currently working to modify XML metadata for delivery of article/magazines to eReaders
  * Working in coordination with IDPF



### ePub Content Coding ###

  * Both PRISM/XML and ePub are based on XHTML
  * Coding of current book content is not as “rich” as magazines require
    * Navigation/findability
    * Layout
  * PRISM/XML handles this through the addition of prism:class= attribute

### PRISM Class Attribute ###

  * body
  * box
  * byline
  * caption
  * credit
  * dateline
  * deck
  * footnotes
  * lead-in
  * pullQuote
  * sidebar
  * teaser



### InLine Content Coding ###

  * Magazines have a requirement for inline content encoding to facilitate precise search
    * pim:event
    * pim:industry
    * pim:location
    * pim:object
    * pim:organization
    * pim:person
    * pim:quote
    * pim:keyword
    * pim:ticker
    * pim:timePeriod



### Coding for Rich Media ###

  * Object is too simplistic to handle media
  * This revision of ePub should handle that
  * prism:media may be considered as a model
    * includes dc:creator, dc:contributor, dc:identifier for media object
    * includes prism:mediaTitle, prism:caption, prism:credit

### Ad Material ###

  * We have a requirement to link Ad material to editorial content

### Recommendations ###

  * Recommend a mechanism to support encoding of magazine/serial publication content within ePub



---



# Navigation #
## Enhancements in the next generation NCX ##
Markus Gylling and George Kerscher, DAISY

As became clear in the 2.01/maintenance WG,
  * NCX was insufficiently documented in the specification (direct evidence that the intent of navMap and the availability of navLists were not made clear enough)
  * The direct lift-over of the DTD from the DAISY spec contributed to the confusion (multimodality, head metadata, @playorder that did not apply to the EPUB usage scenario)

ANSI/NISO Z39.86-2011 introduces the following major changes to the NCX grammar:
  * modularized, allowing creation of [tailor-made NCX grammars](http://code.google.com/p/zednext/source/browse/sandbox/ZedDist/src/schema/) for particular usage domains (such as EPUB)
  * allow expressions of machine-readable metadata for groups of, and individual, navigation items
  * ability to use (XHTML) markup in labels (i18n requirement)
  * increased terseness (smaller document size)

Need to collect further requirements from EPUB:
  * Examples from EPUB 2.0:
    * Multiple pagelists for the same publication (editions, and or paperback/hardback) (relates to machine-readable metadata)
    * Multilinguality/multimodality (are supported by the NCX in general - relevant in EPUB?)
  * Examples from EPUB 2.1/3.0:
    * Do we want to use the NCX to navigate rich media (say, a long video clip with distinct scenes/events) in addition to global document navigation?

# Layout and Styling #
## Targetting Multiple Display Surfaces ##
Brady Duga, eBook Technologies
### Traditional Layout ###
Layout to a single display surface (e.g. a page of known size) allows for certain assumptions that can determine a choice of font, margins, columns, etc. When new surfaces are thrown into the mix (e.g. a smartphone with 2 orientations, a tablet device, a computer with resizeable windows on a 30in monitor, text-to-speech) these assumptions fail.

### Current State of Affairs ###
  * No conditional styling in ePub, with limited exceptions in CSS like em units and percent values
  * Display decisions on different surfaces left to Reading System which causes non-uniform content degradation
  * Best results obtained with minimal styles
  * Third party work-arounds

### Not Just our Problem ###
Same problem exists today on the Web. What are the solutions there?
  1. Server-based device detection (user-agent strings and such)
  1. Conditional styling via media-queries (in CSS and html)
  1. Dynamic styling using various scripting mechanisms

Option 1 is not available to us (no server in the mix), option 2 is not specifically supported in ePub and option 3 is not recommended (all reading systems are required to do is not display scripts to the user).

### ePub is not the Web ###
Users and content creators expect more from their publications. Users will not be willing to pinch-zoom every page to a reasonable size.
  * Professional styling even in simple fiction
  * House styles preserved
  * Custom crafted content
  * Complex layout (textbooks, etc)
  * Styles preserved at various font sizes

### Basic Requirements ###

  * Changes based on physical display size, ppi, color
    * Alter text characteristics (size, drop caps, etc)
    * Modify box properties (margins, padding, etc.)
    * Change flow (float to inline, number of columns, etc)
    * Adjust media properties (images, etc)
  * Also account for font changes by the user

### Examples ###
(coming soon to a Wiki near you)

### Core Requirements ###
A few core requirements emerge when we consider these features:

  * Manageable content creation
    * Styling for multiple sizes must be possible with reasonable resources
  * Implementable
    * Actual Reading System support is a must

## From PDF to EPUB: Lost in Translation ##
Thomas Hadfield, CourseSmart

PowerPoint slides: [From\_PDF\_to\_ePub\_Final.ppt](http://files.me.com/tjhadfield/wvyqka)

CourseSmart is a service provider selling Higher Education eTextbooks to students and providing electronic desk copies to instructors.

Our product delivery is primarily web-based, although we do provide a downloadable option via a partnership.

CourseSmart’s product was designed to solve several problems:

  * Lowering the cost of textbooks to students
  * Providing a lower-cost, environmentally-friendly mechanism for providing instructor evaluation materials
  * Utilize a very low-cost, easy workflow content ingestion process that lowers the barrier to publishers submitting textbooks
  * Provide a highly reliable DRM solution to protect our member publishers
  * Realizing that low-cost eTextbooks would co-exist with print textbooks for an indeterminate future, providing a format that allows side by side use of print and eTextbook formats

CourseSmart uses a “Page Fidelity” view providing identical pagination and formatting with the print book. The source files are the compositer produced PDFs that are converted to encrypted and watermarked JPGs with indexed text to permit searching and highlighting.

While this solution meets all of our initial product objectives, it is not amenable to:

  * Smaller devices that need reflowability
  * Requires more effort to support accessibility

Additionally, this format requires very large file sizes for large books.

CourseSmart has evaluated moving to an ePub standard, but has found the technology less than ideal as a solution to our problem set which we feel requires a rich layout. We have evaluated solutions such as HTML5 but are concerned that once text is available in the browser, our DRM is less effective.

## Layout Requirements in Complex Documents ##
Ric Wright, Engineering Manager – Digital Publishing, Adobe Systems

PDF paper: [IDPF\_F2F\_LayoutReqs.pdf](http://dl.dropbox.com/u/1007541/epub/f2f-201006/IDPF_F2F_LayoutReqs.pdf)

---


# Interactivity and Rich Media #
## EPUB 2.1 Rich Media Thoughts ##
Garth Conboy, eBook Technologies, Inc.

PowerPoint slides: [EPUB\_2.1\_Rich\_Content.ppt](http://www.ebooktechnologies.com/downloads/EPUB_2.1_Rich_Content.ppt)

Demo EPUB (potentially evil, as it depends on Reading System knowledge; a direction we want to avoid in EPUB 2.1): [SIMPLERICHCONTENT.epub](http://www.ebooktechnologies.com/downloads/SIMPLERICHCONTENT.epub)


## Rich Media and Interactivity - The Challenges ##
Ric Wright, Adobe

### Problem ###
  * many speakers have mentioned the need for both animation and interactivity
  * iPad frenzy (soon to be Android tablet frenzy too)
  * applicable to all forms of media (books, newsreaders, magazines)

### Requirements ###
  * Need a way to author both animation and interactivity
  * Books should work across platforms
  * Books should not break in (relative) perpetuity
  * Leverages known standards

### Problems ###
  * Markup
    * No standard in sight
      * SWF
        * Although partially "standard", not perceived as such
    * HTML5/CSS3
      * "Publication as a Working Draft does not imply endorsement by the W3C Membership. This is a draft document and may be updated, replaced or obsoleted by other documents at any time. It is inappropriate to cite this document as other than work in progress. "
    * SVG Animation
      * 1.1 is a recommendation, but now almost deprecated.  SVG 1.2 was abandoned.
    * Effects of changes over time in standards
    * Name changes per se
    * Changes of underlying behaviour

### Implementation ###
  * Performance
    * Range of EPUB devices from slow ARM processors with slow memory to fast desktops with GPUs
    * Slower devices may not handle interactivity little or not at all.  Fallbacks?
    * Lots of interactivity may eat batteries
  * Scripting
    * Not all scripting engines are the same.  What's the standard?
    * What can be scripted?  A "core media type"?  The actual text of the book (yikes)?
  * Display Technologies
    * eInk devices which are widely proliferated cannot support much interactivity or rich media

### End-Game ###
  * Bottom line:
    * Are publishers willing to step up and request this support in the spec and acknowledge that this will result in books that degrade over time and potentially break completely?
  * Does the IDPF wish to bless a spec (HTML5/CSS3) which is encapsulated in the latest build of WebKit?



## DAISY Multimedia Synchronization ##
Marisa DeMeglio, DAISY Consortium

### What and Why ###
DAISY books are accessible eBooks which feature synchronized audio and text.

Some user groups for these types of books:
  * Print-disabled: dyslexic, blind, low-vision (DAISY users)
  * Mainstream readers of audio books with text.


### How does DAISY do it? ###

  * Key components: structured text and human-narrated audio
  * Use SMIL to define synchronization points between text chunks with audio chunks
  * DAISY players contain SMIL-playing components which control audio playback and text highlighting.
  * This way, SMIL works seamlessly with the text and navigation.  E.g., the user selects a chapter, and the book audio starts at that point.  Or, the user has certain preferences, e.g. don't read page numbers (they get in the way of the narrative) -- the SMIL player skips over the page number announcements.

### How could EPUB do it? ###

  * Already has structured text
  * Use SMIL to synchronize audio content
  * SMIL would be a transparent overlay on top of the document
  * SMIL could also be used to supplement islands of content within the document, e.g. SVG or Math
  * It is possible to use a limited subset of SMIL with low overhead
  * Reading devices that don't understand SMIL can ignore the overlay and not be affected by it

### More information ###

  * See DAISY in action: [AMIS DAISY Player video](http://www.youtube.com/watch?v=xbrm0iOe1AI)
  * See a visual for the proposed SmilOverlayFileset

# Extensibility #
Ben Trafford

PDF paper: [IDPFf2fPaper.pdf](http://dl.dropbox.com/u/1007541/epub/f2f-201006/IDPFf2fPaper.pdf)

## Extensibility in ePub ##
  * Why it's important

### History ###
  * How we got here

### Roadmap ###
  * What did we do before?
    * OEBPS 1.0 - 1.2
      * ePub 2.0
  * Future Extensibility
    * Supporting pure XML
    * Handling display behaviors
    * Cross-platform compatibility

### Extensibility and the Charter ###
  * What can be rolled into extensions, and why

### A Radical Suggestion ###
  * Why have preferred vocabularies at all?

# Annotations #
## EPUB 2.1 Annotations ##
Will Manis, Viscous Documents

PowerPoint slides: [Annotations.ppt](http://files.me.com/wmanis/c2o1l8)

# Advertising #
## EPUB 2.1 Ads ##
Will Manis, Viscous Documents

PowerPoint slides: [Advertising.ppt](http://files.me.com/wmanis/88jp9q)