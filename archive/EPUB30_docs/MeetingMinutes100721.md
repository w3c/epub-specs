Chair: Markus Gylling

Scribe: Marisa DeMeglio


Audio recording: 100722

To listen to the recording, dial in and press star 3

## Attendees ##
Si-Wei, !Takeshi, mikesmith, Dan, wenhsuan, DaveGunn, mat\_clutter, jtallent, ebookarchitect, gc, karenbroome, ChoChin, MikeW3C, Shiohama, Peter Sorotkin, Norm, matthaas, BillMcCoy, RogerWebster, marisa\_demeglio, George, !BLarroque, Alex\_Zu, kenny\_j, AdamWitwer, danielweck, BenTrafford, Alexis Wiles, !MOlenick, Dianne Kennedy, !NeilS, ShuTanabe, Ryoji\_Akimoto, EricFreese, SteveKotrch, Mei-Li, mgylling, wmanis, BillKasdorf

## Action Items ##

  * Roger, Keith, Liza to contribute to interactivity section of Wiki (directly or through Peter) re: scripting architectural tradeoffs
  * everyone to review requirements

## IDPF-W3C liason ##

Mike Smith from W3C is on the call today

Mike: I am the W3C staff member responsible for the HTML working group, interested in EPUB and helping out from W3C side with communication, plans to participate in telcons and mailing list


## Previous minutes ##

Accepted previous minutes.


## Previous action item review ##

Bill Kasdorf: recommended 2 resources to Makoto for Arabic language support/publishing

Roger, Keith, Liza action item was to contribute to interactivity re: scripting

Garth: looks like a lot of activity this week in that area

RogerWebster (via irc): "What Garth said."

Roger: plan to update the wiki with more use cases before Friday

action item still open

ACTION: Roger, Keith, Liza to contribute to interactivity section of Wiki (directly or through Peter) re: scripting architectural tradeoffs


## Process overview, next steps ##

Markus: Friday is the deadline for subgroups to submit their requirements for full WG review; still will be in draft status

Markus: next challenge: getting enough review and analysis of submissions in order to reach a stage where we feel that all requirements produced are harmonized and reflect our charter and the needs of our ecosystem/WG

Markus: starting monday, we review all submitted requirements for consistency, resolve conflicts, and clarify where needed

Markus: use the list, not the wiki comments section, as the entire group is to be involved

Bill Kasdorf: meta subgroup has created system of cross references/dependencies in their wiki; want others to add to the meta wiki page dependencies, using the same form

Markus: start with general assignment -- everyone reviews whatever they can or have expertise in.  else we will assign tasks.

ACTION: everyone to review requirements

Markus: next major step (after requirements clarification/improving): build actual implementation proposals


## Annotations status report ##

Will Manis: we have a reasonable set of requirements, focusing on the structural aspect, not display

Will Manis: is this reasonable?

Peter: yes; make sure the content is open-ended enough

Will Manis: want to focus on the data integrity, rather than specific UA issues

Peter: in the long term, we probably want to address these things, but we need to build toward that point


## EGLS ##

Murata not here today

Takeshi: nothing to report but we are still getting requests from the members

Takeshi: Makoto is trying to get comments from non-IDPF members

There is a 2-day F2F in Saporo August 3 + 4



## Metadata ##

Bill Kasdorf: got good input from ONYX, PRISM, NISO, others

Bill Kasdorf: no issues to raise here



## Styling and layout ##

Garth: 21 requirements in the appropriate format, some could have use cases added

Garth: buckets about pagination, multiple display surfaces, page level layout

Garth: proposing a decision to support CSS 2.1


## Navigation ##

George: new requirement about bibliographic references (duplicated in meta group due to strong dependency)

George: requirement is 1. how to get bibliographic reference (e.g. a student is writing a paper and needs to reference an ebook), and 2. how to load that point in the book

Will Manis: this could be a more general issue -- what is the mechanism for referring to epub?

Bill Kasdorf: there's a big difference between citation in form of an identifier (e.g. ISBN) and a bibliographic citation, which includes much more information and is more complicated

George: the point is that in order for ebooks to move into academia, we need a standardized bibliographic reference mechanism

jtallent (via irc): some of that is handled by the various style guides, too

Markus: this looks like a cross-subgroup concern


## Text content ##

Markus: this group has a lot of work to do, in part due to the yet-to-be-defined relationship w. HTML5

Markus: collecting from 3 subdomains (general textbook semantics, dictionaries and glossaries, magazines/periodicals)

Markus: collecting semantic needs from those domains

Markus: extensibility is another task of this group

Markus: will get as far as we can by Friday and note all unresolved issues at that point

Dianne Kennedy: I have a full set of requirements drafted for many subgroups, under review, will submit by Friday


## Interactivity and Advertising ##

Peter: no activity for Ads

Peter: Interactivity is one thing and declarative approach is something else

Peter: don't expect devices with restricted capabilities to render interactive content

Peter: good set of requirements for interactivity, ready for review

Markus: in terms of Ads, there is one requirement and it looks thin.  would anyone here like to sign up for ads?

Dianne Kennedy: will add 1 or 2 requirements for advertising

Will Manis: will contribute to Ads

Mike (W3C):  how do we handle the formatting of advertiser content?  well-formed etc?  many providers not capable of producing well-formed RSS and Atom feeds

Dianne Kennedy: IAB (?) studying what the ad types are, thinking that the ads would be delivered as rich media,  have a link between the ad and the content.  ad providers probably not concerned about well-formedness

Will Manis: to build an ad infrastructure that works long term, we'll have to look at the mistakes of the web and not repeat them.  advertisers need to be trusted content providers (not malware providers)


## HTML5 relationship ##

Markus: 2 parallel problems -- 1. how to relate to HTML5 as a moving target,  2. vocabulary extensibility

Markus: today, let's focus on #1

Markus: 3 proposed solutions at http://code.google.com/p/epub-revision/wiki/TextContent_HTML5Relations

Markus: option A - we could stabilize EPUB ahead of HTML5 by referencing a dated version of the HTML5 draft

Markus: option B -- single out elements that have a lot of intrinsic behavior and treating them separately; take them into our own namespace and stabilize them that way

Markus: option C -- be in draft status until HTML5 is ready

Peter: wants to dismiss option C from the start

Peter: we are talking about 10-years-futureproof documents, not websites, which are outdated every year

Peter: ebooks have monetary value, how can you sell content based on a draft?

Ben Trafford: completely agree

Ben Trafford: standardization varies pretty widely among different browsers, but the behaviors of HTML5 have been fixed for a while

Peter: media elements could still change, not just syntactical changes

Mike W3C: expect a new element for captioning but the video model won't change

Mike W3C: large parts of the HTML5 draft unlikely to change - already implemented by browser vendors

Mike W3C: however, "unlikely to change" might not be good enough for another standard that wants to reference HTML5

Mike W3C: informative to look at implementation status among browser vendors

Ben Trafford: look at specific example of video captioning, the concepts won't change. we can take the parts we like and accommodate longterm HTML5 changes by transforming our syntax to theirs down the road

Bill McCoy: supporting option C depends on the status of HTML5 when we are ready to release epub 2.1

Bill McCoy: if HTML5 is mere months away from completion, we can wait for them to finish

Bill McCoy: are we debating this prematurely?  we're not even writing markup yet.

!MikeW3C (via irc): I think trying to make an assessment about "the browser vendors that count" in the device market is challenging -- it's not necessarily the same as the browser vendors that have the most desktop market share

Peter: we need to move forward - we can reconsider later - but we need something to rely on if we cannot reference HTML5

Neil S: we'll have a public draft in 6 months, HTML5 will not be ready

Bill McCoy: we could know a lot more in 3 months, but we'll start to write without HTML5 being done

George: when Mike said that things that are broadly deployed are pretty stable, although it's hard to reference those things from another standard, it sounds like those things aren't going to change much.  could we release epub 2.1 and later 3.0 when HTML 5 is ready

Neil S: worried that this could destabilize the ebook standard

Garth: it seems that the W3C is quite cognizant of implementation status as a factor in the stable features in HTML5; if we maybe limit the areas of HTML5 that we adopt to those areas that we feel won't change, then we could avoid destabilization

George: intent was not to include features until they're cooked

Peter: however, many people are keen to include video, and that's not necessarily ready yet

Peter: better to describe things declaratively in epub, suboptimal to do things like media start time in javascript (which is what HTML5 would do)

Peter: declarative description of what video is supposed to do, UAs will have a better idea of what to do

!MikeW3C (via irc): HTML5 requires the UA to provide default controls for controlling playback of video and audio (play/pause, seek, etc.)

Garth: video might be stabilized

Peter: but the accessibility component of video is not yet ready, and we can't adopt it without accessibility

!MikeW3C (via irc): HTML5 does provide a video API that enables scripting of video through Javascript, but playback of video does not require Javascript (it requires the UA to implement default controls).. as far as video captioning/subtitling, that is one of the highest-priority items the HTML WG is focusing its tim and energy on)

Markus: time is up

Markus: continue this discussion on the list

Peter: we should agree on some provisional means to move forward, we can revisit this issue later.  we can get started using our own markup and review our decisions later.

Peter: use our own markup = solve our own problems without regard for the HTML5 timeline.  it gives us something specific to work with.

Ben Trafford: agrees

Markus: this is proposal B with the added late-binding possibility

Markus: all in favor?

no objections

Markus: reminder, text content group meeting tomorrow at 1900 UTC

Markus: AOB?

!MikeW3C (via irc): for the record: I think the group should consider very carefully before pursuing any proposal to mint new markup for ePub video, audio, media markup that potentially conflicts with that is already in HTML5

!mgylling (via irc): MikeW3C, right. I think this is what the late binding approach alludes to

!MikeW3C(via irc): I see

!mgylling (via irc): It says: only resort to local solutions if we have no other choice

End of conference call