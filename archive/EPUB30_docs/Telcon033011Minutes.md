Telcon Agenda: [Telcon20110330](Telcon20110330.md)



# Action items arising from this call #

> ACTION: Markus and Matt to start integrating API into specs with help from Kevin@apple

> ACTION: Markus ping Peter about script security warning prose

> ACTION: group to settle quickly on navhide, else this issue will be deferred to a later revision

> ACTION: Apple, Sony and RS vendors provide answer to whether 4b would work for them

# IRC Notes #

recording filename is 20110330

keith\_fahlgren: Peter clarified that he was on vacation this week.

## Topic: Scripting ##

Minutes from scripting call: http://code.google.com/p/epub-revision/wiki/ScriptingCall20110323Minutes

link: Scripting Feature / Support Proposal: http://code.google.com/p/epub-revision/wiki/epubReadingSystem

keith\_fahlgren: It has been reviewed by a number of implementors (not all, obviously)

Reading Systems that support scripting must identify themselves as such through this API proposal

keith\_fahlgren: Liza and I had private discussions and she shared our feedback. This interface somewhat matches discussions we'd had historically, which was a nice to see.

Question from telcon line: is there a need for the 'Potential Features' API functionality as listed in the table at bottom of proposal?

Answer: Yes, somewhat implied and/or essential

These features would declare that Spine- and Container-level scripting is supported

mgylling: Brady proposes that the dom-manipulation and layout-changes features definitions be modified to make clear that they apply to spine-scripting, and are assumed to be true for container scripting

Resolution: The scripting API proposal is moved forward for integration into spec; window open for comments, but any comments must be received in short time-frame. 1 week?

Keyboard event behavior is not defined for scripting purposes danhughes
No standardization of 'scroll-to' type behavior in paginated environment

Security issues are not addressed through specific mechanism; may be addressed through informative notes/recommendations.

keith\_fahlgren: Not a separate doc

## TOPIC: Navigation ##

danielweck: http://code.google.com/p/epub-revision/issues/detail?id=69

Need to group/nest semantically different lists together; done via addition of <span> element, provides for a non-linking heading<br>
<br>
danielweck: <a href='http://code.google.com/p/epub-revision/issues/detail?id=111'>http://code.google.com/p/epub-revision/issues/detail?id=111</a>

Proposed resolution: ordering only enforced for pagelist and toc types of navigation structures<br>
<br>
danielweck: <a href='http://epub-revision.googlecode.com/svn/trunk/build/spec/epub30-contentdocs.html#sec-xhtml-nav-def-types-landmarks'>http://epub-revision.googlecode.com/svn/trunk/build/spec/epub30-contentdocs.html#sec-xhtml-nav-def-types-landmarks</a>

danielweck: <a href='http://code.google.com/p/epub-revision/issues/detail?id=113'>http://code.google.com/p/epub-revision/issues/detail?id=113</a>

Contention surrounding use of OL vs UL, semantic interpretation of author intention vs UA/RS display<br>
<br>
fantasai: recommend that UAs display them by default without numbers (i.e. list-style: none for CSS UAs)<br>
<br>
Resolution: continue to specifiy OL, and allow UA's to handle display issues<br>
<br>
danielweck: <a href='http://code.google.com/p/epub-revision/issues/detail?id=84'>http://code.google.com/p/epub-revision/issues/detail?id=84</a>

proposal to introduce epub:navhide attribute to balance the need for machine and human readable navigation<br>
<br>
Objection made on wiki by Murata-san<br>
<br>
keith_fahlgren: That's Murata<br>
<br>
argument for epub:navhide - RS that do not support CSS will not be able to display navigation in main content<br>
<br>
keith_fahlgren: Markus is correct that we hadn't allowed authors to hint about RS display of NCX, but that was something we discussed as attractive in June<br>
<br>
link: HTML5 @Hidden - <a href='http://dev.w3.org/html5/spec/Overview.html#the-hidden-attribute'>http://dev.w3.org/html5/spec/Overview.html#the-hidden-attribute</a>

keith_fahlgren: I support the postponement of epub:navhide<br>
<br>
Resolution: issue will remain open for 1 week, then faces postponement<br>
<br>
<h2>TOPIC: Required support of video codecs</h2>

link: <a href='http://code.google.com/p/epub-revision/wiki/CodecsRevisited'>http://code.google.com/p/epub-revision/wiki/CodecsRevisited</a>

Option #1 - IDPF has not mandated patent-encumbered tech in the past<br>
<br>
Option #2 - Unlikely to toss out H.264 for varying reasons<br>
<br>
kingwai: AAC-LC (as an audio codec) is patent-encumbered and the exact expiry date of essential patents of mp3 is not known<br>
<br>
keith_fahlgren: ...which is a <b>huge</b> distinction<br>
<br>
Resolution: defer discussion wrt Option 4b (5) to next week<br>
<br>
Concern expressed about control by single entity over a given format, WebM in this case<br>
<br>
Concern expressed wrt to need to stream video referred to from an epub<br>
<br>
RogerWebster: We certainly don't want to rule out embedding videos in ePubs - our publishers are doing this already<br>
<br>
Option #3 - Benefit limited to only being in-step with W3C<br>
<br>
Outcome: Apple Sony and other RS vendors are investigating the 4B option and will return results asap. Group concludes that #4 is the least hurtful fallback option if 4B cannot be chosen<br>
<br>
Attendees: wen-hsuan, Si-Wei, Takeshi, DaveGunn, danhughes, fantasai, mgarrish, kingwai, garth, keith_fahlgren, marisa_demeglio, RogerWebster, George, toby_stevenson, danielweck, Felix, hober, Brady, oedipus_away, NeilS, ShuTanabe, Ryoji_Akimoto, EricFreese, mgylling, BillKasdorf