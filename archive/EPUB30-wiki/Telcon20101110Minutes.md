

# Attendees #
Si-Wei, wen-hsuan, Takeshi, DaveGunn, jtallent, gc, CodenameKT, ChoChin, DanHughes, Kyoji, kingwai, BradyDuga, keith\_fahlgren, James\_Pritchett, BillMcCoy, marisa\_demeglio, George, danielweck, jtchen, MURATA, oedipus\_away, NeilS, ShuTanabe, Ryoji\_Akimoto, mikew3c, SteveKotrch, mgylling


# Action Items #

  * Markus to draft prose that explains how to replicate Guide in NCX 3.0
  * Markus to establish liaison w/ W3C with Fantasai as liasion
  * Dan to move page-progression-direction to package level, add property to spine/itemref values of "left/right"
  * King Wai to start video proposal

# Topics #
## TOPIC: Previous minutes ##
http://code.google.com/p/epub-revision/wiki/Telcon20101103Minutes

## TOPIC NCX ##
NCX has metadata in 3.0
George: Guide can be NavList in NCX, no hierarchy, just a list
Markus: in draft, Guide is deprecated
Action Item: Markus to draft prose that explains how to replicate Guide in NCX 3.0

## TOPIC: TPAC results ##
Markus: Spoke about epub;
Markus: establish formal liaison with W3C CSS WG
Markus: CSS writing modes need work, moving forward next week - report from Fantasai
Markus: liaison will be Fantasai
Action Item: Markus to establish liaison w/ W3C with Fantasai as liasion
Markus: semantics / @role, could be used over opf attr. etc., support from HTML5 WG on use-cases
Markus: Timeline; HTML5 possible to have multiple last-calls. significant amount of unit-tests to produce...talk of 3-4 years, up to 12 years for final spec
Markus: tracker issue topic: reference CSS3 Speech over CSS 2.1. Aural Stylesheets

## TOPIC: Page-Progression-Direction / Two-Page-Spreads ##
http://groups.google.com/group/epub-21-working-group/browse_thread/thread/b4f7650d2deeda1c?hl=ja#
http://code.google.com/p/epub-revision/wiki/ImplementationProposalsMetadata?ts=1289100174&updated=ImplementationProposalsMetadata#Manifest_item_special_properties
Discussion on need for spine/itemref properties
Action Item: Dan to move page-progression-direction to package level, add property to spine/itemref values of "left/right"


## TOPIC: Identifiers ##
Main work/discussion will continue in the package linking group (keith's group)
http://groups.google.com/group/epub-21-working-group/browse_thread/thread/92b1195e07a6316b

## TOPIC: Media Formats ##
Action Item: King Wai to start video proposal

## TOPIC: Editor's Report ##
BillM: Madly assembling draft
BillM: Some metadata still being worked in to draft
... the release will be Friday, 23:59 Hawaii time
BillM: content in repo is pretty close to ready for internal/editor draft

BillM: Issues on tracker

BillM: [Issue 51](https://code.google.com/p/epub-revision/issues/detail?id=51)
http://code.google.com/p/epub-revision/issues/detail?id=51
OPF fragments / xincludes - is this language needed?

BillM: [Issue 50](https://code.google.com/p/epub-revision/issues/detail?id=50): http://code.google.com/p/epub-revision/issues/detail?id=50
UTF-16 comes w/ XML, it remains.

BillM: [Issue 46](https://code.google.com/p/epub-revision/issues/detail?id=46):e Headers + Footers -  http://code.google.com/p/epub-revision/issues/detail?id=46
Garth/Peter: Need to retain oeb-page=foot, oeb-page-head

BillM: xml-stylesheet processing, [Issue 28](https://code.google.com/p/epub-revision/issues/detail?id=28): http://code.google.com/p/epub-revision/issues/detail?id=28
xml-stylesheet spec has recently been updated, supporting Media Queries
keep xml-stylesheet, but clarify usage and spec language

BillM: SVG: reference svg 1.2 tiny

BillM: mimetype requirements: allow trailing whitespace

# Full IRC Log #
[1:58pm] mikew3c joined the chat room.

[2:29pm] mgylling joined the chat room.

[2:55pm] ChoChin joined the chat room.

[2:56pm] ChoChin left the chat room. (Quit: )

[2:56pm] MURATA joined the chat room.

[2:56pm] kingwai joined the chat room.

[2:56pm] George joined the chat room.

[2:57pm] wen-hsuan joined the chat room.

[2:58pm] Si-Wei joined the chat room.

[2:58pm] ChoChin joined the chat room.

[2:58pm] Kyoji joined the chat room.

[2:59pm] Ryoji\_Akimoto joined the chat room.

[2:59pm] George: filename: 101110

[2:59pm] ShuTanabe joined the chat room.

[2:59pm] DaveGunn joined the chat room.

[3:00pm] keith\_fahlgren joined the chat room.

[3:00pm] marisa\_demeglio joined the chat room.

[3:00pm] MeetBot joined the chat room.

[3:01pm] mgylling: recording filename is 101110

[3:01pm] James\_Pritchett joined the chat room.

[3:03pm] danielweck joined the chat room.

[3:04pm] gc joined the chat room.

[3:04pm] DanHughes: meetbot #topic

[3:04pm] DanHughes: #topic previous minutes

[3:04pm] BradyDuga joined the chat room.

[3:04pm] SteveKotrch joined the chat room.

[3:05pm] DanHughes: TOPIC: Previous minutes

[3:06pm] marisa\_demeglio: http://code.google.com/p/epub-revision/wiki/Telcon20101103Minutes

[3:07pm] DanHughes: TOPIC NCX

[3:07pm] DanHughes: NCX has metadata in 3.0

[3:08pm] DanHughes: George: Guide can be NavList in NCX, no hierarchy, just a list

[3:09pm] DanHughes: Markus: in draft, Guide is deprecated

[3:11pm] DanHughes: Action Item: Markus/Garth to finalize NCX/Guide issue

[3:13pm] DanHughes: Action Item: Markus to draft prose that explains how to replicate Guide in NCX 3.0

[3:13pm] DanHughes: TOPIC: TPAC results

[3:14pm] NeilS joined the chat room.

[3:14pm] DanHughes: Markus: Spoke about epub;

[3:14pm] DanHughes: Markus:  establish formal liaison with W3C CSS WG

[3:15pm] DanHughes: Markus: CSS writing modes need work, moving forward next week - report from Fantasai

[3:15pm] DanHughes: Markus: liaison will be Fantasai

[3:16pm] keith\_fahlgren: +1

[3:16pm] DanHughes: Action Item: Markus to establish liaison w/ W3C with Fantasai as liasion

[3:17pm] DanHughes: Markus: semantics / @role, could be used over opf attr. etc., support from HTML5 WG on
use-cases

[3:19pm] DanHughes: Markus: Timeline; HTML5 possible to have multiple last-calls. significant amount of
unit-tests to produce...talk of 3-4 years, up to 12 years for final spec

[3:20pm] DanHughes: Markus: tracker issue topic: reference CSS3 Speech over CSS 2.1. Aural Stylesheets

[3:21pm] DanHughes: TOPIC: Page-Progression-Direction / Two-Page-Spreads

[3:21pm] MURATA:
http://groups.google.com/group/epub-21-working-group/browse_thread/thread/b4f7650d2deeda1c?hl=ja#

[3:21pm] Takeshi joined the chat room.

[3:22pm] MURATA:
http://code.google.com/p/epub-revision/wiki/ImplementationProposalsMetadata?ts=1289100174&updated=
ImplementationProposalsMetadata#Manifest\_item\_special\_properties

[3:22pm] oedipus\_away is now known as oedipus.

[3:22pm] BillMcCoy joined the chat room.

[3:23pm] jtallent joined the chat room.

[3:26pm] keith\_fahlgren: +1

[3:28pm] DanHughes: Discussion on need for spine/itemref properties

[3:30pm] DanHughes: Action Item: Dan to move page-progression-direction to package level, add property to
spine/itemref values of "left/right"

[3:33pm] CodenameKT joined the chat room.

[3:33pm] DanHughes: TOPIC: Identifiers

[3:35pm] DanHughes: Main work/discussion will continue in the package linking group (keith's group)

[3:36pm] DanHughes: http://groups.google.com/group/epub-21-working-group/browse_thread/thread/92b1195e07a6316b

[3:37pm] oedipus is now known as oedipus\_away.

[3:41pm] gc left the chat room. (Quit: gc)

[3:44pm] gc joined the chat room.

[3:45pm] keith\_fahlgren: OK, so content-version should show up in a draft soon along with all the other
metadata subgroup recommendations

[3:45pm] DanHughes: TOPIC: Media Formats

[3:47pm] DanHughes: Action Item: King Wai to start video proposal

[3:47pm] DanHughes: TOPIC: Editor's Report

[3:47pm] DanHughes: BillM: Madly assembling draft

[3:47pm] DanHughes: BillM: Some metadata still being worked in to draft

[3:48pm] mgylling: ... the release will be Friday, 23:59 Hawaii time

[3:48pm] DanHughes: BillM: content in repo is pretty close to ready for internal/editor draft

[3:49pm] keith\_fahlgren: That sounds fine

[3:50pm] DanHughes: Peter: don't create more hurdles, just make show progress and make clear draft state

[3:50pm] DanHughes: BillM: Issues on tracker

[3:51pm] DanHughes: BillM: [Issue 51](https://code.google.com/p/epub-revision/issues/detail?id=51)

[3:51pm] DanHughes: http://code.google.com/p/epub-revision/issues/detail?id=51

[3:51pm] DanHughes: OPF fragments / xincludes - is this language needed?

[3:56pm] DanHughes: BillM: [Issue 50](https://code.google.com/p/epub-revision/issues/detail?id=50): http://code.google.com/p/epub-revision/issues/detail?id=50

[3:59pm] DanHughes: UTF-16 comes w/ XML, it remains.

[4:00pm] DanHughes: [Issue 46](https://code.google.com/p/epub-revision/issues/detail?id=46): http://code.google.com/p/epub-revision/issues/detail?id=46

[4:00pm] DanHughes: Headers + Footers

[4:01pm] DanHughes: Garth/Peter: Need to retain oeb-page=foot, oeb-page-head

[4:02pm] DanHughes: BillM: xml-stylesheet processing, [Issue 28](https://code.google.com/p/epub-revision/issues/detail?id=28):
http://code.google.com/p/epub-revision/issues/detail?id=28

[4:03pm] mgylling: xml-stylesheet spec has recently been updated, supporting MQ

[4:04pm] gc left the chat room. (Quit: gc)

[4:06pm] DanHughes: we keep xml-stylesheet, but clarify usage and spec language

[4:06pm] DanHughes: BillM: SVG reference svg 1.2 tiny

[4:08pm] DanHughes: BillM: mimetype requirements, allow trailing whitespace

[4:08pm] BradyDuga left the chat room. (Quit: BradyDuga)

[4:08pm] ChoChin left the chat room. (Quit: )

[4:08pm] BillMcCoy left the chat room. (Quit: bye)

[4:08pm] DaveGunn left the chat room.

[4:08pm] James\_Pritchett left the chat room. (Quit: http://www.mibbit.com ajax IRC Client)

[4:08pm] Si-Wei left the chat room. (Quit: Si-Wei)

[4:08pm] kingwai left the chat room. (Quit: Using leafChat 2)

mgylling: meetbot, list attendees

[4:09pm] MeetBot: Si-Wei, wen-hsuan, Takeshi, DaveGunn, jtallent, gc, CodenameKT, ChoChin, DanHughes, Kyoji,
kingwai, BradyDuga, keith\_fahlgren, James\_Pritchett, BillMcCoy, marisa\_demeglio, George, danielweck, jtchen,
MURATA, oedipus\_away, NeilS, ShuTanabe, Ryoji\_Akimoto, mikew3c, SteveKotrch, mgylling