# Present #

  * Kevin Ballard, Apple
  * Alan Cannistraro, Apple
  * Garth Conboy, Google
  * Casey Dougherty, Apple
  * Brady Duga, Google
  * Dean Jackson, Apple
  * Takeshi Kanai, Sony
  * George Kerscher, DAISY
  * Bill McCoy, IDPF
  * Frank Rubino, Kaplan Publishing
  * Peter Sorotokin, Adobe
  * Toby Stevenson, Ebook Architects
  * Ted O'Connor, Apple
  * Roger Webster, Barnes & Noble

## Regrets ##

  * Keith Fahlgren, Threepress
  * Liza Daly, Threepress

# New Action Items #

  * ACTION: Apple/iBooks team to draft reading system name/version detection for JS
  * ACTION: Peter to draft text pointing out security issues (I think - wasn't captured in the minutes. Let me know if I am wrong)
  * NO action: Additional JS API
  * NO action: Keyboard events

# Minutes #

`[`Very noisy line at first, George got it fixed. Also, a lot of unfamiliar voices, so names are probably wrong. Correct as necessary.`]`

## How to make scripting work in paginated context ##

**Peter:** We don't specify how scripting should work in paginated use, when applied to chapter content
Hard to say we are standardized in that case.
A proposal was made to forbid scripting entirely.
Peter agrees, since it is a poor standardization practice (not specifying how it works).
Why do we need it, and what is expected? Anyone?

**Frank:** Use cases?

**Garth:** Cookbooks with unit sizes, children's content, etc.
Prefers should not for chapter level content.

**Peter:** Can see the use cases, but not how we standardize on it.
It does not seem to be interoperable.
We should discourage it (should not) and leave it as an extension.

**Dean:** Use cases any UA should be able to handle
  1. Stamp on any page
  1. Childrens book that asks for your name, then re-uses it in the story

**Peter:** Browser RS can be scrollable or paginated.
A paginated RS on browser needs DOM manipulation.
Not presenting original DOM, just doing a single page at a time.
You can try to preserve the DOM, but you lose things when doing that (and it's not how it is done)
Apple is in a privileged position (private APIs)

**Dean:** Yes, it would be difficult to implement in WK on iOS.
Why does iOS matter?
In iOS, we understand that WK access is bad, but hope to open it at some point, but there are technical hurdles to clear.
Asks Peter what he wants (no scripting?)

**Peter:** No, I want some

**Garth:** Scripting is allowed. Expected to have predictable results. What do we say if a spine level item has scripting (should not, should, etc)

**Dean:** If it's not a must, then it seems discouraged. Is a "may" ok?

**Garth:** Must is bad, not interoperable

**Dean:** Not a must, agreed

**Peter:** We are only talking about the class of RS that supports scripting.

**Dean:** I could go on listing use cases...

**George:** Go ahead

**Dean:**
  1. textbook that preps for an exam. There is a quiz at the end, presents a tally at the end to show how you've done. Could be in an iFrame, but they need to be tied together.

**???:** Might want to suppress irrelevant chapters (so, textbooks might be targeted at a specific region), or a guided subset.

**Frank:** Agree (want that).

**Peter:** That breaks all sorts of things (like notes, searches, etc)

**Ted:** So? You still have to deal with display none

**Dean:** Same problem with iFrame

**Peter:** Yes, same issues, but makes corner issues main stream

**Dean:** The problem is with native features (e.g. bookmarks)?

**Peter:** Yes. Not inherently irresolvable, but it is not the time to standardize. Lets experiment, but don't tell authors it will work everywhere.

**Dean:** Could modify things to break the book. Same thing can happen on the web. Yes, it's dangerous, but it is also powerful.

**Peter:** Also note, the web doesn't have annotations. So we have other issues the web doesn't have.

**Dean:** How do annotations work?

**Peter:** They are not part of ePub, separate. Not part of the standard.

**Dean:** Do they reference into the ePub?

**Peter:** Yes, we are working to standardize that now. You need to have something to reference.

**Dean:** What happens when you start getting books that are just a giant iFrame?

**Peter:** It won't paginate

**Dean:** Sure it will, or could.

**Peter:** Yes, but it is not interoperable. Don't want people to find loopholes. Just want to send a clear message to authors and RS to explain what is required/expected.

**Dean:** Either need to disallow everywhere or allow everywhere

**Peter:** Do you agree/disagree with this: Anything done for iBooks will just work in ADE?

**Dean:** Sure, it should work.

**Peter:** This is not a browser

**Dean:** Why would a script that allows you to scribble on a page break anything?

**Peter:** The RS may break up the DOM and saves them in bits.

**???:** spec says use fallbacks in that case.

**Peter:** No, the spec says it must not break the book.

**Dean:** What is breaking is that you are mucking with the DOM (the RS), so a script can't rely on it?

**Peter:** Yes.

**Dean:** A small space where I can scribble my name is not a problem. Is this how most people are doing it?

**Alan:** Can't you just do this with a big, wide page that uses columns for paging?

**Peter:** Yeah, that's what Monocle did. They moved away from it because they couldn't add value.
Needs to manipulate DOM. Places severe constraint on RS by scripting DOM.

**Dean:** Yeah, but it's even worse if you don't allow it.

**Peter:** But it's the way it works today. RS manipulate the DOM. In the future it might become possible to standardize it. ePub is about docs, scripting is about apps. Also, the W3C model is not well-defined for paginated content.

**???:** If we allow spine level scripting, we need to make it clear it may not work

**Peter:** Need to provide a way for the RS to allow for experimenting

**Frank:** Agree, wanted that to by the outcome of this call.

**Dean:** Don't make it based on browser engine, whatever you do!

**Peter:** Sounds like an action item to propose such a thing.

**Dean:** window.epub.allowsDOMManip/allowsTouches/etc

**Peter:** So, does someone want to really propose that?

**Dean:** How does the group work? `[`i.e. who can do it/how`]`

**Peter:** It's pretty open. Will forward details.

**Dean:** Is this a big change for the spec? Scripting would now be allowed.

**Peter:** Not really the case, we just got a report asking for it to be forbidden. `[`ed note: This doesn't seem to make sense. I expect it is a scribing error. Sorry.`]`

**Dean:** Happy to make proposals and work with the community to get scripting useable.

**Peter:** Formulating this is pretty tricky (hitting all capabilities).

**???:** Just identity strings might be best for now.

**Dean:** Problem is people want to write these books now.

**Peter:** Do we want identity strings?

**Dean:** Could we just add it to Window? Browser RS could add it themselves.

**???:** Just stick it on window. "window.readingSystem"
Make sure we break out name and version (e.g. iBooks is RS, never changed by version)

**???:** iBooks team will do a first draft. `[`ed. note: w00t!`]`

**Peter:** We only got 1 of 4 topics done, and we are at an hour. Can we continue?
Remaining topics:
2. do we have additional APIs? For instance, window.scroll - do we scroll to an element?
3.  Keyboard events
4. security

`[`ed. note - scribe had to switch rooms, hopefully nothing was missed`]`

## Additional/Changed APIs ##

**Peter:** ScrollTo x/y- how does it work? Do we go to w3c and resolve it? Probably won't get done.

**Dean:** Yeah, lots like that will be unresolved. Maybe for now leave it undefined. Work with W3C over time.

**Peter:** Need implementations before we standardize it. Propose we don't define it, don't add anything to the existing W3C model.

## Keyboard events ##

**Peter:** Don't see how we resolve it. Say arrow key changes pages - what happens when a script grabs that key event? One possibility for frame based scripts, once frame gets focus the iFrame gets the key events Click on it, all web events go there.

[if you need a key to change focus](Problem.md)

Probably need to key off device type.

**Someone who was not Frank:** If a RS can, then give content first dibs (when you can). If an arrow is only way to turn pages, don't hand it to content. You would need to test everywhere.

**Peter:** I would rather keep silent.

`[`general agreement? Sounds like it`]`

## Security ##

**Peter:** Important for browser-based RS.

**Dean:** Also for custom RS. A trojan horse is always a trojan horse.

**Peter:** Do we want to talk about it in the spec?

**Dean:** Yes, we should mention some of the security concerns.

**Peter:** So, just make people aware of them?

**Dean:** Yes, there's not much you can do to resolve them, but you should point them out.