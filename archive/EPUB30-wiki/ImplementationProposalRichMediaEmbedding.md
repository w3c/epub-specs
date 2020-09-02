## What this proposal covers ##

  * [RM-1](RichMediaAndInteractivity#RM-1._(A)_Video_and_Audio_embedding.md). Video and Audio embedding
  * [RM-3](RichMediaAndInteractivity#RM-3._(A)_Package_A/V_with_the_document.md). Package A/V with the document
  * [RM-4](RichMediaAndInteractivity#RM-4._(A)_Stream_A/V_from_a_server.md). Stream A/V from a server
  * [RM-16](RichMediaAndInteractivity#RM-16._(A)_Fallbacks_based_on_capabilities.md). Fallbacks based on capabilities

## Proposal 1 ##

Use HTML5 audio, video, and source elements to embed audio/video streams in the OPS content. HTML5 defines attributes that provide limited control over how video/audio is handled (autoplay, loop, and controls). It also provides source element that provides a set of capability-based fallbacks. Unlike other OPS element, audio and video elements should be specifically allowed to reference external content, providing a way to stream content from the server.

If HTML5 spec is not ready in time, we can take these 3 elements in ops namespace.

Note about video/audio accessibility:

The "track" element from HTML5 should be considered for inclusion, because it would allow EPUB authors to incorporate captions and audio descriptions as part of the fileset or as external resources, which saves having to (re)-encode the audio/video containers to embed the accessibility tracks within their binary streams (whether captions are open or closed...the point is: there are distinct advantages to out-of-band captions versus media-embedded captions).

Please read more about "track" here:

http://code.google.com/p/epub-revision/wiki/HTML5Subsetting#Comments_about_HTML5_Video/Audio