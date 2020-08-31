# Searching for Common Ground with Fixed-Layout eBooks #
### Digital Issues Working Group (DIWG) of the Association of American Publishers, Inc. • October 23, 2011 ###

Fixed-layout eBooks are important to publishers as we digitize children’s books and other highly-designed titles. Apple and Barnes & Noble have developed early implementations of this concept, and we hope Amazon will soon release details of their new format. Consistent approaches to certain technical issues will greatly facilitate development of the market.

## General Principles ##
Any proposed fixed-layout format should meet the following criteria:

  1. Publishers should be able to create a single file that can be used and interpreted consistently by all retailers.
  1. The format should gracefully adapt to current and future devices and screen sizes, preferably without complex media queries or multiple packages.
  1. The format should be valid EPUB 3.X.
  1. The format and all internal components should be easily edited and corrected.
  1. File size should be kept to a minimum without compromising function or media quality.
  1. The format should allow for interactivity and multimedia using CSS, JavaScript, and SMIL.
  1. The format should allow for robust and straightforward QA and testing
  1. The format should allow for accessibility.

We believe that EPUB 3.0 as approved by the IDPF, can meet these requirements.



## What’s Out There? ##

| |**Content**|Styling|CSS Units|Granularity|Metadata|Notes|
|:|:----------|:------|:--------|:----------|:-------|:----|
|Amazon Kindle Format 8|HTML|CSS|? |? |? |
|[Apple iBooks Fixed Format](iBooksFixedLayout.md)|HTML|CSS|px|page|HTML meta tag|supports SMIL, JavaScript|
|[Barnes & Noble Fixed Format](BNFixedFormat.md)|Image with text overlay|CSS|px, em, %|unknown|custom XML file|Layered text and images|
|[Sony Fixed Format](SonyFixedLayoutFormat.md)|HTML|CSS?|unknown|unknown|in OPF|
|Image in HTML|Image|CSS (minimal?)|? |any|? |
|SVG in Spine|SVG |—|—|page or spread|? |Hard to edit, potential file size and performance issues|
|JPEG in Spine|JPEG |—|—|page or spread|  |Not allowed by EPUB 3.0 without fallback|
|PDF|PDF|PDF|n/a|any|  |Not EPUB; web-based approaches to multimedia and interactivity won’t work|

We are aware of other implementations, but details have not been made public.


## AAP DIWG Proposal ##
We propose a two-tiered approach, with a simple, image-based EPUB for content that may never need interactivity, and a full HTML + CSS approach for everything else.
### Simple Fixed Layout ###
**Content**: JPEG , SVG, or other image format, wrapped in either SVG or HTML as needed.

**Granularity**: One image per page
### General Fixed Layout ###
**Content**: HTML + CSS absolute positioning + images + JavaScript? + SMIL?

**CSS Units**: Percentage (but there could be issues with subpixels; further discussion is probably warranted)

**Audio**: MP3

**Video**: MP4

**Fonts**: OpenType

**Granularity**: One HTML file per page or spread

**Format-specific metadata**: Generic metadata should be expressed once, using a common vocabulary. If individual retailers require additional unique metadata, it should be stored in an individual file in META-INF.
