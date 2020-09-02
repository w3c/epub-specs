

# Introduction #

_This section is informative._

Books featuring audio narration synchronized with the text can be found today in mainstream book software, educational tools, and in formats for persons with print disabilities (often required by law).  In EPUB 3.0, these types of books are created by adding to the EPUB fileset an overlay describing the timing for the pre-recorded audio narration. The file format for the overlay is SMIL, a W3C standard for representing synchronized multimedia information in XML.  This transparent overlay feature will not break compatibility with text-only reading systems.

# How to include SMIL files in EPUB #

## The manifest ##

_This section is normative._

SMIL files for an EPUB publication MUST be listed in the OPF manifest with media-type="application/smil+xml".

## The media-overlay attribute ##

_This section is normative._

  * What: a new attribute called **media-overlay**
  * Where: optional on OPF **item** elements
  * Contents: ID of the manifest item containing the relevant media overlay
  * While not every manifest item is required to have a media overlay associated with it, there MUST be a one-to-one relationship between media overlay files and manifest items; in other words, multiple manifest items cannot share a single media overlay file.
  * Reading systems MAY support this new attribute
  * Content creators MAY include this feature

## Example ##

_This section is informative._

Example of how to specify that there is a media overlay available.

Add the SMIL overlay files to the manifest of the OPF file.  Also add the **media-overlay** attribute to the **item** elements for which corresponding SMIL files are available (e.g. text content documents).  The **media-overlay** attribute contains the ID of the corresponding SMIL overlay file.
```
<manifest>
  <item id="ch1" href="chapter1.html" media-type="application/xhtml+xml" media-overlay="ch1_smil"/>
  <item id="ch1_smil" href="chapter1.smil" media-type="application/smil+xml"/>
  ...
</manifest>
```

This is a forwards-compatible addition: 2.0 reading systems can safely ignore the **media-overlay** attribute and process documents in their normal fashion.

# SMIL #

## Introduction to SMIL ##

_This section is informative._

SMIL (Synchronized Multimedia Integration Language) is a W3C recommendation for describing multimedia presentations in XML.  The current version is [SMIL 3.0](http://www.w3.org/TR/SMIL3/).  This specification defines a subset of SMIL for the purpose of synchronizing an audio overlay with the text document(s) in EPUB publications.  While future versions of this specification may incorporate support for video media (e.g. synchronized text/sign-language books), this version only supports audio media.

The key to understanding how SMIL works here is to see how it handles synchronization of text and audio media objects.  The elements associated with synchronization behavior are called **seq** (sequence) and **par** (parallel).  An EPUB media overlay is, in its simplest form, defined as a sequence of parallel (i.e. rendered together) text and audio media objects.

A basic SMIL document describing an audio overlay for an EPUB book is shown here (note that this example shows how **body** behaves similar to **seq**):

```
<smil>
	<body>
		<par>
			<text src="bookchapter.html#id1"/>
			<audio src="bookaudio.mp3" clipBegin="0" clipEnd="10"/>
		</par>
		<par>
			<text src="bookchapter.html#id2"/>
			<audio src="bookaudio.mp3" clipBegin="10" clipEnd="20"/>
		</par>
		<par>
			<text src="bookchapter.html#id3"/>
			<audio src="bookaudio.mp3" clipBegin="20" clipEnd="30"/>
		</par>
		...
	</body>
</smil>
```

Typical reading system playback behavior would be to, for each **par** element, play the audio clip and highlight the text element pointed to by the ID fragment.  Then, when the first audio clip reaches the specified end time, the contents of the next **par** are rendered.

There are additional features not represented in this very simple example, but they do not add much complexity.  They are described in the following sections as well as in the full example.

## Schema for the EPUB SMIL subset ##

_This section is normative._

Reading systems that support the **media-overlay** attribute MUST support the [EPUB SMIL subset](http://code.google.com/p/epub-revision/source/browse/trunk/src/schema/media-overlay.rnc).  This is a subset of [SMIL 3.0](http://www.w3.org/TR/SMIL3/) plus two attributes defined in this standard, **epub:textref** and **epub:type**.

## Media clipping attributes ##

_This section is normative._

The attributes **clipBegin** and **clipEnd**, used to represent audio media clip times, are defined as follows:

  * Are a subset of http://www.w3.org/TR/SMIL3/smil-extended-media-object.html#adef-clipBegin
  * MUST be interpreted as normal play time (npt) values, although the metric ("npt=") is not stated explicitly
  * MUST be expressed as hh:mm:ss.fraction or as seconds.fraction (e.g. "1:33:23.453", "345.21", "0:00:32.434")
  * MUST be non-negative
  * The value of clipEnd MUST be chronologically after that of clipBegin
  * If clipBegin is not specified, its value is assumed to be 0
  * If clipEnd is not specified, its value is assumed to be the end of the physical media
  * If clipEnd exceeds the duration of the physical media, then its value is assumed to be the end of the physical media

## The epub:textref attribute ##

### Requirements and allowed values ###

_This section is normative._

The **epub:textref** attribute:
  * MUST contain relative URIs with fragment identifiers
  * MUST resolve to an element in the OPS text document corresponding to this SMIL file

### The purpose of epub:textref ###

_This section is informative._

An audio book has a linear flow; however, users may wish to change section or hear a particular sentence by clicking the text, and the player needs to update the audio playback accordingly.

The **epub:textref** attribute has been added to seq containers to facilitate linkage between text structural containers and the corresponding media overlay.

## The epub:type attribute ##

### Requirements and allowed values ###

_This section is normative._

The **epub:type** attribute takes its values from the list of allowed role types in OPS.

It is STRONGLY RECOMMENDED for content creators to include **epub:type** information in SMIL.

Reading systems MAY support the **epub:type** attribute in SMIL.

### About skippability ###

_This section is informative._

While reading, users may want to turn on or off certain features of the publication, such as sidebars, footnotes, page numbers, or other types of secondary content.  This feature is called "skippability".  In addition to default element names, the **epub:type** attribute in the text document is used to express semantics of an element. In order to offer an equivalent set of options in the audio presentation, the **epub:type** attribute can be used in the SMIL document. This approach provides an easy global switch to control rendering.

See how the **epub:type** attribute is used in the full example below.

# The relationship between the SMIL file and the text document #

## Structure ##

The SMIL document SHOULD be marked up with the same nested structures as the text document.  The SMIL **body** element corresponds with the text document's **body** element. SMIL **seq** elements are used to represent text containers such as header, section, subsection, div, and similar elements.  **Seq** elements SHOULD be nested to mimic the nested structures in the text.

This, combined with the use of **epub:type** to identify special types of structures, allows the reading system to give users the option of escaping structures like sidebars, footnotes, and tables while they are reading.

## Granularity ##

SMIL text elements' **src** attribute values point to text document elements by using their IDs.  The granularity level of the SMIL presentation therefore depends on how the text document is marked up.  If the finest level of text markup is at the paragraph level, then the synchronized text/audio presentation will display and highlight an entire paragraph while playing the audio for that whole paragraph.  On the other hand, if sub-paragraph markup is available, such as **span** elements wrapping phrases or sentences, then a finer level of granularity is possible in the SMIL presentation.

## Audio and Video ##

Any OPS/XHTML5 document with which a given media overlay is associated may contain embedded media objects such as video and audio. Unlike text and images, such content type is said to be "continuous" in the sense that it contains its own timing information (i.e. audio and video clips have an intrinsic duration).

Consequently, when a Reading System renders the text/audio synchronization described by a media overlay, the default playback behaviors of audio and video media embedded within the associated text document MUST be overridden, as per the following rules:

  * all audio and video media objects embedded within an OPS/XHTML5 file MUST have their public playback interface deactivated (typically: play/pause control, time scrobbler, volume level, etc.). This is needed to avoid interference between the scheduled playback sequence defined by the media overlay, and the arbitrary playback behavior due to user interaction or script execution. This means that whilst the SMIL audio/text synchronization is in playback mode:
    * the Reading Device MUST hide the individual video/audio UI controls from the page. This overrides the default behavior defined by the "controls" HTML5 attribute.
    * the Reading Device MUST prevent the JavaScript audio/video playback API to be invoked by scripts embedded within the EPUB document (i.e. authored as part of the default publication behavior). Because this may be hard to implement in practice, it is recommended that content producers SHOULD avoid publishing embedded scripts dedicated to controlling the playback of inline audio/video media objects, so that the published media overlay can retain full control of the synchronized text/audio presentation, without any risk of interference with script-enabled custom behaviors.
  * all audio and video media objects embedded within an OPS/XHTML5 file MUST be initialized to their "stopped" state, and ready to be played from the zero-position within their content stream (possibly displaying the poster image specified using the OPS/XHTML5 markup). This overrides the default behavior defined by the "autoplay" HTML5 attribute.
  * when a "text" element becomes active in the media overlay, the CSS visual highlighting rules apply regardless of the content type which the "src" attribute refers to. In other words, visible video and audio player controls within the host OPS/XHTML5 file MUST be decorated as per the **media-overlay-active** [CSS styling rules](#CSS.md).
  * in addition to the above default behavior for SMIL-activation of text fragments, audio and video playback MUST be started and stopped according to the duration implied by the authored SMIL synchronization (as per the standard SMIL timing model). There are 2 possible scenarios:
    * when a "text" element in the SMIL markup has no "audio" sibling within its "par" parent container, the referenced audio or video media object MUST play until it ends, at which point the SMIL "text" element's lifespan terminates. In other words, the implicit duration of the SMIL "text" element (and by inference, of the parent "par" container) is that of the referenced audio or video clip.
    * when a "text" element in the SMIL markup has an "audio" sibling within its "par" parent container, the playback duration of the audio or video media object referenced by the "text" element MUST be constrained by the duration of the "audio" sibling in the SMIL media overlay. In other words, the actual duration of the "par" parent parallel container is that of the child "audio" clip, regardless of the duration of the video or audio media pointed to by the "text" element. This may result in an embedded video or audio media object to end playback prematurely (before reaching its full duration), or to end before the playback of the parallel "audio" in the SMIL markup is finished (in which case the last-played video frame SHOULD remain visible until the parent "par" parallel container finally ends). This is equivalent of the "audio" element in the SMIL markup implicitly carrying the behavior of the  ["endsync" attribute](http://www.w3.org/TR/SMIL3/smil-timing.html#Timing-endsyncAttribute).
  * when a "text" element becomes inactive in the SMIL media overlay, and when it points to an video or audio media object, the referenced media object MUST be reset to its initial "stopped" state, and ready to be played from the zero-position within their content stream (possibly displaying the poster image specified using the HTML5 markup)

# CSS #

_This section is normative._

Often, depending on reading system features, portions of text for which the corresponding audio narration is currently playing need to be highlighted visually, and scrolled into view.

A CSS pseudo class **media-overlay-active** is used to indicate that a particular text fragment is "active".

Content creators MAY include style information for **media-overlay-active**.

Reading systems MAY implement this pseudo class.


# Full example #

## OPF file ##
TODO: show an OPF file with multiple chapters featuring media overlays

## SMIL file ##
TODO: show a SMIL file and how it mimics the structure of the text document

## Text content file ##
TODO: a snippet of a text content file showing the structure mimicked by the SMIL document above

## CSS file ##
TODO: show some value(s) for pseudo class media-overlay-active

# Pending TODOs #

  * Reference the default epub vocabulary as possible values for epub:type
  * Add full example