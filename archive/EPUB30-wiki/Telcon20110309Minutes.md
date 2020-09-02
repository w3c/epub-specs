# Present #

DaveGunn, danielweck, fantasai, danhughes, Brady, mgarrish, Kyoji, NeilS, Norm, Ryoji\_Akimoto, matthaas, keith\_fahlgren, James\_Pritchett, BillMcCoy, marisa\_demeglio (scribe), mgylling, RogerWebster

Regrets from Murata and Takeshi


# New Action Items #

  * ACTION: Markus to write the list about moving the call time one hour earlier
  * ACTION: Matt to pose questions to fantasai regarding terminology to use
  * ACTION: Matt to make sure that in SVG section we have some sort of a note that SVG styling constructs/features may co-exist in the same file with EPUB CSS
  * ACTION: James to emphasize wording of the requirement that an .epub file must contain an EPUB


# Minutes #

Agenda: http://code.google.com/p/epub-revision/wiki/Telcon20110309

## The Tracker ##
We will introduce a new status for the issue tracker: "deferred" (which means "not in EPUB 3.0").  "Deferred" items are still considered "open" (if we can do that in googlecode).

## CSS ##

CSS Properties discussion w. Bill McCoy and Murata-san -- the wording is confusing.

ACTION: Matt to pose questions to fantasai regarding terminology to use

ACTION: Matt to make sure that in SVG section we have some sort of a note that SVG styling constructs/features may co-exist in the same file with EPUB CSS

## Spine-Level Scripting ##

There is not currently a resolution about this issue.  Some believe we SHOUD NOT allow spine-level scripting, some are not convinced.  A group will form to discuss this.

`[keith_fahlgren`] I am being quite sincere when saying I'm willing to be convinced, I just want to hear a more about why SHOULD NOT would help

## [Issue 88](https://code.google.com/p/epub-revision/issues/detail?id=88) ##

pagination and scrollTo method

Peter: are we going to create deviations/clarifications of W3C scripting model or not?  No one speaks up in favor of doing anything different from the W3C model.

## [Issue 89](https://code.google.com/p/epub-revision/issues/detail?id=89) ##

do we allow content to override reading system handling of keyboard input?

this is an issue that could come up in many contexts (e.g. iframe in embedded web application)

does HTML5 address it at all?

Forming a group to deal with scripting issues.

`[mgylling`] Group: Keith, BillMcCoy, Casey,

`[keith_fahlgren`] The EPUB 3.0 Charter link is now broken on http://code.google.com/p/epub-revision/

`[keith_fahlgren`] """Need for rich media and interactivity support. EPUB 2.0.1 has an extension mechanism, with provision for fallbacks, but does not intrinsically standardize support for rich media (such as video) and **interactivity (programmatic content**, such as would be needed to implement a quiz or crossword puzzle).

`[mgylling`] So with the broken link, you wrote that from memory?

`[mgylling`] and Liza

`[keith_fahlgren`] Correct, mgylling

`[mgylling`] and Brady

`[keith_fahlgren`] The correct new link is http://idpf.org/epub/30/wg-charter

`[keith_fahlgren`] +1

## OCF ##

`[BillMcCoy`] I will fix the charter link

OCF 3.0 has been made more epub-specific rather than being a generalized container format

`[BillMcCoy`] +1 for .epub file must contain an EPUB publication!

ACTION: James to emphasize wording of the requirement that an .epub file must contain an EPUB

Can you have multiple publications within a single OCF?

`[keith_fahlgren`] Just as context. DocBook describes a number of `<book`>s as a `<set`>. You can create an EPUB with many `<book`>s (which would normally have unique EPUBs) into a single EPUB by using a `<set`>. Doubt that clarifies, but it's true today.

What about different renditions?  (Same content presented in different ways)

`[keith_fahlgren`] DocBook doesn't necessarily understand renditions, so there's no packaging of that in DocBook-XSL

are there any implementations of alternate renditions?  BIll thinks yes in Japan for Manga (SVG version and HTML version for accessibility)

one possibility: allow multiple renditions if they are EPUB formatted, but not other formats

George: does our fallback system address accessibility better than having many renditions, one of which is accessible?

Bill: for accessibility, we want one fallback for the whole thing rather than something at a finer-grained level

Discussion of data available for RS discovery of what renditions are available

There doesn't seem to be a very direct way for smooth RS discovery

we need solid use cases

`[keith_fahlgren`] I'm not exactly sure if fixed-layout is inherently less accessible

proposal: each OCF contains 1 or 2 epubs, and if it contains 2, the second one is the accessible version

concern about the accessible version becoming second-class

use case is a comic book

another use case: "the cat in the hat" by dr seuss

(stylized text and images)

`[DaveGunn`] fixed-layout which fixes text size will present accessibility issues to large print users

problem with multiple roots, if you don't have a good cross referencing system, features like annotations fall apart

accessibility of the primary document is the best approach but in the cases when it is really not possible, we would propose to have a second alternate root publication

`[keith_fahlgren`] I think that fixed-layout may still be zoomable..., but accept your large print argument

for example, SVG + media overlays would give us accessibliity, but there is no guarantee that publishers would create full-audio overlays and might need a lighter-weight path to accessibility

`[James_Pritchett`] all rootfiles must point to OPF files

`[James_Pritchett`] All rootfiles must present equivalent content

a note for the spec: mention ODF as namespace source