Chair: Markus Gylling

Scribe: Bill McCoy

Audio recording: 100908

To listen to the recording, dial in and press star 3



## Attendees ##

Takeshi, !Si-Wei, wen-hsuan, mikeidpf, gc, karenbroome, ChoChin, DanHughes, duga, Kyoji, MyNick, BillMcCoy, marisa\_demeglio, George, KingWai, danielweck, !NeilS, ShuTanabe, Ryoji\_Akimoto, EricFreese, mikew3c, SteveKotrch, mgylling, wmanis, BillKasdorf, Peter Sorotokin

## Action Items (New) ##

  * chair group to revise compatibility proposal, we'll finalize at next telecon
  * Markus to send out logistics info for F2F

## Previous Minutes Review ##

Please check/edit them (were just published), talk to chair group if disagreement.

## Previous Action Items Review ##

Markus: Keith & chair group have been working on a proposal for backwards/fwds compatibility and we'll discuss today.

Markus: today is deadline for RSVP for F2F, if you haven't noted attendance pls do it now while we talk

Markus: W3C-CSS task force, George to speak to Board, idea is for longer-term effort

## EPUB conform ##

Garth: pointed to maint WG several weeks ago the Google Code site link, to this group as well

Garth: w/ BOD hat on, and AAP updater, this is always hammered, there's a few 100 tests on the site, a lot of hours gone in but not by any stretch complete

Garth: hours are largely our hours, it needs more review & more contributions before we'd want to take it as any sort of official RS conformance test suite

Garth: tech folks involved in EPUB, poke around, complain, add issues/q's, tests, etc.. RS vendors, content creators - pls get in and start playing w/ stuff. Getting a more uniform implementation of 2.01 is a very impt direction

Markus: wrt 3.0 conformance, 1Q/2Q next year will be time to start?

Garth: DTBook is not covered in this test suite so EPUB3 may be salve for our guilt on this, we can maybe get W3C HTML5 tests for EPUB3 timefraem

Garth: we have never done a conformance test suite in the past before finalizing specs, if we do the same thing this time we should at least catch up mu,ch more quickly this time

[mikew3c](mikew3c.md)surprised to hear that no test suites have been produced in the past … (action)

mikew3C: test suites for HTML5 will be a big piece of work - approx 50K tests

mikew3C: HTML5/CSS, we can't go to proposed rec w/out a test suite and having met criteria set (at least 2 impls for every single feature)

Garth: that is not historically part of IDPF procedures, test suite as posted now relies on W3C work (w/ permission)... hope we can continue to draft behind you in HTML5

George: in DAISY and for last EPUB revision was started EPUBCheck application which tests many many dependencies, so while we don't use same process there's a great deal of interop based on epubcheck

Garth: it's content conformance (valid/invalid) but not RS conformance

## implementation proposals ##

Markus: Metadata subgroup has begun to populate Wiki w/ impl proposals, others have created separate docs and linked from reqs to proposals, ideally use headings so they appear in the TOC. Please use bullet list layout, do not expand out too much initially, saving you time and enabling us to more quickly get an overview. Over time people will be asked to expand out text so it can be poured/massaged into spec prose. For now no problem to be brief/compact

Markus: we expect in some cases we'll have competing proposals, this is not a problem, unless you can use simple consensus within subgroup you should be elavating such competing proposals to the full group... full WG remains the only decision making body

Markus: once subgroup has completed impl proposals, next step is to announce availability of subgroup deliverable to the full WG... when you feel a chunk is done - ready to be reviewed by full group - simply announce it

Markus: whether construct is required (in terms of content and/or RS conformance) or optional, please spell this out in proposals

Brady: spelling out which use cases / reqs are solved by a proposal would be nice, esp in complex cases

Markus: if you don't solve all use cases underlying reqs, be clear on that

## F2F ##

MikeS: all subgroup leaders except BillK (likely) are confirmed, need to confirm meeting space in downtown SF from Adobe, will find out about hotels etc.

Markus: I propose we finalize these dates in SF - Oct 18-20 (20 half day)

Approved.

## annotations ##

WillM: sep wiki page w/ impl proposals, some material posted this AM, comments solicited

[danielweck](danielweck.md) http://code.google.com/p/epub-revision/wiki/ImplementationProposalAnnotations

WillM: each section of proposal notes which req it answers

## EGLS ##

Makoto: haven't finished ranking yet, trying to ask implementors of vert writing to explain what they are doing, will have overview in next week's telecon, then F2F in Taipei

## metadata ##

BillK: we have long list of reqs, realized starting into solutions we might propose redundant/conflicting spec changes, so we're taking a look at existing 2.01 spec and Dan Hughes & Graham will draft additions based on 2.01

BillK: do they enable us to address reqs? And, how is this related to compatibility reqs?

## navigation ##

George: will be able to port recs from DAISY work

George: reqs almost identical

## text content ##

Markus: picked off implementation proposals in call last week, realized that there's reqs for text inline metadata, even NCX, there's good reason to look at a universal solution for metadata expressions

Markus: BillK, we need to do a lot of cross-group work to get this right

Markus: discussed how to produce schemas & how to relate to (unofficial but real) HTML5 schema from W3C... intend to produce EPUB version of HTML5 schema, it would reuse as much as possible of W3C schema but be standalone

Markus: join tmw at 21:00 to discuss

## styling & layout ##

Brady: plan to get page up today for pri 1 reqs, and will ask for volunteers for other reqs, need 4 volunteers, 1 solution for each req

Brady: then whole group will work on fleshing out

## rich media & interactivity & ads ##

Peter: nothing new to report, have 1 more reply to factor into priorities

## scripting issues Wiki ##

Markus: I saw you did some edits to Wiki, I'll kick it off Thurs or Fri so we can settle that one

## backwards/fwds compatibility guidelines ##

see agenda for proposal

Markus: pls read KeithF's paper for background on problem and proposed solutions

Markus: you can create specs that don't worry about compatibility, or other end of spectrum is PDF, which has 100% backwards/forwards compatibility

Markus: this proposal is a middle road: guidelines emphasize fwd compatibility for Reading Systems - ability of EPUB 2.0 RS to read EPUB3 doc w/out breaking, a major target... want to distinguish content conformance vs. reading system conformance, as per HTML5, EPUB2 perhaps does it in a way, expect to make this distinction much more clear

Markus: when we're discussing mods of existing features of EPUB, we can say EPUB3 content conformance def reqs new construct only, whereas RS conformance reqs recognizing the old construct as well... want to restrict mods to existing features to not break upwards compatibility

Markus: e.g. in metadata group, we're dealing with dc: title & author elements, these are quite archaic now and Dublin Core has moved on, and there are other taxonomies, but according to our definition we can't remove these required elements because they'd break upwards compatibility

Markus: OTOH Islands or Metadata that are optional in 2.x can be removed from content conformance, but RS would be required (at least in EPUB3) to recognize these things

Garth: because RS will break if you don't have these required elements

Neil: is there a list of RS we care about?

Markus: no way to do a scientific test, we need to use common sense or if we end up in a situation we don't know we'll have to test... should we pick 10 most popular impls? We can do this

Neil: this should be a requirement

Garth: hopefully we've erred towards not doing these things in the first place

Markus: given this constituency hopefully we'll hear from RS vendors

Neil: and if you add things that may cause breaking too

Markus: we say we need to design new features w/ upwards compat in mind... weak by intent so far, if we can find a solid definition of breaking point we can use it, but I believe it's going to be difficult... what does "doesn't break" mean, for example in case of MathML? Peter suggested just displaying text nodes is not breakage

Peter: different threshold for new features

Neil: do any RS attempt to validate the book?

Garth: there are RS than force EPUBcheck to be happy before accepting it

Neil: we need to be really wishy-washy w/ notion of new feature upwrads compatibility

BillM: ingestion systems that ingest EPUB3 need to validate vs. EPUB3, we aren't trying to be upwards compatible there... maybe need to use narrower definition of Reading System (like User Agent in W3C world)

Peter: new feature would do to old RS, in that context showing anything, even just text, should be nice, with OPS switch...

BillK: showing text useless, showing suitable fallback useful

Peter: when you add new feature, like video, you might show something but are limited inherently... modifying existing feature, like title in metadata, that's different - you are removing a feature and adding a different one in its place, in that case you have to provideh a way for all RS to work

Peter: it's nice to clean up things and I was arguing about cleaning up metadata earlier, but to make existing EPUB's invalid or not working correctly worries me, if we do it we have to be very careful

Markus: for MathML, are you suggesting we should/must require OPS switch?

Peter: no, it would be silly and probalby be ignored... if you want to have 1 file that would work in both EPUB2 & EPUB3 systems that should be encouraged... discussion was around inline, but package may not be bad either

Markus: 2.01 valid content will not necessarily be valide for 3.0, e.g. if we remove DTBook or XML Islands or another optional feature, from a content conformance perspective, RS and users are prioritized, we are leaving a generation of EPUB on their own

George: if there's a JS rect in EPUB3 doc, will there be a fallback that 2.0 system will process?

Markus: Peter suggested we recommend package-level fallback or inline fallback

??? how many producers will care about 2.0, no one will care about it in a few years

Garth: backwards compat is more about 2.0 content in EPUB3 readers

Peter: there is a delay of up to a year between when I write code for it to be propagated into updates, given release cycle of dev & manufacturers

BillM: EPUB2 RS should look like a low function EPUB3 RS (no video, scripting) - this will ease transitions

Peter: XHTML2, XForms failed

BillM: yes, we should strive for more seamless transition than these specs
