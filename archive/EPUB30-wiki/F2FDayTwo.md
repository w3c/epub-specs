# Topic: EPub Face2Face Day 2 (2010-06-16) #



## Action Items ##

> - Markus, to create a subgroup template

> - George to solicit Diane K as potential ads subgroup coordinator

> -  each subgroup coordinator to get into Google Code and create a subgroup home page

> - BillMcCoy to create doodle poll to select weekday for full-WG telcons, awaiting conformation from CJKT region on whether 21:00 UTC remains our choice for time

## Introductory Remarks ##

Markus: IDPF extends deep gratitude to Gregory for his efforts to help w/ IRC, and your W3C knowledge as well

Gregory: my pleasure - it is an honor to be a participant, so thanks to you

Markus: setting up subgroups is first task for today, need to make sure things are set up right

Markus: 3 core issues identified so far: relationship to CSS, to XHTML, and scripting (declarative vs. programmatic/compiled content)

Markus: Norman Walsh from Mark Logic will come later this morning, we'd like to have issues discussion while he's here

Gregory: mgylling, if you need channels for each sub-group, simply create them (all 1 need do is "/join #SubGroupChannelName" to create a channel for a subgroup

Bill M: note I'm lightly scribing now as Markus has this written up

### Process overview ###
1. settle core issues; establish design principles

2. define & create subgroups
  * identify subgroup coordinator
  * scope definition in collaboration with chairs
  * decide whether to define minimal and extended requirement sets (split may be done later too)

3. for each subgroup {
  * define use case descriptions (in the case of revolutionary features)
  * recast use cases as requirements
  * milestone: report requirements to full WG; modify/append/stabilize
  * build 1-n concrete change proposals
  * ascertain that change proposal(s) satisfy requirements
  * milestone: report to full WG; modify/append/stabilize; (vote)
}

4. global analysis/synthesis of subgroup change proposals; resolve collisions/harmonize

5. create FPWD (some subgroups may be unfinished)

6. iterations: further drafts

7. DSFTU (Draft Standard For Trial Use)

### Subgroups ###

Markus: proposed WG subgroups organization

Markus: metadata means not just publication level but also fragment level

Markus: feedback please

Bill M: are we saying we are not going to guarantee annotations will be done, i.e. punting?

George: annotation work seems in scope, so we could move it forward as a new specification we wouldn't need a new charter

George: the formation of people who are interested early might have a minimal set of goals to establish requirements in other areas to enable annotations, like UID, canonical mechanism for referencing a spot inside a publication are two that come immediately to mind, there may be others

Markus: in order for overlay annotations to be able to point efficiently, the publication possibly needs to possess certain properties, right?

George: right

RogerS: annotations includes highlights & bookmarks?

Markus: yes

Markus: intent of mentioning Hebrew & Arabic are just examples, to indicate we are not limiting to CJK

RogerS: if there's going to be extension that allows EPUB to bring in ads or thesaurus, or updated content for book, where would that fall in this subgroup scheme?

Markus: cross-cutting concerns, yes, that's an issue. notion of these subgroups being independent is not true, there's interdependencies everywhere, that's why the group as a whole will have to meet every week. There are also two milestones for subgroups to report back, first is requirements, next is change proposals

Neil: seemed like you left off packaging, could kick in later, as annots may want to be packaged separately, similarly discussion of SMIL, that again may be elements for package, seems like at some point we need to discuss how it's all packaged up

Markus: we are committed to solving annotation problem, but we may or may not do it in the same timeline as EPUB 2.1

Garth: extending charter is doable if needed

Markus: primary motivating factor is not to try to punt deliverables, but because it's technically desirable to have it be separate

Keith: I agree w/ Bill that list of problems should be our goal, and it feels appropriate that it be a separate technical specification

George: does anyone disagree w/ a separate spec for annotations?

RogerS: question is whether it's the same WG or not

RogerS: is this a firm decision for today?

??? meta question is it a single doc or multiple doc, if the job of this group is to produce a set of specifications then number of documents is not an issue

Gregory: separate document such as HTML5+RDFa (http://dev.w3.org/html5/rdfa) ? EPub+RDFa ?

Brady: we can decide to put annots in a separate document, and if annots are hard we may need to extend our charter but it's still on our plate

Bill K: footnotes are not an annotation, they are fundamental to a document, we need to make it clear what we are talking about, same for links

James P: Yesterday we mentioned using the bookmark/annotation part of DAISY as a starting point, too:  http://www.daisy.org/z3986/2005/Z3986-2005.html#Bkmk

Gregory: referential notes versus annotative notes

Markus: I definitely agree, we do not when we talk about annotations here, include footnotes, rear notes, or marginalia which are part of the original publication, these are two separate things

Bill M: annotations - consensus seems to be that subgroup will have the presumption that they will meet requirements as a separate spec, but it is up to that subgroup to finalize that in its work

Markus: right

Gregory: FYI created #epub-annot channel for subgroup (that's hash e p u b dash a n n o t)

Steve K: important thing is pub can be updated after acquired, we are moving from eBooks to dynamic documents, esp. w periodicals

Roger S: updated content (new chapters) or ads are the same thing, there is really no difference

Will M: are ads any different than annotations, ads are a process of layout mechanism doing a merge of original content and ads, then you maintain pristineness of doc, helps w/ security, maybe another group similar to annotations

Steve K: maybe security issue, would be very useful to have document be dynamic

Will M: either content from Web or content that is in sidecar used for offline scenarios

Markus: I think we need a dedicated subgroup, there are unique requirements such as doc changing after created, permissions/rights handling, if there's no group to create requirements we can't assume it will be spawned somewhere else

James P: agree, this could be under rich media & interactivity, also relates to extensibility; other stuff you might want to plug into a publication, it might be other stuff besides ads

George: we're overloading the word extensibility, traditionally we mean by that term extending the vocabularies that are allowed.

George: in DAISY we have anno and annot pair, annotated Alice is a bunch of links pointed in, it's terrific and needs to be there. Similarly ads need to be part of our vocabulary

Gregory: FYI created #epub-drm channel for EPub Digital Rights, Permissions and Change Discussion (that's hash e p u b dash d r m)

George: other is dynamic flow of ads overlaid on content, extensibility should be reserved for use of vocabularies

Markus: requirements that comes out of working on ads, this could be a broader set of use cases, BUT we all know is that it's much better to work from concrete use cases

Markus: concrete use cases are critical

Markus: XML vocabulary and programmatic are two types of extensibility

Roger S: should subgroup be ads and dynamic content?

Markus: use case, students get content by installments, incrementally fed

Gregory: notes that he needs to re-ping PFWG at W3C about updating XML Accessibility Guidelines (XAG) http://www.w3.org/WAI/PF/xag (action)

Steve K: is there something explicit to allow for this?

Markus: it just happens in DAISY

Steve: then ads work

Will: I think it's important to focus on ads, 10-1 ratio of print ad $ to online ad $

Gregory: FYI created #epub-dynamic channel for EPub Discussion of Dynamic Content and Ads discussion (that's hash e p u b dash d y n a m i c)

Will: we want to get to model where ads can get up to higher rate, and look at new scenarios, and justify a distinction of EPUB vs. web

Liza: +1 to not restricting to just "Advertising" as a label

Ric W: ads too narrow, happier to see dynamic content, but there are several other scenarios, newspapers might want late breaking news, teachers updated docs sent to students

Ric: general case is we have pieces of doc and want to update on the fly

James P: Markus has converted me to his concrete religion, let's call it ads, but that doesn't mean it's going to be an ad section in the spec

James P: use subgroup as incubator but keep it focused to avoid inventing features out of thin air, but ads are concrete about what needs to be done

Ric: understood, but let's not paint ourselves in the corner

Will: faciliate technical mechanisms to not erode ad revenue. I have a fear that we are putting the Web in a box. What are the distinctions between EPUB & the Web that are key?

Markus: good point, needs to be discussed here

Will: NCX is a distinction, some page level layout pieces, I don't think any one of them is a bright line between EPUB and the Web, in aggregate they will make a bright line

Markus: let's do plenary if we have time

Will: OK

RogerS: I agree w/ Will, we need to phrase it as a design principle. Concern about ads group is that we don't speak for this community and it's not represented here (like Arabic)

Will: disagree, for EPUB to be relevant we need to look at newspapers/magazines, we need to be serious about ads

Brady: charter says ads, this is what's important, and everyone voted yes

Keith F: **MUST** we address _all_ of the Problems in the Charter as part of the work of this Working Group?

Diane K: will join ads subgroup

Liza: I do not actually see "Advertising" in http://www.idpf.org/idpf_groups/IDPF-EPUB-WG-Charter-4-6-2010.html

Roger S: where will Ben fit?

Markus: text content subgroup is expected

Gregory: is the ads subgroup going to be separate from the epub-dynamic subgroup (which has an IRC channel #epub-dynamic)

Garth: Keith's comment may bear discussion, my thought was 1 of 14 will have to give in order to hit timeframe

Ric: it may be that we explicitly punt but we shouldn't ignore and just let it drift away

Liza: "There are thirteen main problems that the Working Group is tasked to address in EPUB 2.1"

Markus: distinction between minimal and extended requirements may reduce the problem

George: welcome Norm Walsh

James P: From the charter:  "the Working Group is encouraged to consider the scope as limited in the sense that not all conceivable enhancements - perhaps not even

solutions to the enumerated problems – can be accomplished in this release."

Will M: I see 14 points in the charter, http://www.idpf.org/idpf_groups/IDPF-EPUB-WG-Charter-4-27-2010.html

Norm: I work for Mark Logic and worked on DocBook and SGML etc.

Markus: we need to identify subgroup coordinators, person who will be primarily responsible, we should at least collect names

Will: volunteers to coordinate annotations

RicW: volunteers to coordinate styling & layout

Markus: perhaps co-coordinate w/ someone deep into CJK

Ric: fine, also may hand to Peter Sorotokin

Markus: no volunteer for text content, may end up being me

Gregory: FYI EPub Text Content Subgroup Discussion channel #epub-text-content (that's hash e p u b dash t e x t dash c o n t e n t)

Markus: first job of each subgroup is to clarify the meaning/scope of the group, by defining use cases

Gregory: FYI EPub Styling & Layout Subgroup Discussion channel created #epub-sl (that's hash e p u b dash s l)

Garth: volunteers to co-coordinate styling & layout

Garth: volunteers to coordinate rich media & interactivity

George: volunteers to coordinate navigation

Bill K: volunteers to coordinate metadata

Gregory: FYI new channels #epub-nav (hash e p u b dash n a v) for EPub Navigation Subgroup Discussion and #epub-metadata (hash e p u b dash m e t a d a t a)

Murata: Did you discuss about CJK subgroup already?

Gregory: murata, CJK subgroup under "Styling and Layout" (#epub-sl)

Keith F: The suggestion was that the CJK folks begin as a part of the Styling & Layout Subgroup, but Markus suggested that it may evolve

Will: volunteers to coordinate ads

Markus: we will fake navigation subgroup, putting up all the deliverables as a template so coordinators have a pattern to follow

Ric W: @Murata, I (Ric Wright/Adobe) am the lead for the "styiing group" but I think we should have a co-cordinator for that group with an interest in CJK

Keith F: Peter Sorotokin will coordinate the Styling and Layout subgroup

Murata: I am wondering why the CJK subgroup was not created. I simply don't know what is in "styling and layout".

Markus: each subgroup will have a list of participants on the Wiki, please give subgroup coordinator name or just add it to that Wiki page
. Subgroups will have meetings & IRC sessions just like entire group

Ric W: IMO, CJK is in styling because it is related to CSS.  BUt I suspect we may wish to split that group into two:  Layout and CHK

Gregory: note on irc.a11y.org channels - all channels are dynamically created -- please reuse the channel names assigned here. If you "/join #epub-drm" for example and no one else is there, the channel will be dynamically re-created

Markus: the chairs are not married to bundling CJK under styling & layout so it's entirely up to the CJKT comunity to propose what you believe to be the best process to get the job done, if the subgroup should be separate that's OK

Murata: should be separate

Keith F: How about i18n & CJK rather than _just_ CJK

Murata: that's fine, Mongolian is vertical and not part of CJK

Gregory: created #epub-i18n for EPub Internationalization (i18n) Discussion (that's hash e p u b dash i 1 8 n)

Josh T: many people worried about CJK, only a few worried about others, I would like to know for sure that there's going to be a way to maintain neutrality?

Markus: valid concern, we should not limit ourselves to E Asian writing issues, generally we should say that primary working mode for all subgroups is virtual

Markus: but we are dependent on an expert in the field showing up and giving requirements

Keith F: i18n & CJK

Roger S: CJK and i18n

Markus: per charter, enhanced global language support

Makoto: volunteers to coordinate EGLS aka i18n/CJK

Roger S: Noted earlier in meeting that "Hebrew / Arabic" represents other languages with vertical, r-to-l and complex script issues

George: want to make sure everyone is happy, so want to hear affirmation

#### affirmation ####

Markus: Murata, do you agree that 21:00 UTC is the best choice for time-of-day for telcons? (Taking Australia into account too). Please share your experiences from SC3

Murata: Let me check. Yes, 21:00UTC would be 05:00 for Taiwanese.

Kenny J: And 2100 utc is 7:00 a.m. in Melbourne.

Murata: It would be 06:00JST. How about 1 hour later?

Kenny J: that would suit australians even better.

B Larroque: 21:00 UTC is already 23:00 in Paris

Murata: Unfortunately, we cannot make everybody completely happy.

B Larroque: yup

Murata: However, we have to really make sure Taiwanese can participate.

Markus: capitalization of EPUB?

George: all caps when using it in text, if you are referring to the extension it's lower case, done

MikeS: we trademarked all caps, camelcase was an acceptable usage for trademark purposes

Gregory: FYI CamelCase isn't translated into those natural languages whose braille equivalent don't even have a character to indicate uppercase, such as en-gb

Markus: other new topic is fixed format (prepaginated) support, building on talks yesterday, Bill McCoy will start that off

Markus: we will also add EPUB vs. the Web - expectation management

Dave Gunn: british braille does support combinations of upper and lower case

James: it came up in talks yesterday, there's things that won't work in a reflowable/EPUB world, that was hinted at, that's a good discussion to have, what's the

purpose of EPUB as a format, what kind of products is it designed to allow, it is certainly not going to be everything, that needs to be explicit

Gregory: DaveGunn, what i've heard from across the pond is that for british braille, uppercase indication isn't used, but i don't have the tactile sensitivity to read braille - only use as input mechanism through braille keyboard

Dave G: @gregory, capitalised braille was adopted as the UK preferred format about 10 years ago

Gregory: DaveGunn, thanks for the correction - there are a lot of people out there spreading mis-information (mea culpa)

## EPUB & the Web ##

Bill M: EPUB is a "website in a box", that's portable; self-contained and packaged, period.

Liza: I agree with Bill

Gregory: plus 1 to bill

Ben: and a third agreement for Bill.

Kenny J: +1 to bill

Bill: radical idea: EPUB is portable web content (packaged, accessible, structured, and device independent)

???: agree that EPUB is part of the Web, there will be a lot more tools that way

Norm: Portable=you can carry it offline or portable=you can use it on different devices?

Ric: another way to look at it is EPUB content is not easily changed by the content creator like URL-hosted Web pages

Ben: Norm: Carry offline. Wish it meant the latter. Differing DRM formats make that impossible.

Markus: if we look at Web as HTML5 and where that technology is going, it is clear that the Web will likely not support extensibility, distributed or centralized, it was in our charter

Mei: Murata, We prefer 23:00 UTC.

Will: I appreciate the fact that EPUB existed as a closed (self-contained) entity up until this point, I think the concept that it is a closed doc doesn't hold water

any more. We are also talking about dynamic content, I think as we go forward that doesn't hold any more. it is a distinction but not a hard distinction

Bill M: agree w/ Will

Murata: I would like to hear the opinion of other members of the EGLS subgroup.

Liza: I think it's fair to say that that "self-contained" doesn't necessarily mean "completely self-contained" [Will is saying](what.md)

Steve K: Amazon found it easy enough to kill 1984 on everybody's Kindle . . .

Gregory: HTML5/XHTML Author's Guide (a.k.a. "the Polyglot Spec") http://dev.w3.org/html5/html-xhtml-author-guide/html-xhtml-authoring-guide-rendered.html

Bill M: nor does offline capabilities means it is always/only used offline

Liza: Just because Google does allow EPUB file downloads does not mean that there won't be pure "cloud" EPUB implementatins

Keith: I agree that navigation differentiates a website in a box, ability to provide metadata is another component, best practices for accessibility is another

differentiation. With luck there will be some model for extensibility, but it's absolutely correct that many implementors will benefit if EPUB is aligned with Web

rendering technologies

Keith: sounds like today we need to come up with concrete requirements, not need to worry too much about whether CSS x.x has reached candidate rec status yet

Liza: +1 Bill on extensibility via other mechanisms

## CSS 2.1 / CSS 3 ##

Keith: if on 23 Aug when we actually go to write specs we find things aren't done, but it will be informed by what we

Markus: I was referring to semantic vocabulary extensibility

Norm: isn't sure HTML5 will get all the way through the process without an extensibility mechanism anyway (action)

Gregory: sincerely hopes norm is right! (action)

Bill M: express disagreement w/ Markus about his view of MathML, we say MathML working perfectly well yesterday w/ JS extensibility. also agree w/ Keith's in passing comment that EPUB is "basically" a website in a box

Ben: portability is a way for content providers to tag content as changeable or not when you go offline

Ben: tagging it that way will also help with security

Liza: Online/offline should be managed using the "HTML5" model using JavaScript to detect the online status

Hadrian: for most semantic vocabularies, the current extensibility would work fine

Kanai: I think current EPUB is still used as an intermediate format, we should still keep that idea in EPUB 2.1

Ben T: Hadrien: I put forward some new ideas for extensibility yesterday. http://www.prodigal.ca/IDPF/IDPFf2fPaper.html

Hadrian: yes, and I agree with your conclusion overall Ben, I'm just not 100% sure about the CSS part though

Ben: Hadrien -- It's the technology that's there. I'm not a big CSS fan, but I'm pragmatic. If we invent a whole new styling language, we're pretty much guaranteeing it won't be used.

Marisa: we can hold epub to a higher standard than the web, being more rigid

Roger S: I don't think the editors would agree that EPUB is the Web in a box, that's one that makes me anxious and upset. if it's just a shortcut, it's a bad one for our constituency, we're the more technical oriented. Publishers here, do you think your editors would like that description?

Liisa: I think Roger's right from editorial & pub perspective - most people in this building don't know what XHTML is, they just think an .epub is the book, it's the way I conceived of it, a discrete package

Keith F: Roger is raising a reasonable point, but we need to be careful not to be condescending.

Steve K: I agree with Keith F

Liisa: I see it as package that yeah maybe it's extensible, when we talk to authors about making books more dynamic they are talking about content from websites, links out to forums, they are starting to conceive of where this thing expands

Frank at Wiley: from POV of non-fiction oriented publisher, a complementary/alternative viewpoint is finding solutions to problems, concretely addressing clear use cases will help pubs take these things back in to their houses. Some editors want to redefine what a book is and think differently about it, there's a generational

shift going on, pubs who think an epub is just a digital form of the print book are hiring people who have a different view, I don't need to know whether epub is web in a box or something  else, i just need ways to reach audiences in new formats through new channels. We know distributors often do things w/ EPUB to optimize for

different devices, it is not a product unto itself (agreeing w/ Kanai's comment) but the more it can be an end product the better for everyone, minimizing work having to be done with it

Garth: if DRM goes away EPUB ought to flow all the way to end users, meanwhile there are ways to encrypt, but I don't think we ought to view the intermediary nature as a good thing, and hopefully it will transition away over time

Norm: as a reader... (action)

Ric W: echoing, just because an EPUB is DRM protected it doesn't cease to be an EPUB, and I haven't had any publishers complaining to me about DRM. It is important to realize that if you have a DRM protected EPUB updating it on the fly is more technically challenging, something we will  need to at least keep in mind

Steve K: DRM: authors more than publishers

Neil: notion that EPUB brings is that container notion, what we allow or don't is what distinguishes us

James: portable document format - reflowable and multi-device support is key, we are taking for granted this, that's presumably why we are building on web standards

Bill M: one reason this 2.1 effort was pushed for by members was a perception that HTML5 is moving ahead, EPUB is falling behind

George: but EPUB is about documents that are formally published, even corporate documents are OK, but that has to be captured in our definition

Markus: "... a formally published rigid accessible website in a box?" (action)

Brady: historically EPUB adopted the Web because of pragmatic concerns

Hadrien: As long as HTML5 is within the reach of our extensibility features, I don't see how EPUB could be falling behind

Marisa: careful with "web in a box" -- "web" is impossible to define.  rather "specific web technologies plus our own inventions"

Ben: I understand pragmatism, Lexus/Nexus has 5B documents that can't be satisfied with the Web, that's a big pot of gold

Keith: EPUB = A website in a box that includes accessible semantics, rich metadata, and enhanced navigational directions.

Will M: anyone can alter files unbeknownst to me, dsig would be one way to create doc stability in terms of best practices we might want to push that concept more

Markus: what has been the reasons for the relative success of EPUB to date? what choices have taken us to this juncture?

Hadrien: I really don't like the idea of "Web in a box", sounds like a bad marketing idea

Markus: one reason is the low entry threshold, basing vocabulary on HTML has made it a mundane trip, if you guys had chosen TEI the threshold would be higher

Bill M: Hadrian, I use this only in terms of our thinking on when to do de nova invention in the WG, not a marketing concept

Markus: and ability to use browser rendering engines for display

Liza: I took "web in a box" to mean that we should minimize deviation from the web only when absolutely necessary

Bill: +1 for what Markus just said, +1 for Liza

Liza: Paged layout, Vertical flow

Keith: "Website in box" just seeks to express two goals: Fairly self-contained & intentionally built on the web's technology stack & standards (with minimal deviation)

Garth: in subgroups there are some things that aren't addressed in web technologies today, some of the CJK stuff is not in Web yet, some newspaper stuff, so we may need to innovate beyond the web

Liza: More obvious user control of reading experience

Hadrien: Agree about the need to minimize deviation when we use HTML/XHTML and CSS

Liza: Navigation

Marisa: +1 for Liza -- predictability is valuable

Garth: rich media and interactivity may be one that is address by (if still squirming) web technologies that we can figure out how to embrace

Hadrien: but we still have a problem on our hands when for example certain CSS3 modules are not moving forward, generated content for paged media is a good example of a module stuck in a loop

Ben: the argument is that we should be sticking with Web technologies because of existing code, we deviate enough that we have to modify Webkit, and modifying it "a little bit" is relatively dificult.  if we are already modifying it why can't we go further?

Liza: [where "web standards" don't immediately provide the necessary tools to do ebooks](Areas.md)

Ric W: Totally agree with Hadrien.  This is symptomatic of the crux of our problem vis a vis "HTML5/CSS3"

Keith F: CSS3 != HTML5. The specification process for CSS3 modules is not highly-politicized and many modules have seen renewed interest in recent weeks.

Garth: there's clearly some RS that don't use Webkit, but there are ones that do (one way or another), I don't agree w/ Ben that you can't do EPUB w/ existing code, and I do agree that there is a leverage that we need to continue to be aware of

Hadrien: sure Keith, but let's face it, the current work on HTML5 is quite a mess too. So many internal fights and debates going on...

Keith: When trying to support XML Content Extensibility, what do CSS 2.1 + CSS 3 modules **not** provide?

Marisa: I always assumed that the standard was going to be a composite of many other standards, I haven't heard anyone stay that we ONLY use HTML5, we can use lots of things, that's simlar to what we've done in DAISY

Ric W: This is true.  HTML5 is more "stable" than CSS3 and most of what it proposes to address is not central to us

Liza: keith, + Javascript

Ben: Keith: Links.

Marisa: it's kind of a tricky standard to control, what are our target platforms for rendering devices, that we expect EPUB to appear on?

Ben: Keith - Scripting. Video embedding.

Marisa: it's important to consider feasibility

Keith: We're targeting three externally developing sets "standards": HTML5 (political), CSS 3 modules (lots), JavaScript (less formally specified)

Hadrien: Also agree that a lot of things in HTML5 are not central here

Keith:  There is some SMIL support in Quicktime

BillM: to me this is about minimizing redundancy, as an example SMIL implemented its own layout logic which failed because it was redundant wrt HTML; SVG 1.2 tried to tackle web apps. Like it or not HTML/browser/Web is the dominant client presentation platform.

Andrew G: +1 What Bill just said

Markus: SMIL layout, agree it's a dead end, we don't use it or plan ot use it

Ric W: to all intents and purposes  HTML5 is whatever is in Webkit nightlies, you are deluding yourself if you are waiting for W3C. if we have low end system and Webkit is required that's a problem for resource limited devices

Neil S: where EPUB deviates from web technology it's virtually unimplemented, for example "switch", only ADE implemented it

Bill: "partially" implemented it... ;-)

Andy G: coming new to EPUB and from pub perspective, cautions are 1. power in leveraging the web and what is capable there, vs. downgrading to limited EPUB capabilities, on happypad incentive is to leverage HTML5

Keith: At this point in _our_ process, we need to define real requirements and a pragmatic specification, not worry about whether Ric needs to run WebKit on an ARM processor. There will be a time and a place for that, but I do not feel it is today.

Garth: definition of an EPUB RS is a combination of HW & SW that accepts EPUB and makes it available to a reader, when EPUB got kicked off there were purpose built devices w/sub 100MHZ processors now

Hadrien: frankly, aside from the 

&lt;video&gt;

 tag, what do we need in the current HTML5 "spec" ?

Keith: Hadrien, The new semantics from HTML5 provide a better framework for creating accessible documents, so we need more than 

&lt;video&gt;

 and 

&lt;audio&gt;

 to support accessibility, a Problem

Garth: many devices now, we need to continue to be a "wide" standard from device perspective, but disagree w/ Ric, I might be willing to go for HTML5 islands because you can't buy a processor thta's under half gigaherz now, memory is so cheap. in 2000 it was let's keep the spec simple for low end devices, but you can't build such a device today, that doesn't mean I would go for requiring Webkit "everywhere"

George: summary attempt - EPUB is the center of innovation in digital publishing technologies, we leverage web technologies wherever possible, we use semantics to express published materials with high fidelity

James: content that can be displayed on a wide variety of platforms is really important, that distinction for EPUB

Bill: what distinguishes EPUB from PDF is two things: built on web standards and designed for accessibility & device independence

Hadrien: Slightly Keith, but it's not as useful as DTBook either

## relationship to CSS 2.1 and CSS 3 ##

Hadrien: the main difference is that everyone will use HTML5, while DTBook is specialized

Brady: people are confused, as they don't know what to use, perhaps we should delete the whole section and just point to spec

Brady: then the next question is which version to point to

Keith: CSS 2.1 is "W3C Candidate Recommendation 08 September 2009", as Brady asserts

Liza: W3C Candidate Recommendation 08 September 2009

Brady: 2.1 is never going to change but then again it is never going to be a final recommendation, probably

Murata: Should we send a liaison statement to the CSS WG?

Keith: DAISY intends to harmonize with ePub. DTBook is being dropped

Ben: MURATA - Yes!

Gregory: notes that a) CSS 2.1 is still in Candidate Rec; b) PFWG is seeking a re-statement of the Beijing Snaphot from November 2007 .

http://www.w3.org/WAI/PF/html/wiki/CSS

Brady: CSS3 modules are even more unstable

Brady: should we point at WD or even editor's draft

Liza: +1 Norm

Norm: I don't see any benefit in worrying about the CSS3 tarball at this point, we can figure it out later

Murata: TW, ODF 1.0 used an old working draft of CSS3.  Later, CSS people changed what ODF uses.

Gregory: CSS issues and development on Protocols & Formats W3C/WAI WG's wiki (includes links to issues logged with CSS WG) http://www.w3.org/WAI/PF/html/wiki/CSS

[Hadrien](Hadrien.md) What can we do at a CSS3 level ? We need some of these modules a lot more for EPUB, than the Web needs them

Liza: If any particular CSS3 module is not complete enough, then we would not point to it

BenT: Liza - Or complete it ourselves. :)

Ric: some of these modules are incomplete, sometimes they run off into nowhere, I don't want to figure out what to do in each case

RogerS: What significant pieces from 2.0 are not in our subset?

Keith: Or we do what we can to encourage the W3C or implementors

Norm: if we need a CSS3 spec and it's half finished we havie to do something else

Murata: We should send more experts to the CSS WG

Liza: It is useful to suggest to implementors who may want to go ahead of the current EPUB spec what to harmonize with, that's likely (perhaps not in the EPUB spec itself, but informationally)

Hadrien: From my POV, we need CSS3 more than we need HTML5 - it's not mutually exclusive of course

Murata: Right

MurataL: I'm not that pessimistic

Brady: writing mode is not going to be done, maybe we should tihnk about how to resolve it now as a group

Keith: I believe that the DAISY goal of harmonization with HTML**and dropping DTBook will mean that we need the new HTML5 semantics.**

Brady: I don't want to reimplement CSS3 text layout, it is really easy to just use writing-mode, but i don't know how we will do that

Hadrien: we shouldn't sit on the sideline while W3C works on CSS3, we need to get involved

Makoto: one of core editors of CSS text layout is J and I will request him to eliminate contentious features so it can become CR ASAP, we should send liaison statement to WG, we should also make our own request

Keith: Who is the best person to reach out to the W3C CSS working group(s), Makoto?

Norm: I guess I hope the subgroups can enumerate the things we think we need. If we need 15 and 12 are incomplete, then that's different than if we need 15 and 2 are incomplete.

Brady: multi-column layout is eligible for exiting CR in next few days, maybe it's time to go to W3C and use muscle

Makoto: yes

Ric: skeptical given history of CSS group, now multiple CSS groups, isn't it a little backwards, isn't the spec webkit, maybe we should be talking to webkit

Keith: Along with Google, Bill

Neil: implementation driving standards is terrible

Bill: terrible but reality IMO

Neil: get your votes in to W3C

Norm: wrinkle with getting something out of CR is that you need at least 2 implementations of each feature and tests

Keith: MURATA, who is the best person to reach out to the W3C CSS working group(s)?

Markus: unless a director steps forward and says implementations are not necessary

Norm: unlikely for things of the complexity of CSS and HTML5

Markus: per Murata's suggestion of putting muscle, would you request people to contact you?

Murata: I think IDPF should contact W3C CSS WG, it may not make a difference but is worth trying

Bill: get Hakon's help as he's expressed interest in EPUB before

Norm: suspects our case would be stronger if we could enumerate a specific set of specs that we want/need. (action)

Murata: I'm not the best person as I've been harsh to them already

Hadrien: Hakon's the one behind most of the modules that we need... and he probably needs them too for Prince XML anyway

RicW: Maybe an orthogonal approach might be to think about trying to get Apple, Adobe, Opera, Google, to work together on IMPLEMENTING the features in CSS3 that we need, which would then perhaps lead to the specs....

Bill: Adobe implemented a page layout mechanism based on XSL-FO master page syntax which pissed him off

Bill: Hakon thinks is should be CSS3-based

Norm: Yes, the modules are separate specs

Brady: status of specs is unclear, I don't know what's holding them up, I don't even know how to find out

BenT: Hakon also showed a bunch of interest a few years back when I talked about styling XML with CSS. I just never followed up on it. Life happened. :)

BenT: Ric - Agreed.

BillM: Ben, he followed up with us and we said we'd look into it when the next EPUB rev was being done, and here we are ;-)

RogerS: Just from Brady's comments, there definitely needs to be some co-ordination between that wg and IDPF

Norm: makes note to self, "do not give Brady my mobile number." (action)

Bill: possible to define baseline of CSS2.1 and adopt CSS3 modules selectively, defining a transformation to CSS2.1 - idea from Peter Sorotokin

Brady: I don't know technically how this could be done for something like writing-mode

Bill: perhaps Peter can clarify

Keith: We don't understand which CSS3 modules are most critical to our not-yet-written requirements. Perhaps they've already been implemented, Ric.

DaveM: I am here to be Apple's ears, I can't make a commitment for Apple, but the first step is to articulate which pieces of CSS3 need to be implemented to make Webkit a good platform, I can definitely take those requests back to Apple and know the people I need to talk to about it

DaveM: Apple has a desire to support EPUB and to the extent it means enhancing Webkit's CSS support we'll be listening

Gregory: any CSS module in CR would benefit from our adaptation - need 2 independent implementations of each feature to exit CR, so we can accelerate that process

Ric: thanks for volunteering to join the rich media & layout subgroup

Liza: Good summary

Brady: removing section defining a CSS subset is agreed, we want to make baseline CSS2.1 and adopt some CSS3 modules

Brady: we have to almost closed questions and want to continue looking at CSS3 and there will be technical issues we have to resolve

Brady: 2.1 is not a rec but is unlikely to ever change, implications of going to 2.1 mainly we are going to drop things that are in 2.0, we have to check whehter that's a concern

Liza: 2.1 removed a lot of the audio hints, which weren't implemented

Joshua: starting list numbering is a problem in ePub currently. Counter-reset is supported in CSS2, but not implemented in most reading systems. The old start attribute is deprecated, just giving a real world example of issues with css now

BenT: Murata - as metadata, perhaps?

Murata: Maybe. A small mechanism for extending HTML5

Markus: HTML5 is better than XHTML 1.1 in some areas of accessibility

Garth: some new stuff in HTML5 is going to be needed but pointing at ALL of HTML5 as our baseline is fraught with problems, that's biting off more thatn we would want to force down to everybody to implement, and it's still very much squirming. my take is potentially we could keep our XHTML modules as we have them, adding a list of things from HTML5, hopefully we choose wisely and they don't squirm too much

Murata: Ruby of HTML5 is also fine

Garth: HTML5 islands is more from rich media perspective, I still very much view the rich media as islands in an otherwise paginated reflowable EPUB, although pagination isn't required it's important to be able to do it

Garth: we could take Ric's direction that Webkit defines HTML5, and maybe in these islands you hand it off to Webkit or another HTML5 capable rendering engine

BillM: obviously with fallbacks

Gregory: http://dev.w3.org/html5/spec/text-level-semantics.html#the-ruby-element

BillK: DTBook vocabulary more useful in our work

Gregory: FYI created an #epub-core channel (that's hash e p u b dash c o r e)

Garth: idea of taking XHTML and bringing in HTML5 capabilities and some more to make it equivalent of DTBook

Markus: we had lightning talk yesterday about DTBook, DAISY no longer sees cost benefit ratio of maintaining separate grammer. new HTML5 markup supports most of what we did in DAISY but gives the goodness of browser support

Bill K: crosswalk to DTBook? (concordance)

Jon: one could build an XSLT for DTBook to the proposed XHTML vocabulary.

Markus: we will retain spirit of the grammer and structure/semantics but elements will change (be standard)

Bill M: Jon, that's not a proposed XHTML vocabulary because XHTML is dead, it's HTML5

Murata: XHTML5!

Gregory: official title of HTML5 is "A vocabulary and associated APIs for HTML and XHTML"

Jon: well, an XML serializataion of HTML 5 is what I meant.

Ben: Jon - Then it isn't HTML5, is it?

Gregory: http://dev.w3.org/html5/html-xhtml-author-guide/ (Polyglot spec - using HTML5 and XHTML)

Jon: I don't know, but I assume one can author XML-conforming HTML 5 documents.

Norm: mumbles "any random string you hand to the html5 parser is html5, isn't it?" (action)

Jon: I think Markus is proposing a modulized subset of HTML 5 which "emulates" DTBook. Am I right?

George: we envision the transformation of authored content to distribution format, which in my mind is an XHTML serialization of HTML5

Norm: Jon\_Noring, that has not always been true, though maybe it is again. I haven't looked at the weird markup-in-attributes-iframe issue recently and how it got resolved.

George: we want to enhance div & span with some attribute that denotes it e.g. as a footnote

Gregory: PFWG IFrame Accessibility Inquiry http://www.w3.org/WAI/PF/wiki/IFRAME

Bill K: if George is characterizing his brain as pea it's an insult to the rest of us ;-)

Markus: link to draft of DAISY proposal is on the wiki

Ben: are people thinking that there's semantic value in the tag set, or are we looking for the behaviors of the tag set

Gregory: http://code.google.com/p/epub-revision/wiki/F2F201006LightningTalks#Book_semantics_in_XHTML_and_the_future_of_DTBook

[gregory](gregory.md)says "pay no attention to the man behind the WHAT WG curtain" (action)

Markus: XHTML vs. HTML is a detail, a secondary concern about how it's represented on disk

Bill M: agree but there's also that little question about what happens with Webkit...

Gregory: XHTML 1.1 Second Edition (our for PER update) http://www.w3.org/MarkUp/2009/ED-xhtml11-20091118/

(scribing lightly here as Markus is editing content that will be on the wiki)

BillK: is Ben's proposal no preferred vocabulary or a preferred base?

Ben: the latter, I prefer XHTML as base, I proposed DTBook as well just for backwards compatibility, then we'd push HTML5 behaviors to our own stylesheet language

BillK: then your proposal isn't an either/or with other proposal

Ben: right, we could have a base vocabulary

Gregory: for those off-put by HTML5's UI stuff, check "HTML5: The Markup Language" http://dev.w3.org/html5/markup-spec/ (stripped down - just syntax)

Markus: I need to study your proposal, are you saying that there's a default fallback vocabulary?

Ben: yes, if no vocabulary stated, or you can declare it's something else and provide the "here's how to figure out what"

Markus: my proposal is HTML subset that is infoset compatible with HTML5, so that we can serve as text/xhtml and text/html

Ben: "The Trafford Method." It sounds like an acting school. It should be noted that my extensibility model can be applied to any of the base grammars being proposed.

Garth: with CSS we had live CSS 2.0/2.1 and something squirming CSS3, in this arena, XHTML 1.1 is deader and squirming with nothing in the middle

Noring: Is Markus proposal that a document need not be XML-conforming? My understanding, which may be way off base, is that HTML5 does not require XML-validity. (I need to study HTML 5 more closely)

Ben: Jon - Good question

BillM: why do with HTML what we are moving away from with CSS, which is to invent our own (subset) language?

Jon: because if the HTML 5 is not XML-conforming, that may have RS impacts, including with XPointer, XPath, etc. for annotation purposes.

DaveM: there's a lot of momentum behind HTML5, to the extent things are congruent that's the best chance for them to work easi

DaveM: again, willing to provide conduit to webkit team, but we should bear in mind that when we ask them for support because EPUB needs it we'll have a better chance if it's in HTML5... maybe we can make HTML5 squirm the way we want it to!!

Markus: point is we'd be able to serve as text/html and have the browser engine work properly

Norm: we'll have to have a grammar, we'll have to at least describe the relationships

George: what's wrong with RDF/A

Markus: we're still talking about the core grammar

Murata: Exactly!

Markus: problem with XHTML 1.1 is there's no RelaxNG version, I'm reluctant to use XSD for "religious" reasons, it's a technical detail but still

Norm: No disagreements from me

Markus: is it a viable option to create our own grammar, have it be infoset compatible and take the burden of maintaining it in the future

Jon: Hasn't anyone built a RelaxNG schema for XHTML 1.1?

Murata:  Yes, there is a draft. I requested TAG to publish that RNG schema for XHTML 1.1 as a recommendation or technical note. Recently, TAG responded to me.  I

should speak with Michal Smith.

Keith F: could solution be proper subsets of HTML5/XHTML1.1/whatever with convention for increasing semantics to improve accessbility, but we'd be careful to not define any new markup

Jon: it is my understanding that HTML 5 can be "subsetted", including requiring XML-conformance.

KeithF: do we lower the squirming risk by subsetting

Markus: whether it's a subset would depend on light extensibility model

Ben: no issue w/ subset of HTML5 as absolute fallback, this is the minimal you have to implement to be compliant, we can adopt a minimal core for implementors to

encourage competition in the marketplace

Ben: I assume we aren't considering a non-XML format? that'd be bad

Ben: if we are going to create a minimal grammar let's stick with XHTML

Liza: I have been assuming any use of HTML5 would be the XHTML serialization

DaveMak: I agree

Hadrien: Agree

Paul Norton: +1

Murata:  http://syntax.whattf.org/relaxng/

Roger S: if mechanism supports arbitrary XML doesn't XHTML fall into that?

Gregory: Abstract for http://dev.w3.org/html5/html-xhtml-author-guide/html-xhtml-authoring-guide-rendered.html: "This document summarizes design guidelines for authors who wish their XHTML or HTML documents to validate on either HTML or XML parsers, assuming the parsers to be HTML5-compliant. Note that this recommendation does not define how HTML5-conforming user agents should process HTML documents. Nor does it define the meaning of the Internet Media Type text/html. F

Ben: default set of behaviors for using HTML tagset, above and beyond that you look at style sheet

RogerS: any tag that's in HTML5 you are saying we will just define default semantics

Markus: we have 45 minutes left, we need to wait for details of Ben's proposal, we'll return to the details

Norm: Ten years ago, when I believed that it was a forgone conclusion that all browsers would of course support arbitrary XML with a general style language, I'd have been an ardent supporter of the "any XML" position. Today, I have a hard time championing it.

Markus: trial close - we as WG want to have a preferred/core grammar which is compatible with a subset of HTML5

Garth: yes

Jon: HTML 5 has added new elements, some of which may be of interest for book publishing.

Liza: Are we taking a vote or registering comments?

#### STRAW POLL = overwhelming support for Markus's proposition ####

Jon: a few of these might even cross-reference with DTBook's grammar.

Ben: Norm - Why?

Norm: Because I don't think any other vocabulary will be implemented widely enough to be interesting.

Jon: so it is intriguing to explore an HTML 5 subset (so long as we require XML-conformance). the downside with using new tags from HTML 5 not in XHTML 1.1 is of course pretty obvious -- new tags (and presentation behaviors) that RS must support.

BillM: I reluctantly agree w/ Norm, even though I happen to like XBL2 a lot...

Jon. However, any CSS-compatible XML vocabulary is renderable in most major browsers today.

Ben: Jon - Except that CSS doesn't allow a whole bunch of behaviors to be applied to XML -- for example, making a link.

Jon: the linking issue within arbitrary XML is an issue if we are considering compatibility with current browsers since no browser supports any mechanism (other than a brain-dead subset of XLink by Mozilla) for enabling links.

Hadrien: so we're going down the road that we just left for CSS - from subset to reference 2.1 - but with HTML5 ?

Ben: Norm - Well, the nice thing about my proposal is that it really doesn't rely on any given core grammar.

Ben: Hadrien - Yes.

Markus: compliant RS will have to support whole grammar, so as some component aspects evolve it's easier to maintain

Jon: hypertext linking is a critical need in all digital books -- whether that matters for supporting non-baseline (X)HTML is something maybe Ben can address...

Hadrien: We left that road for CSS because it made the spec too complex to understand, we'll have to be extra careful this time

BillM: question to subgruops re scripting and interactivity

BillM: declarative content shuould be preferred whereever possible

Keith: BillM suggests that we should strongly encourage declarative content over programmaticly provided content

Hadrien: +1

Keith: I think that is a good position for the WG: Prefer declarative content in the core grammar

BillM: base hypothesis that there will be programmatic content, and that content will be javascript based (per previously accepted principle that we adopt Web

standards wherever possible)

Liza: +1 Bill

???: implications for accesibility, security

Gregory: hmm... no script, no canvas (action)

George: declarative where possible, resort to scripting where that doesnt work, is that what ur saying?

BillM: yes

Jon: allowing support for scripting is something that I think should wait for a post 2.1, so it can be addressed closely without other distractions.

Jon: scripting is fraught with peril, and should not  be jumped into without a lot of close discussion which appears beyond this effort.

Jon: Scripting is a Pandora's box, to summarize my view, but if we plan a subgroup to look into it, that's fine...

Keith: We're not going to be able to accomplish "Need for rich media and interactivity support." without scripting, Jon\_Noring

Gregory: +1 to preference for declarative content in the core grammar

Gregory: right, if don't support script, can't have canvas - gain for SVG!

Liza: JavaScript is critical for a large body of digital books that people would like to produce

Keith: I believe that there are JavaScript techniques for the modification of declarative content that may preserve accessibility. Does that feel like it may be true,

Liza: I am happy to say that declarative syntax should be preferred when possible

Gregory: if EPub 3 supports javascript, will it also need to support ARIA (http://www.w3.org/WAI/PF/aria/

JonN: I think we need to determine what we mean by Rich Media and Interactivity support, and whether that can be accomplished without need for adding script, but only with markup.

Marisa: we need a guideline - maybe something like "don't use javascript if there is a provision to do it declaratively?

Gregory: keith\_fahlgren, javascript black holes filled by ARIA

Keith: How can we get "interactivity (programmatic content, such as would be needed to implement a quiz or crossword puzzle)." without JavaScript?

Gregory: javascript support only a win if ARIA also supported (no native UI, etc.)

Ric: security: what is it allowed to access? Can it modify document, can it reach outside package, etc

Jon: Once scripting is allowed, that's it. Scripting will take over and books will essentially be scripted. Is that what we want?

Keith: Jon, I feel that you're being hyperbolic.

BillM: subgroup needs to consider usecases, perhaps some "rigidity" (per Marisa's comments earlier)

Hadrien: sandboxing scripting in a convenient way sounds tough

Brady: we are at a point where this needs to be some scripting: the group needs to define the scope of what is to be allowed

JonN: and if we allow some scripting, how can that be enforced? Can it be enforced with epubcheck?

JonN: I do not agree that we should allow scripting as default, but do study it and see if we can reliably declare a subset. I can see an extremely constrained scripting (which can be expanded in the future) so long as it can be enforced.

Gregory: re scripting and accessibility, check out http://www.w3.org/2005/Incubator/app-backplane/XGR-app-backplane/

JonN: epubcheck must reject any scripting that is not allowed, and adding scripting puts a burden on RS developers (although browsers are good at supporting JS.)

Gregory: recommended resource on scripting and accessibility: WAI-ARIA Primer http://www.w3.org/WAI/PF/aria-primer/

PaulN: Sandboxing and subsetting JS in unique ways might be required, but would increase the burden on those RS developers.

Liza: gregory, thanks

Gregory: LizaDaly, thank you!

RogerS: Today I can give an arbitrary XML file (with CSS) and display it in a browser. I can write a script in Ruby and have it execute even with no pre-downloaded plug-in. Why do we deny ourselves what webpages can do?

BenT: Roger - Agreed. Heartily.

BillM: EPUB should strongly encourage that content be dynamic/reflowable, rather than fixed-format/prepaginated, in order to maximize accessibility, device usability, and content reusability. However it is recognized that layout can be an important component of information communication, and that some publications will have a strongly preferred paginated representation. This is particularly true for magazines and textbooks, two key constituents that

JonN: I agree with Roger, although supporting linking, image embedding, etc., is still difficult to do with arbitrary XML within browsers.

BillK: providing publishers a useful reflowable format for more and more kinds of content

BenT: Jon - Yes, but we can fix that. :)

Gregory: note: WAI-ARIA is slated to go to second last call before end of July

SteveK: +1 to BillMcCoy

BillK: if you are rendering content on a HappyPad you can retain the page layout, but 2x2 screen we provide a good mechanism

BenT: Jon - Just trying to avoid spamming the channel.

George: BillM,  are u suggesting an SVG presentation of a page layout and the same content in traditional EPUB (reflowable) with as much styling as standard allows

BillM: Yes, for cases where a preferred prepaginated view is a) important and b) can't be adequately represented via reflowable EPUB + styling/templating

JonN: table models and handling notes are the other two biggies in rendering arbitrary XML. Handle the four items, and we've solved the big problems.

George: two simultaneous representations of same content?

JonN:  Of course, ePub may contain a publication in other forms via the container mechanism. One could build PDFs, as an example, each of which is optimal for a

particular class of reading systems.

Liza: I worry a little that saying you can put paginated content (PDF?) inside an EPUB content will be like saying you can make SVG covers -- people just embedded JPGs

in SVG and called that "SVG". I don't want empty EPUB containers with nothing but page images inside

BillK: agrees 100%

PaulN: @Jon\_Noring Unfortunately, combining PDF & epub will bring you quickly to limitations in Reading Systems.

Liza: I'd want to require a reflowable version

JonN: Liza -- yes, I am troubled as well. But a container may contain other formats so long as there's an ePub inside. but of course a publisher could make the ePub to

be a simple "refer to the PDF file".

Hadrien: as far as I can remember, we force a fallback to a preferred vocabulary in such a case. Shouldn't we move from preferred vocabulary to any XML+CSS ?

BenT: Liza - Agreed.

BenT: Hadrien - Yes.

BillM: best case if you can represent it in reflowable that's going to be better, but there's some content that has no value without the layout, like Head first series

Liza: Yes, I don't want to back away from the existing functionality, though it's rarely used

BillM: it's a shame if spec would not have a way to at least attempt to get that in EPUB format, I could do something silly like use a bunch of bitmap images, it would probably work but it's a hack, I think it belongs in the spec

Liza: If we surface that functionality more then we need to be careful about the requirements for real reflow

Markus: anyone disagree?

Liza: EPUB containers with images only = comics

Marisa: don't disagree, but what about a way to declare minimum requirements, so for example if there's video it won't work on E Ink devices, SMIL has something  like this

RogerS: Norm, so all the work someone does to model complex data to store in an XML database will ALWAYS require simplification to something like RDFa if we want to sell content as a book and search collectionsw of books?

JonN: Liza - agreed! Of course, current ePub RS simply render the OPS Publication.

Liza: Hadrien, that's a good use case

Garth: Fallbacks to arbitrary XML +CSS is already possible -- using fallback-style.

JonN: So it is a sort of "secret".

Marisa: for example showing different res images on different size screens

Ben: Garth - Except that the CSS can't do much of anything interesting with the document except make it pretty colors.

Markus: good questions, but I don't think we can answer today

Keith: Indeed, manga and comics may provide interesting concrete examples for layout-critical titles **that are already distributed for electronic reading**

Hadrien: Garth: possible yes but isn't it mandatory to use at least ONE document with preferred vocabulary ?

BenT: Hadrien - Currently, yes.

BillM: +1 for Keith re: manga

RogerS: As a small publisher, I don't want to publish manga as ebooks using images of text.

Ric: layout group can take it on and if gnarly we can punt or ask for help

Garth: I thought could put an out-of-line XML island document in the spine, with a fallback-style to css.

Ben: need subgroup for fixed layout, I'm not a fan of fixed layout, public knowledge of how to author EPUB is lacking, maybe we can evangelize how to do fluid layout

Roger S: gc - show me the e-reader that will accept that.

Garth: Quoting the spec -- don't know about reader support -- that's, FWIW, pretty easy.

PaulN: Sorry Ben, I totally disagree, there's things that you really can't do in a reflowable format unless you're coding every break and layout by hand, and at that

point you're just coercing the reflow to be fixed.

BillM: volunteers to join layout subgroup and shepherd along fixed layout requirements/issues

BenT: Paul - Yes, but that stuff is basically art, at that point.

Hadrien: Ideally though, both comics and manga could be XML based. They would reference images + provide text for accessibility + things like transition/dividing a page into narrative elements

PaulN: Magazine layouts, Head First Design Patterns, and anything else where someone considers each spread/layout.

Ben: Hadrien - Yes.

PaulN: Yes, but art is important.

Hadrien: but today, the most commonly used format - CBR/CBZ - is a container + images. EPUB would be a better container format thanks to metadata + NCX

Ben: Paul - Agreed. Just don't know that we can support it directly.

Bill M: SVG is simply a scalable version of an image, with real text, same as a PDF page

Murata: Thank you everybody.

KennyJ: thanks a ton Mike!!

Liza: I don't believe that "group hug" was on the agenda yet

George: thank Markus, Brady, and Garth for organization and planning of this