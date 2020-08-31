# Action items arising from call #

  * Action: Markus to clarify intent wrt caption formats
  * Action: Markus, Matt, and Peter to work on epub:switch mechanics and prose

# Resolutions #

  * Resolution: Video Captions proposal accepted
  * Resolution: Manifest Fallback proposal accepted
  * Resolution: (tentative) re-introduce epub:switch (ops:switch); needs re-working in spec, then brought back to group for consensus
  * Resolution: keep oeb-page-foot and oeb-page-head, RS support will remain as 'SHOULD', spec prose to clarify fallback approach

# IRC Minutes #

mgylling: recording filename is 110427

mgylling: danhughes, ok to scribe?

mgylling: meetbot, set scribe danhughes

MeetBot: Scribe is now danhughes


danhughes: Topic: Extra Calls

BillMcCoy: Dan - u are scribing?

danhughes: Call dates/times located on agenda here: http://code.google.com/p/epub-revision/wiki/Telcon20110427

BillMcCoy: thx let me know if you need to tag team

danhughes: ok Bill



danhughes: Topic: Video Captions

danhughes: email list thread here: http://groups.google.com/group/epub-working-group/browse_thread/thread/34ec738507bfa7f3

danhughes: Propose 2nd chairs solution today, no requirements or core media types specified

danhughes: George raises a11y issue and need for caption support in RS

danhughes: Markus points out that common caption format are **fairly** easy to manipulate from 1 to 1

danielweck: NOTE: there can be several 'track' children elements of 'video' with the same '@kind' attribute value (e.g. several subtitle tracks, in different languages).

danhughes: BillM asks how similar situation is to video codec circumstance

danielweck: NOTE (follow-up): there must not be two track element children of the same media element whose kind attributes are in the same state, whose srclang attributes are both missing or have values that represent the same language, and whose label attributes are again both missing or both have the same value.

danhughes: Action: clarify intent wrt caption formats

danhughes: Resolution: Video Captions proposal accepted



danhughes: Topic: Manifest Level Fallbacks

danhughes: Issues 118 http://code.google.com/p/epub-revision/issues/detail?id=118, 119 http://code.google.com/p/epub-revision/issues/detail?id=119, 120 http://code.google.com/p/epub-revision/issues/detail?id=120

danhughes: Current proposal summary: http://code.google.com/p/epub-revision/wiki/Telcon20110427#manifest-level_fallbacks

danhughes: Problem is that a RS must traverse and parse document to discover non-spine level content fallbacks; e.g. fallback for a Flash file that is referenced from an XHTML doc

danhughes: Concerns over impact on RS if behavior is changed at late stage in process; anecdotal evidence that this did/does not have widespread, if any, implementation from RS developers

danhughes: BillM: this change will simplify both spec and implementations; also the introduction of the binding mechanism makes the fallbacks unneeded

danhughes: Resolution: Manifest Fallback proposal accepted



danhughes: Topic: epub:switch

danhughes: Issue tracker: http://code.google.com/p/epub-revision/issues/detail?id=94

danhughes: Email thread: http://groups.google.com/group/epub-working-group/browse_thread/thread/48ac936115930a3c

danhughes: Peter comments that epub:switch is not widely implemented - but is useful, and necessary for some content publishers

danhughes: Peter states that we should continue support for epub:switch, but define supported namespaces for content docs, i.e. MathML

danhughes: In 2.0/2.0.1 epub:switch was ops:switch

danhughes: :switch allows reading systems to display **future versions** of epub then they may not officially support

danhughes: Resolution: (tentative) re-introduce epub:switch (ops:switch); needs re-working in spec, then brought back to group for concensus

danhughes: Action: Markus, Matt, and Peter to work on epub:switch mechanics and prose


danhughes: Topic: oeb-page-foot/head

danhughes: Suggestion has been made to deprecate: http://code.google.com/p/epub-revision/wiki/ContentDocumentsFeedback#3.3.10

danhughes: anecdotal evidence feature is not widely supported, and also that the mechanics are less than desirable

danhughes: however, the concept of running headers and/or footers is common and appealing to publishers/authors

danhughes: Resolution: keep oeb-page-foot and oeb-page-head, RS support will remain as 'SHOULD', spec prose to clarify fallback apporach


danhughes: meetbot, list attendees

MeetBot: wen-hsuan, Si-Wei, Takeshi, DaveGunn, fantasai, danhughes, mgarrish, Kyoji, kingwai, garth_, garth, matthaas, James\_Pritchett, marisa\_demeglio, RogerWebster, BillMcCoy, danielweck, Felix, hober, Brady_, MURATA, Brady, NeilS, ShuTanabe, Ryoji\_Akimoto, mgylling