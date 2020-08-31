# Chat Log from Taipei Meeting #

Viewer 13@All: why doesn't screenshop sync with the speech? cannot follow.

Viewer 7@All: fyi - its difficult to understand the phone

Viewer 6@All: @all - is it possible to move phone speaker closer to microphone?

Viewer 7@All: @all - the echo is pretty strong - its very difficult to understand Makoto

Brady Duga@All: Click on Viewer 15 and see if you can edit it

Brady Duga@All: There doesn't seem to be a presenter

Brady Duga@All: Anyone there?

Viewer 64@All: Indeed.  No slides visibe.

kanai@All: I'll let him know

Brady Duga@All: ty!

Viewer 64@All: The cherry blossoms are nice, though.  :-)

Brady Duga@All: Very calming

Presenter@All: we will get set up again for presenting after lunch (if there is any more screen sharing to be done)

Viewer 64@All: How long a break?

Brady Duga@All: 1:30?

Viewer 64@All: That's an hour?

Brady Duga@All: Sounds 1 hour

Presenter@All: starting again in 1 hour (1:15pm taipei time)

Presenter@All: btw IRC was down so please use this chat

Viewer 64@All: Yep.  Noted that.

Dave Cramer@All: I thought I was just clueless about IRC. Good to know.

Presenter@All: I have updated this info on logistics wiki page, sorry

Presenter@All: we are starting in a few minutes - will be rejoining conference call (hopefully...)

Viewer 72@All: Anybody home?

Presenter@All: yes just a minute please

Viewer 72@All: Just checking.  Then you'll call back in too?

Dave Cramer@All: I'm back, and am now very sleepy!

Viewer 72@All: Yes, it would be best to have this metadata in the OPF -- such that markup files don't need to examined.

Brady Duga@All: I agree with #72.

Presenter@All: #72 who are you? ;-)

Garth@All: Garth.

Dave Cramer@All: Mixing fixed and reflow able layouts in the same book is something we're very interested in doing.

Garth@All: Strange that Brady agrees with me -- very unusual!

Brady Duga@All: Didn't know it was you

Garth@All: Perhaps, but better than having to open/parse markup documents.  :-)

Dave Cramer@All: Is there a basic vocabulary that could be agreed on that would live in OPF, and then anything that was unique to a RS would live in META-INF?

Garth@All: Well, perhaps not (soley) in the markup files.

Garth@All: Agree.

Brady Duga@All: Didn't catch it all

Dave Cramer@All: My sense is that Apple will always use the com.apple.ibooks file for some metadata.

Presenter@All: casey indicated willingness to abandon it, I thought anyway

Dave Cramer@All: I didn't quite get that sense.

Presenter@All: of course there may be vendor-specific metadata

Dave Cramer@All: Apple does offer the possibility of restricting content to specific devices in META-INF. IPAD only vs iPhone and IPAd, for example.

Dave Cramer@All: That seems pretty specific to Apple!

Garth@All: :-)

Dave Cramer@All: Other things seem generic… whether it's fixed or not, whether the orientation is locked.

Roger@All: Agreed: I'd like us to nail down the generic set and then figure out where to put them...

Garth@All: Yep.  My desire is that the binary flowing/fixed be determined from the OPF, without looking at markup documents.  Seems like that's the path we're on.

Garth@All: Could be container, but support for by-spine-item really drives you to the OPF.

Brady Duga@All: Also, mutiple renditions suggests opf

Brady Duga@All: Markus left a while back

Dave Cramer@All: item makes sense to me. So fixed vs not, landscape/portrait/either, spreads vs single page, what else?

Presenter@All: look at Kanai's proposal... ;-)

Roger@All: OPFs are not that big or hard to parse, generally, so we could live with that. I just wonder if being able to select the OPF(s) you want from metadata in the container.xml file might be handy.

Dave Cramer@All: Re: Kanai proposal: do we want viewport in HTML meta or in OPF? Former seems to make sense.

Brady Duga@All: So, more info in container.xml that says what features are used by each opf?

Garth@All: Agree -- viewport seems logically tied to the content.

Presenter@All: IMO one piece of HTML content could be used with more than one viewport, esp. given CSS/JS variability... but that's just one (non-expert) opinion...

Presenter@All: could be (re)used, I meant

Dave Cramer@All: But would JS want to read the default viewport from the HTML file? It doesn't know about the OPF, does it?

Brady Duga@All: I also doubt there would be much re-use of html for different viewports, but happy to be preoven wrong

Garth@All: Wow, agree with Brady, again.

Roger@All: Ditto. Scary.

Garth@All: Yes, keep it (HTML/CSS fixed).

Dave Cramer@All: Is fragmentation a symptom of reading systems that don't support all of the spec?

Garth@All: Yes.

Viewer 71@All: and requirements that are beyond the spec

Garth@All: My "yes" was to the question of wether we want both HTML/CSS-fixed and image-based-fixed.

Garth@All: Who's "Viewer 71?"

Viewer 71@All: Tzviya Siegman

Dave Cramer@All: What happens if we send a B&N fixed book (that validates as EPUB 3) to Apple, or send a fixed iBook to B&N? If both reading systems support the spec, we should be OK, right?

Brady Duga@All: Thanks :)

Garth@All: Well, B&amp;N to Apple would likely show only the reflowable article view.  Appel to B&amp;N, unlikely that B&amp;N knows about "viewport", so it would probaby paginate the fixed stuff.  Not pretty, unless both RS's learn both.

Roger@All: Garth: that's about the size of it **at present**.

Brady Duga@All: It's a bug that we didn't add this feature

Roger@All: Yep

Garth@All: Should be a WG, in my opinion.

Roger@All: Yep again :)

Garth@All: Roger: tx, seemed likely (for now).

Brady Duga@All: For maximum confusion, I think it should be a WG chaired by the other Brady

Roger@All: I thought you were the other Brady.

Brady Kroupa@All: Sign me up :)

Brady Duga@All: I'm the other other Brady

Garth@All: One WG for both for both the B&amp;N (replica map) &amp; Apple (HTML/CSS) version?

Dave Cramer@All: We can at least avoid fragmentation at the WG level!

Brady Duga@All: Too many WGs can get confusing (and fragment us).

Garth@All: Indeed.

Brady Duga@All: I second Dave!

Viewer 71@All: we're trying to eliminate renditions, not create new ones

Garth@All: I think there will be dependancies that we don't see yet.

Dave Cramer@All: It might be challenging to convince a reading system developer to abandon their own format. I think we have a greater chance of getting vendors to fully support the spec (3.1?) and thus rendering all formats properly.

Garth@All: Also a true fact.

Dave Cramer@All: What would happen if the "article" in B&N was in fact HTML with CSS absolute positioning? So Apple + Image in one EPUB?

Garth@All: Seems that could be.

Viewer 87@All: all formats properly? too HARD for one EPUB 3.x editor

Garth@All: Roger, get on that!  :-)

Roger@All: Sure, no prob. The way it works now you could just craft it to ignore the CSS abs pos in article view anyway.

Dave Cramer@All: Interesting to think of bitmap as fallback from CSS abs. positioning, or vice versa.

Viewer 87@All: make sure one editor could accomplish the proposed solution....doubt.

Brady Duga@All: May use the same scheme to describe regions

Dave Cramer@All: @87 by editor you mean tool to create EPUB?

Brady Duga@All: [clap](clap.md)

Roger@All: Right -- that's my thinking (same scheme)

Viewer 87@All: YA...we only consider rendering, but ignore the difficulty for editor

Brady Duga@All: Bye!

Garth@All: Thank you all!

Dave Cramer@All: Sleepy time...

Roger@All: Cheers!

Garth@All: Night!

Dave Cramer@All: Thanks all!