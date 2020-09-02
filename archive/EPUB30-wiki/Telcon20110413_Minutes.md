# Telcon 13 April 2011 #

recording filename is 110413

Agenda: [Telcon20110413](Telcon20110413.md)

Agenda change: CSS topic not expected to reach resolution today

## Attendees ##
wen-hsuan, Si-Wei, danielweck, oedipus\_lurker, Felix, fantasai, Si-Wei_, Murata, hober, kballard, mgarrish, kingwai, Kyoji, NeilS, ShuTanabe, Ryoji\_Akimoto, Norm, garth, SteveKotrch, BillMcCoy, RogerWebster, mgylling, marisa\_demeglio (scribe)_


## Action items ##

### New action items ###
  * ACTION: Murata-san takes the lead on resolving prefixes
  * ACTION: All WG members can review scripting section as the latest changes have been integrated and committed
  * ACTION: Murata-san to bring to the list people/information about additional details such as use cases

Note that the body of the minutes say that Markus is to set up a poll about remote fonts, but then later we decided that such a poll would be a waste of time given the already-strong support coming from Asia.  So, that action item was not included in this master list.

### Previous action items ###
  * ACTION: (remaining) Bill & Markus to formalize terminology and get docs moving (registry)
  * Done: Garth / CFI spec
  * Done: Daniel / navhide


## video codecs ([Issue 75](https://code.google.com/p/epub-revision/issues/detail?id=75)) ##

Looking for a consensus-based solution first (Consensus = absence of objections).  One suggestion sent out this monday by Markus, ruling out options with objections (1, 2, 4b).  The remaining options: 3, 4

### option 4 (RS supports H264 or WebM) ###
Reaction to option 4 among those on the call:
  * One WG member/company cannot accept it at all
  * Another states they could accept but it's not preferable


### option 3 (be silent a la HTML5) ###

question: what is the core media type & fallback language for option 3?

one option is to require a fallback that is not video -- it could be something like HTML5's poster

if we stay silent in the spec, we could still provide informational pages about the current state of video codecs and make recommendations

`[`fantasai`]` if these files are being transferred over HTTP, maybe you could do content negotiation with the client?

answer: that would work fine for streaming; embedding is trickier

having multiple epub versions (1 per codec) is a burden for publishers

**The working group has reached a consensus-based resolution to go for option 3 for video codecs**



## audio codecs ##

The chairs will release a 72-hour resolution and then discussion will commence


## CSS working group call summary ##

The call was today

CSS WG would like EPUB to use prefixes for any properties that aren't in CR

Suggestion from apple: require content to use both the prefixed and non-prefixed versions of properties

UA only allowed to implement a prefixed version until the draft goes to CR

example from fantasai:

```
-epub3-word-break: keep-all;
word-break: keep-all;
```

advantage to prefixed version: engine like apple's which parses both epub & web content would not expose prefixed versions to web content

by excluding web content, we have more control & freedom to change w/o breaking content

we still defer semantics to w3c, which is consistent with our approach thus far in epub

authors use both prefixed & unprefixed; UAs only parse prefixed until the spec goes to CR

(this is from a proposal; requiring authors to double up on properties is not an official css wg decision)

problem: if authors double up on properties and the unprefixed version changes before reaching CR, then authors have to change too

Note that the scribe was disconnected for about a minute.

We need to list the different solution  options and proceed forward.

ACTION: Murata-san takes the lead on resolving prefixes


## scripting issues ##

ACTION: All WG members can review scripting section as the latest changes have been integrated and committed


## Remote fonts ##

Summary: Taiwanese, Japanese, Korean users believe remote fonts should be allowed.  Don't understand why prohibited.

There is currently a discussion in the TAG & Web applications WG about this

In EPUB3, everything is required to be in the container (exceptions for audio & video for size reasons).  It's a slippery slope when we start adding more exceptions.

However, CJK fonts can be quite huge.  Can we consider subsets?

Example: some adventure books require users to enter their own name, so we can't anticipate the font subset that is required

Peter: seems like an experimental feature, no guarantee that the device will be able to display books that require remote fonts (for example, if the device is offline).  need a processing model - do i download the font with the book or do it later?

Murata: there have been strong requests for such a feature

Murata: it has been included as part of CSS, so why prohibit it?

`[`fantasai`]` notes that by that argument, remote background images are also allowed (action)

Remote fonts on the web is a different model than in EPUB, since the web is a 100% online environment

Peter mentions licensing problems for font vendors

`[`Si-Wei`]` Excuse me, Taiwanese need remote font because even the smallest Traditional-Chinese font still keep 8MB

`[`fantasai`]` Si-Wei, what about a font that is subsetted to the text actually used in the ebook?

`[`Si-Wei`]` And some artist font will increase to 18~25MB

King Wai: many RS come with limited sets of fonts because of size constraints

`[`Si-Wei`]` fantasai, I think the subsetted might be a solution if the remote font can' t be accept by IDPF

King Wai: therefore, these RS will rely on remote fonts

`[`fantasai`]` Si-Wei, i think that would be better for users. Because ebooks are often used offline. I think Peter's argument that the resources should be in the EPUB file makes sense

Can publishers include an embedded font subset?

We would like Brady's input on this

Do we need any further information in order to make a decision?

Do we have consensus to add remote fonts to the list of resources that may live outside the container?

fantasai: we should take a closer look at subsetting

Peter: sometimes subsetting is forbidden

Markus: we are not forbidding embedding fonts

Peter: if you have license to allow downloading, you probably have license to allow subsetting. So I don't see how this proposal really solves the problem.

Markus: Proposal for allowing remote fonts, spec silent on same-origin restriction.

Peter: I think we should first do a straw poll.

Peter: See if there are more people who like it than who don't like it.

Peter: I fear that this is being pushed without proper review

Markus: I will take an action to set up a poll

ACTION: Markus to set up a poll

George: I'm concerned about longevity of documents

George: What if the remote font is no longer available?

George: Would RS be required to process remote fonts?

George: Or would it include the fonts necessary for the book embedded and only download fonts for user-generated content

unknown speaker: Maybe we should have some informative note that from content accessibility and longevity etc. it's better to embed it

Peter: I'm not aware of use case where this is needed

Murata: user-generated content

Peter: Yeah, ok.

Peter: But not other than that.

Peter, on licenses: Fonts that are not subsettable are in general also not embeddable / downloadable

Peter: Typical for some high-end Asian fonts

Re: poll - it may be a waste of time (there seem to be many in favor of remote fonts in Asia).

Murata: start 72 hour clock

Peter: concern that it will be treated as a shortcut instead of using font subsetting software (which is more work)

ACTION: Murata-san to bring to the list people/information about additional details such as use cases

some restrictions, such as "only use remote fonts when absolutely necessary", could give us both control and flexibility

these restrictions could target certain use cases


## page progression direction ##

postponed until next week

## epub:switch ##

postponed until next week