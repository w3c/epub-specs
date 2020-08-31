Chair: Markus Gylling

Scribe: Bill McCoy

## Attendees ##

Markus Gylling, Bill McCoy,  BLarroque, KingWai, Norm, MOlenick, Kyoji, RogerWebster, matthaas, keith\_fahlgren, Ryoji\_Akimoto, DaveGunn, kenny\_j, Brady Duga, Cho Chin, Si-Wei, Steve Kotrch, Daniel Weck, Adam Witwer, Marisa Demeglio, Eric Freese, Diane Kennedy, Bill Kasdorf, Shiohama, awiles,  Dan Hughes, Josh Tallent, Takeshi Kanai, George Kerscher, Neil S, Garth Conboy, Mei-Li, Liza Daly

## New Action Items ##

- BillK to put Makoto in touch with Hindawi people (Egyption publisher)

- Roger, Keith, Liza to contribute to interactivity section of Wiki (directly or through Peter) re: scripting architectural tradeoffs

## General ##

Markus: previous minutes - approved

## maintenance future work items ##

Markus: to subgroup coords, have any questions on the issues on the list?

BillK: no, brought up in yesterday's call, they are on our wiki

Brady: not looked yet, but Garth has

Makoto: received JEPA, Voyager, and Cemix, and I will review them, and check for overlap

Markus: next Friday is date for initial submission of subgroup requirements, will be followed by global overview to resolve and overlap/conflicts,  but doing that early is good idea

Markus: surprised to not see NCX in there

Garth: everything made it into 2.0.1

Garth: one - id of alternative renditions - put into 2 subgroups

Garth: both metadata and layout, others all fit nicely into 1 subgroup

Markus: dig sig?

Garth: coming up to then-current standards, can be done at drafting time

## subgroup status reports ##

Markus: reminder - first submission next Friday of subgroup requirements set, followed by a week of global analysis/changes. Time is getting short!

## annotations ##

Markus: Will Manis, absent today

Daniel, DAISY: will check list of requirements tomorrow and send comments

Daniel: starting discussion around audio/multimedia annotations

George: thinking about document that goes out after EPUB is completed, adding an audio reading of poem or something after the fact, delivering as annotation

Marissa: sounds like it'd be good for rich media & interactivity

Markus: Joshua, for Hebrew does what's in Wiki satisfy?

Joshua: I think so (??? audio unclear)

Makoto: bidi - need more requirements

Makoto: unless some Arabic persons bring requirements I don't think the subgroup can do anything about it

Makoto: basicaly only from CJK countries

Makoto: merging should not be difficult, should not require teleconference

Makoto: then F2F meeting in Sapporo, prelim agenda published to Wiki, want to get attendees listed on Wiki, esp since reception on first day planned

Makoto: EGLS members, please read relevant documents like vert writing from Unicode consortium

Josh T: Yes, I think the requirements for Hebrew will be satisfied by the items already mentioned on the EGLS wiki. my only question is about normalization (placement of combining diacriics) -- not sure if that is something the ePub standard should or will discuss

## metadata ##

BillK: lots of participation from relevant experts but not much on requirements yet, background info more relevant to solutions, I may have to approach members and "draft" them to contribute reqs

Meil-Li: Makoto, CJKT please!

BillK: I did make a template, the rest of the group may be interested, since reqs are granular there are interdependencies and I put a place for this in my template, may be useful in general

## navigation ##

George: pretty complete set of reqs there

Markus: NCX needs a metadata mechanism, hope to have a more univesal solution

## text content ##

Markus: people working on specific semantics (book, mag, etc.)

Markus: first call had yesterday

Markus: major design problem, establish the optimal relation to HTML5, there's a number of different solutions we're discussing, we'll be meeting again friday, and hope to have Wiki page with summary of where we ended prev call

Markus: core issue is HTML5 will be moving target for longer than we want to be a moving target ourselves, issue how do we stablize grammar that depends on something that's not stable, with consideration to longevity of content that needs to last for decades.

Markus: problem applies to CSS  as well

BillK: any expliict coordination with DAISY?

Markus: it is part of the picture, and happening as we go along. DAISY's hypothesis is to deprecate/remove DTBook and use HTML5 adaptation instead

George: we'd recommend to DAISY that they use a modular XML approach to capture semantics, and transform to EPUB for delivery with semantic mechanisms the WG comes up with, as opposed to using EPUB as authoring environment

George: TEI, DocBook, etc. would be transformed to EPUB

George: James has action item to make sure DTBook semantics are in the requirements for text content

BillK: OK, that was my concern

Markus: also about stricter content models, there are a few elements but the strictness is a key property, we have requirements in text content wiki (so far vague) about ability to express subsets, that's referring to the idea to express a version of HTML that is more strict & stringent (de-tag-soupify)

## formatting & layout ##

Brady: not much has happened yet, will be leaving in Garth's hands while on vacation starting next week

Brady: will kick things off on the list via email, hopefully Garth will have more to report next week

## Interactivity & rich media ##

Peter: a little activity on the Wiki, think it will be in shape by end of next week, but more stuff esp on interactivity would be welcome

Markus: you talked about webapp encapsulating most of what we want to accomplish with interactivity, we may have a cross-cutting concern there

Markus: whats the status of scripts in epub-current?

Garth: "should not" execute, "must not" display textual content of script

Liza: Are we looking to collect use cases on interactivity?

Markus: question is should we change our position there, which subgroup/subgroups will deal with this?

Liza:What would be the most useful contributions to make on the wiki?

RogerW: few comments on interactivity - in conversations with publishers, they are keen to have, they have imagination on this, tough for us to stave off scripting inside EPUB, it's a shift in view, but have to figure out how to embrace in a way that we're comfortable with

Garth: likely to embrace from perspective of encapsulated sub pubs

RogerW: scripting that can affect DOM

Peter: may have requirements that affect pagination of an entire chapter, but this may be in conflict with other requirements like anchoring annotations

Peter: when you allow scripting you can only execute the script, you can't analyze it

Keith F: Everyone interested in scripting should review http://code.google.com/p/google-caja/

Peter: so we have a lot of implicit requirements, being able to annotate is one of them, but if scripting is allowed we have to nail them down

Bill: resolve by making requirements explicit, then resolve - we have annotations subgroup, so we will make annotations explicit anyway

KeithF: scripting is a requirement, Liza would be happy to write them up

KeithF: I'm concerned that many objections are similar than those raised to SCRIPT element in HTML2, I don't want to rehash what HTML did

KeithF: concerns from implementators are around support, one is to make sure documents are accessibility, another like Google Caja

KeithF: attemps to try to ensure that JS doesn't get too much access

KeithF: I believe there's going to be many requirements to manipulate the DOM

KeithF: I'm not sure we should say we're going to exclude some JS component from HTML5 because it's scary

Peter: I don't have a problem with a web app on a page that has scripting, yes we need ot discuss accessiibliyt but that's in scope

Peter: I'm concerned with being able to script the chapter content, so the script can change the layout of the overall document

Peter: question is whether we should allow scripting everything

Markus: describing the use cases on the Wiki so we can understand more clearly would be useful

Peter: or send it to me

Peter: I don't see allowing changing beyond the small island that the script is assigned to

Roger: scripting that would allow dynamic mod of a paragraph would make it tricky to do annotations, overlays, etc., that's what you're getting at right?

Roger: I'm generally not hearing that, but I haven't heard about that

Garth: scripts that are self-contained would be in scope

## advertisement ##

BillM: my leads have not come through yet

Peter: can take on ads

BillM: rename "rich media, interactivity, and ads" = RIA ;-)

Markus: reminder text content subgroup, 19:00 UTC, this group same time next week