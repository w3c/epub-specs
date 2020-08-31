# DRAFT  Meeting notes from the workshop "Advanced/Hybrid Fixed Layouts in EPUB" #

[TokyoWorshopForAdvancedHybridFixedLayouts](TokyoWorshopForAdvancedHybridFixedLayouts.md)

Attendees:GYLLING, Markus  (IDPF); MURATA, Makoto  (IDPF); KOBAYASHI, Tatsuo  (IDPF); McCOY, Bill (IDPF); NAGAI, Seiji (ACCESS Co., Ltd.); YAMAMOTO, Taro (Mr.) (Adobe Systems Incorporated); KOPP, Matthieu  (Aquafadas); LESTER, Jim (Barnes & Noble, Inc.); KROUPA, Brady (Barnes & Noble, Inc.); FUJISAWA, Jun  (Canon, Inc.); YOSHIMURA, Wataru (DNP Digitalcom Co., Ltd.); TAKASE, Hiroshi  (EAST Co.,Ltd.); HEKI, Tatsuo (FUJIFILM Corpoation); MURATA, Masao  (FUJIFILM Corpoation); NONAKA, Shunichirou  (FUJIFILM Corporation); OHMURA, Yoshinori (Mr.) (Impress Holdings, Inc.); ISHII, Koji (Mr.) (W3C CSS WG); TAKAMI, Shinya (Mr.) (Rakuten, Inc.); KANAI, Takeshi (Mr.) (Sony Corporation); SHIMADA, Hiroshi (Shogakukan Inc.); OKAMOTO, Masashi (SHUEISHA Inc.); AKIMOTO, Ryoji (Toppan Printing Co., Ltd.); KOIKE, Toshiaki (Voyager Japan Inc.); KITAHARA, Masakazu (Voyager Japan Inc.); KAWAMURA, Hiroshi (DAISY Consortium); HAMADA, Mayu (Ms) (Assistive Technology Development Organization); OGATA, Katsuhiro (USAPARA corp.)

## 1. Logistics and Introduction (10:00 - 10:15) ##

Heki-san of Fujifilm welcomed attendees.

Bill McCoy of IDPF gave an introduction to the IDPF IP policy.

## 2. Morning session (10:15 - 12:10) ##

The agenda and presentation slides are available at [TokyoWorshopForAdvancedHybridFixedLayouts](TokyoWorshopForAdvancedHybridFixedLayouts.md).

### 1) Murata ###

After the presentation, there was some discussions about the proposed
classification: "Paper first, Digital second", "Digital first, paper
second", and "Digital first, paper never". The first two groups are
common in the US and Japan, while the last group is common in Korea.
Markus pointed out that standardization for the last group might be too
early.

### 2) Aquafadas ###

The PPT file (linked from this workshop announcement page) contains
interactive animation.  Additional video is also available.

After the presentation, there was a question about authoring costs.  The
presenter replied that they have started an automatic cell recognition.


### 3) Shuueisha ###

Open Manga Format of Shuueisha is derived from EPUB.  There are three
groups of files: those for the advanced view mode, those for the
standard view mode, and the program Library for the advanced view mode.
Images witht DRM and those without DRM are stored in separate
directories.

An OMF publication consists of two package documents, namely
standard.opf and advanced.opf.  The standard.opf contains image files
(without HTML wrappers), and is intended for ePaper devices.   The
advanced.opf contains a single XHTML file (advancedpages.xhml),
CSS(style.css), and Javascript (content.js, device.js, script.js, and
porting.js).  On top of the standard mode and the advanced mode,
Shuueisha has developed the cutting mode, which provides cinematic
animation and cell transitions.  But this mode is not included in OMF.

advanced.xhtml does NOT reference to image files.  It references to
Javascript files and style.css, and also specifies a canvas. The
content.js file contains instructions for specifying which image file
consists of this OMF publication.  Meanwhile, script.js, device.js, and
porting.js provide an OMF library that is NOT tailored to each OMF
publication.

There was a question about conformance to EPUB3.  Since the fallback
attribute is not specified for each image file in the standard.opf, OMF
is not strictly conformant.  The extension by B&N is also non-conformant
for the same reason.  There was a discussion for avoiding or even
lifting the restriction that the fallback attribute is mandatory.

There was also a question about content authoring. An authoring
environment for the standard mode will be freely available from Digital
Comic Association of Japan.  It will be very easy to create OMF
publications from existing image files

There is another editing environment, Manga Director Tool. This
environment allows the author to specify cell region information, etc.
for the support of the cutting mode.  But the authoring cost for this
cutting mode is quite heavy.

Later, there was a question about inconsistencies between future
versions of webkit and the OMF javascript library.  If such
inconsistencies arise, it will become necessary to republish the
OMF publications.


## 3. Afternoon session ##

### 1) B&N ###

An [example](http://code.google.com/p/epub-revision/downloads/detail?name=COSMO-20101001_drp.epub) by B&N is available on the IDPF Google Code page.

Rendition mapping is used for both inter-rendition navigation and
intra-rendition navigation (hotspots).

After the presentation, there was a question about the direct use of images.

### 2) Kanai (Sony) ###

After the presentation,  there were some discussions about
single-image-only templates that allow centering the image.

There was also discussions about rendition selection beyond media
queries (e.g, natural-language-based selection).  Similarities between
content negotiation and rendition selection were pointed out. The
"rendition type" was suggested as a hint for rendition selection.

### 3) Heki and Murata (Fujifilm) ###

After the presentation, there was a question about automatic
determination of cell ordering.  The answer was that it is not
completely automatic but requires manual intervention.

There was a suggestion to represent a spread as a single content
document rather than synthesizing a spread from two content
documents.

### 4) Summary ###

Markus and Murata presented an overview summary of the functionality topics that had been demonstrated/discussed:

  1. Rendition Mapping
    * inter-rendition (1-1 or n-n)
    * intra-rendition mapping
      * region/area information
      * hotspots
      * sequence of areas
      * hierarchies of regions (scenes & shots)
  1. Rendition Selection
    * W3C Media Queries scope
    * additional queries (multi-lingual, writing modes, EPUB version, etc)
    * rendition metadata ("discovery") in container.xml
  1. Page & Sub-page navigation
    * sub-page navigation made possible by intra-rendition mapping
    * Transition effects
      * on page navigation
      * on sub-page navigation
    * Gesture and navigation inc overriding primary nav
    * Real text areas (balloons)
  1. Device Adaptation
    * "reading/interaction modes" (OMF)
    * allowing fidelity
  1. User/Context Adaptation
    * multilinguality
    * print disabilities, situational disabilities, day+night

> Noted differences in approach are shown below:

  * Declarative vs Scripted (note that EPUB has stated design preference for declarative solutions)
  * Use Web Technologies vs Preserve Battery
  * Urgency

### 5) Next steps ###

Formation of ad-hoc working group to collect use cases and functional requirements; these will be basis for charter proposal to IDPF membership.

Markus and Murata will be convenors of ad-hoc group, eventually 2 co-chairs of formal WG will be needed

Primary topics: rendition mapping (inter- and intra), rendition selection (inc container.xml metadata), and possibly page+sub-page transition effects/events.

Group agrees to target finalized specification by years end; for this reason, avoiding scope creep and focusing on most urgent aspects is of utmost importance.