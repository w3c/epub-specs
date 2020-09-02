This page gathers pros and cons for the various solution options to [Issue 75](https://code.google.com/p/epub-revision/issues/detail?id=75) (video codecs) and [Issue 96](https://code.google.com/p/epub-revision/issues/detail?id=96) (audio codecs).



# Solution Options - Video codecs #

## Option #1: "Stay the course," require Reading Systems that support video to support H.264 encoding ##
[Issue 75](https://code.google.com/p/epub-revision/issues/detail?id=75)

### Pros ###
  * Interoperability assurance for content creators
  * Currently adopted by many leading platforms
  * Evolutionary outcome building on the success of proven video standards
  * Open source and commercial software support
  * Good hardware support in common application processors
  * RTP-based streaming support already an IETF standard (RFC 3984)
  * MPEG-4 container supports subtitles via MPEG-4 part 17 or ISO/IEC 14496-17:2006

### Cons ###
  * Web video formats on the Web are changing rapidly, with no obvious single cross-platform, cross-device standard
  * Presumption that eventual "winner" will be H.264
  * H.264 is patent encumbered and license fees apply
  * Any "not yet known" patents and license fees can't be planned for
  * EPUB will not drive HTML5, and we run the risk of being wrong
  * Not currently adopted by all leading browser vendors
  * Technical superiority/equivalence of H.264 versus other possible encodings is unknown

### Commentary on #1 ###

## Option #2: "Switch horses," require Reading Systems that support video to support WebM encoding ##

### Pros ###
  * Interoperability assurance for content creators
  * WebM is available under a non-royalty bearing BSD-style license
  * Currently adopted by some leading platforms
  * Open source software support
  * Hardware support announced or available in some application processors

### Cons ###
  * Web video formats on the Web are changing rapidly, with no obvious single cross-platform, cross-device standard
  * Presumption that eventual "winner" will be WebM
  * Any "not yet unknown" patents and license fees can't be planned for
  * EPUB will not drive HTML5, and we run the risk of being wrong
  * Not currently adopted by all leading browser vendors
  * Could currently be considered "less" adopted than H.264
  * Non-royalty bearing BSD-style license is not equivalent to indemnification
  * Enjoys less hardware support in current common application processors
  * Technical superiority/equivalence of WebM versus other possible encodings is unknown
  * RTP-based streaming still an IETF draft
  * Current WebM (associated container format) release does not support subtitles

### Commentary on #2 ###

## Option #3: "Follow HTML5," do not require support of any particular encoding for video content ##

### Pros ###
  * In line with current proposed HTML5 direction
  * EPUB 3 in unlikely to get out of sync with HTML5 going forward
  * Avoids making an encoding choice with insufficient data
  * Allow future versions of EPUB to adapt to then-current landscape, without legacy requirements

### Cons ###
  * Content creators do not know a single encoding target
  * Possible lack of Reading System interoperability
  * Content creators will need to encode multiple video encodings for maximal interoperability of content

### Commentary on #3 ###
  * (MGy) _note re "In line with current proposed HTML5 direction": this issue was very contentious in the HTML5 WG, making this a "pro" here seems to ignore that within the HTML5 community, many people consider the failure to settle on codecs as a failure, and that for interoperability purposes we should avoid inheriting this scenario_

## Option #4: "Ride two horses," require Reading Systems that support video to support at least one of the H.264 and WebM encodings ##

### Pros ###
  * Legitimizes what appears are the current two most likely "winning" encodings
  * Interoperability assurance for content creators (if both encodings provided)

### Cons ###
  * Presumption that eventual "winner" will be H.264 or WebM
  * To achieve full interoperability, two encodings for videos must be included in content
  * EPUB will not drive HTML5, and we run the risk of being wrong
  * Technical superiority/equivalence of H.264 or WebM versus other possible encodings is unknown

### Commentary on #4 ###

## Option #5: "Ride two horses for real," require Reading Systems that support video to support both H.264 and WebM encodings ##

_H.264 and WebM are both Core Media Types, and video-capable RS conformance requires support for both of them_



# Solution Options - Audio codecs #
[Issue 96](https://code.google.com/p/epub-revision/issues/detail?id=96)

_TBD_