Chair: Markus Gylling

Scribe: Bill McCoy

Audio recording: 100901

To listen to the recording, dial in and press star 3



## Attendees ##

!Si-Wei, wen-hsuan, mikeidpf, jtallent, karenbroome, liza, ChoChin, DanHughes, duga, !MikeW3C, Kyoji, danielweck_, keith\_fahlgren, MyNick, BillMcCoy, marisa\_demeglio, George, Kyoji_, kenny\_j, KingWai, AdamWitwer, danielweck, MM, EPUB\_IRC_, MURATA2, MeetBot, !NeilS, ShuTanabe, Ryoji\_Akimoto, SteveKotrch, !Mei-Li, mgylling, wmanis, BillKasdorf_

## previous minutes review ##

Approved.

## Action Items (New) ##

  * everyone RSPV to Mike re: next F2F
  * George to speak to Board re: W3C task force

## previous action item review ##

KeithF: fwd/backwards compatibility in progress, chair group should get something by EOD today -  discuss in next telecom sounds fine

Markus: attempt to be more detailed in re: backwards compatibility, which has a huge impact on implementation proposals

Markus: CSS WG liaison

George: got to Philippe, it's been discussed

## next F2F meeting ##

Markus: proposal for dates & city, just prior to the "books in browsers" meeting of Internet Archive. We believe it will be useful to have shorter plenaries to discuss cross-cutting concerns, general issues, and so on. Breakouts for subgroup work & then get together 2-3 times per day for shorter plenaries depending on needs

Mike: 25 people have replied, 18 confirmed attending, 2 tentatives, 5 unavailable

Markus: subgroup work imposes requirements on venue - big roocm or smaller rooms for subgroups

Mike: Oct 18-20 in SF - 20th - half day

Markus: timeline - exact dates for 1st drafts not set in stone, but if we stick to it, this F2F would be close to the end of the phase leading to first draft, so we could focus on that first draft & any issues pertaining to it

George: giving people through Mon 9/6 to confirm would be a good idea

Markus: finalize by the next call, OK?

George: yes

[keith\_fahlgren](keith_fahlgren.md) No decisions should be made until after Tuesday 7 Sept, so the next call sounds reasonable

## subgroup status reports ##

## annots ##

WillM: Daniel & I have prioritized, up on Wiki, need to put together draft of implementation, hopefully w/ Daniel's help, hopefully by call next week

## EGLS ##

Makoto: have requirements list but still collecting input re: prioritization, 2nd F2F in Taipei Oct 5-6, Taipei focused on solutions only, not reqs

## metadata ##

BillK: did quick straw poll re: req/optional/off list, responses quite contradictory, most things people thought should be optional, and most things are already in 2.0x spec, lot of variation in technical knowledge in the group

BillK: asked Dan Hughes to put together plain English description of current EPUB metadata model, to help us understand what needs to be different. We realized apart from spec work there's best practices & recommendation work as well

BillK: important to note metadata is often for intermediaries

Markus: I wouldn't say 2.0 metadata is satisfactory, e.g. we can't do sorting

BillK: right but we can't use reqs as tabula rasa, assuming nothing is there now

markus: you're the first group that needs the info on compatibility

BillK: will be important guideline for us

## navigation ##

George: quiet, good set of reqs & next step is putting together solution proposal, should be easier than other WGs

## text content ##

Markus: tmw's call will kick off impl proposals, starting with overarching issues

## styling & layout ##

Brady: nothing's changed, no new controversies, & prioritization is in place, will start gathering possibilities for impls, kicking off this week if we get volunteers

## rich media, interactivity, ads ##

Peter: continue to prioritize reqs, a lot of responses, have been factored in, now some are unhappy with averages. I can't do anything but average, as it's not supposed to be a consensus. We will have to figure out if we want to go for consensus scoring or work with what we've got

Marisa: I think it'd be interesting to see 2 axes, whether it's in charter scope & how important. some are rated D but that's average, but that doesn't mean D on 2 axis ranking scheme

Peter: averaging doesn't capture it.  D means some people think it's very important and others don't. a lot of people think ads are not in the charter even though they clearly are in it, that's why ads are very low prioritization, a lot of people don't want to deal with it

AdamW: KeithF made a good point, I look at items and don't find them out of scope but don't find them desirable. dict hyphenation - I think that should be left to RS

Marisa: like with ads, I can see that they're important, but for me as DAISY book developer they aren't important

Peter: another interesting recurring theme is that people say if it's accessibility it's "A" automatically

Peter: yeah it's important and in some cases required, but you have feature and sub-feature to make that feature accessible, you can't argue that having the feature and making it accessible are same priority

Peter: if you try to do textbooks, clearly you need accessibility, but if I want interactive ad in my book, perhaps it doesn't matter if accessible. accessibility = "A" automatically, I just don't buy it wrt business requirements. some features are critical for survival of EPUB in certain segments, some accessibility features are not about survival, this is really down to specifics of a particular item, I just don't think we should apply an automatic adjustment

Peter: these rankings are just some of the priorities that people hvae

[keith\_fahlgren](keith_fahlgren.md) Design principles and guidelines for the EPUB 2.1/3.0 (aka "EPUB++") revision: """2. Maintain content accessibility as an overriding goal: while new capabilities...bring inherent challenges in re: accessibility, it remains critical that, in supporting these new capabilities and content types, accessibility be maximized."""

Markus: maybe one thing to keep in mind is rankings are not final indication of what makes it into the EPUB 3 spec, it's a way to make sure we work on higher priority features first, and if we need to punt later, give us guidance, but that doesn't mean all "A"s will get into the spec, if too complex even A stuff may end up out of the spec, and visa-versa: B items may end up in the spec, so it's not the end of the world

Markus: we are approaching a time when we need to get moving on next step (impl proposals)

Peter: as long as everyone remembers priorities are just an indication, that's OK, in the end people will work on things impt for their specific goal

Peter: no way to tell someone for whom the most impt feature for their business is "B" that they should work on somehting "A", so from that POV it is consensus building tool

Peter: people can look at how much chance they have to rally the troops that something has to be there, or they have to convince people... need to start working and look at priorities as just one of the variables to look at

Markus: Adam, it's correct that there's no way to say "I don't want to do this". I suggest if you have such concerns while it's late you can raise them on the list

Brady: prioritization is just how impt we think it is to tackle, possibly you're priority 2 items will end up being decided to be a bad idea or to be left to RS impls, it just means it's a high priority to look at

Brady: hyphenation I disagree with, 2 parts inc specification and dicts, I think it's impt to be able to specify

Adam: it's cool if you disagree, but if everyone who's voting, if they all said I don't want to talk about X anymore, there wasn't that option, but understand it's late now

## CSS3 relations ##

Markus: we had consensus that global solution is not viable, depending on stability (of module), I spoke w/ Philippe, leader of domain for HTML & CSS, apparently W3C has severe resource problem

[MikeW3C](MikeW3C.md)notes that I'm still on the call and can step in to comment if/when needed (action)

Makoto: 3 people for HTML5 test suites inc. philippe, any req for resources is unlikely to be accepted, so nothing is likely to be accelerated unless there are more resources. synergy between eBook & Web world is impt, I said, so it would be nice if CSS3 incorporated features for eBooks, but he was not very excited

Makoto: he said there are quite a few forks of HTML now and we can't stop it, but often they disappear in a few years w/out good results, often causing troubles for designers, he suggested sending a few experts to CSS WG and requesting a task force

Makoto: creating WG & interest groups is difficult, but creating task forces is easier, for example for vertical writing, this MIGHT develop something in a timely manner and be endorsed by WG in a timely manner, but who knows

Markus: question is whether this "task force" and "timely manner" is appropos our charter, or is it longer term?

Makoto: for meeting EPUB3 deadline I'm not optimistic

Peter: Basically, problem is way CSS is developed, in the end unless you convince 2 major browser vendors to implement it's not going to move, people I know don't bother w/ CSS because they gave up on convincing browser vendors

Makoto: we discussed about implementing as part of WebKit branches, it might be adopted by many users if a) we have a task force and b) IDPF blesses the extension and c) some countries or impt groups of users strongly claim such extensions

Makoto: if these conditions are met then folks might fly but we reallyg don't konw

Markus: we want to maintain good relations so idea of task force must be good idea, concrete question is whether we should spend resource on this this autumn or not

Makoto: we're hoping we can send 2 members to CSS WG, Murakami, who is already a member, other is Ishii-san, author of CSS Text Module 10 years ago and wants to finish it

[EPUB\_IRC_] Makoto: we are trying to find some govt funding for this project, so we can maybe send 2 Japan members to CSS WG , perhaps Taiwan can send 1, perhaps 1-2 from other subgroups would help a lot_

George: when is CSS WG meeting?

Makoto: 2 weeks ago had F2F meeting, don't know about next F2F

George: brainstorming, if we have a couple people on CSS WG, and a task force which is essentially our styling & EGLS work, then that work we're doing gets blessed as task force under CSS, and we'd make recommendations

George: we'd be doing the work we have to do anyone, just as liaison task force, if we provide this to them, as recommendations from our task force, whether they accept or not if they don't the work wouldn't be wasted

Peter: you aren't going to get what you want from CSS WG, CSS works under fairly different assumptions, we don't require implementations for example

Peter: even experimental impls are not enough, you have to show new features will play nicely with existing features & scripting, which requires implementing a browser, effectively

Peter: impl browser engine is enormous task

Peter: so have to implement in WebKit & Mozilla, better different people, then test suite, then you can get it in the spec, the amount of work is heavy lifting

Peter: until this heavy lifting is done you won't have a final spec

George: req of 2 indep working impls of features, while having it in browser is desirable, if a RS implementor implements that should count

Peter: I don't think you have easy time making this argument to CSS mailing list

Peter: you will get so much pushback...

Peter: we had SVG viewer, because it wasn't a browser that meant a lot to people

Peter: until it's in 2 browsers it's not being promoted to recommendation

Makoto: I agree w/ what Peter said but am not optimistic about timely progress in CSS WG

Peter: would rather see us making time making our own spec & coming up w/ our own implementations, if we have momentum behind the features then CSS will take another look

Peter: browsers have inertia, and main goal is cool web apps... not about typography/layout or reading documents ,docs are interesting but not driving feature today... I don't see a good reason to create another bureaucratic entity if it's the same amount of work, I don't see big difference in IDPF vs. W3C umbrella, what matters is the work being done, and if anything CSS adds distraction

Makoto: whole point of task force is alibi, so we can say we are working with W3C, even if task force achieves nothing, but we can claim close working w/ W3C, and our work will be seriously considered in W3C via the task force

Peter: there's value, but that is too political an argument for me

Peter: may be useful but I would not put a big bet on it

Markus: we are not seeing the creation of a task force as the vehicle but should rely on our own WG? but for political / longer-term reasons creation of a task force is a good idae

George: I would hope that this does not slow us down at all, we have our WG (essentially the task force) that serves to inform the CSS WG of what we're doing

George: we have to control our own destiny, we can't have it slow us down

Markus: thinking about Brady & Murata's subgroup, shorter term, what exactly do you need to know to move smoothly forward?

Peter: start by borrowing or inventing CSS properties/features at will, of course borrowed is nicer than invented outright, once we have outright our ideal solution, then we can try to figure out what framework to put it in (prefixes, @ rules, MIME types whatever).

Markus: you're suggesting a straw man first...

Peter: let's not worry about prefixes, just propose col-count if you want, rather than worry about whether it's idpf-col-count or whatever, just focus on the essence, syntax we figure out later

Markus: Brady, Murata: works?

Brady: reasonable

Makoto: sensible

Brady: some things may not fit with CSS, nothing to steal (expando image support, prop value calcs, other stuff)

Peter: what I'm saying is let's not try to limit ourselves, if there's CSS dicsussions we should pick what's there but if ther'es nothing, then... eBooks/pub is not their focus

Makoto: I agree we should concentrate on technical alternatives, will probably do around 2nd F2F mtg in Taipei