# Introduction #

Loosely edited compilation of observations, notes & comments by Dan Hughes and Graham Bell [7-10 2010](September.md) regarding Dublin Core metadata elements in existing OPF.

# Details #

## Identifier ##

  * Because this element does not enforce uniqueness, and does not provide a defined set of values for the opf:scheme attribute to describe the identifier, it serves more as a differentiator, expressing “this publication is not this other publication”, rather than explicitly stating “this publication is this publication and can be uniquely identified as part of this recognized system”
  * In addition, the current OPF does not specify how distributors, retailers, and reading systems [handlers](downstream.md) must treat identifiers supplied by content providers. Ideally, if an identifier is described with a value in opf:scheme that indicates it is derived from a recognized system, downstream handlers would be required to preserve the data, and where necessary, supply their own proprietary identifier.
  * As OPF does not require opf:scheme, there should be an assumed or default value of “none” when the attribute is not present. A generic ‘proprietary’ value should also be considered in addition to common identifier types – ISBN-13, DOI, ISTC et al.  (note that each of those actually identifies something different, most of which are not in fact the epub…)
    * ISBN identifies publicly available product
    * ISTC identifies abstract work
    * DOI  identifies ‘an object’ by virtue of its location)
  * No mechanism to relate this ePub to another ePub (no reliable identifier, so reliable relations cannot be created even if there are well-defined relators such as ‘has same content as’, ‘is part of same series as’, ‘is updated version of’)
  * Setting aside overall supply chain adoption of emerging identifier standards, once inside an epub ‘ecosytem’ they can provide a basis for additional functionality.
    * Requirement META\_R01 includes multiple identifiers beyond the scope of uniquely identifying the package, e.g. Annotations may make use of ISTC, if present, to provide consistency across manifestations of the same work.
    * While the burden of implementation must be considered, is there merit in laying the groundwork in epub in advance of increased adoption of these standards.

## Language ##

  * OPF allows multiple language elements, but does not provide a method to contextualize what bearing the language(s) have within the package.
  * Scenarios such as a bi-lingual publication; a commentary on a Latin classic written in French; or a textbook on Greek for native German speakers might require a means to express the role or nature of the language as it applies to the publication.

## Title ##
  * The title element lacks the ability to express complex title data in an explicit manner, such as series, collection, or subtitle, or an edition statement {generally appended to a title for presentation, but distinctly not part of the formal title.)
  * In addition, there is no mechanism for expressing sequencing or sort order data (eg number 7 in a series)
  * Cannot reliably sort by title without knowing the language of the title (in order to identify non-sorting prefixes. Les Misèrables sorts under M, assuming you know it’s French, even if the text of the book is in English
  * OPF could implement a type attribute, with defined values such as title, subtitle, series, and require the attribute be present where multiple Title elements are present.

## Creator & Contributor ##

  * These elements provide one descriptor, opf:role for the role of the entity, derived from MARC Relator codes.
    * MARC relators not widely used by publishers…
    * …and only relevant in context of opf:role.
  * No mechanism exists to indicate primacy or importance of any entity where multiple listings are present
    * Authors get very picky about precedence order
    * Differentiationbetweeen primary creator and secondary contributor is artificial
    * OPF could implement an optional display order attribute
  * No mechanism to uniquely identify creator/contributor entities.
    * Not a problem that ePub can fix.  Emerging ISNI standard not ready for prime time.
    * Collocation of books by a single creator/contributor complex because of different display names for one persona (Norman Fletcher, Dr. N. S. Fletcher, Prof. Fletcher)
  * Please sort into alphabetical order: (this cannot be done without some knowledge of the structure of different names)
    * Gabriel van Helsing
    * Carmen Garcia del Rio
    * Norman Stanley Fletcher
    * Yamada Taro
  * OPF currently does provide opf:file-as attribute, unsure how prevalent usage is…
  * The EGLS subgroup has a requirement for phonetic information [Phonetics in OPF metadata](EGLS_MM_18.md) that has bearing on author sort, and perhaps more. But as Makoto noted, phonetics and sorting are not always the same…

## Date ##

  * There are no defined values for opf:event, such as those that are loosely suggested in the current spec: creation, publication, and modified.
    * It’s not clear what ‘modified’ or ‘created’ means in the context of a publication.
    * Mainly used as publication date I suspect, but ambiguous as to what manifestation (physical or digital) it refers to – at least in those cases where both exist. Rather than define an event taxonomy, this may be a candidate for best practice guidelines.

## Rights ##

  * No agreement on vocabulary used to describe rights, and without that, there’s absolutely no value in any rights data
  * No way of identifying what the rights actually relate to… (it COULD be the ePub, or it could be the underlying work…)
  * And in any case, comes a poor second to the rights expression in any DRM layer
  * OPF spec should make explicit that this element is not referring to DRM, and is only a blanket copyright statement.
    * In most cases, DRM is applied at the distribution or retail level;
    * multiple channels could receive the same epub file from content provider and apply or not apply varying DRM methods.
    * DRM is generally implicit through these channels;
    * There is almost no practical value in expressing DRM context in the publication itself.

## Subject ##

  * The Subject element provides no method for explicitly stating that the data is not an arbitrary keyword or phrase.
  * A number of recognized systems for topically classifying works exist- LoC, BISAC etc.
    * LOC too complex and arbitrary
    * BISAC unique to North America
    * No scheme with global applicability (not even Dewey)
    * Because of that, hard to treat any data as anything OTHER than a list of keywords
    * Even though epub has global reach, most distribution and retail channels are essentially regional. Using a regional or local subject or classification scheme makes sense when there is a likelihood that the publication will stay in that market.
  * OPF should define a list of recognized subject/classification schemes, and utilize a similar opf:scheme attribute to express that.
    * Many, many types of subjects systems
    * Perhaps we can solicit our colleagues in other regions to identify commonly used subject schemes.
    * Would need to establish criteria for inclusion so that implementation burden is not too high, e.g. common trade publishing schemes are eligible, but a numismatic subject scheme is not.
    * Academic and STM publications, and respective distribution channels, may have need for robustness & clarity in this regard that has not surfaced as a requirement on wiki, but makes a great use case.
  * In addition to the aspects of search & discovery that subjects and keywords provide, there is also categorization.
    * OPF could provide an attribute, opf:category, with a small set of defined values such as primary, secondary.
  * While all subjects might very well be keywords, not all keywords are subjects.
    * OPF should encourage usage of regular `<meta name=”keyword” content=”…” />` elements over Subject elements where appropriate.