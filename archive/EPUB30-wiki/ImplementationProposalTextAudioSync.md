# Proposal for synchronized text and audio in EPUB #

# Summary of additions to EPUB standard #

Please see the newer document [MediaOverlaySpec](MediaOverlaySpec.md) for details.  This page contains older pre-specification text, and more useful things like a list of requirements met/not met and a sample implemention/demo content.

# Proposal #


## Contributors ##
  * Marisa DeMeglio
  * Daniel Weck
  * Chow King Wai
  * Alex Zu

## Introduction ##

Books with synchronized text and audio can be found today in popular reading software, educational tools, and in formats for persons with print disabilities (often required by law). This is a proposal of how to add text/audio synchronization to EPUB (based on recorded human narration, not on live TTS Text-To-Speech rendition). It is designed as a transparent overlay to the current EPUB text file format and it will not break compatibility with text-only reading systems.

During the EPUB requirements gathering phase, several requirements for the inclusion of synchronized text and audio were identified.

### Requirements met ###

This proposal meets the following requirements and enables the features in the included examples.

  * [RM-18: Define synchronization points](RichMediaAndInteractivity#RM-18._(A)_Define_synchronization_points.md)
  * [RM-19: Synchronized playback](RichMediaAndInteractivity#RM-19._(A)_Synchronized_playback.md)
  * [RM-20: Text scroll/highlight](RichMediaAndInteractivity#RM-20._(B)_Text_scroll/highlight.md)
  * [RM-21: Transparent overlay](RichMediaAndInteractivity#RM-21._(B)_Transparent_overlay.md)
  * [RM-22: Using audio selectively](RichMediaAndInteractivity#RM-22._(C)_Using_audio_selectively.md)
  * [RM-24: Runtime audio options ](RichMediaAndInteractivity#RM-24._(D)_Runtime_audio_options.md)

#### Examples of features associated with these requirements ####

  1. Audio presentation synchronized with text highlighting:
    * [See a video of a DAISY book reader](http://www.youtube.com/watch?v=9CtsM2K2iK0)
    * Screenshots of ASTRI books: <br /> ![http://dl.dropbox.com/u/5509213/epub_wiki_images/pp702.png](http://dl.dropbox.com/u/5509213/epub_wiki_images/pp702.png) ![http://dl.dropbox.com/u/5509213/epub_wiki_images/pp703.png](http://dl.dropbox.com/u/5509213/epub_wiki_images/pp703.png)
  1. Allow users to turn on or off specific classes of items such as page number announcements, footnotes, producer notes, and asides such as sidebars.
    * [See a video of a DAISY book reader demonstrating this feature](http://www.youtube.com/watch?v=QMcP-0L021A)

### Requirements not met ###
This proposal does not meet these requirements, but could be extended to do so:

  * [RM-13: Parallel audio clips](RichMediaAndInteractivity#RM-13._(C)_Parallel_audio_clips.md)
  * [RM-14: Triggers](RichMediaAndInteractivity#RM-14._(A)_Triggers.md)
  * [RM-25: Multiple granularities](RichMediaAndInteractivity#RM-25._(C)_Multiple_granularities.md)


## A complete example ##
Sample content for what is described here along with the source code for a demo implementation are available from the epub-revision subversion repository:
http://code.google.com/p/epub-revision/source/browse/#svn/sandbox/smil-overlay-demo

A live version of the above is available here:
http://marisademeglio.com/demos/audio-overlay-demo/webapp/reader.html

## Additions to the standard ##

The proposed additions to the standard are as follows:

  1. [Add an audio attribute to the OPF file](#Add_audio_attribute_to_the_OPF_file.md)
  1. [Define the subset of SMIL](#Define_the_subset_of_SMIL.md)
  1. [Describe the relationship between the SMIL file and the text document](#Describe_the_relationship_between_the_SMIL_file_and_the_text_doc.md)

Please note that there are no changes required to the NCX.

### Add **audio** attribute to the OPF file ###
In the OPF file, specify that there is an audio overlay available and specify which text file it belongs to.

Add SMIL files to the manifest.
```
<manifest>
  <item id="ch1" href="chapter1.html" media-type=application/xhtml+xml"/>
  <item id="ch1_smil"href="chapter1.smil" media-type="application/xml"/>
  ...
</manifest>
```

Add the **audio** attribute to the OPF **itemref** element and reference the manifest item containing the SMIL file resource.
```
<spine>
  <itemref idref="ch1" audio="ch1_smil"/>
  ...
</spine>
```

This is a forwards-compatible addition: 2.0 reading systems can safely ignore the **audio** attribute and process documents in their normal fashion.

### Define the subset of SMIL ###

The SMIL document links an audio rendition of the document with the text content.
The basic concept of how to use SMIL is illustrated by this example:

```
<smil>
    <head>
    	<meta name="dc:title" content="Sample"/>
    </head>
	<body>
		<par>
			<text src="chapter1.html#id1"/>
			<audio src="aud.mp3" clipBegin="0" clipEnd="0:32"/>
		</par>
		<par>
		        <text src="chapter1.html#id3"/>
		        <audio src="aud.mp3" clipBegin="1:00" clipEnd="1:15"/>
		</par>
		<par>
			<text src="chapter1.html#id4"/>
			<audio src="aud.mp3" clipBegin="1:15" clipEnd="1:30"/>
		</par>
	</body>
</smil>
```

Where **body** represents the document's series of phrases, and each phrase is represented by parallel (**par**) groupings of text and audio chunks.

In order to keep complexity to a minimum, EPUB will use a minimal subset of SMIL (see [SMIL details](#SMIL_details.md) below). There will be a dedicated schema to define the EPUB SMIL document.

The relationship with the overall EPUB fileset is that there is one SMIL file per spine OPS item.

#### SMIL elements and attributes ####
This proposal recommends a minimal subset of SMIL including basic timing constructs and media objects; excluding complex timing, events, layout, animation, etc.  About the SMIL elements and attributes used:

##### smil element: document root element #####
  * attributes:
  * child elements: one head, one body

##### head element: document head #####
  * attributes: none
  * child elements: meta (optional)

##### body element: document body #####
  * attributes: none
  * child elements: seq, par

##### seq element: a sequence of media nodes #####
  * attributes: role, id, ops:textref
  * child elements: seq, par

##### par element: a parallel set of media nodes #####
  * attributes: role, id
  * child elements: one text, one audio

##### text element: references text media #####
  * attributes: src
  * child elements: none

##### audio element: references audio media #####
  * attributes: src, clipBegin, clipEnd
  * child elements: none

#### Player convenience and the ops:textref attribute ####

An audio book has a linear flow; however, users may wish to change section or hear a particular sentence by clicking the text, and the player needs to update the audio playback accordingly.

In order to facilitate easily locating the audio associated with any given text structure (especially those not directly linked to by SMIL **par** elements), we've introduced an attribute called **ops:textref** on the **seq** element.   It aligns SMIL **seq** elements with elements in the text document.  Instead of IDs, XPath could also be used.

#### Guidelines ####
  * IDs are not recommended to be on media elements because they shouldn't be directly linked to.  The parent time container should be linked to instead.  At the moment, the smilref layer is the only thing that references SMIL directly, but of course there is a chance that other uses will come up.
  * There is exactly 1 SMIL file per HTML file
  * The text and audio inside a par are considered equivalent to each other content-wise


### Describe the relationship between the SMIL file and the text document ###

The SMIL document references elements in the text document.  These references can be written as fragment identifiers or as XPath expressions.

#### Using IDs as a reference mechanism ####

As shown above, SMIL uses the **src** attribute to refer to media resources (text and audio).  The specific phrase in the text is referenced using a fragment identifier, e.g. **file.html#phrase1**.  This necessitates the text file to be marked up using the **id** attribute:

```
<h1 id="id1">Lorem ipsum</h1>
<p id="id2">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor</p>
<p id="id3">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
```

#### Using XPath as a reference mechanism ####
The text reference could also be expressed using XPath. In this sample code we're using the [xpath1()](http://www.simonstl.com/ietf/draft-stlaurent-xpath-frag-00.html) notation in the URL/URI/IRI fragment identifier, and XPointer's [element() scheme](http://www.w3.org/TR/xptr-element/). Note that for readability purposes the characters are not escaped in the fragment part of the URL.


```
<body>
	<par>
		<text src="chapter1.html#xpath1(/html/body/section[position()=2]/p[position()=3]/span[position()=1])"/>
		<audio src="aud.mp3" clipBegin="0" clipEnd="0:32"/>
	</par>
	<par>
		<text src="chapter1.html#element(/1/1/2/3/2)"/>
		<!-- XPath equivalent: /*[1]/*[1]/*[2]/*[3]/*[2] -->
		<audio src="aud.mp3" clipBegin="0:32" clipEnd="1:00"/>
	</par>
	...
</body>
```

#### Styling ####

At any given time, portions of text for which the corresponding audio narration is currently playing need to be highlighted visually, and scrolled into view.

It is proposed that the EPUB standard specifies a reserved CSS class named "epub-time-active" (which aim is to define the rendering style of highlighted text for audio/text sync purposes), and it is proposed that the default set of styling rules shall be: background=yellow, color=black, font-weight=bold.

Document authors may override the default styling rules by including the "epub-time-active" class in the CSS published within the EPUB container, so that the actual highlight style remains harmonious with the authored global style of the publication.

Reading Systems may offer additional styling themes to match typical user-agent overrides such as the "white-on-black" color scheme (inverted color display to read in the dark). This is essential for accessibility purposes too.

NOTE: a CSS pseudo-element may be a "cleaner" way to implement this, rather than enforcing semantics on an arbitrary CSS class name. However this "cleaner" solution would impose an additional burden on implementors as they would have to parse and interpret this custom CSS pseudo-class (instead of relying on an off-the-shelf CSS class mechanism). It is, however, felt by many that a realistic OPS implementation will need its own CSS parser.

#### The role attribute ####

While reading, users may want to turn on or off certain supplemental aspects of the publication, such as sidebars, footnotes, annotations, etc.  We can specify these elements in the text document by using the **role** attribute.  In the audio presentation, we want to offer an equivalent set of options, hence the introduction of the **role** attribute in the SMIL document.  So, wherever the text document uses **role**, the SMIL document does the same (see [semantic extensibility in text content](TextContent#TE.01_Allow_for_inflection_of_domain-specific_semantics_on_top_o.md)). This approach provides an easy global switch to control rendering.
```
<body>
	<par>
		<text src="chapter1.html#id1"/>
		<audio src="aud.mp3" clipBegin="0" clipEnd="0:32"/>
	</par>
	<seq ops:textref="doc.html#the_sidebar" role="sidebar">
		<par>
			<text src="chapter1.html#id3"/>
			<audio src="aud.mp3" clipBegin="1:00" clipEnd="1:15"/>
		</par>
		<par>
			<text src="chapter1.html#id4"/>
			<audio src="aud.mp3" clipBegin="1:15" clipEnd="1:30"/>
		</par>
	</seq>
         ...
</body>
```


### Schema ###
```
default namespace = ""
namespace ops = "http://www.idpf.org/2007/ops"

start =
    element smil {
        element head {
            element meta {
                attribute content { text },
                attribute name { text }
            }
        },
        element body { (seq | par)* }
    }
seq =
    element seq {
        attribute role { text }?,
        attribute id { text }?,
        attribute ops:textref { text },
        (seq | par)*
    }
par =
    element par {
        attribute role { text }?,
        attribute id { text }?,
        element text {
            attribute src { text }
        },
        element audio {
            attribute clipBegin { text }?,
            attribute clipEnd { text }?,
            attribute src { xsd:anyURI }
        }
    }+
```

## Pending TODOs ##

ACTION ITEM: Daniel => The demo shows how to handle HTML5 video/audio media elements targeted by a SMIL's "text" elements, but we need to normatively define the expected Reading System behavior(s), like how default video controls get overridden by the SMIL scheduler.

ACTION ITEM: Marisa => refine the proposal to get as close as possible to normative prose (bullet lists, MUST SHOULD MAY)