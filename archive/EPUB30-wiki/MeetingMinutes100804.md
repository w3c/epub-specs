Chair: Markus Gylling

Scribe: Garth Conboy

Audio recording: 100804

To listen to the recording, dial in and press star 3

## Attendees ##

MikeW3C, Si-Wei, Ryoji\_Akimoto, ShuTanabe, KingWai, SteveKotrch, DanHughes, AdamWitwer, keith\_fahlgren, DaveGunn, George, Kyoji, RogerWebster, duga, liza, James\_Pritchett, Garth, BillMcCoy, wenhsuan, marisa\_demeglio, mikeidpf, AlexisWiles, Roger\_S, Takeshi, Dave (Apple), Peter (Adobe) `[`From IRC "join"s and others I remembered`]`

## Action Items ##

  * Review Requirements
  * Prioritize Requirements

## Previous minutes ##

Accepted previous minutes.

## Previous Action Item Review ##

  * N/A

## Timeline ##

Markus: timeline (Wiki page called "timeline")

Markus: we are a bit behind; EGLS i18l meeting in Sapporo; need additional requirements stabilization time.

Markus: Keep requirements open through month end; do prioritization during this time too; no requirements after month end.

Markus: No problem is starting with implementation proposals in sub-groups, if requirements seem stable.

Markus: end date of WG should remain in tact; first working draft delayed (perhaps a month).

Markus: (spec) editor group getting put together -- Markus, Garth, Brady -- few more may/should join.  Contact Markus.

Markus: editing likely to start 3-4 weeks from now.

George: Dorthea did editor of Daisy DRM spec & also OEPBS 1.2 -- perhaps viable for this effort?  As paid editor.

## Review and Prioritization of Requirements ##

Markus: need prioritization of requirements -- so the "high" ones can be done first -- and we can get to our end point.

Markus: Prioritization can be a "contract" - highest ones must be done.

Peter: what about high priority ones that are really hard?  Should complexity be a a factor?

Markus: Some high priority item(s) might to too complex to meet timeframe.

Markus: e.g. cross publication link in metadata group.

Markus: Did prioritization (A, B, C, D, F -- per Garth's list form last week) for Navigation sub-group.

Garth: perhaps as doing prioritization, difficulty may factor in -- if it's huge effort, and can't get done in time, it should go lower.

Markus: yes, okay (if complexity known).

Markus: added Navigation dependancies.  Others should do the same.

Markus: Sub-group coordinators should do this prioritization exercise.  And, of course, requirements review.

Markus: all WG members should read requirements, and sign off, by adding their names.

George: Meatdata is doing priorities as group-think -- each sub-group member in a spreadsheet -- then average will be used.

## Rich Media, Interactivity & Ads ##

Markus: Question for Will... sandbox ads, or can we do better (from previous call)?  Should there be such a requirement?

Peter: don't think we should get into authoritative security.

Markus: should there be ad-injected-content restrictions?

George: non-XML ad (random content) is scary.

Garth: Are we biting off "ad holes" where another processor is injecting ads?

Peter: in-flow versus chapter-content-modification (for ads) is a bifurcation.

Peter: saying ads need to XHTML versus HTML seem reasonable.

Peter: requirement for custom browser engine probably won't fly.

Peter: Looks like we're converging on interactivity (on list).

Peter: Lots of audio sync features to be worked out (likely area for cuts)

## EGLS ##

Markus: EGLS will wait until next week for Makato.

## Navigation ##

George: Navigation -- two unclear requirements: TOC & index -- clarification needed.  First may be inter-document linking, other may be NCX.  Priorities have been added.

## Text Content ##

Markus: text-content -- progressing.

Markus: priorities real soon; meeting tomorrow.

## Styling & Layout ##

Brady: been away; calling in from Sapporo; good requirements; some need use case and/or examples.

Brady: (with GC) to do prioritization pass next week.  Will catch up.

Brady: From ELGS -- much overlap between EGLS and styling/layout -- need coordination of solutions.

## Scripting Discussion ##

Markus: pick of scripting discussion...

Dave (apple): one proposal: prohibit `<`script`>` at chapter level, limit to iframes, so they work within their own rectangle.

Dave (apple): some providers will want may want to manipulate the DOM (chapter level scripts) -- add a way to 'call out' that DOM may be changing due to content manipulation.

Dave (apple): 'call out' in manifest.

Peter: Not best of both worlds -- by allowing scripts, you disallow manipulation of document.

Peter: complex feature suggestion, both adds features, but also removes them.  Won't be interoperable -- like we didn't disallow `<`script`>` in 2.0.1.

Markus: not every reading system uses and HTML(4/5) DOM.

Peter: handling of (e.g.) pop-ups, end of current page, or next page -- different from UA to UA -- interaction w/ paginated view (as in browser-based viewer).

Peter: these issues not resolvable in chapter level; but can be handled in rectangles (with browser view) -- the latter could be cross-platform.

Liza: not all readers are paginated, some scroll, some auto-scroll.  Likes proposal, that this is not recommended for all publications.

Peter: don't see interoperable chapter-based solution.

Peter: interactivity in a box can be interoperable (if the UA has a browser capability).

GC: interoperable content is very important (from the likes of the AAP).

Brady: two solutions: scripting in a box, chapter level scripting.  Could do both, latter would be marked, and not interoperable, and perhaps loose features (like pagination).

Brady: Perhaps any book with chapter-scripting, must be readable if that (chapter level scripting) is disabled.

George: that approach would also help with navigation.

Liza: agree.

Markus: would a "readable" version of such beasts be useless?

Liza: experimental ebooks, maybe not.  Majority of cases should be okay with that approach.

Keith: agree

Keith: Aria could provide instruction for doing this in a declarative fashion.

Keith: will to accept action item to look at Aria (as narrow as possible).

Markus: summary: basically to have a fall-back behavior when chapter-level scripting is disabled (for a ebook to still be "readable").

Keith: Can ARIA help provide a model for UAs that cannot support chapter-scripted content (perhaps fallbacks, etc).

Garth: full summary: two solutions: scripting in a box, plus chapter level scripting.  Could do both, latter would be marked, and not interoperable, and perhaps loose features (like pagination).  First required (assuming browser available), second more optional.  Have a fall-back behavior when chapter-level scripting is disabled (for a ebook to still be "readable").

George: think accessibility.  Think quizzes, et al.

Brady: lets not say "iframes" (as it's a possible solution) -- use box/island/window.