No recording available

# Attendees #
SteveKotrch, karenbroome, gc, Si-Wei, NeilS, Takeshi, ChoChin, wen-hsuan, BillKasdorf, kennyluck, danielweck, Brady, kingwai, James\_Pritchett, Ryoji\_Akimoto, DanHughes, gfreed, MURATA, BillMcCoy, DaveGunn, EricFreese, NeilS, marisa\_demeglio, Kyoji, Peter Sorotokin

Scribe: Marisa DeMeglio

# Summary of action items #
  * Find out rational behind why vocabularies might be best left informative ([issue 42](https://code.google.com/p/epub-revision/issues/detail?id=42)).  (Marisa volunteers post-call to take this one.)
  * Garth to look into rational for guides in NCX

# Minutes #
## TPAC ##

Garth discussing Markus's notes from TPAC:

  * We have agreement to set up a formal liaison with CSS WG (and Elika was set as that liaison at the W3C side, which may have to change since Elika is not W3C staff, but thats a minor detail for now, I'll clear this up with Bert tomorrow).
  * I (as instructed by Makoto) plugged the importance of writing modes, so it is clear to all that this would be the initial topic/outcome of the liaison. Technical discussions will follow tomorrow; Elika pushed a new draft yesterday.
  * We are expected to contribute test cases for Writing Modes to the CSS test suite, and eventually submit reading system implementations of it as W3C implementation reports (I perceived this as a condition from their POV)
  * Håkon was very interested in knowing more about Peters page templates proposal, and was pointed to our public emailing list for more info
  * DAISY submitted Daniel Weck as new editor of CSS3 Speech, which with some luck can go up the REC ladder enough notches to replace our current reference to the aural stylesheets appendix in CSS 2.1

## TOPIC: editors report ##
Bill M: new document structure, see wiki

Bill M: improved organization re: scripted/unscripted content and relationship with html5

Bill M: top 10 issues with the spec (all in tracker)

1. what is our namespace?  how about "epub"?

No objections noted to "epub"

2. spec has a "future directions" statement; can we move that out of the spec?

All: agreed to drop that section

3. [issue 42](http://code.google.com/p/epub-revision/issues/detail?id=42): is the vocabulary for ops:type normative or informative?

ACTION this needs clarification - why might it be best left informative?

4. http://code.google.com/p/epub-revision/issues/detail?id=34

All: resolved.

5. [issue 36](http://code.google.com/p/epub-revision/issues/detail?id=36): do we specify reading system conformance to say that they must/should/may reject html content?

Peter: "reading system MUST use proper XML parser"

Peter: "HTML spec says to pick the parser based on the mime type"

6. [issue 33](http://code.google.com/p/epub-revision/issues/detail?id=33): fallbacks

Bill M:  we should say that some item types cannot have fallbacks (e.g. NCX)

Garth: we should remove the blanket statement in the spec and replace with specific item restrictions

Peter: we should not restrict ability to have fallback by media type

7. [issue 35](http://code.google.com/p/epub-revision/issues/detail?id=35): more fallbacks

All: resolved

8. what is the rational for "guide" in the NCX?

George: why not use a nav list in the NCX instead?

ACTION: Garth to look into this

9. [issue 32](http://code.google.com/p/epub-revision/issues/detail?id=32): packaging and networked epub

Peter: networked books interesting for web app implementations but they likely have their own protocols

Garth: we haven't designed for this use case, so we should remove it

Peter: http is not sufficient

10. Bill M: any objections to referring to this document as "editors draft" instead of "internal working draft"?

All: no objections

## TOPIC: iframe and fallbacks ##
Peter: HTML5 spec specifically and purposely does not have fallback

Peter: iframes could start blank (with no @src), creating embedded browser context anyway, and be later populated via scripting

Peter: this would be a legitimate case of why an iframe would not have any content

Peter: don't think it's legal to reference non-html5 content from iframe.  so, it does not need a fallback.

Peter: fallbacks are for non-blessed content (PDF, flash)

Peter: we should say that iframe @src target must be XHTML content (HTML5 spec is too general, browser-specific for our needs)

George: accessibility of iframe content?

Peter: iframe is for nested browser context, in our case OPS, accessibility is maintained


## TOPIC: captions and subtitles ##
Geoff: proposal sent to the list to follow HTML5 regarding caption/subtitle format with a backup provision in case they don't make a timely decision

Geoff: two popular options, WebSRT and TTML

Geoff: WebSRT a new format based on non-standard SRT; likely that if HTML5 chooses it, it will undergo more development

Geoff: if HTML5 does not choose, suggest that EBUB reference TTML.  it's a W3C spec in the final stages of recommendation.

Geoff: HTML5 not necessarily expected to decide by January (EPUB public draft date)

Peter: would not want to take a position on TTML until HTML5 decides; it's not an easy format to re-encode

Peter: we should follow HTML5, don't want to second-guess them

George: if TTML is W3C-approved and come May, it's not included in HTML5, chances are that HTML5 will decide something else

All: note that TTML is complex

Bill M: we should normatively reference HTML5 spec, which currently references WebSRT, and should we put an issue in the tracker that if they change their minds, we should reconsider

George: are there video formats that associate themselves with different captioning standard?

Geoff: yes, e.g. flash, quicktime, windows media, smil, realplayer

Geoff: smpte captioning group will be using TTML as a convergent format

King Wai: multimedia container formats (e.g. mpeg4) support captioning, widely used in digital broadcast

King Wai: 708 captions

All: agreed to go along with HTML5

we are out of time.  two topics remain: XML Islands and video formats

## TOPIC: out of line XML islands ##

Garth: can we deprecate these?

Bill M: proposal is to remove it from content conformance

Garth: out of line XML islands are arbitrary grammars or sections of content using non-blessed XHTML5 modules

All: agree to deprecate them unless any counter examples are found

## TOPIC: video formats ##

Garth: Please review: http://code.google.com/p/epub-revision/wiki/ImplementationProposalRichMediaFormat

Garth: For discussion next week!