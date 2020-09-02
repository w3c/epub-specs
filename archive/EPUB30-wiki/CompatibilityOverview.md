# Definitions #

## Downward Compatibility ##

Systems that offer "downward compatibility" are designed to accept input from
previous versions. Because more is known about the previous versions than
future versions, downward compatibility is usually considered easier to
achieve, although it may impose various costs. These costs could weigh on new
implementations that do not inherit legacy support frameworks or could be seen
simply by the growing size of the specifications.

Downward compatibility often brings with it the notion of deprecation for
features that are discouraged, superseded, and eventually removed.

## Upward Compatibility ##

Systems that offer "upward compatibility" are designed to accept input from
later versions, but is the ability of a system to gracefully accept input
intended for later versions. New features are often excluded from upward
compatibility goals. A strong goal of upward compatibility can be limiting on
future revisions unless the earlier systems were very carefully designed and
may not be a good fit for systems that are evolving rapidly. Upward
compatibility can also negatively impact the adoption of future revisions in
some contexts.

Upward compatibility is often accomplished by ignoring the unknowns and
selecting the known subset of the data that the system is capable of handling.

Upward compatibility is typically harder to achieve than downward
compatibility.


## Extensibility ##

"Extensibility" is a design goal where implementations strive to support future
growth, specifically allowing/supporting changes (extensions) to the system
without undue implementation/authoring effort. Extensibility is often directly
related to how easily software systems can be upgraded.

## Upward Compatibility Versus Extensibility ##

Although "upward compatibility" and extensibility are similar, they are not the
same.

[Keith, speaking for himself, feels that extensibility should be a goal for both
metadata solutions and text content solutions.]

## Examples ##

  * Handling an EPUB 3.0 document ("gracefully" or not) in a 2.0.1 Reading System would classify as upward compatibility. We are not aware of the specifics of how many current Reading Systems are implemented with this goal in mind.  [wonders if we should research this specifically.](Keith.md)
  * """HTML5 is defined in a way that it is backwards [downwards](downwards.md) compatible with the way user agents handle deployed content.""" http://www.w3.org/TR/html5-diff/
  * A 3.0 Reading System that was able to read all 2.0 document would be downwards compatible.
  * A 3.0 Reading System that was able to read all 4.0 document would be upwards compatible.

# A Thorny Problem #

Compatibility goals are very difficult to follow rigidly. To help set the stage
for a compatibility discussion, here is a single example from the metadata
domain:

> EPUB 2.0.1 puts metadata elements like title in the older, Dublin Core DCMES
> Version 1.1 namespace:

```
<dc:title xmlns:dc="http://purl.org/dc/elements/1.1/">2.0.1 Title</dc:title>
```

> Although DCMES has seen wide adoption and formal standardization, Dublin Core
> suggests that "implementers are encouraged to use the semantically more precise
> dcterms: properties", which come from the newer DCMI Metadata Terms.

> If EPUB 3.0 chose this DCTERMS for metadata elements, as it offers a much
> richer set of metadata, it would need to uses a different namespace:

```
<dcterms:title xmlns:dct="http://purl.org/dc/terms/">3.0 Title</dcterms:title>
```

> This could potentially break upward compatibility: many 2.0.1 Reading Systems
> should not be able to read the title because the namespace has changed and they
> (legitimately) look for the title under the older DCMES Version 1.1 namespace.

# HTML5's Approach #

HTML5's approach is interesting, even if it comes without any explicit
endorsement:

> HTML5 is defined in a way that it is backwards compatible with the way user
> agents handle deployed content. To keep the authoring language relatively
> simple for authors several elements and attributes are not included as
> outlined in the other sections of this document, such as presentational
> elements that are better dealt with using CSS.

> User agents, however, will always have to support these older elements and
> attributes and this is why the HTML5 specification clearly separates
> requirements for authors and user agents. For instance, this means that
> authors cannot use the isindex or the plaintext element, but user agents are
> required to support them in a way that is compatible with how these elements
> need to behave for compatibility with deployed content.

> Since HTML5 has separate conformance requirements for authors and user agents
> there is no longer a need for marking features "deprecated".

> http://www.w3.org/TR/html5-diff/


# Goals #

## Existing ##

We already have one compatibility goal (although perhaps it should be revised):

> Maximize upwards compatibility, i.e. existing EPUB 2.0.1 standard
> should be valid in EPUB [3.0], although there may be exceptions if
> required to solve the problems we are tasked to address, and some EPUB
> 2.0.1 markup could be deprecated in EPUB [3.0] (e.g. DTBook basic content).
> http://code.google.com/p/epub-revision/wiki/DesignPrinciples

## Document Longevity ##

Unlike purely web-based documents, EPUB 3.0 documents are designed to be stored
and remain readable very far into the future. While textual formats, XML, and
UTF8 accomplish part of this goal, the EPUB 3.0 Working Group is designing this
revision with the goal EPUB 3.0 documents still being readable in FIXME years.
This goal may be accomplished by:

  * Reducing EPUB 3.0-specific complexity
  * Creating transforms to convert EPUB 2.0 documents into EPUB 3.0 documents
  * Clarifying the way in which EPUB documents using DRM may not have reliable longevity

## 3.0 to 4.0 ##

Many of the implications of our compatibility goals will be on the relationship
between 2.0 and 3.0, but we should also be certain to outline our future goals
for the upward compatibility of 3.0 Reading Systems.

## Text Content ##

If we adopt (some of) HTML5 for text content, we will also inherit its position
on downward compatibility.

  * EPUB 3.0 Reading Systems must be downward compatible with 2.0 XHTML 1.1 text content.
  * EPUB 3.0 Reading Systems may be downward compatible for 2.0 DTBook.
  * EPUB 3.0 should deprecate DTBook markup.
  * EPUB 3.0 text content should be designed to be upward compatible (toward 4.0) to help facilitate longevity.

## Navigation ##

  * Navigation markup in 3.0 should be well distinguished from 2.0 Navigation to facilitate upward compatibility for well-designed 2.0 Reading Systems.
  * EPUB 3.0 Reading Systems may be downward compatible for 2.0 Navigation.
  * EPUB 3.0 should deprecate legacy 2.0 Navigation techniques.

## Metadata ##

  * Metadata in 2.0 should not be modified in 3.0 unless strongly demanded by the requirements, which is an upward compatibility goal.
  * EPUB 3.0 Reading Systems should be downward compatible with 2.0 OPF metadata.
  * Metadata in 3.0 should be designed to use Extensibility techniques from the family of widely adopted and effective XML specifications and standards.
  * EPUB 3.0 should deprecate legacy 2.0 metadata markup.

## New Features ##

  * New Features should be excluded from upward compatibility goals, but should be designed with 2.0 Reading Systems in mind. Specifically, they should attempt to avoid ambiguity with existing features and markup. This should help 2.0 Reading Systems that have been built to ignore unknown markup and features (they were designed to be upward compatible).

# Specific Options #

  * Write and release EPUB 2.0 to 3.0 conversion tools and guides (if not fully automated). This would help downward compatibility and longevity. This would benefit folks that have a lot of EPUB 2.0 documents. DAISY has used this model in the past.
  * Write and release EPUB 3.0 to 2.0 conversion tools and guides (if not fully automated). This would help upward compatibility.
  * Craft the 3.0 specification to ensure that all valid EPUB 2.0.1 documents are valid EPUB 3.0 documents. This would benefit upward compatibility but would significantly limit extensibility.
  * Deprecate sections of the EPUB 2.0 specification inside EPUB 3.0 but still encourage implementers to support them for this revision. This would help downward compatibility and longevity.
  * Follow HTML5 and strictly distinguish between downward compatibility requirements for EPUB 3.0 Reading Systems versus EPUB 3.0 authoring.

# Open Questions #

  * What would it mean practically for an EPUB 3.0 document to be "readable" in a 2.0 Reading System? All of the words? Some of the navigation? A bit of the metadata?