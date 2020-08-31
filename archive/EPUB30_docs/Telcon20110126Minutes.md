# Present #

Si-Wei, Takeshi, wen-hsuan, DaveGunn, danielweck, Felix, fantasai, Murata, mgarrish, kingwai, Kyoji, ShuTanabe, Ryoji\_Akimoto, Norm, matthaas, keith\_fahlgren, Mei-Li, James\_Pritchett, marisa\_demeglio (scribe), mgylling, George


# New Action Items #

ACTION: Markus to add placeholder in spec with 'at-risk' warning for linking section

# Topics #

Agenda: http://code.google.com/p/epub-revision/wiki/Telcon20110126

## Next draft ##

we will publish the final internal working group draft next monday (jan 31)

WG review period 31 jan to 13 feb


## Questions from editors ##

### 1. intrinsic fallbacks for SVG? ###

SVG has a switch element

`[`keith\_fahlgren`]` """SVG contains a ‘switch’ element along with attributes ‘requiredFeatures’, ‘requiredExtensions’ and ‘systemLanguage’ to provide an ability to specify alternate viewing depending on the capabilities of a given user agent or the user's language."""

`[`keith\_fahlgren`]` http://www.w3.org/TR/SVG/struct.html#ConditionalProcessingOverview

related to embedded MathML question

Markus and Peter to take offline for discussion


### 2. need clarification about whether page-left/right properties are on spine or manifest item? ###

Murata: itemref

Nothing further from the editors



## [issue 64](https://code.google.com/p/epub-revision/issues/detail?id=64) ##

"recast NCX as XHTML microformat"

question: what happens to multimedia support?

answer: it is improved; can have overlays associated with it; it can live in the spine

question: mathML and ruby support?

answer: improved as XHTML supports these things (however, no guarantee that reading systems' treeview widgets will comply); a text-only version s/b available in the @title attribute of that label element

question: NCX backwards/forwards compatibility - what takes precedence?

answer: 3.0 NCX always present; 2.0 NCX may be included to aid 2.0 reading systems.  3.0 takes precedence for reading systems that understand it (they are to ignore the 2.0 NCX if present)

any objections to recasting NCX as XHTML microformat? (no objections here nor off-list)

the group agrees to make this move


## [issue 65](https://code.google.com/p/epub-revision/issues/detail?id=65) ##

"request for the addition of unicode-range"

no objections, so unicode-range will be added to the draft



## [issue 66](https://code.google.com/p/epub-revision/issues/detail?id=66) ##

"Add CSS 2.0 list-style-type values"

Murata: CSS can automatically generate numbers for each item in an itemized list.  There are 3 values that were omitted in CSS 2.1 only because when the scope of CSS 2.1 was finalized, there were no implementations, but now there are implementations.

Therefore, we can include this: generating labels with Japanese, Arabic, and Hebrew numbering

Any objections to including this?

No objections.

Murata to check if the text is already in the spec; add it if not present.  Murata confirms that the subsection "CSS 2.0" is in "EPUB3 CSS Profile" section.

## Publication identity ##

dropping three-segment property proposal

EPUB 3 going to suggest that multiple versions of the same file have the same identifier (with minor modifications)

new metadata property proposed: "modified"

while this does not solve as many problems as an earlier proposal, it is much more pragmatic

timezone pattern required by timestamp

can be used to figure out if user has the latest version

new text will be introduced to discuss "composed identifier" -- concatenated version of uid+dcterms:modified

`[`keith\_fahlgren`]` All times MUST be expressed in UTC (Coordinated Universal Time), with a special UTC designator ("Z").

`[`Murata`]` xsd:dateTime with "Z"


## linking ##

decided at the adobe meeting to detach our linking charter item (take off the formal timeline but address it as a standalone document, perhaps remerging it depending on schedules)

linking is a very important feature but not a showstopper

Keith: focus on technique of linking from one EPUB document to another rather than linking subcomponents of EPUB documents

Markus: would a virtual F2F be beneficial?

Keith: would like a wider group of interested individuals

ACTION: Markus to add placeholder in spec with 'at-risk' warning for linking section

Peter: let's see if there are objections to this proposal

Peter: what about fragment identifiers?

it would be nice to have something standard rather than invent another proprietary scheme

Peter to restart fragment identifiers discussion