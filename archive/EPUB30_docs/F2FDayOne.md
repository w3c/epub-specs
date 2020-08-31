

## Opening Remarks ##

George: reiterated IP and antitrust policies

George: please use invented names rather than company/product names when making examples, like HappyReader or EvilReader

Markus: we will try to find a volunteer to take over scribing after each break

Markus: Today, lighting talks. We have extremely busy schedule, talk list is posted on Google Code site. 15 minutes per speaker including questions - LIGHTNING talks, not big presentations to solve all the world's problems. We will have a clock with George as timekeeper, no one can go over 15 minutes, we will have to cut off. We will give 2 minute warning. If you talk 5 minutes you can have 10 minutes for questions. Speakers can coordinate and create a joint question session for a related set of talks, please coordinate with yourselves

Markus: We hope that by 5:30 we will have gotten as much information and ideas and problem and use case descriptions as possible so that when we move on tomorrow we will have a better grasp of the problems and how we should move forward to address them

Markus: Regarding process, we will settle and finalize that tomorrow, problems are not final, we will not make any decisions today/tomorrow. Likely we will break up into subgroups that resemble themes of today's talks, they will be tasked with producing official requirements and use case descriptions, the main group will ratify, then next step is to develop solution proposals and take back to the main group again. So there are two main loops here, then we have to write the specification too

Markus: some presentations are available on a wiki page linked in agenda (on Google Code epub-revision site). those who haven't submitted presentations or directly wiki content, up to you to choose, preferably the latter as it is more accessible. if you email me presentations I may be able to stream them up during the day

Markus: scribing the lighting talks will be light unless you ask for heavy scribing. See Wiki for abstracts/slides for each talk.

## Introductions ##

## Global Language Support ##

Markus: EZRead will be first speaker

Michael Hsieh: report on progress in adopting EPUB in Taiwan and China. We have problem reading old English documents a few hundred years old, in China there are 5 thousand years old documents. Two major problems, vertical format doesn't fit EPUB model, which is based on horizontal left-right reading; secondly, most works saved to page based PDF format, especially historical works converted from printed works to PDF, but PDF is far inferior to EPUB in readability

Hsieh: what is needed is vehicle to convert from PDF to EPUB: there is no 100% conversion but task is to produce satisfying results

Hsieh: EZRead represents Taiwan Digital Publishing Forum (TDPF)

Hsieh: michaelh@ezread.com

Markus: Elliott Ning and Mei-Li Chen will coalesce into one 15 minute talk to save time

Chen: demo of vertical layout using HTML table tag - a current solution but has disadvantages. 10 screen sizes, 10 modes, images can't be supported, and heavy

JavaScript loading

Murata: writing-mode?

Chen: propose EPUB 2.1 support CSS3 subset, text layout modul with writing mode: inline direction and block flow, and related CSS attributes

Keith Fahlgren: There are some "future consideration" tickets on the same topic: http://www.daisy.org/epub/issues/support-page-progression-independent-script-writing- direction

Chen: border, margin,' padding and mapping logical to physical relations

Keith Fahlgren: and http://www.daisy.org/epub/issues/epub-needs-support-vertical-directionality-writing

Chen: before, after, start, end to top, bottom, left, right

Murata: I am now quite pessimistic about logical properties, which are relative to the present writing-mode.

Chen: reason is HTML5+CSS3 getting adoption, and original content can be converted with one line "writing mode: tb-rl"

Chen: browser can do SVG font rotation etc.

Murata: It is still an editor's draft.

Chen: challenges, CSS3 still a W3C draft, SVG layout mapping to CSS3 writing mode must be done

Gregory Rosmaita: would CSS3-Layouts help? http://www.w3.org/TR/css3-layout (in last call)

Brady: is writing mode in published CSS3 document, I couldn't find it in latest drafts

Murata: http://dev.w3.org/csswg/css3-text-layout/

Keith: it's not the CSS3 module that's received the widest support from browsers yet, but suggestion is that we try to push it

Murata: One of my colleagues, Murakami-san, has become a co-editor to push it.

Ric: our concern is pointing at specs whose first paragraph says don't reference this spec it's a WIP, it's an interesting challenge to us to see how to solve it, as

it will come up at least 12 times today

Murata: I understand your concern. But I am not so pessiimstic.

Will: other than vertical, another issue is references to physical attributes, you are trying to establish a mapping, right?

Murata: If we just remove contentious parts, this should not be so difficult.

Chen: yes

Murata: I reluctantly give up logical properties... reluctantly. Logical properties lead to complicated cascading or two sets of properties, which are burdens to implementations.

Kanai: ePub CJK requirements, I'm working with Murata Makoto of JEPA: 3 different organizations have made proposals to IDPF already (Japan) plus Taiwan and China.

China has private, kind of EPUB extension. CJK requirements can be gibberish between countries

Murata: This is because IT guys do not understand typography. Typographers do not understand IT.

Kanai: propose CJK subgroup to create global spec, and get commitments from CJK content providers

Murata: Existing e-book viewers (non-EPUB) already support vertical writing.

Murata: I'm the convenor of SC34/WG4 (OOXML).I know other SC34 people well.

Kanai: Makoto is chair of ISO SC34 and is collecting CJK requirements from ISO members, first CJK workshop held in Seoul last month. Sapporo workshop coming. items

Makoto collected include CSS3 features, ruby of HTML5, CJK metadata in OPF, user defined characters, pagination. we will need writing-mode and text-emphasis of CSS3. existing XHTML ruby is good enough, we will need Unicode IVD and SVG fonts, and Unicode 6.0.0, used in Japanese keitai books. we will need emoji in epub

Will: in 93 94, X4051 was translated to English, it's a very good spec of J layout, but I don't hear people mentioning it. What is status?

Kanai: I will evaluate JIS X4051 and answer, but this is spec for print book, not good for web based technologies, but some items were translated into W3C requirements

Murata: W3C Japanese layout requirements are much better now, It is derived from 4051

Kanai: spec is not updated frequently

Murata: W3C has published requirement document about Japanese text layouts, two versions are available, this has derived from 4051 so we can ignore it.

http://www.w3.org/TR/jlreq/

Jeff: do requirements deal with issues like which characters are allowed to appear at beginning or end of line

Murata: Yes, See 3.1.8 in the W3C note ("Characters Not Ending a Line")

Kanai: current EPUB spec doesn't even specify western language character set so we don't touch that part, that should be solved in the market

Murata: I'm wondering if HongKong has seen the JEPA requirement document.  I would be very much interested in their feedbacks.

King: mapping IDPF 2.1 requirements to local response based on Hong Kong requirements

King: demo of read along feature

King: speech is being played and text is animated, font color changed ("karaoke mode"), we speak Cantonese, so we need to learn Mandarin pronunciation, so textbook can overlay pinyin (pronunciation guide) using roman charset, can be toggled on/off. There are 4 or 5 accents, you don't find it in printed textbook, but it is expected in electronic textbook

King: demo of English textbook

King: highlighting sentence by sentence not word by word. annotation features, freehand drawing, translucent highlighting. we don't necessarily need vertical layout, because for horizontal layout ("rowwise") makes pinyin overlay easy. Fancy text layout over graphics or text over text, whatever can be done with desktop publishing software, want to have it preserved in  electronic format

Murata: Japan sticks to vertical writing.

King: if text wraps around graphics, they want it preserved, they want 100% replication of paper textbook page layout. rich media, key feature is synched audio playback with visual tracking of changed word or sentence attributes like color, in situ animation, "temporal interpolation", exercises & quizzes for interactivity, with teacher feedback overlays, students need to be able to send intermediate steps not just answers. Annotations need also global notepad/whiteboard not associated with preexisting content.

King: a proposal is to capture all user generated content into a separate EPUB, cross referencing support, that makes electronic textbook a collection of loosely bundled EPUBs, where each layer is an EPUB overlaying the original publisher's content

Garth: that textbook was more a picture of a page, that house with text wrapping, that is very pre-paginated "dont reflow this thing", EPUB is reflowable standard and these two worlds don't merge

Murata: BTW, information about the Seoul CJK workshop is available at http://www.asahi-net.or.jp/~eb2m-mrt/CJK/Seoul2010/

Garth: for iPhone vs. iPad vs. Android, the different aspect ratios and screen sizes aren't a consideration?

King: at some point being migrated to students, but they always have paper textbook to fall back on, electronic is complementary not replacement. 5 years from now still have paper as core layer. in order not to confuse students, we need to preserve pagination, we will need 1-1 replication of paper based version

Markus: reflowability and print page maintenance not necessarily contradictory

Roger Sperberg: internationalization - is it possible to do book in Hebrew today? second question, if request to be able to handle vertical & R-L, does this resolve issues for complex scripts like Thai and Arabic and so on

Murata: I believe that bidi is supported by HTML and with Thai and Arabic I don't think they need vertical so what is needed is good formatting of these languages,

they are important and not easy but I don't think EPUB spec has to be changed for supporting such languages

Markus: Makoto, can this be confirmed by anyone?

Josh: there is need for better support from R-L for Hebrew, some of this is software, but not nearly as difficult as vertical

Roger S: user characters, referring to things not in Unicode?

Gregory: In HTML5 it is the bdo element http://dev.w3.org/html5/spec/text-level-semantics.html#the-bdo-element

Murata: yes, one is minor variation in characters, another is just completely different characters, or create some logo

Gregory: http://dev.w3.org/html5/spec/text-level-semantics.html#the-ruby-element

Bill M: emoji

Roger S: SVG glyphs possible?

Ric: this will be complex to implement, when you have to write markup and implement formatting it will be difficult to ensure coverage of details

Gregory: SVG as embedded content in HTML5: http://dev.w3.org/html5/spec/the-map-element.html#svg-0

Ric: in Arabic there is a complex set of shaping depending on which characters are adjacent, kind of like fancy ligatures. We should have domain experts involved. We

have a customer who uses SVG for complex mathematical expressions, Hindawi, they are interested in Arabic support as well and may want to help

Brady: is shaping even something that needs to be in spec or is it just a rendering issue?

Brady: latin text may or may not need to be rotated, overflow, etc. there may need to be markup for some of this

Liza: Shaping of Arabic characters in EPUB works correctly, today, when rendered in a browser engine

Bill M: we originally said if page layout was important use PDF not EPUB, that may not be the right answer for the future given our need to support magazine and textbook use cases. We already have SVG in EPUB which helps.

Liza: (and directionality with Arabic is correct when the proper CSS is supplied)

Murata: please come to Sapporo Aug 3 & 4 if you are interested in CJK issues

Gregory: HTML5 on @bdo "The requirements on handling the bdo element for the bidi algorithm may be implemented indirectly through the style layer. For example, an

HTML+CSS user agent should implement these requirements by implementing the CSS 'unicode-bidi' property."

Markus: could this be official F2F?

Murata: some K and Taiwan experts are not quite ready to join IDPF, but we could consider changing title of workshop

King: Chinese books are rowwise, L to R, so mainland may not have position on vertical, they may be more like European layout

Murata: Japan is quite stubborn about vertical layout. Taiwan is close. But not mainland China or Korea, as far as I know.

Ben Trafford: I think this discussion of fixed layout is very dangerous. The real power of a markup-enabled document is reflowability -- if you want print semantics, use PDF or TeX or whatever. If we open this door, it's Pandora's Box, as every typography nut in the publishing world will think, "Finally! I  reproduce exactly what I'm doing today on an ebook reader!"

Gregory: amen to BenTrafford

Bill M: I agree it's dangerous but we are tasked to support textbooks and magazines, and reflow is not **always** the paramount consideration, and we have already opened pandora's box by supporting SVG which is PDF page contents in XML form

Ben: Bill, you'll note that I strenously fought against SVG for -precisely- this reason. Also -- nowhere does the charter say that we have to -reproduce- textbooks and magazines, just that we have to support them. I'm happy to interpret that broad mandate as not requiring that we support every nuance of their fixed layout model.

Gregory: fixed form runs into problems with legibility (not just for visually impaired - also for those with little visual real estate) - as long as pagination is

"retained" programmatically with a marker so content can be accessed "page by page as it appears in the print edition" it doesn't matter if reflow is performed

## Accessibility ##

George: I'm joined by Kenny Johar from Australia; slides on Wiki

Kenny Johar: Hi all.

Roger Sperberg: when you are reading a book with computer voice, does reading device make accomodation for contextual pronunciations?

George: next session, but most synthesizers will put in pause for comments, but prosody is important, but with some reading systems you couldn't tell when a paragraph ended

Dave Kramer: will HTML5 structural tagging be helpful for accessibility?

George: W3C have implemented ideas from DAISY, happily

Ben: Another interesting idea for semantic tagging of HTML-type content is in POSH -- http://microformats.org/wiki/posh

Brady: what are specific problems we should address vs. keeping accessibility in mind as we solve other problems?

Gregory: BenTrafford, i like the POSH checklist item 2 "Second, drop the use of TABLEs for purely presentational purposes, spacer GIFs, and presentational-html in general."

George: human narration, DAISY has gone there, so much content is graphical/spatial, e.g. flowcharts with boxes and arrows, that's challenging, alternative descriptions, multiple descriptions, links to description libraries, etc.

George: periodic table you may want to point out a standardized description vs. trying to "read out loud" it

Bill: Ben, yes but you lost that fight and more importantly SVG is now in every browser - we can't legislate away graphically/spatially laid out content

Bill: I believe we should instead focus on ensuring accessible fallbacks - better an SVG page with XHTML alternative than "opaque" binary PDF or a bitmap image of a page

Gregory: SVG also has a modicum of accessibility built-in (title and description) and work on SVG continues to SVG objects themselves more accessible by expressing relationships, etc.. going to be the same problem with CANVAS from HTML5

Bill: yes, SVG text is real text and can be indexed by search engines, scraped out, etc.

Ben: I agree that battle was lost; however, I don't think we should be enshrining fixed layout. Enabling it? Sure. But actively promoting it? No. Better to educate the magazine and textbook publishers on reflowability.

Bill: canvas is far far worse as there is no declarative representation that is built in, and everything is programmatic

Markus: TTS vocabularies and systems are geared for specialized domains like train tickets, so good synthesizers still fail

Markus: sometimes they crash or generate noise

Gregory: Canvas draft with accessibility built-in (note goal is access/use of interactive canvas not as fallback but as a means of enabling keyboard and eyes-free interaction with the CANVAS) for specifics on accessibility, search for the string 

&lt;ZZ&gt;

 http://lists.w3.org/Archives/Public/public-canvas-api/2010AprJun/att-0054/2dcontext10-June-7.html

Bill: as you note that's a totally different kind of accessibility that doesn't enable TTS or fallback

Markus: SSML, speech synthesizer markup language, SSML 1.1 in last call and provides the semantics we need. consumer is speech synthesier not browser rendering engine. CSS3 has a speech module but as Ric said it is still in development, even worse it hasn't been touched since 2004. also using CSS-like approach from purist point of view would be good choice, but module doesn't seem to be "alive"

Gregory: SVG also needs the equivalent of "tabindex" - the Access Module intended to do this with the order attribute http://www.w3.org/MarkUp/2009/ED-xhtml-access-20090423/ - document is being reproposed as "The Access Element: Enabling Generic Document Accessibility

Markus: this is one area we hope to propose in coming months

Gregory: http://www.w3.org/TR/css3-speech/

SteveK: could there be pinyin that's more general, like based on IPA pronunciation tag?

Gregory: currently there is support for CSS3 speech in Opera+Voice, emacspeak and FireVox

SteveK: I've run into problems with made up words with too few vowels, so they came to me for ideas on how to pronounce

RogerS: CSS3 speech, does it overlap or handle different things?

Markus: overlap, yes these are fundamentally solving the same problem

Gregory: http://www.w3.org/TR/css3-speech/#phonetic-props, http://www.w3.org/TR/css3-speech/#phonetic-alphabet. Marked as issue in CSS3-speech "ISSUE: we do not mention any other possible value for @phonetic-alphabet. SSML 1.0 defines "ipa" to be the only valid value - any other value should be added with the "x-" prefix. Do we want to follow this? Or do we allow some other values? SAMPA comes to my mind as a widely used ASCII alternative to IPA, but then: SAMPA is language dependent, and it might be better to have X-SAMPA"

Ben to Chair Group: I have a quick topic I'd like to raise in the open slot if nobody else has taken -- the idea of a subgroup to produce "best practices" for using ePub.

Bill M: Ben, I support a best practices effort although I wonder if it belongs as subgroup of 2.1WG or should be something separate

Ben: Bill - I agree. It could go either way, really -- just seems to make sense to bring it up to the WG because we have the relevant bodies present.

## Metadata ##

Bill K: not whether metadata but which; standards have way more than we want, and usage is inconsistent/incomplete. MARC, Dublin Core, PRISM, XMP etc. for images, I will focus on ONIX, developed for book selling (print books). We should pay attention to ONIX 3.0. I doubt it makes sense to adopt wholesale but there are very useful vocabularies and term lists in these standards that are widely used. EPUB is a supported type already in description record

Bill K: there is a wealth of useful data but we will have to be careful about what makes sense to incorporate into EPUB spec, best practices will be important which means we should collaborate with other organizations like DAISY, BISG, BIC, Editeur, NISO

Markus: to flip perspective a bit, what's the problem we're solving, is EPUB broken and if so how?

Bill K: I think it would be useful to provide mechanisms and guidelines for people to embed metadata in a method that would be widely recognized and ideally standards based. Extreme case, which in effect we have now, is there's a place for putting metadata but no standards for what's going to be there or what it means. So no I wouldn't say model is broken, but at minimum we need best practices, I was involved at earlier phase and people were excited about metadata but then people did a 180 because it's too complicated, there may be a middle ground

Will Manis: there's elephant in the room if you start removing metadata from EPUB, what do you do about it?

Bill K: we're not talking about removing anything

Will: how would you bind outboard file with metadata to existing EPUB

Bill K: that's an essential part of this because majority of publisher's metadata will not belong in the EPUB file, it makes no sense to embed in file, I don't have a

mechanism in mind but it should be addressed

Keith F: current mechanism **is** broken because it doesn't have an extensibility model to support new vocabularies. WillM is right because correlation between works is

going to be important, also for other domains like annotations

Keith F: we should get good comments from Editeur et. al. about which pieces of ONIX 3 would be their top recommendations for best practices, because ONIX is serving a fundamentally different purpose but it's rich descriptive capability could be attractive to us

Bill K: crossref, focused on scholarly pubs, has crossmark spec to provide access about current information about the article (e.g. is this the latest version, where can I get updated version and in what forms, etc.). All that info is obviously external to the file, but this provides a mechanism to get to it

???: EPUB exists not in a vacuum, exercise has to look at metadata and anything converging around standards that everyone can transact in, to attract more people to it

DaveM Apple: metadata and pub often travel and are revised separately, including user annotations

DaveK: we need subtitles in EPUB

George: we can do that

Diane Kennedy: I'm representing IDEAlliance, representing 500 companies across digital media supply chain, primarily magazines and advertisers. Ads drive the world of mags.The emerging eReader channel has much interest, and desire for a foundation for standards to enable pubs to move into this channel, new bus models, pushing content to devices through subscriptions, dynamic display of content, linking to materials

Diane: rather than have one standard for books and another for serials, we'd be better to work jointly to a single specification. Peter just entered the room and may jump in to comment, these are issues that have come up in previous joint meetings. PRISM, XML metadata for pub/aggregator interchange of articles, has evolved to support content as well as metadata, similar to XHTML as used in EPUB. We have an activity for meeting use case of delivering mag & rich content to eReader channel, happy to be here today and hope we can coordinate within this next release of EPUB. Need corporateEntity as well as publisher, also productCode and IssueIdentifier, PRISM is built on Dublin Core and extends it for serials reqs. We extend Date for coverDate, coverDisplayDate, and issueDate. Fields will be reevaluated as part of our new work, some may go away; you can see that some of these fields are built on DC and shared w/ EPUB but we have numerous additional fields, many around related content. If article is about an event we may want to bundle content around that event and push to a channel

Diane: Peter is the chair. We hope we can find common ground so if metadata is transmitted through EPUB channel it can support it

George: NISO conf call about journal standard in medical field, NLM, is that a competing standard?

Diane: when it was in SGML, I was editor of ISO spec when XML transition was happening. We find 90% of journals publishing in RSS, they are using a combo of Dublin Core and PRISM metadata. Tony Hammond of Nature Pub Group is our bridge to journals

Bill M: does IDEAlliance represent experience/visual requirements of magazines, e.g. for IPads?

Peter: PRISM has to support editorial workflows starting with Woodwing and Indesign

Diane: advertisers are interested in links between editorial contents and ads, with new models emerging based on new devices, pubs are very dependent on ads for

revenue for it's natural that we'll be looking at links, but our work has just begun

Andy G: you guys are in a parallel universe with NLM in STM community, I'm not sure what this means for IDPF

Diane: STM community has luxury of working from structured content, but PRISM is mostly done after the fact because in our world layout, esp layout with ads, is critical

Diane: we thought years ago wouldn't it be wonderful if we could create a mag article and have it in XML, but we will be examining the PRISM workflows, Time is probably going more directly to PRISM than anyone else but service bureaus have a more serial workflow right now

Diane: Overall, they are parallel worlds but in the end the problems are identical

Ben: Suppose we will have a standard extensibility mechanism, do we need to have PRISM built-in vs. one of many metadata types we can refer to

Diane: That's probably the route that has the least barriers, we are just very interested in having PRISM content displayed in eReaders under EPUB umbrella and not

having battling specs that force choices, extension would be fine

Bill K: NISO is interested in exploring using EPUB packaging model because NLM lacks packaging

Diane: IDEAlliance and IDPF leadership had meetings and looked at where there's synergy. Packaging has been on our list but you already have it, it would be a win-win if we can just pick that up and just adopt it, there's no conflict at all

## Rich Media & Interactivity ##

Garth: rich content thoughts. EPUB is not good only for textual content, that's certainly not true of the spec, although it may be true of some Reading Systems. it's important not to accept that as fact, you can do documents with rich styling that ought to render nicely, on some RS they do, on some they don't but that's a bug. There is an extensibility mechanism but when you start using this you head off into RS dependent territory, we don't want to go back to 1992  when there were 17 flavors of sort-of OEBPS.

Garth: AAP is pressing us and I'm pressing maintenance group to get our ass in gear and make progress on conformance tests. We are moving this to Google Code and it's

happening in the coming weeks, people in this WG should start working on these tests, it will be a step forward to resolving this "only good for text content" issue

Garth: demo -

Garth: the text should reflow, we can wrestle with how important it is but the right thing should happen as you move to different device sizes. More attractive layouts should work although we are getting into some RS dependent issues, such as headers/footers and adapting number of columns. EPUB should also be capable of more complex layouts, RS should catch up, even vertical J and Hebrew

Ben:  Garth's comments bring up the question of certifying reading systems as compliant. That we have no such mechanism in place is a real black eye, in my opinion.

Garth: This is using the writing-mode and direction/block-progression, it's a perfectly reasonable thing to do in EPUB today. Yes, we can argue about how standardized the CSS for this is but if RS doesn't understand it it will just ignore it. As long as you have a fallback you can have a nested EPUB, with fallbacks to Flash and then SVG and then image - in theory this can work with  every reading system today. Active content, for example HTML5 and Flash alternatives can be in object tag, HTML5 can say hand off to browser vs. paginating EPUB renderer. Talking with AAP people, RS better render EPUB 2.01 correctly before we make things more difficult but we need interactivity, e.g. front  matter, end matter in otherwise paginated flows, room for extension. We should be aware of the bright shiny object that's just out of reach. Elements on iPad is an app, we won't get there with next EPUB, well  maybe we will but there are things that will fall into that "it's really an app" space, I don't think we can do apps in EPUB in this releas. I want to see us solve heading in this direction without forcing RS-specific markup, and without punishing less capable RS

Garth: HTML is still squirming, how do we take advantage of that? Islands may be a good solution. E Ink won't support video for a while and that's something we have to consider too, not punishing RS that aren't as capable

Bill M: but I'm all in favor of punishing RS that don't bother to support the EPUB spec! (esp. when we have conformance tests to make evaluations objective)

Gregory: HTML/XHTML Author's Guide (a.k.a. "the Polyglot Spec") http://dev.w3.org/html5/html-xhtml-author-guide/html-xhtml-authoring-guide-rendered.html -
http://dev.w3.org/html5/html-xhtml-author-guide/

Ben: Bill - Agreed!

Garth: demo of Adobe Digital Editions with interactive content

Garth: it's bad that I just did the markup tuned to support 2 specific RS. This whole area will be one of the top of our list, a huge amount of discussion, I hope that by tomorrow we can start digging in

Ric: I totally agree w/ Garth we should stay within spirit of standard, esp. with fallbacks, but it scares me to have RS specific markup. How do we get away from this. Publishers are extremely excited about HappyPad and coolio things it can do. We need a way to author it, but the tools are really poor, hand coding is not suitable. Books should work acrossg platforms, not just on HappyPad. Users don't understand the concept of fallbacks, and most critically, books should not "break after a while". We should be leveraging known standards, but it's one thing to have a web page that works now, but you can't sell a book and tell the consumer "you'd better read it soon". HTML5/CSS3 are simply not standards - more than squirming: when properties change then content is broken, you can't update a book once you've sold it. Well you can but publishers bs will tell you how hard it is. Are publishers really willing to step up even though books will break over time and we're willing to accept it? OTOH does IDPF want to bless a spec that's really embodied by the implementation of Webkit?

???: would adobe support side by side, multiple versions coexisting?

Ben: to cripple ourselves from supporting these because they aren't finished seems like a lark

Ric: done or stable in HTML5 = nothing

Bill M: entprises are deploying apps based on what browsers support

Markus: ... dont believe its an obstacle that we cant get past

Ben: It's nothing we haven't gotten past before.

Ric: Bill mentioned 3 browsers, and that's simply a mish-mash. My bottom line is we need to be aware and make publishers aware that this is going to be a little bit of a mess possibly forever

King: would there be a need for certification program for RS? Without that logo/certification how can anyone tell. Right now everyone claims EPUB but what is meant is that they can decode it, maybe display something

Garth: that was a topic that we discussed at BOD yesterday, we have a new logo and BOD made a decision that it would NOT be used as a stamp of certification but more as mark for standard

Garth: there's a possibility of growing it over time - e.g. checkbox on logo to signify "approved" growing out of tests, RS will pass some %, score will differ by RS, whether this becomes a formal certification vs. self-reporting is TBD

Andrew Gilbert: Has there ever been consideration for versioning / link updating / push capability to deal with legacy content (realizing it raises whole issue on distribution / aggregation side)

Ben: Nope, not in my experience.

Ric: Adobe licenses SDK for rendering, we require certification, that takes so much effort you can't imagine. Think twice before IDPF takes on such a program

Marisa: audio/text synchronization

Marisa: demo of synched text & audio ("karaoke mode")

Marisa: we have mainstream readers as well as traditional DAISY users, esp for HappyPhone

Marisa: handsfree is useful to switch from reading to listening

Marisa: structured text + human-narrated audio

Marisa: we could treat SMIL as overlay, that would tell corresponding points on top of the document, SMIL could also supplement islands of content like SVG or Math

Marisa: link in wiki presentation, with potential mechanism

George: we are on a convergence plan, we are revising the DAISY standard. One of the four profiles is an audio book only, the second profile is classic DAISY which is text/audio/synch, the third profile is text only we want to punt and point to EPUB, the fourth profile we've been contemplating which is what we call pro, full text, audio, plus video with captionining & audio captioning, interactivity, forms

George: we're not sure where EPUB will land with respect to that

Markus: we want to dissolve the difference, our only concern is to maintain accessibility, if EPUB gets there the pro profile George described will have little raison d'etre, we will just point to EPUB

KeithF: you spoke of subset of SMIL, is it well described/understood/implemented?

Marisa: SMIL is profilable and split into modules, there are some rules about minimum subset, the subset that we would propose for EPUB, it would depend on what we want it to do

Markus: King's presentation also showed audio & text synch, did you look at DAISY/SMIL?

King: textbook vendors are using Adobe/Flash, "hard wired". Not sure which portion will be applicable, but we want to learn more about what DAISY is doing

Neil: I've heard from textbook publishers that SMIL gets in the way, it produces larger file, and only necessary if human narration, and in a world where TTS is the future do we really need it for EPUB?

Marisa: if you are going to use TTS engine you don't need SMIL and I agree it gets in the way. But if you have human or prerecorded TTS then you need it

Marisa: if you start to look at other ways to do what SMIL does you end up back at SMIL in my experience

Markus: for many languages synthesizer quality is very very low

Markus: imagine Steven King's novel read by him synched to the visual text

Markus: a good thing or very scary

Bill M: I am hoping convergence between DAISY and EPUB 2.1 can happen, in part to help EPUB get onto an ISO standards path

## Semantics ##

neil: I will lull you to sleep after lunch with math. most readers don't handle switch statement properly so you can't even fall back to MathML. mathml vs. svg, mathml offers reflow, accessibility, interoperability, & search. mathjax, mathml in JavaScript coming very soon

Brady: line breaking expectations?

Neil: plug-in model doesn't allow for that in IE, probably not JavaScript either

Brady: what about in EPUB?

Neil: I wouldn't expect it to be required, since it's difficult

Markus: this seems like a no-brainer in the context of textbook requirements

Neil: we are in a 3 week last call period then we become proposed recommendation

Markus: are there things in MathML 3 that we should definitely be interested in?

Neil: I'm very  much in favor of don't use switch, there is a fallback mechanism, as was done with DAISY 3 years ago, you can specify an image and alt text for the tag itself

Markus: there is also the annotation HTML element

Neil: there's 2 sides to MathML, presentation and content, the latter describes the meaning in a deeper sense, i.e. here's addition

WillM: are there open source versions of the components that implement MathML, that would enable someone writing a reader to do the layout itself

Neil: firefox and webkit, but tied to their codebases of course, also some standalone implementations

Ben: fallback mechanism is present in DAISY, but if we already have existing fallback mechanism in EPUB and MathML can work with it, why promote it for a limited subset of documents

Neil: currently fallback is inaccessible, and if you don't make something mandatory it won't be used

AndrewG: OSS MathML to SVG http://www.grigoriev.ru/svgmath/ (caveat emptor)

Liza: JEuclid can convert from MathML to SVG or imageshttp://jeuclid.sourceforge.net/

Gregory: better to have actual MathML rendered than transformed into a picture of a mathematical expression

Bill M: My concern is where do we draw the line with specialized vocabularies, after all there is ChemML and many other such. I would suggest a better solution than special-casing such vocabularies one at a time we find a path to use the existing switch/fallback mechanism together with JavaScript extensbility that can address MathML plus many other requirements

Ben: Bill - I share your concern, and address it in the extensibility talk.

Gregory: specialized markup languages reference: http://www.linuxfoundation.org/collaborate/workgroups/accessibility/handlers/references/smls

Liza: In terms of requests I've seen from the industry, I'm asked frequently about MathML and never about other markup languages. Other experiences may differ of course.

Gregory: MathML is essential for teaching students REAL mathematical skills

Ben:  Liza - I've gotten requests for everything from ChemML to ATA-i2200. Everybody thinks we ought to include their vertical industry specific language of choice.

Jeff A: need to mark up "head words"

Liza: I don't see MathML as industry-specific in any way.

Ben: Liza - What % of published material contain mathematical formulae? 5%, maybe? I'd call that industry-specific. I recognize that it's a broad need, but again, once we open the door to making given document types as intrinsic to the spec, where do we stop?

Gregory: BenTrafford: the need is there for text books, advanced mathematical courses, etc. all can best be satisfied with MathML

Andrew G: Ben - but can you really say "industry specific" unless you cast a broad brush. STM journal content, text, academic publications, research papers, all across wide domains...

Gregory: think accessible text books - that is a significant market share

Paul Norton: You can also look at it from the other side... If current standard doesn't really work for MathML, what other vocabularies are we blocking from entry?

Bill M: I think the question is not whether MathML is important but whether implementing it merits being a baseline requirement to be a conforming Reading System

Bill M: I would say if we can make the spec extensible enough so that we don't have to say "yes it's required" we will be better off, esp since Webkit doesn't support MathML natively yet

Ben: Bill - Yes, precisely the same point I'm making.

Gregory: how else to make a mathematical text accessible other than using MathML - pictures of math (even SVG) won't help a significant share of the accessible text book market

Ben: gregory - Nobody is saying, "outlaw MathML". We're saying "make it a recognized extension.". But not something -all- reading systems need to handle natively.

Gregory: BenTrafford, thanks for clarification

Andrew G: Ben - but then the incentive for some is to push apps to happy pad using webkit...

Gregory: MathML has applications in a popular science books, too - not just for the classroom

Ben: MathML has huge applications - I use it regularly. No one is denying that. What is being questioned is whether or not we need to demand that a compliant reading system handle MathML. The more things we are required to tack onto the spec, the higher we're setting the bar for implementations. And people have barely implemented what we have -now-.

Bill M: why do you need markup to tie back 100 forms of "estar"

Jeff: maybe for that verb you don't but it is generally done to disambiguate

Ben: why special markup for dictionaries?

Jeff: similar to neil's point wrt MathML, a dictionary is a very basic fundamental type of book and warrants being in the spec, although it could be dealt with as an extension

Ben: I think we need to step away from this idea of "well, if it's not intrinsic, nobody will do it." If the market need is present, the implementation will follow.

Keith: I would love to have so that even basic EPUB reading systems could get some of the benefits without necessarily having to get too deep into it

Markus: Keith, you looked at TEI?

Jon: there is dicml: http://en.wikipedia.org/wiki/DicML (unfortunate name for the markup language, though :( )

Liza: Master bug tracking MathML support in WebKit: https://bugs.webkit.org/show_bug.cgi?id=3251

Jon: And XDXF: http://en.wikipedia.org/wiki/XDXF

Gregory: FYI there is an example of a dictionary definition in the HTML5 draft's secton on DD: http://dev.w3.org/html5/spec/grouping-content.html#the-dd-element

Markus: rational for supporting XML with DAISY was that web was evolving to XML vocabularies as first-class, but in practice this hasn't happened

Markus: DAISY is undergoing a revision, by intent to be able to share and coordinate and harmonize, we are separating authoring & distribution distinctly

Keith: TEI, DicML, and XDXF seem to have impedance problems for low-barrier-to-entry markup for the inclusion of dictionary semantics & markup into ePub

Markus: TEI etc. can be part of authoring but for distribution we want to be compatible with EPUB

Ben: Unless, of course, we can support any or all of them as extensions. :)

Markus: for certain types of content there is a strong argument for a special vocabulary but DTBook and XHTML are very close, so we want to utilize XHTML and find a way to harmonize

Jon: Since CSS is the "typesetting language" for web browsers and for ePub, ,then any XML vocabulary that is presentable using CSS is "easily" supportable in ePub. But for vocabularies that have elements requiring properties outside of CSS to render, that makes things more problematic. For example, overall TEI is CSS-compatible, but there are a couple elements in TEI that stretch the ability of CSS to handle, such as notes.

Ben: Jon -- you can read the approach I'm suggesting here -- http://www.prodigal.ca/IDPF/IDPFf2fPaper.html

Markus: EPUBs that are just a single CANVAS or only paragraphs that are styled to look like headings are unacceptable. we want to propose the notion that we have a strict profile of XHTML that has content model restrictions that pertain to properly marked up textbooks. there needs to be metadata to identify notes, note references, marginalia, non-structurally-significant headings, image groups, etc.

Jon: ok, thanks! I was simply presenting a general principle as I understand it.

BillM: Should this be a restricted subset or as part of a best practices document? why have two profiles?

Markus: it helps in authoring. someone like a University may select the stricter schema for content they accept

Dianne: Presenting on navigation and findability in the context of periodical content

Dianne: PRISM/XML has provided a flexible, rich system for handling layout and navigation using the @prism:class attribute. @prism:class has a structured vocabulary, including sidebars/teasers, etc.. Also includes the pim namespace (PRISM inline markup) for inline content encoding. prism:media is richer than EPUB/XHTML object and may be a model for rich media in EPUB. Includes references to video, audio, identifier and other Dublin Core metadata on that object. PRISM would like to coordinate with EPUB on whatever extensions may be made to EPUB's object element or other forms of rich media. Some believe we require links from articles to  advertising materials (but this will get deferred until the actual advertising  lightning talk/discussion). Recommend an extension mechanism for EPUB to support rich media as required in magazine and serial publications

Will: On the PRISM inline markup, how much has to be hand-authored versus autogeneration

Dianne: Varies by publisher but they are developing auto-tagging mechanisms in some workflows. Workflows in magazine content tend to apply tagging at different points in time, either automated or by hand. Including re-keying content that has already gone to print. Open question about whether pim is necessary in EPUB

Will: There's a concern about adding additional markup and adding cost from a content generation perspective

Dianne: Often content from digital asset managements systems feeds into the final XML output in the workflow. Some publishers are putting effort into heavy tagging,
others don't use pim at all

Garth: Can you describe prism:media in more detail?

Dianne: Our current use case is to deliver content to aggregators (from Time Inc to Lexis/Nexis, eg). Use prism:media to pull in the media, often necessary because of rights issues with captioning content, etc. In the EPUB world there are fewer contractual obligations like that. Associating credit lines/captions with images is critical in magazines. Often these media objects are transmitted separately from the content, so tight
associations are important

Liza: End of PRISM/media presentation.Summary in: http://code.google.com/p/epub-revision/wiki/F2F201006LightningTalks

Markus: Enhancements in next generation NCX. We are presenting our experiences in documenting/implementing NCX in EPUB prior to 2.0.1. The specification was insufficient in terms of what aspects of the NCX should be required or used. It has been used primarily to provide a table of contents, but can provide much more functionality. Originally included by simply including the DAISY/NISO DTD, which contained some irrelevant elements (@playOrder)

Markus: 4 main points in the revision of the NCX in ANSI/NISO Z39.86-2011:

Markus:1. Modularized (and ported to RelaxNG). This offers the ability to provide some modules to other usage domains like EPUB.

Markus: 2. Allow expressions of machine-readable metadata for groups of navigation items. "What is the nature of the destination of this item?".

Markus: 3. Added the ability to use inline XHTML markup in ncx:label

Markus: 4. More terse expression of the NCX to decrease document size

Markus: DAISY has already collected their own requirements for NCX revisions. Requirements that could come from EPUB: Nice to have  multiple pagelists to encode different page relationships between digital and multiple print versions)

KeithF: I see NCX refinements as providing a huge opportunity
for innovation

Markus: (Came from Peter Sorotokin)

Markus: Add the ability to have multi-language labels. Add the ability to add labels for other kinds of media. Some of these came up in 2.0/2.0.1, others are coming up as we move to 3.0

Joshua: The multiple pageList sections will have an impact on Markus' point from previous talk about having a semantic markup for page breaks

Markus: Labels for other kinds of media imply the ability to random-access into timed media. HTML5 accessibility task force explicitly references NCX as a model for navigation within timed media in HTML5 (e.g. HTML5 video)

Markus: Over to George

George: DAISY has demonstrated that there is wide approval for use of NCX. Page breaks/page lists are very popular in mixed-use classrooms. "Navigate globally, read locally" -> navigation lets you peruse the entire book and target the desired area to read

Gregory: media accessibility requirements for HTML5 (HTML5 Accessibility Task Force) http://www.w3.org/WAI/PF/HTML/wiki/Media_Accessibility_Requirements

George: Want to see this as a MUST in the next revision of EPUB. NCX would be an excellent way to get to some of the requirements raised in the PRISM discussion

#### questions ####

Keith: Garth, what are the critical issues that came up in NCX implementations for DAISY?

Markus: DAISY did not have some of the same issues in confusion around use of NCX as did EPUB

George: DAISY's pipeline and validation made it easy to produce high-quality NCX

#### End of NCX discussion ####

### Page layout/formatting discussion starts ###

Ric: High level requirements for rich layouts. Layouts that can accommodate rich media, with good performance, across devices. Not all these are mutually satisfiable. Long list of requirements include intelligent reflowing of block elements, ability to align text across columns, aligning relative to images, etc. Existing markup languages provide some level of this control but not as much control as content providers would like. Rich content implies content that can be sold at higher  prices, so there is a market need. Examples of flow control (across columns, within columns). Other forms of flow control include flowing around images

Ric: It is difficult for content creators using tools like InDesign to write complex markup. Often there is also fixed content (that does not flow). Sometimes there are extremely complex rules about alignment even across regions

Ric: Showing screenshots from an internal Adobe prototype that uses layout markup that is not CSS3

KeithF: All of Ric's screenshots showing very complicated constraints for alignment and flow are from an internal Adobe prototype

Ric: Line-level layout includes intelligent hyphnation

JonN: Not seeing Ric's examples, could CSS3 (as it currently exists) be used to accomplish the presentation?

Ric: This kind of complex layout can be done but requires a programmer using an XML editor

Liza: Jon, he says "some"

PaulN: I take it he's talking about the page-template mark-up or some additional extension to it, is he not?

KeithF: Ric suggested that we might be able to talk about some of the choices they've made in their prototype in the coming [period](time.md)

Liza: Paul, we haven't seen markup examples (yet?)

KeithF: He's also asserting that designers will **never** be able to stop obsessing about certain components of design, which I feel is hyperbolic

Ric: It may be that highly-designed content may need to be confined to fixed-size layouts

KeithF: As in every domain, we need to be careful about "every" & "never" and "always" stereotypes

JonN: @keith, agreed!

BenT: Keith - Agreed. With exclamation points.

#### Ric's presentation has ended, Brady taking second half. Questions will follow ####

Gregory: the PFWG of the WAI at W3C is formally requesting the Style Activity at the W3C to update the "CSS Development Snapshot":

http://www.w3.org/TR/css-beijing

#### Brady Duga from eBook Technologies ####

Brady: Traditional layout [of parchment](example.md) had a fixed, known size. Obviously this falls apart in a multi-modal world . I'm going to disagree with Ric and say that we don't do trade publications very well right now. There is no conditional styling in ePub. Reading systems get to make decisions about styling, the upshot of which is that publishers provide only minimal styling. We end up with 3rd party workarounds for dealing with rendering systems

KeithF: " Media queries extend the functionality of media types by allowing more precise labeling of style sheets. ... Among the media features that can be used in media queries are ‘width’, ‘height’, and ‘color’. By using media queries, presentations can be tailored to a specific range of output devices without changing the content itself." http://www.w3.org/TR/css3-mediaqueries/

Brady: This problem isn't confined to the EPUB/ebook space, comes up in the browser/web world

KeithF: ...and Brady mentions the CSS media queries I just mentioned

Brady: In the web world, user-agent sniffing (server-side detection), media-queries in CSS and dynamic styling are used. These are not options or are not allowed in EPUB

KeithF: Brady asserts that ePub 2.x does **not** support CSS Media Queries (I disagree?)

Liza: Brady: Requirements list for conditional layout includes changes based on size, PPI, color

BenT: Keith - Since we only support CSS2 in ePub, he's right. Media queries are CSS3. Unless I'm missing something...?

Brady: May need to change flows or number of columns or adjust media properties of images. May also need to change the layout based on user preferences. For example, changing the number of columns based on enlarging the font

KeithF: CSS2 is mentioned in ePub. Unlike scripting, which is the formal SHOULD NOT (not MUST NOT), it says nothing about CSS3

JonN: I believe the current spec requires reading systems to minimally support the OEBPS 1.x CSS.

#### Demonstrates example of scaling down a large page with decorative images to a phone-sized layout ####

JonN: that does not mean RS may support more CSS properties, but there is the "blessed" CSS.

BenT: from spec: "A conforming Reading System must render all OPS CSS 2.0 required subset properties. A Reading System may support CSS properties beyond the OPS CSS 2.0 required subset, however, any unsupported properties must  be gracefully degraded per the CSS 2.0 specification."

KeithF: Brady also mentions that we have a specialized requirement: how do we properly understand a user expressing a reading preference, like doubling the font size

#### Demonstrates examples of a large multicolumn newspaper layout "degrading" to a fewer-column layout with smaller images ####

JonN: @Ben. Thanks! I misspoke.

Brady: These are not trivial to implement. None of this will be possible without good tooling in content creation,and it must be implementable by reading engines

Gregory: nothing about media queries in: http://www.w3.org/TR/CSS21/media.html

KeithF: It's a question of gracefully degrading, not excluding

#### Now questions for Ric & Brady ####

Adam: @media and @page explicitly referenced http://www.idpf.org/2007/ops/OPS_2.0_final_spec.html#Section1.3.5

Keith: Why do you feel that CSS3 media-queries aren't supported?

Brady: Yes, some rendering engines do support media-queries, but it's not a requirement

Keith: Do you believe that CSS3 media-queries provide support for these features?

Brady: Yes, it seems like they should be incorporated into the spec

Gregory: FYI Media Queries http://www.w3.org/TR/2009/CR-css3-mediaqueries-20090915/ is still in "Candidate Recommendation" (2 indpendent

implementations of each requirement to meet CR)

Keith: Do you think it is realistic for epub authors to design different CSS for different devices?

Brady: I think they are a well-understood mechanism for making different templates for roughly-sized devices. The examples I showed were done with media queries

Keith: Does Adobe have a good set of solutions that go beyond CSS3?

Ric: Yes, we'll show some of our solution maybe tomorrow? And not all of the problems were easily solved with CSS3. Still an open question about how to proceed, whether to wait for W3C/CSS, or to make up new markup

Gregory: http://www.w3.org/TR/css3-roadmap/#mediaqueries

Ric: The problem with developing new markup is that it has to be supported forever

Brady: Media queries are not limited to CSS; can be used in the link element, but may be deprecated

Gregory: W3C note: http://www.w3.org/TR/xhtml-media-types/

steveK: I'm afraid we're going to get into the same scenario as when we had multiple ebook formats

Brady: Yes, this is a challenge. We have to make sure that normal publishers with budgets can do this, and normal reading systems can do it. I don't think it's as bad as multiple ebook formats

SteveK: Maybe the onus should be on the reading system providers to degrade elegantly

Gregory: FYI: there is the promise of an implementation report in the CR draft of CSS3-media-queries, but search.w3.org can't find one for media queries

Brady: The problem is that then there is unpredictable behavior, which upsets content creators

#### End of layout discussion ####

#### Tom Hadfield from CourseSmart to talk about page fidelity ####

TomH: There are business needs to provide digital textbooks that can be used with print versions as well as provide advantages of digital. Student adoption was found to increase when providing high-fidelity ebook versions (based on PDF). Unfortunately high fidelity is not accessible, does not work well on devices, and has very large file size. Did not feel that EPUB was going to be an alternative solution for their business case

Keith: Tom is another speaker who presents a concern about ballooning file sizes. I wonder if that is a big concern in the industry.

Tom: Did a pilot program with some titles. Students felt that the reduced aesthetics were critical. In this pilot, MathML became images, so perhaps not the best possible EPUB conversions

Joshua: Keith, file size seems to be a concern with retailers, at least. most have upper limits

Keith: I wonder if those retailers' limits are well-justified, or based on legacy conventions or business problems

Tom: Presenting a real example of a page image versus a degraded EPUB version

Liza: That looks like a poorly-composed EPUB file

Keith: ...that said, delivering gigantic files over a prepaid cellular data connection...

Joshua: i think it's mostly an issue of storage space and download costs (3G paid by B&N, Sony, etc.)

Tom: On their mobile apps, they implemented thumbnail images of pages, which was found to help students orient themselves in the ebook

KeithF: Perhaps the solution is to present the carrots of what new functionality comes with larger sizes rather than sticks

Joshua: yeah, good point

Tom: Layout is essential in textbooks, and lost "spacial recognition" of where elements ended up on the page

KeithF: Tom asserts that layout is critical for delivering these textbooks, but I wonder what better semantics would be required to provide more of the meaning from the original, if not the "lower left corner of 204"

TomH: Loss of proximity of content to illustrations

Joshua: are we moving to the point that ePub replaces PDF? Seems to be the direction some are talking

KeithF: I haven't heard a compelling argument suggesting that ePub and PDF shouldn't continue to solve separate problems separately

Tom: Many things were lost in these reproductions, that were carefully composed for print

Gregory: it is a question of identifying page elements not by where they are on the page, but by header, caption, IDref, etc.

Tom: These ebooks did not provide good appeal for visual learners. Our conclusion was that few books would be amenable to EPUB conversion

Keith: I think that most of Tom's points are valid, but that the ePubs presented for review by the students could have been much more richly and attractively styled

Gregory: teacher should say - "look at the section captioned three stages of a butterfly's life" on page 204 not "look at bottom lefthand corner of page 204"

Tom: Our best option right now is a multi-format approach mixing page fidelity and EPUB versions. DRM is a critical component for educational publishers

#### End of Tom's presentation ####

Joshua: yeah, that is a big issue. styling and layout in ePub is actually pretty good for most content, you just have to adust the thinking of authors and designers from page layout to content flow

???: about accessibility; the inability to easily find the content in a page fidelity view is important

???: If students are happy with large tablet devices, why worry about reflowability?

Tom: Yes, students do have larger devices, but more than that they have smartphones

Tom: Students find value in the page images even if they're unreadable. It may be that textbooks are just not appropriate for reflow

???: Small children do find it confusing when page sizes change, perhaps this doesn't matter in higher ed

Tom: It depends on the university, faculty and students

AndrewG: Hmm - is anything technical not appropriate for ePub? (Not entirely serious, but one wonders...)

Tom: Many older professors do not want to do anything other than refer to the printed textbook (versus projecting relevant content on a projector)

AdamW: is anything technical appropriate for ePub? :)

#### End of presentation ####

Gregory: the change has to start with how teachers publishers and students approach textbooks and technical material; this is why structured documents are so important, because on can get to content on a specific page by elemental navigation (that is navigation by element)

Liza: (Some technical publishers have embraced epub)

Gregory: not everyone needs reflow, but those who do are up the proverbial creek without it

Ben: gregory - I'd argue that the majority of use cases require reflow. Fixed layout is, as far as I can figure, for content that is more artistic and/or marketing-oriented than functional. I mean, the reality is that people read content they'd find in a fixed-layout magazine on the Web all the time, and I'm not hearing any huge complaints. Much of the perceived need for fixed layout is illusory.

PaulN: @Ben - There are, of course, the minority that are instructional/informational **and** need the fixed-layout. The "Heads-First" series, from

O'Reilly would be nearly impossible to reflow in a meaningful way

Gregory: BenTrafford, i agree whole heartedly - before i lost my vision 21 years ago, the only time i used a computer was to do desktop publishing when i was at university --- luckily for me, used a mac, so i know what GUI "looks & feels like"

Will: If ePub is going to be a standard that supports publications, and many of those publications rely on advertising, we'd better support it. And advertising itself is becoming more targeted. Unlike the historical advertising models in the last century. Ebook retailers now have phenomal records on your reading preferences now, for example, so they understand that I'm interested in history. Eventually content and advertising may be
indistinguishable

Keith: Advertising is also becoming more personalized and embedded inside the content itself, perhaps as part of the content

Will: Traditionally advertising was bound early in the production cycle. Now ads will have late binding. This late binding will have an influence on layout choices. Because of the economics, addressing advertising is important to making EPUB commercially relevant. Late-binding may include techniques like auctioning bound to particular end-users. Offline scenarios mean that ads need to be acquired ahead of time (not-as-late binding)

Will: Late-binding can even include injecting advertising into content

Liza: please don't do this

BenT: Liza - Ditto. Big-time. I suspect that this is opening the door to malware and spam in ebooks, and could likely kill us.

Will: Example, "Sam Spade got into his 

&lt;auto-ad/&gt;

" becomes "Ferrari"

Will: Not sure we can have any realistic advertising-related specifications could be part of 2.1 in the current timeline, but it should be kept in mind during subcommittee development

#### questions ####

Dianne: When ads are booked, there's a need to define ad types

JonN: Even if we consider allowing markup to be added that would deliver advertising (and I am troubled by it as Ben and Liza mention), then there is the issue of whether we require reading systems to inject advertising at the point of insertion, it is a new burden on RS developers to require advertising insertion.

Keith: I believe that the late-binding of ads would probably be provided as part of a scripting component

Dianne: It may be too early to specify this as the channel for ebook advertising is new

Will: As ads become more personal, it is important to protect privacy

Will: And to deal with the real estate that is consumed by ads

Will: is responding to a question about whether we need new markup to address this versus using the scripting model in the web

BenT: I'll give the same answer that I've given to every other vertical market application -- it's an extension. Advertising should not be core.

Liza: There was no suggestion in this talk that advertising be core

#### End of questions ####

#### Will is now going to present on annotations ####

Will: Presenting along with George

Will: Annotations, "Metadata on content"

Will: Data associated with a particular spatial & temporal point in a document

Keith: Annotations **could** be metadata about content, but they could be content about content as well, which are slightly different use cases and nuances

Will: Metadata needs to be held in some kind of payload. The payload needs to be in some kind of container. Examples of metadata: author-supplied (footnotes, ruby). Reader-supplied marginalia. Annotations for a larger body (as opposed to personal marginalia)

JonN: "annotations" are quite broad as Will mentions.

Will: Metadata for non-reader use, such as for a bibliography

Keith: Will is presenting a slide that shows a very broad understanding of the different types of annotations

Will: Auto-generated metadata (such as search query results)

JonN: OSoft and its ThoutReader explored this quite deeply, so as we delve into the "annotation" issue we should look at actual implementations.

Will: Metadata that can be used for assistive purposes

Keith: Are the details of those implementations readily available, Jon?

JonN: Not that I know of.

Will: Anchoring mechanisms for these metadata types

JonN: OSoft went belly-up a couple years ago, but I think we could ask them to give a nice demo of their reader, the demo is eye-opening as to what

can be done.

Will: XPath is a likely mechanism, but XPath 2.0 or earlier?

Will: What is the mechanism for specifying XPath queries?

JonN: Since "annotations" are externally applied, we need to come up with a URI to address a point or range within an ePub publication.

PaulN: thoutreader search came up with: http://sourceforge.net/projects/thout/

Will: Questions about linking and identifying identical or related publications via DOI, ISBN, URI

JonN: Brady came up with the book:/ URI. It could be called epub:/.../

Will: Content editing may invalid anchors

JonN: oops.

Will: Capturing the time [place -LD](and.md) of annotations is important

Keith: Anchoring mechanisms can be very fragile. Blaine Cook has some interesting ideas on how to make them more robust that are derived from ideas in astrometry. I've asked him to publish them.

JonN: I think we can bring Mark Carey out of "hibernation" and ask hiim to provide a demo, not to market his product, but to show what is possible which brings to life what Will is discussing.

Will: The minimal payload schema for an annotation should include text, styles, links, images, SVG, queries, though we want to avoid defining how the payload is rendered, since that will vary by device

JonN: yes, a URI can be fragile when an ePub is upgraded.

Will: Just because it is called "marginalia" does not mean it needs to be rendered in the margins

Will: Author notes: don't require a separate mechanism since these are captured as normal EPUB content

Will: Do need a mechanism for describing annotation payloads

Will: Security/DRM considerations: security, could be obsolete

#### Now George will comment ####

JonN: should we consider adopting a standard for the annotation "objects"?

George: I worry about scope of what we can accomplish in 2.1. There is significant commercial worth in annotation specifications, so other organizations may want to provide this kind of content enhancement

George: Describe this generally as how to "overlay" content on an EPUB, including e.g. audio-tracks

JonN: what we can do with the annotation issue is to lay the groundwork for establishing a URI syntax to point to a spot or range of content within an ePub.

Gregory: http://dev.w3.org/html5/rdfa/ RDFa 1.1 in HTML5

George: We need to scope the work that we're going to be doing

Will: I agree that scope needs to be limited

#### Questions ####

JonN: until one establishes a standardized way to point to  content within an ePub, we can't do anything else.

Keith: DAISY has already defined some syntax/pointer technology for annotations. Is this a good foundation?

Markus: It could be a starting point. DAISY addresses the problem of describing temporal location as well as textual

JonN: The old OEBPS working group, just before disbanding, spent a couple months working on this. We should revisit and build upon that. Brady and Garth were there.

Will: XPath 2.0 + parameterized queries could satisfy the needs

JonN: I do believe that any pointing into an ePub should be done using a URI.

Keith: Perhaps it would be better to consider it a discrete product under the IDPF, but not "baked" into EPUB

Will: Is EPUB an "umbrella" specification? Or is it a separate specification?

BillM: A certain HappyCompany's system uses an XPath approach for this as well

???: DTBook readers found annotations to be a great feature

KeithF: Where is the annotation system for ePub and PDF described publicly, Bill?

???: What are the limitations of the DAISY bookmarking grammar?

KeithF: Many DAISY users apparently find the ability to annotate very compelling.

Liza: The DAISY specification may not be applicable to modern technology, though it is similar to what Will described

Marisa: There is nothing in the DAISY specification specifying markup,  only text

George: When creating annotations, your reading system becomes an authoring tool. The reading system could potentially generate a new  EPUB file

Gregory: keith\_fahlgren, THIS daisy consumer finds the ability to annotate very compelling

KeithF: Why not make the deliverable content inside the annotations use the same markup as ePub itself?

George: What happens when you apply an annotation to an annotation?

JonN: that's assuming the annotations are added to the ePub. My view is that we should not support that -- keep all annotations as
standalone digital objects that point within an ePub.

KeithF: But there could be harmonization between the two specifications, including the content component

Liza: Mei-Li Chen is now going to present another annotation talk

BenT: Jon - yes, agreed.

Mei-Li: Annotations allow users to create cloud-based personal reading systems and comments.These annotations may be in-book and travel with the
book, or be personal. In-book annotations may be implemented using 

&lt;ruby&gt;

. Personal annotation may include: bookmarks, highlights (start/end point),

current reading position

JonN: Using Brady's suggested URI syntax from a few years ago, we could have a URI like "epub: / ... /" . It will take advantage of XPath and

XPointer, but the specifics need to be worked out.

Mei-Li: Propose creating a separate XML schema to describe these personal annotations, which may be stored in the EPUB file. Could be stored in the 

&lt;meta&gt;

 section of the OPF file (linked, rather)

JonN: Interesting idea -- to be able to attach the annotation objects to an ePub but without modifying the core publication itself.

Mei-Li: Handwriting annotations require implementations to include information like font size

#### End of presentation ####

RogerS: Do you think that SVG would be a suitable mechanism to implementing handwriting annotations?

Liza: Information about font size is required to help specify where the annotation occurred

Gregory: "In-book annotations may be implemented using 

&lt;ruby&gt;

" i've proposed the same thing for marginalia in the past

Liza: Many things can change, not just font size -- device orientation, device, etc.

KeithF: What are the big drawbacks of using 

&lt;ruby&gt;

 in that context?

#### Roger Sperberg is now going to present on extensibility ####

KeithF: I believe that we may have a need for very specific annotation locations that may use XPath/XPointer or some other technique, but perhaps also a more vague location description technique that tries to survive content modifications and updates

Gregory: from a standardsnista point of view, that's not what ruby was intended for, but i counter that with that's what it offers for all languages use for glosses, marginalia, etc.

RogerS: What will readers want from ebooks in 5/10 years? Ebooks are different from print books in 2 ways: E- alters fundamental assumptions about display, stability, distribution and re-use, Raises the kind of issues that we are familiar with, including content stability, such as when a reader is actively re-authoring the book. What happens when authors/publishers respond that this kind of re-use should not be allowed? And then who owns these new re-written or annotated works? We should be taking the readers' side (rather than  publishers' side) in these debates People want to be able to do in their ereader what can be done on the web. Don't disadvantage book publishers competing against  information providers in other formats. How books are different from other content - publishers can position their value in terms of authority, veracity & indexing. Collections of content should be encouraged by enabling cross-title searching, merged indexes, and integration with other media types. Aspects of the ebook can be
"smart" and adapt to new contexts like locations. We should be enabling the ability for users to search  their own book collections. How can we encourage authors to treat ebooks as suitable for authoring in. We should allow APIs to enable external applications  to add value

KeithF: Redux: ePub needs an extensibility model. I agree

RogerS: Especially since we can't predict what will be a  market need will be in 10 years

KeithF: Extensibility is always difficult, but we now have a lot  of experience in other communities that we may draw from.

RogerS: We should be able to share indexes independent of the book object. Allow download of authenticated content from a source. For example, an updated section of itself. Enable speciality markup languages (eg ChemML) to be defined in SVG and accessed directly from the EPUB. Provide access to full metadata, not just in the spine, but in the container. Support spontaneous generation of a book from a search  and get it into print/electronic  form. There will be security issues that need to be addressed

#### End of presentation ####

Joshua: great CSS/Javascript timeline module: http://www.simile-widgets.org/timeline/

Liza: BenTrafford is now presenting about extensibility

BenT: Paper books aren't broken, so we need to compete
with something non-broken

[of Ben's talk: http://code.google.com/p/epub-revision/wiki/F2F201006LightningTalks#Extensibility](Summary.md)

BenT: EPUB has not been very good at displaying content due to reading system limitations. EPUB is good at specification, especially about the container. We shouldn't be afraid to diverge from other standards  because we  already support only a subset of those standards. We are at a place where we can address needs by pointing at other standards

BenT: Complete talk notes: http://www.prodigal.ca/IDPF/IDPFf2fPaper.html

BenT: How do we support "pure XML"?

Liza: (I'm only going to transcribe comments that don't appear in the complete talk notes)

Joshua: PrinceXML deals with this by adding their own CSS. I don't think that is a bad idea, really

BillM: How would CSS be able to provide this mechanism?

#### meeting concludes ####