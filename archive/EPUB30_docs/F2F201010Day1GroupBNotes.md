Group B: RichMedia, StylingLayout, EGLS (Coordinator: Brady)

# Scripting Implmentation Proposal #

Defined in ScriptingImplementationProposal. Described by Peter S.

Two classes of OPF content resources:

  * Non-scripted OPS3 Content: Processing model is defined in OPS 3 (not HTML5)
    * May reference (`iframe`, `object` references as usual, fallbacks required)
  * xHTML5 Content with Scripting: Processing model is defined in HTML5
    * If this xHTML5 content is reference from the `spine` it will be implementation-dependent on how this is processed
    * MAY limit OPS3 features.

Each resource `item` MUST specify which of the two classes of OPD content resource the referenced uses.

Rough consensus of support reached. Will discuss at WG.

# Text Audio Sync Implementation Proposal #

Defined in ImplementationProposalTextAudioSync. Described Marissa D.

Required changes:

  * Add `item` referencing SMIL file(s)
  * Specify correspondence from `itemref` to one and only one SMIL using `audio` attribute
  * Define a schema for a subset of SMIL (3.0?)

SMIL 3.0 subset:

  * SMIL file will reference a specific element in the targeted text content using IDs or other fragment ID techniques TBD

This Implementation will use the same techniques for element references as the rest of EPUB3 (Annotations, for example)

Styling:

  * Reading Systems should set and unset a specific CSS class (`audio-active`) to each element as the related audio is played back.

`role` attribute:

  * SMIL files will use the same `role` attribute (or whatever, TBD) for defining semantics as text/other content

Commentary:

  * MAKOTO & others are not entirely comfortable with `#xpath()`/XPointer
  * Peter S feels that the `audio` attribute may need to be renamed to `smil` or `timeline`
  * Peter S feels that we should move to a psuedo-class

Rough consensus of support reached. Will discuss at WG.

# Triggers Implementation Proposal #

Defined in ImplementationProposalTriggers. Described by Peter S.

Reading Systems need a declarative way to start and stop multimedia in Non-scripted OPS3 Content. This allows a set of buttons wired to start/top a unit of multimedia (potentially SMIL too?).

The alternative is declarative audio/video in an xHTML5 sub-context.

"Triggers" are in many ways "controls."

Bill M wonders if this is substantially better than the audio/video attributes defined in HTML5.

Adobe has already developed a similar type of declarative markup for magazine interaction.

Rough consensus of support reached. Will discuss at WG.

# Pronunciation and Audio Implmentation Proposal #

Defined in ImplementationProposalsPronunciationAndAudio. Described by Peter

Covers TR5 (Synchronized audio pitch adjustment), TR7 (optional "phonetic transcription"), and TR8 (repetition).

## TR5 ##

Reading Systems should allow the adjustment of speed & pitch. These adjustment are declared in the content using either:

  * CSS 3.0 Speech
  * SSML `prosody` element's `rate` and `pitch` attributes

CSS 3.0 Speech module is very old and never reached Recommendation. SSML is a Recommendation.

Peter S worries that this adds a lot of complexity

Daniel W adds that we may want to consider SSML for solving other issues.

Rough consensus of support not reached. This has already been solved OPS 2.0.

## TR7 ##

An optional "phonetic transcription" for Bopomofo, etc.

Three alternatives:

  * Strong objection to `lang`. Should be discussed either in an EGLS or TextContent subgroup?

Discussion tabled; Markus already submitted proposal using PLS as part of TextContent.

## TR8 ##

Repetion of audio.

Solutions:

  * 1: Multiple HTML5 `audio` elements for repetition: Rejected, as it will not play in order but instead will play concurrently
  * 2: Use SSML `speak`, `audio`, and `repeatcount`: This adds TTS support

Peter S is concerned that this may be out of scope. Daniel W agrees.

Raise to group discussion with recommendation of defer.


# Embedding Rich Media Implementation Propsoal #

Defined in ImplementationProposalRichMediaEmbedding. Described by Peter S.

Subset of HTML5 alignment. This tries to more explicitly clarify the inclusion of `audio`, `video`, and `source`. What about `track`?

## Track element ##

Daniel W clarifies that the W3C version of HTML5 does include support for `track`, which is designed for text captions and audio descriptions. The WhatWG version does not. It appears to be underspecified at this time. `track` may solve the caption issue, but the format for the captions themselves is not known.

Peter S requests that someone volunteer to forward, research, and solve this requirement for captions.

The big danger may be choosing a captioning format too soon.

Rough consensus on inclusion of `audio`, `video`, and `source`.

Geoff F will try to handle the track element, which needs more information.

# Separation of Data and Code Implementation Proposal #

Defined in ImplementationProposalDataAndCodeSeparation. Described by Peter S.

The problem is that scripting may make it easier to over-use scripted data rather than including the content declaratively. What can we do to provide techniques to authors to keep as much data declarative rather than in the script.

Peter S is concerned that scripts will be used to implement custom content types.

## Scoped widgets ##

FIXME

OPS processor reads an media type from an object tag
it adds a list of media types that may be processed in an `iframe`

`object` will be reference to the data
based on the media type there is
for a scoped widget, the Reading System opens an HTML5 context (iframe)
a Reading System may have a specialized viewer for this data type

The fallback might be

The EPUB3 might include an _implementation_ of a reader for specific data types, which is an XHTML file with scripting that accepts the (original) data `src` as an attribute.
