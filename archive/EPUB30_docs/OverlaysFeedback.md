Applies to: http://epub-revision.googlecode.com/svn/tags/20110215/build/spec/epub30-mediaoverlays.html

Trunk (most recent, actively-edited)  version: http://epub-revision.googlecode.com/svn/trunk/build/spec/epub30-mediaoverlays.html



# Generalities #

## Multi-lingual overlay ##

At present, we can have only one overlay document per html content
document, and each par element
can reference to a single audio or video file.  It makes sense to
prepare multiple audio or video
file: one for each natural language.

If we use external video or audio files, we can already provide
multiple audio or video files
per par element by using content negotiation of HTTP.  But if we use
local files, I don't think we can.

| _DANIEL_: [Issue #15](https://code.google.com/p/epub-revision/issues/detail?id=#15) already records this "wishlist" feature. We reviewed the pros and cons of various "switch"-based proposals, but didn't reach a consensus. We need to fully comprehend the design requirement, particularly when an EPUB publication bundles several narrations in different languages (i.e. mutually-exclusive audio tracks that can be switched on/off based on user language or other system setting). See [issue 15](https://code.google.com/p/epub-revision/issues/detail?id=15): http://code.google.com/p/epub-revision/issues/detail?id=15 Also see this email discussion: http://groups.google.com/group/epub-21-working-group/browse_thread/thread/5cb97d2ba56a4ce2# |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: It is correct that Media Overlays does not include the ability to represent multiple alternate media files.  Some experiments were done for this, but not incorporated into Media Overlays due to complexity and low interest. If there is sufficient interest, we could revisit this issue (use cases are welcome). |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARKUS_: One main question is if the use cases that drive this include the ability to switch also on the language of the text element, not just audio. While [Issue 15](https://code.google.com/p/epub-revision/issues/detail?id=15) talks only about switching audio, it seems to be a very specific case that AFAICS does not suffice to cover the more general use case of "User language preference". |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|


| _MURATA_: I raised this issue but do not strongly think that this feature is needed for EPUB 3.0.  |
|:---------------------------------------------------------------------------------------------------|


## T2S ##

Is it possible to use T2S (rather than recorded audio) as part of
media overlay?  In my understanding,
we simply cannot.  I think it makes sense to allow the omission of
audio elements for textual HTML
elements and allow implementations to do T2S.

| _DANIEL_: support for TTS (Text To Speech) is already enabled in EPUB 3 via PLS (W3C Pronunciation Lexicons), some CSS3-Speech properties, and inline SSML phonemes attributes. Media Overlays, on the other hand, is designed specifically for cases when TTS is not suitable or not available (conversely: where pre-recorded audio narration is preferable or needed). We did not consider allowing the 2 approaches to be mixed, but this can be looked into (we would essentially need to relax the par/audio rules in the SMIL timeline, and describe the conformance requirements for reading systems that do have TTS support, and those that don't). |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: This is a good point.  We should look at accommodating TTS in a similar way to embedded audio, where our restrictions on the par element allow for a lone text element child if and only if the target of @src is an audio, video-with-audio, or TTS-friendly text. |
|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|_MARISA_: This was added as [Issue 97](https://code.google.com/p/epub-revision/issues/detail?id=97) |
|:---------------------------------------------------------------------------------------------------|

# Throughout #

This specification allows synchronization of audio and XHTML, which in
turn may contain image, graphics, audio and video.  But very many
places in this specification are misleading.  For example,

- "synchronized text and audio publications" in 1.1,

- "An XML document that associates the text content of an XHTML
> Content Document with pre-recorded audio narration"
> in the def of media overlay document (1.3), and

- "this version supports only text and audio media" in 2.

Some people are already confused by these sentences and think that
media overlay cannot be used for manga (even when it is represented by
HTML containing JPEG files).

| _MARISA_: Agreed to change "text" to "EPUB Content Document". |
|:--------------------------------------------------------------|


Replace "user" by "User".

| _MARISA_: Done |
|:---------------|

# 1.1 and 1.2 #

Make clear that 1.1 and 1.2 are non-normative.

| _MARISA_: Done |
|:---------------|

1.1, the second para

We do not understand the 1st and 2nd sentences: "Although designed to
be usable in a variety of contexts, this specification does declare
certain normative requirements specific to EPUB Publications. These
requirements are marked as EPUB-specific where they are defined and
may be disregarded by applications that only conform to the content
and EPUB Reading System requirements of this specification. "

| _MARISA_: This para has been removed. |
|:--------------------------------------|

# 1.3 #

Terms for the entire EPUB3 family are covered in the terminology
sub-section, but terms specific to this media overlay specification,
skippability and escapability, are not covered.  The same comment applies
to other specifications in the EPUB3 family.

5) 1.3, the def of EPUB Publication (or Publication)

Replace "a EPUB" by "an EPUB"

|_MARISA_: Fixed in ./share/terminology.xml |
|:------------------------------------------|

# 2. #

1.1 and 2 should be merged.


| _MARISA_:  I see your point. We'll follow the lead of the rest of the EPUB specification regarding standard sections such as 1.1. |
|:----------------------------------------------------------------------------------------------------------------------------------|

# 2., the 2nd para #

Replace "W3C standard" by "W3C specification" or "W3C recommendation".

| _MARISA_: Done |
|:---------------|

# 2., the 3rd para #

"so the inclusion of Media Overlay Documents has no impact on the interoperability of EPUB Publications." is
a bit misleading, since there is an impact on the interoperability of media-overlay-aware reading systems.

| _DANIEL_: I think that the term "interoperability" should apply to implementations, not content. Here is a suggestion: "Since the Media Overlay of an EPUB 3 Publication can effectively be ignored by EPUB 3 Reading Systems that do not support the Media Overlay specification, content authored with a Media Overlay can be consumed as "regular" EPUB 3 Publications, without any prior content alterations. This means that EPUB 3 implementations, with or without support for Media Overlays, remain interoperable to a great degree." |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: Changed to: "The Media Overlays feature is designed to be transparent to Reading Systems that do not support the feature. The inclusion of Media Overlays in an EPUB Publication has no impact on ability of Media Overlay-unaware Reading Systems to render that publication as a "regular" EPUB Publication." |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 3.1 #

This (non-normative) subsection should be moved to 1.1 or 2.

|_MARISA_: We have decided to keep it where it is to preserve the flow of section 3 and to avoid having a long and overly technical introduction. |
|:------------------------------------------------------------------------------------------------------------------------------------------------|

# 3.1, 4th para #

Since IRIs do not allow relative references, use IRI references rather than IRIs.  The same change is
required for other locations in this document.

| _DANIEL_: indeed ==> http://rfc-ref.org/RFC-TEXTS/3987/kw-iri-reference.html (plain text: http://www.ietf.org/rfc/rfc3987.txt ) |
|:--------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: Done. Changed "IRI" to "IRI reference". |
|:--------------------------------------------------|

# 3.1, 6th para #

As the definition of fragment identifiers, reference to W3C XPointer Framework and allow shorthand pointers
only in this specification unless we would like to commit to other schemes.

| _DANIEL_: I agree that the XPointer Framework (W3C Recommendation 2003) - more specifically the shorthand notation ( http://www.w3.org/TR/xptr-framework/#shorthand ) - offers a stable definition for the encoding of our fragment identifier scheme. Also note that the escaping rules ( http://www.w3.org/TR/xptr-framework/#escaping ) are normatively referenced from the IRI RFC. |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 3.1, the para before last #

In the "EPUB3 publications" specification, "the default reading order"
is an order of content documents.  But in this subsection, it appears
to be an order of elements.

| _DANIEL_: The concept of "order" is also defined in the "nav" (ex-NCX) section ( http://epub-revision.googlecode.com/svn/tags/20110215/build/spec/epub30-contentdocs.html#confreq-nav-a ), and pertains to both the order of XML elements within a given EPUB Content Document (depth-first tree traversal), and to the order of files referenced in the spine. How can we harmonize this ? |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|_MARISA_:  To me, the difference is clearly stated within the scope of Media Overlays.  "Reading order" is mentioned in two places, and each place has a qualifier.  The spine definition (shared by all of the EPUB spec documents) states "the default reading order of the publication" whereas when we refer to the element reading order within a single document, we say "the default reading order of the EPUB Content Document".  Maybe we can suggest that a similar clarification clause be used in publications.  Would that suffice?|
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|_MARISA_: The wording in Nav and Media Overlays has been reviewed and agreed by Marisa and Daniel to be clear regarding references to reading order. |
|:----------------------------------------------------------------------------------------------------------------------------------------------------|

# 3.1, the para before last #

Explicitly state that some elements in the XHTML document are not referenced by
par elements.

| _MARISA_: Done.  Added: "Not every element of the Content Document will have a corresponding par element in the Media Overlay, only those relevant to the audio narration." |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 3.2.1 #

Mark the 2nd para as non-normative.

| _MARISA_: Done (but para@conformance is not reflected in the build, so the final HTML spec document does not indicate this change). |
|:------------------------------------------------------------------------------------------------------------------------------------|

# 3.2.2 #

Is 3.2.2 non-normative?  If so, mark as such.

| _MARISA_: Yes, done. |
|:---------------------|


# 3.2.2 #

Which specific tag is meant by "embedded media objects such as video
and audio"?  The object tag?  Or, the audio and video?  What is the
relationship between media overlay and the object tag of HTML5?

| _DANIEL_: we use the literal expression "media object" to mean 2 different things. The term we use to differentiate (albeit, not effectively-enough), is "embedded" ==> (("media object" inside SMIL)) "4.2.5 The seq Element", "4.2.6 The par Element", "7.1.2.1 Timing and Synchronization" AND (("media object" inside XHTML)) "3.2.3 Embedded Audio and Video", "7.1.3.2 Embedded Audio and Video". I suggest that "media object" is NOT used in the context of SMIL (alternative: "media element" ?). In the case of XHTML, "embedded" seems like an appropriate term, unless "inline" (or such like) is more suitable. Now, once we fix these terminology issues, the remaining problem is the ambiguity regarding the "object" XHTML tag. I suggest that the Media Overlay specification doesn't restrict support for "embedded audio" and "embedded video" only in terms of the "audio" and "video" HTML5 tags, but also in terms of the "object" tag. We therefore need to describe the behaviors generated by "embedded video" and "embedded audio" irrespective of the actual markup used. |
|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: Suggest to use "SMIL media element" to refer to SMIL audio and text tags, and "Content Document media element" to refer to XHTML audio, video, and object tags. This removes ambiguity regarding whether we're talking about SMIL or XHTML, and does not risk confusing media object with the XHTML object tag.  It also treats XHTML audio, video, and object tags as being in the same category, which should work for most purposes (we can clarify what we mean if there are cases when we only want to refer to XHTML timed media). |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|_MARISA_: The wording has been revised and now talks about Content Document audio/video/image in general terms.  I don't think it was an issue outside of this one section, so being more specific about SMIL vs XHTML media element (as I initially suggested) should not be necessary. |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 4.2 #

What does this sub-section try to achieve?  Is this a non-normative
summary of what is already specified in the W3C SMIL recommendation?
If so, mark this subsection as non-normative and drop all
EPUB-specific normative requirements.  If not, change the subtitle and
state that our media overlay is derived from the W3C SMIL
recommendation.

Furthermore, please clearly distinguish EPUB-specific restrictions
from SMIL.  I prefer normative references to SMIL possibly combined
with our own restrictions for subsetting.  Reformulating what is
already specified in SMIL together with our own restrictions make
complicate users and possibly introduce IPR issues.

| _MARISA_: This as well as the other comments about how to express our differences from W3C SMIL are under discussion. |
|:----------------------------------------------------------------------------------------------------------------------|

# 4.2.1 The smil Element #

Re: "Unlike the SMIL specification element from which it is derived,
the version used in Media Overlays does not require the inclusion of a
child head element."

I think that this is misguided.  We should not introduce such changes
while using the SMIL namespace and claiming that our work is a subset
of SMIL.

# 4.2.1, The smil Element #

"and/or" in "This attribute is optional except when the epub:type
attribute and/or meta element is used in the Overlay Document, in
which case its use is required."  is ambiguous.  Does this mean that
this attribute is required only when both the epub:type attribute and
a meta element exist?  Or, does it mean that it is required if either
this attribute or a meta data element exists?

| _MARISA_: It means that it is required when either epub:type or meta element is used, but it is also saying that they could both be used at the same time.  The use of "and/or" is to make sure that "or" is being interpreted inclusively rather than exclusively. |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|


# 4.2.1 The smil Element #

"For more information on the usage of the profile and prefix
attributes, refer to Semantic Inflection." is incorrect, since nothing
about their usage is stated in "3.3 Semantic Inflection".

| _MARISA_: I will add some prose about how the terms used in semantic inflection come from documents referenced by profile and prefix attributes. |
|:-------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: Done.  (changed link to point directly to Content Doc's "Semantic Inflection" section, as this perfectly addresses @profile and @prefix. |
|:---------------------------------------------------------------------------------------------------------------------------------------------------|

# 4.2.3 The meta Element #

Re: "The attributes and content model for meta in EPUB Media Overlays
differ from the [SMIL](SMIL.md) specification. SMIL meta elements have name and
content attributes, and an empty content model, whereas Media Overlay
meta elements have property and about attributes, and, optionally,
text content. "

I think that we should not introduce such changes as long as we use
the namespace of SMIL and claim that our work is a subset of SMIL.
Why don't we ask W3C to publish SMIL 3.1 and incorporate required
changes?

# 4.2.3 The meta Element #

Why do we need @dir?  HTML5 already has this attribute.

|_MARISA_: This attribute is for the optional text contents of the metadata item, for example, a title or author name, which may be RTL instead of LTR.|
|:-----------------------------------------------------------------------------------------------------------------------------------------------------|

# 4.2.3 The meta Element #

What does the text content of the meta elements represent?

|_MARISA_:  It is the value of the property given in @property.  Description updated. |
|:------------------------------------------------------------------------------------|

# 4.2.4 The body Element #

Is the value of the attribute epub:textref always a relative IRI reference?
Also state that this attribute reference to HTML content documents only.

| _MARISA_: I believe it could refer to an SVG image as well, although this hasn't been explored further than a few experiments I did.|
|:------------------------------------------------------------------------------------------------------------------------------------|

|_MARISA_: @epub:textref should always contain a relative IRI reference, just as the SMIL text element's @src attribute. |
|:-----------------------------------------------------------------------------------------------------------------------|

# 4.2.7 The text Element #

State that the src attribute is always a relative IRI reference.

| _MARISA_: Done. |
|:----------------|

# 4.2.8 The audio Element #

State that the src attribute may be an absolute IRI since we allow
references to external audio or video.

| _DANIEL_: I agree that we should be consistent with regards to allowing media assets to be located outside of the EPUB container |
|:---------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: Done. |
|:----------------|

# 6.1 #
## 6.1, the 3rd para ##

Re: "The media-overlay attribute must only be attached to manifest
items that reference EPUB Content Documents. The attribute must not be
attached to items that reference Foreign Content Documents as defined
in [Publications30](Publications30.md)."

This means that we can attach the media-overlay attribute to manifest
items that reference to SVG content documents.  This may be a good
thing, but is it intended?

| _DANIEL_: The Media Overlay specification describes a CSS-based method to highlight (inside the visual canvas) "pieces of content" that are active (in terms of the synchronization timeline authored in the SMIL document). The specification also describes expected behaviors when referencing embedded timed media, such as "video" or "audio" tags (such behaviors have implications beyond the visual canvas). In the case of SVG, the ":media-overlay-active" pseudo-class could be applied by renderers that provide CSS support, but it would of course be ignored by non-supporting SVG renderers. Maybe we should explicitly state that Media Overlays for SVG Content Documents is at risk of being non-interoperable, or we could use "MUST" for XHTML and "MAY" for SVG...which would have the same effect on implementors. |
|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: It should be easy to adapt Media Overlays for use with SVG, although special cases would need consideration, such as what we've done for content document media elements, so it is not likely that we will explicitly support this, as the list of special cases could be very long.  I like the idea of MUST/MAY as Daniel suggested. |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## 6.1, the 4th para ##

Re: "While not every manifest item is required to have a Media Overlay
associated with it, there must be a one-to-one relationship between
Media Overlay files and manifest items. Multiple EPUB Content
Documents cannot share a single Media Overlay file."

In our opinion, "one-to-one" is misleading.  Here is our rewrite:

> Not every manifest item is required to have a Media Overlay
> associated with it.  Multiple EPUB Content Documents cannot
> share a single Media Overlay file.

| _MARISA_: Done. |
|:----------------|

# 6.2 #

Audio or video formats may contain metadata.  Will such embedded metadata be ignored?

| _DANIEL_: My understanding is that Reading Systems are not required to process metadata inside media assets (only metadata declared within the markup files, for which required support is explicit) |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: Right.  There is no required support for metadata embedded in audio or video formats. |
|:------------------------------------------------------------------------------------------------|

# 6.2, duration #

Does it make sense to compute the total duration?  Or, should we
compute the total only for epub:type="chapter"?

| _DANIEL_: It is convenient for Reading Systems to be aware of the total Publication duration without having to parse and add multiple time values extracted from various SMIL files. By the way, as per content conformance requirements, content validation tools verify that the total duration is indeed equal to exactly the sum of each Media Overlay's duration (modulo reasonable rounding errors, just like how it is already done with DAISY content) |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: It's a player convenience that saves a bit of time for User Agents, and is easily calculated at authoring time.|
|:-------------------------------------------------------------------------------------------------------------------------|

# 6.2, duration #

Does this duration include the duration required for displaying audio
or video elements in HTML5 documents?

| _DANIEL_: Although this is a good point, it is actually not that simple, because "embedded" audio or video media (i.e. within XHTML documents) are subject to clipping rules imposed by the sibling "audio" element within a "par" container. In other words, the duration of "embedded" audio or video media objects may be truncated. We need to clarify the definition of duration based on this well-defined behavior. |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 6.2, narrator #

How can we specify names both in Kanji and Katakana (or Hiragana)?  What about BIDI?
How can we specify more than one narrator?

| _DANIEL_: Is this a common metadata issue in EPUB3 ? If yes, then let's migrate this issue to the relevant  place in our tracker (we can mention that Media Overlay needs fixing too). What about Ruby text ? |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 7. #

This section provides rather detailed information for straightforward
cases but shows little information for complicated case such as the
table reading mode.  Due to this unbalance, we are not sure if this
section provides very useful information to implementors.
Implementors can learn a lot more from existing DAISY implementations.

Moreover, some seemingly-obvious requirements shown in this section
might tie the hands of implementors and prevent them from creating
innovative user interfaces.

For example:

- Re: "When the Reading System loads an EPUB Content Document, it also loads the corresponding Media Overlay Document."

> Some reading systems might load the media overlay document only when the user hits the play button.

- Re: "When the Media Overlay Document has finished playing, the
> Reading System must load the next EPUB Content Document (as specified
> in the Package Document spine) ..."

> Some reading systems might play each content document repeatedly until the user
> hits the play-next-content button.

In our opinion, we should first clarify semantics intended by the
author and then provide use interoperability guidelines (SHOULD).  We
should not introduce conformance requirements (MUST or SHALL) when there
are no risks in data exchange.  Fidelity of different reading systems
may be a good thing, but it should be kept outside the scope of
normative requirements.

For example, we propose

> "It is the author's intention that all par elements in a media overlay
> document are rendered in the document order."

instead of

> "Reading Systems must render immediate children of the body
> element in a sequence. ... A seq element's children must be
> rendered in sequence, and playback completes when the last
> child has finished playing."

(By the way,  is this simply incorrect for  the table viewing mode)?

| _DANIEL_: in DAISY, special navigation modes **may** be triggered by the authored use of certain "class" values  ( http://www.niso.org/workrooms/daisy/Z39-86-2005.html#AutoInv ), but the nature of each individual navigation mode is described informatively outside of the specification (tables, for example: http://www.loc.gov/nls/z3986/background/navigation.htm#15.%20Tables ). In the Media Overlays specification, we need to add a MAY conformance requirement that allows Reading Systems to implement more sophisticated reading modes. |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: Removed sentence about loading Media Overlay Document. Changed MUST to SHOULD regarding spine-order playback.  As for the description of sequential playback, I think implementors would benefit from a description of SMIL mechanics rather than author intent. |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|


# 7. #

This section does not provide any information about table reading
modes.  Readings system designers have to innovate, and no fidelity of
reading systems is guaranteed.  If this is acceptable, why should we
bother to define behaviours of straightforward cases (such as
7.1.1. Loading the Media Overlay, 7.1.2. Basic Playback,
7.1.2.1. Timing and Synchronization, 7.1.2.2. Rendering Audio,
7.1.2.3. Rendering Text, and 7.1.3.1. Navigation)?

| _DANIEL_: My comment above applies to this as well. We need to add a MAY conformance requirement that allows Reading Systems to implement more sophisticated reading modes, but I think it is sane to describe a baseline set of conformance requirements, so that Reading System implementation are interoperable relative to a certain degree of fidelity (which we define normatively in the specification). |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: Would it be a good idea to include an informative example of a table and description of corresponding user agent behavior? |
|:-------------------------------------------------------------------------------------------------------------------------------------|

## 7.1.2.1 ##

Most of this subsection (e.g., the 1st and 2nd sentences) is already
stated in preceding sections, and should be removed.  The rest should
be reformulated as intended semantics or interoperability guidelines.

| _MARISA_: Removed the first two sentences. Need to consider how to reformulate. |
|:--------------------------------------------------------------------------------|

|_MARISA_: Remaining text refers to timing behavior guidelines for reading systems.  Seems to be in the right place.  |
|:--------------------------------------------------------------------------------------------------------------------|

## 7.1.2.2 ##

Here is a proposed rewrite of the first para.

"It is the author's intention that the audio resource referenced by
the src attribute is played, starting at the time given by the
clipBegin attribute and ending at the time given by the clipEnd
attribute. The following rules should be observed:"

| _DANIEL_: maybe this is a language issue (note that I am not a native english speaker), but Reading System conformance requirements do not need to be described relative to authors' intent. The use of MUST seems perfectly reasonable to me, as it means that authors have the guarantee of a well-defined behavior from compliant user-agents. |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## 7.1.2.2 ##

The last para should be  non-normative

| _MARISA_: Done (but para@conformance is not reflected in the build, so the final HTML spec document does not indicate this change). |
|:------------------------------------------------------------------------------------------------------------------------------------|

## 7.1.2.3 ##

The last sentence ("Reading Systems ... must also apply the styling
rules ...")  appears to disallow the user to ignore the pseudo class
media-overlay-active and specify some other appropriate appearance.
Reformulate this sentence as the intended semantics or use "should" at
least.

| _DANIEL_: 100% agrees. What is the language used in the XHTML/CSS part of the specification ? We should be consistent, as the ":media-overlay-active" pseudo-class takes part in the normal style cascade. |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: Changed to 'should'. |
|:-------------------------------|


## 7.1.3.1 ##

Again, most of this subsection (e.g., the 1st and 2nd sentences) is
already stated in preceding sections, and should be removed.  The rest
should be reformulated as intended semantics or interoperability
guidelines.

|_MARISA_: Re-worded to remove redundancy. |
|:-----------------------------------------|

## 7.1.3.2, the 2nd bullet in the first bullet ##

If "As this requirement may be hard to implement in practice" is
correct, this statement should not be stated as a conformance
requirement.  The same thing might apply to the previous bullet.

| _DANIEL_: Indeed. I suggest using SHOULD instead of MUST, and removing "As this requirement may be hard to implement in practice" (we can leave an informative note about content producers and embedded JavaScript audio/video control) |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: Done. |
|:----------------|

## 7.1.3.2, ther third bullet ##

Re: "regardless of the content type referred to by the src attribute"

We do not understand this phrase.  Do we allow non-HTML5 content documents here?

| _DANIEL_: The prose needs fixing indeed. We must also harmonize the MUST/SHOULD conformance requirement for the ":media-overlay-active" CSS pseudo-class (only mention it once in the specification, to avoid redundancy and error-prone editing) |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| _MARISA_: Would this be better? "When a Content Document element becomes active within the Media Overlay, the visual highlighting rules apply regardless of the content type referred to by that element's src attribute (e.g., visible video and audio player controls within the host EPUB Content Document must be decorated as per the media-overlay-active CSS rules)." |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|_MARISA_: Edits have been made with wording similar to the above. |
|:-----------------------------------------------------------------|

## 7.1.4.1, 1st para ##

What does "page break/page number announcements" mean?  In particular,
what is referenced by "chapter1.xhtml#g1"?  Please provide an HTML5 example .

|_MARISA_: Done|
|:-------------|

## 7.1.4.2, 1st para ##

Re: "Reading Systems shall determine the start of nested structures by the value of epub:type attribute (e.g., glossary) "

Can reading systems simply use HTML tags (e.g., table, ol, and ul) for
escaping from nested structures?

| _MARISA_: Are you asking if we allow, for example, epub:type="ol"?  Or if reading systems do not need to use epub:type as they can look at the content document directly instead? epub:type is a player convenience and makes it easy to see the scope of a nested structure in terms of media overlay elements.  The vocabulary for epub:type must come from the document profile vocabulary (or from extended vocabularies given in @prefix).  My understanding is that our vocabulary is intended to be rich enough to cover authors' needs, and that we will not need to provide a mechanism to substitute element names such as 'ol' for vocabulary terms. |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## 7.1.3.2 ##

Replace "a EPUB" by "an EPUB"

| _MARISA_: It looks like this has been fixed already in the trunk. |
|:------------------------------------------------------------------|

## Appendix A. ##

<blockquote>The RELAX NG schema media-overlay-30.rnc does not allow foreign elements and attributes.  Do we disallow them unlike in other specifications of the EPUB3 family?</blockquote>

**FIXED: No change.**