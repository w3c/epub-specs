# Present #

mgylling, Garth, ShuTanabe, danhughes, Kyoji, kingwai, DaveGunn, hober, keith\_fahlgren, Murata, marisa\_demeglio, Brady, Ryoji\_Akimoto, Takeshi, NeilS, CodenameKT, danielweck, Norm, klbroome

Not on IRC (by memory, did not get meetbot to cough up a log, so the above is "joined"s): Peter, Casey, Matt


# New Action Items #

  * ACTION: James+Markus: make sure [Issue 60](https://code.google.com/p/epub-revision/issues/detail?id=60) and Takeshi's font signing issue are resolved for OCF
  * ACTION: Bill+Markus come up with proposal for link registry
  * ACTION: all to read the CFI google doc, comments on changes
  * ACTION: Markus take CodecsRevisted #4 as proposed solution to list


# Minutes #

Agenda: http://code.google.com/p/epub-revision/wiki/Telcon20110323

## OCF Container ##

Clarification: OCF container may contain multiple EPUBs (and only EPUBs), if there are multiple, they **should** be manifestations of the same publication rendition.

## [Issue #107](https://code.google.com/p/epub-revision/issues/detail?id=#107) (external fonts) ##

[Issue #107](https://code.google.com/p/epub-revision/issues/detail?id=#107) (can fonts be stored/referenced remotely?): Not for EPUB 3.0.  Full processing model needs to be defined for such a change.  No, wait, says Murata, so we're waiting a week for this one.

## EPUB Fragment Identifiers ##

Proposal at: https://docs.google.com/document/pub?id=1gPMYtx4rsojqYDHWsfTJCtlfOpNQrg3tFH98htPQcJc

Notes: discussion of EPUB CFI proposal; request (Google and Adobe, at least) to get something like this in EPUB 3.  Suggestion for Registry of such schemes.

## [Issue #75](https://code.google.com/p/epub-revision/issues/detail?id=#75) (Video Codecs) ##

[Issue #75](https://code.google.com/p/epub-revision/issues/detail?id=#75): http://code.google.com/p/epub-revision/issues/detail?id=75

Issue details: https://docs.google.com/document/pub?id=1dyFcIHNhLnYZVLugsuD1MYfDW1jwRGexNqyLi5MaUC4

Possible solutions: http://code.google.com/p/epub-revision/wiki/CodecsRevisited

Proposal: "Solution #4" (EPUB may include H.264 and/or WebM, as core media types), RS's that support video, must support H.264 or WebM.

# Raw Log #


Scribe is now garth

Decision: EPUB 3 WG call times remain 21:00 UTC.

Clarification: CSS in EPUB are a logical set that RS' must/should support; RS' may provide additional support.

`[MURATA`] FYI: I just joined using skype

`[danielweck`] #1 Daniel is trying to connect to the audio concall server...(goto #1)

`[MURATA`] I am a bit worried about editorial inconsitencies.

`[MURATA`] which may be caused by this change.

Clarification: OCF container may contain multiple EPUBs (and only EPUBs), if there are multiple, they **should** be manifestations of the same publication rendition.

`[MURATA`] I personally doubt "every resource is declared in the manifest".

`[MURATA`] One could argue that font fallback is already available as part of CSS and HTML.

`[MURATA`] SVG font is also a possibility.

`[MURATA`] I would like to solicit comments from Japanese users and developers.

`[MURATA`] You can safely ignore it.

`[MURATA`] !!!

JOINED: `[Norm`] `[2011/03/23 22:18:49`]

`[MURATA`] Could you then read what I  am typing?

`[MURATA`] One week before making this decision, please.

`[MURATA`] More feedback from users in CJK is needed.

`[MURATA`] I didn't know that!

[Issue #107](https://code.google.com/p/epub-revision/issues/detail?id=#107) (can fonts be stored/referenced remotely?): Not for EPUB 3.0.  Full processing model needs to be defined for such a change.  No, wait, says Murata, so we're waiting a week for this one.

`[keith_fahlgren`] +1 for the idea of a registry that can be added to in the future.

`[mgylling`] +1 from me too

`[keith_fahlgren`] REQUIRED?

`[MURATA`] If we use your frag id to reference to an SVG element, what is required for accessibility?

`[MURATA`] What was the exact change?

`[MURATA`] BTW, what happens if two img/@src reference to the same thing?

`[MURATA`] What do reading systems do?

QUIT: `[Norm`] `[2011/03/23 22:29:19`]

`[MURATA`] So, is that CFI?

`[GARTH`]: Yes.

`[MURATA`] Hmmmm.  I think that it is a different scheme ...

Proposal at: https://docs.google.com/document/pub?id=1gPMYtx4rsojqYDHWsfTJCtlfOpNQrg3tFH98htPQcJc

`[MURATA`] Sometimes, do two different CFIs lead to the same appearance on screen?

`[MURATA`] OK.  Please introduce more information in the draft.

Notes: discussion of EPUB CFI proposal; request (Google and Adobe, at least) to get something like this in EPUB 3.  Suggestion for Registry of such schemes.

`[keith_fahlgren`] +1 transcends 3.0

`[MURATA`] Yes

`[MURATA`] Great

`[GARTH`]: As long as registry isn't initially empty at 3.0 timeframe.

`[danhughes`] Yes, I think we would need to define the process by which new schemes might be added in the future `[ to proposed registry`]

`[GARTH`]: +1

`[keith_fahlgren`] http://code.google.com/p/epub-revision/issues/detail?id=75

`[keith_fahlgren`] Argument Against H.264 as Lone EPUB 3

`[keith_fahlgren`] Core Media Type for Video https://docs.google.com/document/pub?id=1dyFcIHNhLnYZVLugsuD1MYfDW1jwRGexNqyLi5MaUC4

`[mgylling`] King-Wais analysis

`[mgylling`] https://spreadsheets.google.com/ccc?key=0AnXE8s9XoOz3dFhLWHJzTEgyUUlNU2pEZlRBajc0dGc&hl=en

`[mgylling`] http://code.google.com/p/epub-revision/wiki/CodecsRevisited

`[MURATA`] FYI: I will see my Korean colleagues in Prague next week and speak with them about remote fonts.

`[keith_fahlgren`] But it is realistic to think that we can make an informed choice about what will be true in Q4 2011, let alone Q4 2012. What's the desired longevity of EPUB 3?

`[keith_fahlgren`] No

`[keith_fahlgren`] I don't think that represents the consensus of the Working Group

`[kingwai`] EPUB 3 can be upgraded to EPUB 3.x to incorporate additional video codec(s) when those codec(s) become better supported in the application processors, commercial software SDK, and the production side

`[keith_fahlgren`] Again, do we want an answer for 23 Mar 2011 or 23 Mar 2012?

`[Brady`] Minutes from the scripting meeting: http://code.google.com/p/epub-revision/wiki/ScriptingCall20110323Minutes

`[danhughes`] Since most of the discussion today revolves around licensing and/or workflow, is there general agreement that there are not technical issues, e.g. streaming, subtitle support, that may factor in to the decision?

`[kingwai`] Subtitle is supported in H.264 via MPEG-4 Part 17 whereas WebM does not support subtitle yet

`[keith_fahlgren`] We can make a decision informed by our understanding of the landscape in May 2011, that's fine. I just think we should say that (non-normatively)

`[keith_fahlgren`] or something about what kingwai is saying, and warning that it'll change

`[mgylling`] keith: yes, warning that it'll change for sure if we go this route

`[keith_fahlgren`] have to run; thx

[Issue #75](https://code.google.com/p/epub-revision/issues/detail?id=#75) (video codecs) `[corrected`]: Proposal "Solution #4" (EPUB may include H.264 and/or WebM, as core media types), RS's that support video, must support H.264 or WebM.

`[mgylling`] ACTION: James+Markus: make sure [Issue 60](https://code.google.com/p/epub-revision/issues/detail?id=60) and Takeshi's font signing issue are resolved for OCF

`[mgylling`] ACTION: Bill+Markus come up with proposal for link registry

`[mgylling`] ACTION: all to read the CFI google doc, comments on changes

`[mgylling`] ACTION: Markus take CodecsRevisted #4 as proposed solution to list