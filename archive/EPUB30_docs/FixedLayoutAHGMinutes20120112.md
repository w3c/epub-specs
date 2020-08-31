

Fixed Layout Metadata Ad Hoc Group F2F
Sony office, San Jose
Thursday 12 January 2012

Location: 1730 N. 1st St. San Jose, CA map
Remote attendees: IDPF concall service
Meeting starts at 16:30 UTC

## Goals ##

  * to stabilize the Package vocabulary for rendition selection metadata
  * to stabilize definitions of “wrapper” (XHTML/SVG) rendering instruction metadata
  * to finalize processing models for rendition selection and rendering
  * to identify the group to author first draft for WG review, and set the timeline for finalization.

## Agenda ##


8:00 - 8:30 	Arrivals, coffee

8:30 - 8:45 	Review: agenda, targets for the day

8:45 - 10:30	Current status (see summary from prev telcon)
> Package and Wrapper metadata

10:30 - 10:45 	Break

10:30 - 12:00     Package and Wrapper metadata, cont’d

12:00 - 12:45 	Lunch

12:45 - 15:00	Processing models for rendition selection and rendering

15:00 - 15:15 	Break

15:15 - 16:30	Processing models for rendition selection and rendering, cont’d

16:30 - 17:00	Synthesis & Next steps: heads and plan for spec production, set deadlines

17:00 		Close

## Present ##
Bill McCoy, Markus Gylling - IDPF

Dave Cramer - Hachette

Brady Duga, Garth Conboy - Google

Edward O'Connor - Apple

Brady Kroupa, Roger Webster, Jim Lester - Barnes & Noble

Peter Sorotokin - Adobe

Takeshi Kanai - Sony

## Previous minutes ##
Fixed Layout Metadata AHG Call Notes - 11/18/11

Fixed Layout Metadata Telcon 2011-12-16

Wiki Pages
  * http://code.google.com/p/epub-revision/wiki/RenditionMetadataAdHocGroup (vocabulary, use cases)
  * http://code.google.com/p/epub-revision/wiki/TaipeiMeetingNotes
  * http://code.google.com/p/epub-revision/wiki/GenericRequirementsOnFixedLayout
  * http://code.google.com/p/epub-revision/wiki/MotivationsForFixedFormat
  * http://code.google.com/p/epub-revision/wiki/ConcernsAboutFixedLayout

## Minutes ##
### Summary ###
#### Rendition Selection Metadata ####
  * rendition:target-dimensions (CSSPixelWidth ',' CSSPixelHeight)
  * rendition:paginated (all|auto**)
  * rendition:spread (auto**|none)

#### Spine Item Metadata ####

Already in EPUB3: (Publications sec. 4.3.5): page-spread-left, page-spread-right

**add: page-spread-center (means “do not glue”)**

(NOTE: viewport for L & R (inc. content “looking out” e.g. scripting) won’t change whether it’s stitched or not)

#### Rendition selection processing model ####

Start with device dimensions.  Go through renditions to find exact match, if not figure out if dims are portrait or landscape, if landscape/square device, split vertically and try to find exact match for resulting dimension, if not then use some heuristic or absent that pick the first item. (page-spread-left/right not used in rendition selection).

For devices with flippable displays with exact match of dimensions to full or half size of display the following processing model is defined (see picture). If no exact match behavior is undefined but it’s likely that reading systems may do similar based on closest match.

1. If RS is in landscape orientation:

a) always display matching landscape dimensioned content 1-up landscape

b) display split-display-matching portrait content 2-up unless unless spread=none in which case display portrait 1-up rotated.

2. If RS is in portrait orientation:

a) always display matching portrait dimensioned content portrait

b) display matching landscape content rotated 1-up.

NOTE: if you have landscape pages you really want to be stitched together 2-up you can fake portrait dimensions and do set up in rendering instructions.

#### In content itself (rendering instructions) ####

what we need (abstractly)
1. viewbox/viewport
2. overflow behavior

##### SVG in spine #####
@viewBox atttribute 14.3.4, @overflow property 14.3.3.
NOTE: SVG depends on viewport being set up properly for this to work

RS should never apply RS/user style sheets to SVG content

##### images in spine #####
embedded image metadata carries needed information
scaling behavior not defined

##### XHTML in spine #####
**viewport META tag with width & height defines dimensions of the initial containing block (ICB), content is clipped to ICB (or scrolled if RS can scroll)** overflow behavior defined inside CSS
**if you have viewport META element then that content will be no more than one page (will be a single block).**

CSS absolute positioning should only be done in the context of XHTML file with META  viewport element or inside of block with position:relative.

User / Reading System style sheet overrides should not be applied for XHTML with META viewport elements.


### Discussion Notes ###

Markus: want us to end up where we know enough where I can produce a spec.

Markus: fastest path is an Informational Document, which can be voted up by WG and Board and then we’re done, then it can be folded in to a maintenance release in future. Not looking at long cycle of draft/review/etc.

Markus: we decided in our last call that “wrapper” in case of HTML or SVG is the content itself, and we need to provide for that ecosystem a way to unify their metadata. As well we have image-based approaches and we don’t want to prevent innovation there.  We ended up saying that all actual rendering instructions are in the document for HTML/SVG case and that raw image case doesn’t need rendering instructions so that’s OK.

Roger: we just want way to directly utilize images esp. on low perf devices (w/out having to set up a browser context) and intrinsic metadata in image or implicitly based on use case (e.g. we know content is magazine pages).

Peter: images allowed in spine if there are fallbacks, although spec is vague about what fallbacks mean and how they should be used.

Markus: fallbacks can be core media types

Garth: we didn’t loosen restriction to not require fallback for core media types, although I’d be in favor of it.

Roger: fallback that has wrapper that we ignore is not a big burden and we don’t mind doing it.

Markus: we can look at loosening this restriction next time we do a minor revision to the spec.

Dave: if we can have image in spine with full-blown CSS abs pos HTML as fallback we have prayer as publishers of producing one file that works everywhere

Roger: CSS abs pos - note in spec discouraging should be clarified.

Garth: this is the approach that has most traction today, even if there are cases where it doesn’t yield precise results.

Bill: pos fixed and absolute are different in CSS

Markus: rendition selection vs. rendering instructions

Bill: interoperability vs. predictability - tension and slippery slope between content author intent and reading system flexibility.

Roger: predictability is more important for fixed layout... by definition...

Peter: designers may not trust automatic machinery to do the right thing anyway

Peter: magazines are often mix of fixed and reflow, in fact are rarely ALL reflowable

Peter: for ingestion EPUB file it may be OK to be made larger by putting in renditions for all devices that they care about.

Garth: I don’t count doc that has just a cover image as fixed

OPF dimension metadata property
  * repeatable, one expression per meta element
  * represents viewport dimensions
  * syntax:  CSSPixelUnitWidth ‘,’ CSSPixelUnitHeight aka (‘800,600’)
  * name: target-dimensions

```
<meta name=”rendition:target-dimensions”>600,800</meta>
<meta name=”rendition:target-dimensions”>400,600</meta>
```

OPF paginated metadata property
  * Cardinality 0,1
  * Determines authors declaration of prepaginated content
  * (some|none|all)
  * all: every item represents a single page
  * auto: some or no prepaginated pages (some or no viewport specified in a rendering instruction)
  * name: paginated
```
<meta name=”rendition:paginated”>all</meta>
```

ON RENDERING INSTRUCTIONS

Peter: use device adaptation spec?
http://dev.w3.org/csswg/css-device-adapt/#viewport-meta

Ted: not mature spec, CSS folks recommend avoiding

We can live with only width and height properties for viewport, and thus can define these locally with informative reference to apple custom metadata URL, or CSS Device Adaption.

### CSS absolute positioned fixed layout – clarifications needed in EPUB 3 spec? ###

“The fixed value of the position property is not part of the EPUB 3 CSS Profile. To avoid potential rendering and interoperability issues, it should not be included in an EPUB Style Sheet ...
and:

“The ability of Reading Systems to paginate absolutely positioned layouts is not guaranteed, so reliance on absolute positioning is discouraged. Reading Systems might not support these property values.”

Modification to first statement is dealt with under XHTML rendering instructions above.

For clarity we can consider a minor change to the first statement as an erratum fix such as:

“The fixed value of the position property is not part of the EPUB 3 CSS Profile. To avoid potential rendering and interoperability issues, it should not be included in an EPUB Style Sheet (note that fixed layout support is a different topic and position:absolute may be used in certain situations, see below)...

### Timeline ###
Markus and DaveC will write first ad hoc group internal draft and call a AHG con within two weeks. Target release to WG review at the end of Jan.


### Examples ###


#### 1 ####

Target Device(s): iPad, actual viewport: 1024, 768
Content Type: XHTML-based FXL intended for both portrait and double spread in landscape
Expression: each single page (of the spreads) authored as one physical document
dimension
```
<meta name=”rendition:target-dimensions”>768,1024</meta>
<meta name=”rendition:target-dimensions”>512,768</meta>
```
First is to reliably present the document in portrait
Second for landscape 2up
```
<meta name=”rendition:paginated”>all</meta>
<meta name=”rendition:spread”>auto</meta>
```
The spread:auto could be omitted since auto is the initial value, and it indicates that the second target-dimensions can be applied not only for device dimensions, but also for 2up mode.

All documents have a meta viewport set to 768, 1024

In this case the aspect ratio is 3/4  which doesnt match 2up mode aspect ratio of ⅔ so there is going to be letterboxing in 2up mode.

The item representing the first page (the cover) has the page-spread-center property. In other situations it might make more sense to have page-spread-right to mimic  for example US magazines, page-spread-left to mimic Manga.

#### 2 ####

Target Device(s): Kindle, actual viewport: 1024, 600
Content Type: XHTML-based FXL intended for landscape viewing only
Expression:
each spread authored as one physical document
dimension
```
<meta name=”rendition:target-dimensions”>1024,600</meta>
<meta name=”rendition:paginated”>all</meta>
```
The spread:auto is not included because it doesn’t apply to landscape.
All documents have a <meta viewport set to 1024,600, excluding the cover which is set to 512,600

#### 3 ####

Target Device(s): Nook Tablet viewport: 1024,600
Content Type: Images intended for both portrait and 2 up landscape with separate text.
Expression:
Two renditions:
The first rendition contains the images
dimension
```
<meta name=”rendition:target-dimensions”>600,1024</meta>
<meta name=”rendition:target-dimensions”>512,600</meta>
<meta name=”rendition:paginated”>all</meta>
```
Images as a spine item also require fallback such as XHTML (making this similar to example 1)
XHTML would contain  a <meta viewport of 600,1024
Also similar to Example 1 the document should indicate that it is paginated and can use the default spread (for 2up mode)
```
<meta name=”rendition:paginated”>all</meta>
<meta name=”rendition:spread”>auto</meta>
```
The second rendition contains the textual content in XHTML format with no target dimensions and with no <meta name=”rendition:paginated” tag, because the default value of auto is correct.

#### 4 ####
Target Device(s): one two-screen Sony tablet which reports dimensions (1024,960) and (1024,480) when rotated (both landscape)
Content Type: SVG-based intended for both portrait and landscape in double spread.
Expression:
each single page (of the spreads) authored as one physical document
dimension
```
<meta name=”rendition:target-dimensions”>1024,768</meta>
<meta name=”rendition:target-dimensions”>768,512</meta>
```
Both target dimensions represent landscape.
```
<meta name=”rendition:paginated”>all</meta>
<meta name=”rendition:spread”>auto</meta>
```
All documents have a SVG viewbox meta set.


#### 5 ####
Target Device(s): hardcover book size
Content Type: Reflowable XHTML-based book with interspersed color plate spreads
Expression:
the fixed layout pages are each one physical document, the reflowable parts not.
no target dimensions provided, this is a single rendition
```
<meta name=”rendition:paginated”>auto</meta>
<meta name=”rendition:spread”>auto</meta>
```
page-spread-left and right is set on the color plate pages (unless they are independent)
meta viewport is set only on the fixed pages




#### 6 ####
Target Device:
Content-type: Fixed, two renditions (portrait and landscape)
Expression: each rendition targets a different orientation
each single page (of the spreads) authored as one physical document
dimension
portrait.opf:
```
<meta name=”rendition:target-dimensions”>600,1024</meta>
```
landscape.opf
```
<meta name=”rendition:target-dimensions”>1024,600</meta>
```
both:
```
<meta name=”rendition:paginated”>all</meta>
<meta name=”rendition:spread”>none</meta>
```
For spec: On size change, you must select a rendition that best matches the new device dimensions

For spec: mixing absolute and automatically positioned content can generated unexpected results, for instance paragraph of text which is abs posed and assumed to have certain dimensions might require more space in other implementations -- some words might be lost.