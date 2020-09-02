# Introduction #

In preparation to the [IDPF EPUB Workshop for Fixed Layout in Taipei on 2011-10-25](TaipeiFixedLayoutWorkshop.md), a taxonomy of mechanisms for fixed layout is presented. It is hoped that this taxonomy will allow the IDPF to understand existing mechanisms or upcoming proposals for fixed layout and compare different mechanisms or proposals.

Feedback on this taxonomy is welcome.  Additions or modifications are also very welcome, but please contact the facilitator, MURATA Makoto (eb2m-mrt atmark asahi-net.or.jp), in advance.

# M1: Mechanisms for specifying fixed layout #

  * M1A: HTML and CSS relative or absolute positioning
    * Example: [JPEG-in-HTML-in-spine example](http://epub-revision.googlecode.com/files/harukoHTML.epub)
    * Example: [iBooksFixedLayout](iBooksFixedLayout.md)
    * Example: [The "Bifter" comic](http://www.bifter.co.uk/issue/8/)
    * How do we represent text in SVG?
      1. M1A1: text as bitmap image (pros: simplicity; cons: accessibility)
      1. M1A2: textual elements of html
    * Concern: Authors may inadvertently rely on CSS/HTML features which are not guaranteed (by those specs or by any implementer) to work the same in the future. Text layout and line breaking are unstable algorithms in the sense that even small changes can produce very noticeable differences.
  * M1B: SVG containing images and text
    * Example: [JPEG-in-SVG example](http://epub-revision.googlecode.com/files/harukoSVG.epub)
    * Example: [The "Bifter" comic](http://www.bifter.co.uk/issues/8.svg)
    * How do we represent text in SVG?
      1. M1B1: text as bitmap image (pros: simplicity; cons: accessibility)
      1. M1B2: 'text' elements (cons: no fancy text constructs such as ruby)
      1. M1B3: 'foreignObject' elements containing HTML
      1. M1B4: use 'text' elements but simulate typographic artifacts such as ruby by explicit size/pos
      1. M1B5: mix HTML & SVG w/out namespace mechanisms (a la emerging W3C proposals)
  * M1C: Bitmap images (e.g., JPEG and PNG)
    * Example: [JEPG-in-spine example](http://epub-revision.googlecode.com/files/harukoJPEG.epub)
    * Example: [BNFixedFormat](BNFixedFormat.md) ([Example](http://epub-revision.googlecode.com/files/COSMO-20101001_drp.epub))
    * How do we provide text for accessibility?
      1. M1C1: fallback chain to HTML
      1. M1C2: none (_**New**_) or alibi fallback
  * M1D: JSON or other custom data format packaged with JS renderer
    1. PDF and renderers such as [PDF.js](https://github.com/andreasgal/pdf.js/)
    1. [Portable Game Notation (Chess)](http://en.wikipedia.org/wiki/Portable_Game_Notation) and its renders in Javascript
    1. [Smart Game Format (mainly for Go)](http://en.wikipedia.org/wiki/Smart_Game_Format)and its renders in Javascript

# M2: Mechanisms for announcing fixed layoutness #

  * M2A: Properties in EPUB package documents
    * M2A1: Properties of meta elements (e.g., [SonyFixedLayoutFormat](SonyFixedLayoutFormat.md))
    * M2A2: Properties of item elements
  * M2B: Meta elements of HTML5 documents  (e.g., [iBooksFixedLayout](iBooksFixedLayout.md) proposal)
  * M2C: _**New**_ "properties" in container.xml
  * M2D: _**New**_ Files of particular names in EPUB3 publications (e.g., [BNFixedFormat](BNFixedFormat.md))
  * M2E: - display-options file in META-INF directory (e.g. iBooks fixed layout in market)

# M3: Mechanisms for selecting a particular fixed layout from a collection of fixed or reflow layouts #

  * M3A: CSS media queries
  * M3B: Multiple package documents (possibly having properties in container.xml or package documents) per OCF Container
    * Note that M2A1 and M2C may be used for providing additional information for this mechanism.

# M4: Granularity #

  * M4A: Representation of pages
    * M4A1: A single XHTML/SVG/image file per page (e.g., [iBooksFixedLayout](iBooksFixedLayout.md))
    * M4A2: A single XHTML/SVG/image file per two-page spread
      * Note: Some mechanism (either CSS or something _**New**_ (and risky!)) for controlling page break is needed.
    * M4A3: A single XHTML/SVG/image file for a collection of pages, but a div or some other element is introduced per page.
      * Note: Some mechanism (either CSS or something _**New**_ (and risky!)) for controlling page break is needed.
  * M4B: Representation of cells, panels, or regions
    * It becomes possible to provide sophisticated user interactions (e.g., automatic panning and zooming; region-based links to internal or external documents) if cells, panels, or regions are explicitly represented.
    1. M4B1: None
    1. M4B2: Elements in XHTML or SVG
    1. M4B3 (_**New**_) : Additional resources containing sequences of rectangles or polygons.  Each rectangle or polygon may further contain a link to a different resource.
      * Example: [BNFixedFormat](BNFixedFormat.md) ([Example](http://epub-revision.googlecode.com/files/COSMO-20101001_drp.epub))