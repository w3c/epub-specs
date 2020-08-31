# Guidelines (DRAFT) #

## Guideline 1: Use Plain Text ##

Avoid sending HTML email messages, unless duly justified by formatting or composition requirements (images, hyperlinks, colors, fonts, text alignment, etc.).

## Guideline 2: Avoid Special Characters ##

Some symbols, such as currency signs, are not always handled properly by assistive technology. Try using simple ASCII equivalents wherever possible.

## Guideline 3: Craft Prose For Tonal Purposes ##

Be sufficiently verbose to convey emphasis (or other tonal variations) through words rather than special formatting, for example using prefixes such as "please note:".

## Guideline 4: Emphasize With Markers ##

When using text formatting rather than pure prose to convey emphasis, do not use all-upper-case as this may be confused with acronyms, or may be perceived as "shouting". Instead, use before/after markers such as the underscore sign ('`_`') or the star character ('`*`') on either sides of a word or sentence. For longer sentences, adding emphasis with XML-like markup tags is acceptable too.

## Guideline 5: Use Textual Smileys ##

Try to express feelings or moods using keyword equivalents to the common smiley face ASCII arts. For example, use "(smile)" instead of ":)", or "(wink)" instead of ";)".

## Guideline 6: Use End-Of-Message Cue ##

In case more text is present below your reply message, make sure to place a recognizable text cue at the end of your reply (usually a name and a polite formula), so that screen-reader users are aware of the message boundaries and do not go through unnecessary prose.

## Guideline 7: Quote With Markers ##

The most common plain-text quoting method used by most email clients is based on prefixing lines of quoted text with a forward angle bracket '>'. The resulting text is reasonably accessible to assistive technology users, and it is specifically parsed by some online email archives (such as Google Groups) in order to enable automatic hiding and folding of discussion threads. This is therefore the preferred method.

Alternative marking methods based on recognizable and consistent XML-like opening and closing tags are acceptable too (for example, `<steve>...</steve>`).

## Guideline 8: Quote First, Then Respond ##

Place the quoted message first, so that context is given before the response.

## Guideline 9: Split The Response ##

When replying to a sequence of individual points, split the quoted original message and insert replies within the blank lines.

## Guideline 10: Quote Selectively ##

When responding to a specific issue, only quote the relevant part of the original message, so that readers are not forced to scan through unnecessary prose.

If the original message is trimmed to the extent of removing non-trivial context, leave a full quote of the original message below your "signature" (or any other sign-off line), as this may be useful retrospectively (e.g. when going through archived email messages).

## Guideline 11: Double-Check Email Subject Line ##

Prefix email subject lines using the required keywords enclosed in square brackets "`[ ... ]`" (for example, when an email is aimed at a specific sub-group of the whole working group). Convey as much meaning as possible via the subject line, avoid short, ambiguous statements. Rename the subject line when necessary, for example when the topic of a discussion thread changes (note that most email clients and online archival systems are able to link related messages despite the change of subject line).

## Guideline 12: Use One Topic Per Email ##

Be specific about email content (and subject line), avoid mixing several topics (write separate emails).

## Guideline 13: Use Appendix For Hyperlinks ##

When inserting web hyperlinks within email in plain text format, avoid interspersing the actual link addresses within text prose. Instead, use a referencing system based on numbered entries located at the end of the message, normally after the signature or polite exit formula. For example, write "refer to this link `[1]` for further information" and place the corresponding hyperlink address at the bottom of your email: "`[1]` `http://example.com`". Most email clients will automatically make the link clickable, so HTML formatting isn't necessary. Note however, that email clients tend to break long link addresses, so use URL shortener services if necessary. Make sure that long links occupy whole lines, without any text before or after (in the example given above, insert a line break after "`[1]` ").

## Guideline 14: Use Bulleted Lists ##

Organize your points into lists, by prefixing lines with plain-text markers such as the star '`*`' or dash/hyphen  '-' character. Numbered lists can be authored using a consistent prefix such as a number followed by a right parenthesis. Insert blank line breaks between list items when text density compromises readability.


# Why We Need Best Practices For Email Communication #

A particular email discussion thread within the EPUB Working Group involved a quoting method based on colors instead of the usual "leading angle bracket" (or other editing practice based on plain text markers or tags). This resulted not only in lack of accessibility for persons with visual impairments (e.g. screen reader users), but also in readability breakage for sighted users, due to the Google Groups archiving system displaying only plain-text messages, and not being able to "fold" quoted text because of the absence of citation markers within the prose.

A warning flag was consequently raised (see link below), which prompted a consensus to publish and use some form of emailing guidance. It is quite clear that the quality of the public email archive is important, so that retrospective readings of discussion threads lead to a clear understanding of what member was/is in favor of what side of an argument. Furthermore, it is common practice amongst other standards organizations to back-up formal decisions made within working groups by citing / linking to specific messages in the email archive (W3C being a prime example).

This information in this wiki page aims at compiling relevant guidelines, possibly by pointing to already-established standards or practices published by other organizations.

Link to archived email discussion raising the issue of email accessibility and readability:
  * http://groups.google.com/group/epub-21-working-group/browse_thread/thread/f02deaf7c16677ba

# Existing Guidance #

This is by no means an exhaustive list of existing guidelines, but it should contain enough material to help defining a substantive set of emailing rules to meet the needs of the EPUB Working Group.

Note that one requirement is to keep the recommendations short (eventually it should all boil down to a simple but effective list of rules), so that they can be easily digested and realistically implemented by the mailing-list participants.

## RNIB ##

Email formats and accessible HTML emailing:

  * http://www.rnib.org.uk/professionals/accessibleinformation/electronicdocuments/email/Pages/formats.aspx
  * http://www.rnib.org.uk/professionals/webaccessibility/articles/Pages/html_emails.aspx

## BBC ##

This document is not so much relevant in terms of its contents, but more because of how it is structured and how it uses "MUST" "MAY" keywords ( http://tools.ietf.org/html/rfc2119 ):

  * http://www.bbc.co.uk/guidelines/futuremedia/technical/email.shtml

## Text Email Newsletter (TEN) Standard ##

  * http://www.headstar.com/ten/tens-1.2.txt

## DAISY ##

_(this is a draft by George Kerscher & Gregg Vanderheiden, edited by Daniel Weck to meet wiki formating requirements)_

**Discussion List Protocols and Etiquette**

After many years of participating on discussion lists, several suggestions pop up time and time again.  We have tried to capture the most common recommendations that can be used as suggestions for discussion list guidelines.  The guidelines are listed first as a short list followed by more information on each.

  1. Keep the discussions friendly. Use `(grin)` and `(smile)` in your email if tone could be mistaken. Don't use `:-)`.
    * _Rationale_: This helps clarify intentions and is an aide to communication.
    * _Tip_: Sometimes people will use colons and other punctuation to do this. Screen readers do not work with ASCII art like `:-)` so spell out `(smile)` or `(wink)` etc as words.
  1. If you change topics - change the Subject Line.
    * _Rationale_: Automatic Threading software in the archive will start a new thread. It is also easier for people to follow a topic of interest by reading the subject line.
    * _Tip_: It is possible in many email packages to sort subject and by date. This allows you to read the messages about a certain subject in the order as they were posted.
  1. Try to include just one thought topic per email.
    * _Rationale_: This allows the discussion on the list to focus on one idea.
    * _Tip_: Send multiple messages to facilitate response and threading.
  1. Delete any unnecessary or unrelated lines from the original message. Retain information necessary to follow the thread.
    * _Rationale_: This means there will be less information to wade through. Remember some people are using screen readers and they must read each line to find the relevant information.
  1. If new text is inserted within the body of the Old message, mark all new text with author's initials enclosed in angle brackets, e.g. `<GV>`  or `<GK>`. At the end put: `</gv>` or `</gk>`). BE CONSISTENT so that a person using a screen reader can use text search to find all your comments.
    * _Rationale_: In long messages, there may be only a few lines of comments.  People who use screen readers cannot glance over the message to find the comments.  Each line has to be heard to determine if a comment is present.  (Many times a person using a screen reader hears, "greater, greater.." hundreds of times.)  The angle brackets borrowed from XML are used to ensure uniqueness and to allow a user to jump from the beginning of one person's comments to the next by searching for the angle brackets with initials.
    * _Tip_: Mention at the top of your message that you have surrounded your comments within your initial tags.  Show this at the top and suggest searching for the start tag.
  1. Do not use indenting to show organization of thought or material unless you also include Outline Labels such as `1,2,3` and `a b c`, or full word labels.
    * _Rationale_: Spacial indenting is not detected by persons using screen reading packages.  This is a form of visual formatting.
    * _Tip_:  For example this memo properly uses both indents and labeling to indicate organization.
  1. Put two blank lines before titles to make them easier to find both visually and via search.
    * _Rationale_: Paragraphs are normally separated by one blank line. Having two blank lines causes screen  reading packages to say "blank" twice.  Most packages new email packages also let you search for the triple carriage return.  The extra white space is also helpful for persons with low vision.
  1. Send these recommendations to new list subscribers. (And repeat as necessary).
    * _Rationale_: These recommendations are not in common use and this will help the list to be a disability user friendly list.