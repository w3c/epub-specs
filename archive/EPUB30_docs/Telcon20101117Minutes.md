

# Topic: Previous action items #
Guide/NCX: guide is likely to be deprecated, look to NCX to supply similar functionality, near term update

Page-progression declaration being worked into spec, appear in svn soon. follow-up next call.

# Topic: Video Formats #

lots of list discussion, proposal on wiki from King Wai

http://code.google.com/p/epub-revision/wiki/ImplementationProposalRichMediaFormat

concensus around the language of '**may** support rendering of audio / video, not required to support. If supports audio, **must** support MP3 - video TBD.'

mgylling: Garths bullet with Ryans mod:

  * A Reading System (RS) may support "rendering" of audio
  * A RS may support "rendering" of video
  * If a RS does support rendering of Audio, one of the audio format it **must** render is mp3
  * If a RS does support rendering of Audio, it may render audio formats beyond mp3
  * If a RS does support rendering video, one of the video formats/contains it **must** support is MPEG-4/H.264/AAC
  * If a RS does support rendering video, if may render video formats/containers beyond MPEG-4/H.264/AAC

Vlad: it should be MPEG-4 AVC / h.264, AAC is an audio format

BillMcCoy: I recommend mP3 for audio, and h.264 "per HTML5/browser usage" for video, with whatever that means about MPEG4 & container and audio inside it TBD

# Topic: CSS WG / Liaison / CSS Writing Modes / Text #

Fantasai: progress on vertical text is being made

Makoto: will hold EGLS irc conf re: CSS Text, introduce concept of idpf- prefix, details to follow

Fantasai: logical properties: concerns in CSS WG - large number of properties, confusion to authors, no use case

# TOPIC: WOFF #

http://groups.google.com/group/epub-21-working-group/browse_thread/thread/7a405a69d4becb12

BillMcCoy: a major use case for HTML is HTML email - this is the same as EPUB so if WOFF is ok for HTML email then' it's OK for EPUB

BillMcCoy: because email is HTML packaged with resources for offline use
much discussion re: woff pros/cons.

Lengthy discussion re: issues regarding need for woff, suitability of woff for epub, authoring workflows, what is embedded vs. linked, distinctions between woff/opentype

BillMcCoy: InDesign does not know anything about font subsettability, at least I recall we just decided to give the check box and somewhere provide a text string that fonts should be used according to their licenses

WOFF outcomes: Peter will continue discussion internal @Adobe, topic will be revisited with broad stakeholder input.


# Attendees #
wen-hsuan, Takeshi, Si-Wei, DaveGunn, jtallent, ericgnyc, gc, fantasai, ChoChin,

DanHughes, Kyoji, kingwai, Norm, kennyluck, James\_Pritchett, RogerWebster,

marisa\_demeglio, BillMcCoy, jtchen, MM, EricGold, Brady, NeilS, EricMuller, ShuTanabe,

Ryoji\_Akimoto, Vlad, EricFreese, SteveKotrch, Mei-Li, mgylling, wmanis,

BillKasdorf, Peter Sorotokin