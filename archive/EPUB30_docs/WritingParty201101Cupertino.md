

# Purpose #
This is a writing party, focusing on finalizing remaining issues and producing spec prose for the [ContentDocs](http://epub-revision.googlecode.com/svn-history/r2041/trunk/build/spec/epub30-contentdocs.html) spec, with primary focus on the CSS3 section(s).

# Location #

**De Anza 6** (name of the building)

**10355 N De Anza Blvd, Cupertino, California 95014** ([map](http://maps.google.com/maps?q=10355+N+De+Anza+Blvd+Cupertino+California+95014+))

  * 1/11: Arena meeting room
  * 1/12: Grand Canyon meeting room

The group will take notes over IRC and welcomes remote IRC participation. Remote phone participation is not planned. Please notify Markus over email if you intend to participate over IRC.

# Participants #
_(tentative)_
  * Murata Makoto (FAMILY Given)
  * Fantasai
  * Koji Ishii
  * Peter Sorotokin
  * Takeshi Kanai
  * Matt Garrish
  * Yasuo Kida
  * Brady Duga
  * Mika Nakamura
  * Garth Conboy (likely)
  * Bill McCoy (possibly)
  * Markus Gylling

# Linkage #
  * [Latest ContentDocs spec (trunk)](http://epub-revision.googlecode.com/svn-history/trunk/build/spec/epub30-contentdocs.html)
  * [Notes & decisions from the plenaries on the second day of the Oct 2010 F2F](http://code.google.com/p/epub-revision/wiki/F2F201010Day2Notes)
  * [http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WG.html](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WG.html)
    * [Proposed modifications to EGLS subgroup recommendation](http://code.google.com/p/epub-revision/wiki/EGLSProposalComments)
  * [CSS3Relations](CSS3Relations.md)
  * [warning note http://code.google.com/p/epub-revision/wiki/SolutionSNLR3\_3](Draft.md)
  * CSS Spec Status http://dl.dropbox.com/u/8812114/epub-css-status.htm
  * http://fantasai.inkedblade.net/style/specs/altss-tags/

# Agenda #
## Day 1, Tuesday 11th of January 9:00 - 17:00 ##

  * introduction, logistics
  * scribing, scribe style
  * finalizing agenda
  * dinner in the evening?

### CSS Relations ###

#### EGLS ####

  * Identifying specifications in the CSS family that are required for reasonable EGLS support in EPUB3 and reviewing the current status of each of them (when necessary, we review each of the properties)
  * Normative references or non-normative references?
  * Dated references or undated references?
  * What can be implementation-dependent or implementation-defined?  Note: "Implementation-dependent" means implementations can do anything, while "implementation-defined" means that implementations are required to provide documentation for the adopted definitions.
  * What kind of warning is required?
  * Should we attach the prefix **idpf-** to properties?
  * Should we copy syntactical definitions and/or semantics definitions from non-normative references?
  * IPR issues

#### CSS Speech ####
Establish relation as done for EGLS

## Day 2, Wednesday 12th of January 9:00 - 17:00 ##

### CSS3 relations cont'd ###
  * action items for completion of profile

### XHTML5 relations ###
  * approach to non-REC problem (schema nature)
  * rb element

### Alternate Stylesheets ###
  * how to reference/include Fantasai's document

### General RS conformance reqs (if time allows) ###
  * Spec needs to be explicit about XML processing expectations on RS (compare [XML Processor profiles](http://www.w3.org/TR/xml-proc-profiles/)):
    * DTD internal/external subset support?
    * PIs (excluding xml-stylesheet support in SVG)
    * XInclude
    * IDness in the absence of DTD

### pgt ###

### ncx issues ###

### takeshi: questions on scripting ###





# Summary of outcomes #

## CSS ##
  * [EPUB CSS Profile](http://epub-revision.googlecode.com/svn/trunk/build/spec/epub30-contentdocs.html#sec-css-profile)
    * Review of this profile by community and general and CSS WG in particular will happen during spring; during this phase changes (-idpf prefixing in particular) may occur
    * Note the [notice of instability at section start](http://epub-revision.googlecode.com/svn/trunk/build/spec/epub30-contentdocs.html#sec-css)
    * It is believed that EGLS minimal requirements are now met, with these nota benes:
      * Proposal to add [unicode-range] property from CSS Fonts Level 3 - _pending WG decision_ [Issue65](Issue65.md)
      * hyphenation properties from CSS Text Level 3 are still being finalized by Fantasai and Ishii-san
      * value enum for _-epub3-ruby-position_ under active discussion in CSS WG

_[Murata-sans design space overview](http://epub-revision.googlecode.com/files/CSS%20Relations.pdf)_

## rb element ##

rb (as in _Ruby base text_) issues:

  * styling: cannot easily style base text
  * fallback: cannot get both correct correspondence and correct fallback for non-ruby
  * accessibility: cannot hide base and only show ruby text

Meeting group proposes that the _rb_ issue be vetted fully in HTML WG before EPUB considers alternate solutions.

## Schemas in ContentDocs ##
Proposal:
  * EPUB XHTML schema to be normatively referenced
  * Explicit minor versioning strategy detailed in spec to address breaking changes until HTML5 becomes a REC
  * CSS syntax changes may trigger minor rev as well

  * @Bill draft prose for versioning strategy

_Completion of schemas will happen during spring_

## XML Processor Conformance ##
Proposal:
  * non-validating
  * only entity decls in internal subset
  * RS's are required to honor xml-stylesheet PIs only when referencing CSS stylesheets
  * RSs are not required to support XInclude

  * @markus add example of internal subset and entities

## Inclusion of Alternate Stylesheets document ##
  * The document to be available at same base URI as other specs (http://www.idpf.org/epub/30/spec/), but not formally part of spec suite, instead a general normative reference

  * @Fantasai, revisit _day_ and _night_ values, perhaps sb _day-mode_ and _night-mode_?
  * @Fantasai, modify document header, notify Markus

## recast of NCX as XHTML microformat ##
Proposal: refer to [Issue64](http://code.google.com/p/epub-revision/issues/detail?id=64)

## Scripting - clarifications ##
  * @Markus _scripted_ property be extended to cover both script and forms
  * @Markus assure its clear that the scripted property applies to both xhtml and svg
  * @Bill extend prose in Publications spec ("may disable pagination") with more examples; also make clear that scripting may not work as expected, as compared to a normal browser. For iframe it is the html5 model, outside iframe the model is undefined. If you do it at the top level, you may not get the html5 DOM.
  * @Markus CSS Profile: add prose clarifying that features that we define (-idpf properties) might not be honored by the renderer in a scripted context