# Styling and Layout Sub-group Page #



## Requirements by Priority ##

  * P1 SNL\_R1.1 [Selection of Styles for Various Displays Properties](StylingAndLayout#SNL_R1.1_Selection_of_Styles_for_Various_Displays_Properties.md) `[in scope, high/medium priority`] [Potential solutions](SolutionSNLR1_1.md)
  * P2 SNL\_R3.11 [Expando Image Support](StylingAndLayout#SNL_R3.11_Expando_Image_Support.md) `[in scope, priority in question`] [Potential solutions](SolutionSNLR3_11.md)
  * P3 SNL\_R1.5 [Selection of Styles for Various User Settings](StylingAndLayout#SNL_R1.5_Selection_of_Styles_for_Various_User_Settings.md) `[in scope, priority in question`] [Potential solutions](SolutionSNLR1_5.md)
  * P4 SNL\_R1.2 [Property value calculation based on environment](StylingAndLayout#SNL_R1.2_Property_value_calculation_based_on_environment.md) `[scope and priority in question`] [Potential solutions](SolutionSNL_R1_2.md)
  * P5 SNL\_R4.1 [Specific sized renditions](StylingAndLayout#SNL_R4.1_Specific_sized_renditions.md) [Potential solutions](SolutionSNL_R4_1.md) `[priority and scope in question`]
  * P6 SNL\_R3.7 [Vertical image centering](StylingAndLayout#SNL_R3.7_Vertical_image_centering.md) `[in scope, priority in question`]
  * P7 SNL\_R3.1 [Improved column support](StylingAndLayout#SNL_R3.1_Improved_column_support.md) `[in scope, priority in question`]  [Potential solutions](SolutionSNLR3_1.md)
  * P8 SNL\_R3.2 [Declarative](StylingAndLayout#SNL_R3.2_Declarative.md) `[in scope, priority in question`]
  * P9 SNL\_R3.8 [Preserve aspect ratio when scaling images](StylingAndLayout#SNL_R3.8_Preserve_aspect_ratio_when_scaling_images.md) `[in scope, priority in question`]
  * P10 SNL\_R2.1 [Multi-region flow](StylingAndLayout#SNL_R2.1_Multi-region_flow.md) `[in scope, priority in question`]
  * P11 SNL\_R3.9 [Enhance image float contral](StylingAndLayout#SNL_R3.9_Enhance_image_float_contral.md) `[in scope, priority in question`]
  * P12 SNL\_R1.3 [Image/content selection](StylingAndLayout#SNL_R1.3_Image/content_selection.md) `[in scope, priority in question`]
  * P13 SNL\_R2.5 [Dynamic formatting based on intersection of multiple properties](StylingAndLayout#SNL_R2.5_Dynamic_formatting_based_on_intersection_of_multiple_properties.md) `[in scope, priority in question`]
  * P14 SNL\_R2.2 [Fixed (repeatable) content](StylingAndLayout#SNL_R2.2_Fixed_(repeatable)_content.md) `[priority and scope in question`]
  * P15 SNL\_R2.3 [Page elements alignment](StylingAndLayout#SNL_R2.3_Page_elements_alignment.md) `[priority and scope in question`]
  * P16 SNL\_R3.10 [Text Overlay of Images](StylingAndLayout#SNL_R3.10_Text_Overlay_of_Images.md) `[in scope, priority in question`]
  * P17 SNL\_R3.3 [Hyphenation](StylingAndLayout#SNL_R3.3_Hyphenation.md) `[scope and priority in question`]
  * P18 SNL\_R2.4 [Region-based styling](StylingAndLayout#SNL_R2.4_Region-based_styling.md) `[in scope, priority in question`]
  * P19 SNL\_R3.6 [Poetry alignment](StylingAndLayout#SNL_R3.6_Poetry_alignment.md) `[in scope, priority in question but trending low`]

## Solution Status ##

The track the status of solutions for various requirements, please see StylingAndLayoutSolutionStatus. That page lists various requirements and their at-risk status based on availability of solutions.

## Requirements Review Status ##

Requirements have been reviewed by: Peter Sorotokin; Garth Conboy; Roger Webster; Dave Gunn; Adam Witwer; Eric Freese; Murata Makoto; Robert Kasher; Keith Fahlgren; Bill McCoy;

## Mission ##

Identify styling and layout limitations in the epub spec that can improved or extended using existing or new technologies. We will make specific recommendations as to what styling and layout should be added and how that should be done. We will pay particular attention to current industry needs and weigh any changes against difficulty in use or implementation. This corresponds to [item 5 in our charter](http://www.idpf.org/idpf_groups/IDPF-EPUB-WG-Charter-4-27-2010.html).

## Sub-group participation ##

There is no required technical requirements for sub-group members (i.e. you don't have to be a CSS wiz), though conversation on the group will, at times, become quite technical. I still encourage participation by members who have a high-level knowledge of styling and layout issues even if they will not be able to offer specific solutions.

  * Brady Duga; eBook Technologies, Inc. (coordinator)

  * Peter Sorotokin; Adobe
  * Ric Wright; Adobe
  * Eric Freese; Aptara
  * Garth Conboy; eBook Technologies, Inc.
  * Steve Kotrch; Simon & Schuster
  * Bill McCoy; WebPaper
  * Adam Witwer; O'Reilly Media
  * Chelsea Valentine; LibreDigital
  * Dave Gunn; RNIB Centre for Accessible Information
  * John Prabhu; HOV Services, Inc.
  * Liza Daly; Threepress Consulting Inc.
  * George Kerscher; DAISY Consortium.
  * MURATA Makoto; JEPA
  * Roger Webster; Barnes & Noble
  * Karen Broome; Sony Electronics
  * Alexis Wiles; OverDrive
  * Eric Muller; Adobe
  * Soo Choi, HarperCollins Publishers
  * Elliott Beard, HarperCollins Publishers
  * Andrew Gilbert, Dartmouth Journal Services
  * Hadrien Gardeur, Feedbooks
  * Benoît Larroque, Feedbooks
  * Eric Gold, Digital Divide Data (DDD)
  * Kyoji Tahara, Toppan Printing
  * Shu Tanabe, Toppan Printing
  * Tom Hadfield, CourseSmart, LLC
  * Dianne Kennedy, IDEAlliance

## Decisions ##

### 1 Multiple Display Surfaces ###

### 2 Page-level Layout ###

### 3 Miscellaneous ###

#### SNL\_D3.1 Include full CSS2.1 ####

_Rationale: it is formatting-limiting, confusing, spec-maintenance intensive, and not fully leveraged to specify a required subset of CSS2 in OPS_

**Decision: Replace the OPS 2.0.1 required CSS2 subset with a reference to full CSS2.1 (http://www.w3.org/TR/CSS2/)**

Note: this decision was made on June 16, 2010 a the Working Group face-to-face meeting in New York.

Note: this decision addresses two EPUB 2.0.1 "future consideration" issues: http://www.daisy.org/epub/issues/consider-supporting-css2-quotes-property and http://www.daisy.org/epub/issues/add-text-transform-css

### 4 Formatted (Paginated) Content Support ###

## Requirements ##

Note: RichLayout.pdf is uploaded to the "Downloads" section to illustrate some of these

### 1 Multiple Display Surfaces ###

#### SNL\_R1.1 Selection of Styles for Various Displays Properties ####

Ranking:  P1, in scope, high/medium priority

Rationale: Different display surfaces have different optimal styling.

Examples/use cases:

  1. Justified text may look good for a large display, but smaller displays may need to switch to a ragged edge to avoid large spaces or repetive hyphenation.
  1. When displaying a full-page image (say a cover), content creators may want to specifically design different looks for landscape and portrait orientations.
  1. Default text sizes on small displays may want to be smaller than large devices to allow for reasonable amounts of text displayed at any one time.
  1. Font sizes may want to take into account PPI differences (very small fonts may be inappropriate on low PPI devices).
  1. Different media may be provided based on the capabilities of different devices. For instance, displays with poor refresh rates may want to use a static image in place of a video.

**Requirement: Ability to choose different rule sets based on display properties (size, width/height ratio, ppi, etc). `[Note: user preferences moved to SNL_R1.5]`**

[Potential solutions](SolutionSNLR1_1.md)

Note: related to conditional rendering "future consideration" from EPUB 2.0.1 (http://www.daisy.org/epub/issues/conditional-rendering-reading-systems)

#### SNL\_R1.2 Property value calculation based on environment ####

Ranking: P4, scope and priority in question

_Rationale: screen real estate needs to be partitioned differently for different displays properties and user preferences_

Examples/use cases:

  1. CSS is supposed to support reflowable layout, but in practice not many well-designed web pages on the Internet are fully reflowable. When expressing complex flexible designs in CSS, there are a lot of arbitrary limitations that have to be overcome in a very ad-hoc manner. For instance, saying something like "move left edge of this paragraph to the middle of the page + 2ems" or "10% of width, but no more than 1.5em for margin" is not possible without introducing some superficial document structure or styling. CSS2.1 recognizes some of these with having min- and max- variants for some (but not all) properties. CSS3 introduces calc value, but it is hard to implement, it is not widely supported and it is missing needed functionality (min, max, round, floor, ceil functions).
  1. this can be used as implementation strategy for SNL\_R2.3
  1. replacing Adobe proprietary XPGT would require this functionality. XPGT allows arbitrary XPath expressions to calculate property values

**Requirement: ability to do simple calculations based on the environment to express things like "half of a viewport plus 10 pixels" or "one and a half of a column width".**

[Potential solutions](SolutionSNL_R1_2.md)

#### SNL\_R1.3 Image/content selection ####

Ranking: P12, in scope, priority in question

_Rationale: images need to be scaled, cropped, and, in some cases, even selected differently for different display surfaces_

**Requirement: ability to select images (or other content) based on the display environment**

Note: Related to image scaling "future consideration" from EPUB 2.0.1 (http://www.daisy.org/epub/issues/proportional-image-scaling-problem-paged-environment)

#### SNL\_R1.4 ####

This has been moved to SNL\_R4.1

#### SNL\_R1.5 Selection of Styles for Various User Settings ####

Ranking: P3, in scope, priority in question

Rationale: Optimal content display may change based on user preferences.

Examples/use cases:

  1. Many reading systems allow for font-size and even font family changes. Content may want to adapt itself to account for such changes. For instance, the margin of paragraphs may need to be altered.
  1. Content may want to adapt itself if a Reading System provides a night mode. Typical night mode (found in cell phones, GPS navigators, and other handheld devices) assumes dark background with light text. Some of this can be done using user stylesheet (in CSS terms) and it works for simple files, but in many cases the result is unsatisfactory, for instance if some text was already styled to be light on dark background for some sort of highlighting or special effect, that effect/highlighting is lost. It is better to give the author explicit control over styling in night mode.
  1. A Reading System may enable switches to default text flow. So, a Japanese user may be able to choose between horizontal and vertical text directions based on personal preference. Content may want to use different rendering in this case. The most notable issue is margins (what is side margin in one mode is spacing margin in the other), but many aspects of the presentation (image and sidebar placements, alignments) are specific for vertical vs. horizontal layout. CSS can do it in both modes, but portions of a stylesheet must be turned on and off depending on which mode is used.

**Requirement: Add ability to choose styles and calculate property values based on user preferences.**

[Potential solutions](SolutionSNLR1_5.md)

Note: This is related to SNL\_R1.1 and SNL\_R1.2, but accounts for user preferences instead of display properties.

Note: this is related to requirement RGLS\_MM\_06 on [EGLS\_requirement\_list](EGLS_requirement_list.md)

Note: there is somewhat related issues on interaction of the book styling and user stylesheet (which can be autogenerated from user preferences). It is our experience that user stylesheet is much less useful than it could be due to the lack of styling conventions. For instance, it would be nice to have a way to override body font and body margins, but these are specified on paragraph elements in many cases.

### 2 Page-level Layout ###

#### SNL\_R2.1 Multi-region flow ####

Ranking: P10, in scope, priority in question

_Rationale: when a unit of presentation is a "page" or a screen (not an only, but primary use case for ebooks), and when screen size is sufficiently large (e.g. a larger hand-held device or a laptop/PC), professionally layed-out content is typically organized in multiple columns with headers, footers, sidebars, pull quotes and other similar layout elements, collectively called "regions"_

**Requirement: ability to partition screen real estate into regions and ability to (a) flow the primary content from one region to the next; (b) push content to occupy a secondary region; (c) move secondary content to a different page if no space for it can be found on a current page without breaking the primary flow; (d) force other content to flow around a region**

Examples/use cases:

  1. Most magazines and newspaper and some textbook layout is done in this way.
  1. For paginated view floats are suboptimal because they interact with each other unpredictably when content is broken between pages. Good-looking page layout should start with the page, not with second-guessing CSS float layout rules.
  1. replacing Adobe proprietary XPGT would require this functionality. XPGT relies on XSL:FO+ regions for page layout

_Solution:_

The problem is really a set of problems
  * Flowing text from container to container
  * Navigation
  * Dynamically creating new containers to handle overflow
  * Run arounds (e.g flowing text around an anchored item)
  * Alignment
  * Etc.

Proposal is for a solution to flowing text from container to container, and leave the others out, they can be tackled at a later day, and for the most part can be handled with sufficient forethought with existing css and html. The thing one cannot do today without writing javascript is flowing text from container to container.

The css concept of overflow needs to be extended slightly.

There are two tacks to take with this.

  1. Define a starting div/container and content inside it and then flow into subsequent containers.
    1. `<div id=”f0” style=”position/size info; overflow:flow(initial,f1)”> blah blah </div>`
    1. `<div id=”f1” style=” position/size info; overflow:flow(f0,f2)”><!—flow content in here-></div> `
    1. `<div id=”f1” style=” position/size info; overflow:flow(f1,scroll)”><!—flow content in here, excess would not be clipped, but could be scrolled into view-></div>`
  1. Create a true view/data separation.
    1. `<div id=”c0” class=”content” style=”visibility:hidden;”>blah blah</div>`
    1. `<div id=”f0” class=”geometry” style=”position/size info; overflow:flow(c0,f1)”><!—flow content in here-></div>`
    1. `<div id=”f1” class=”geometry”  style=” position/size info; overflow:flow(f0,f2)”><!—flow content in here-></div>`

As much as I would like option two, I am inclined to go with option one since we could rely on overflow used traditionally for UAs (e.g. overflow: scroll, flow(a,b)) that did not understand this concept allowing them to default to a more traditional behavior. There clearly are situations where this will not work perfectly, (e.g. a traditional front page of a newspaper, there might be empty containers for UAs that did not implement the feature ).

Additional normative behavior regarding view data separation so that the UA would not alter the data/content. With @media one could handle different form factors.


#### SNL\_R2.2 Fixed (repeatable) content ####

Ranking: P14, priority and scope in question

_Rationale: current header/footer support is too limiting_

**Requirement: ability to control positioning of repeatable content on the page**

Use case (from Text Content subgroup): a diagram which is critical for reading a large block of text. If the text is broken across multiple pages, the image should be repeated on every page.

#### SNL\_R2.3 Page elements alignment ####

Ranking: P15, priority and scope in question

_Rationale: professionally-done publications pay great attention to lining up various elements of a page/screen to have maximal impact on a reader_

**Requirement: align various elements on a page/screen, such as (a) make sure that body text lines are aligned across columns even when headings, decorations or images are present; (b) align elements in different regions by precisely placing the regions on a page**

Use cases:

  1. Designers are very picky about lining up various elements on the page.
  1. printed publications with multiple columns align text lines across columns.
  1. various illustrations and diagrams look best when they are aligned with each other: look at WIRED or Sports Illustrated on iPad
  1. Illustrations and captions should be aligned - sometimes in non-trivial ways

#### SNL\_R2.4 Region-based styling ####

Ranking: P18, in scope, priority in question

_Rationale: content sometimes needs to be styled slightly differently when it flows from one region to the next. This is similar to first line or first character styles, but for regions_

**Requirement: assign region-specific styling rules which affect content which flows into those regions**

  1. Looking at newspaper page with article leads, the styling is different depending on where the lead falls on the page. For top articles larger font is used, for bottom articles, some content may be turned off altogether. When layout is dynamic these decisions need to be made based on how stuff is actually laid out.

#### SNL\_R2.5 Dynamic formatting based on intersection of multiple properties ####

Ranking: P13, in scope, priority in question

**Requirement: optimal formatting may depend on multiple factors including the display surface characteristics, user font size preferences, and content properties**

Use case examples:

  1. for a newspaper front/section page view, whether full articles with photos, articles with blurbs, or just headlines for articles are displayed is a function of display surface size, font size preference, as well as the number of articles and their relative importance (see for example the "Times Reader" applications).
  1. magazines - see Wired for iPad

Note: could be viewed as overlapping with, perhaps even subsuming, multiple display surfaces requirements (SNL\_R1.x), and perhaps as well Selection of Styles for Various User Settings (SNL\_R1.5). This requirement is intended to capture the need to handle the intersection of multiple conditions and the content itself in order to produce an optimally formatted result per publisher preferences.

Note: the use of "formatting" above is perhaps synonymous with "Selection of Styles" and "styling" in SNL\_R1.1 etc.; one might consider styling as a particular component of the formatting process, and/or as a possible implementation mechanisms, so the arguably more general term is used here.

Note: an experimental vendor-specific EPUB extension, "XPGT", can be viewed as implementing this requirement (see: http://wiki.mobileread.com/wiki/XPGT )

Note: a number of Reading Systems have implemented Media Queries (either HTML or CSS3) and can be viewed as implementing this requirement (see http://www.w3.org/TR/css3-mediaqueries/ Candidate Recommendation)

### 3 Miscellaneous ###

#### SNL\_R3.1 Improved column support ####

Ranking: P7, in scope, priority in question

_Rationale: Current column support in epub does not provide enough control over specific properties (e.g. column size)_

**Requirement: Ability to specify number of columns, width of columns, gaps between columns and rules in those gaps. Ability to float boxes across columns and indicate if column balancing should be employed are both desirable features**

Use case examples:

  1. traditional magazine, newspaper, and textbook layouts all include elements of these features
  1. replacing Adobe proprietary XPGT templates

[Potential solutions](SolutionSNLR3_1.md)

#### SNL\_R3.2 Declarative ####

Ranking: P8, in scope, priority in question

_Rationale: to make sure that document can be analyzed for search, navigation, accressibility, etc. and so that a viewer for it can be produced for all popular platforms, layout should be described in declarative terms_

**Requirement: Layout should be described without resorting to running embedded imperative code which is impossibe to analyze and not possible to run on all devices**

#### SNL\_R3.3 Hyphenation ####

Ranking: P17, scope and priority in question

_Rationale: hyphenation is almost always used in printed books._

**Requirement: minimal hyphenation control; including hyphenation dictionaries with the content (similar to fonts)**

Examples / use cases:

  1. Books with justified text may need to allow hyphenation to avoid very tight or very loose lines
  1. Content in very narrow boxes (e.g. newspapers, some magazines) may need to hyphenate to avoid overflow, regardless of justification

[Potential solution](SolutionSNLR3_3.md)

#### SNL\_R3.4 text-transform ####

_Obviated by decision SNL\_D3.1_

#### SNL\_R3.5 CSS2 quotes ####

_Obviated by decision SNL\_D3.1_

#### SNL\_R3.6 Poetry alignment ####

Ranking: P19, in scope, priority in question but trending low

_Rationale: When typesetting poetry, it is normal to have lines left-aligned. If a line doesn't fit the page (due to restricted width), it is broken at a convenient place and the second part is right-aligned, and often with a mark (like an opening square bracket) before it. This is a rather specific need and it's not a supported property in CSS, so if accepted it would be an extension for EPUB._

**Requirement: Add support for "too long line" poetry alignment styling  (http://www.daisy.org/epub/issues/special-alignment-option-poetry)**

#### SNL\_R3.7 Vertical image centering ####

Ranking: P6, in scope, priority in question

_Rationale: It is currently not possible to vertically center a picture within a box. The desire to do this occurs frequently within publications. For example, typically one would like to vertically center the cover image of a book._

**Requirement: Provide an easy method of requesting vertical centering.**

#### SNL\_R3.8 Preserve aspect ratio when scaling images ####

Ranking: P9, in scope, priority in question

_Rationale: It is currently not possible to scale an image without distortion if you don't know the aspect ratio of the image. Typically one would like to scale a cover image to be as large as possible without distortion. To do this, you need to fix the size of the dimension that will be limited by the page size first. It is not possible to know which dimension this is if you don't know the size of the image._

**Requirement: Provide an easy method of preserving the aspect ratio of an image while the image is scaled to fit within a box.**

Example:

Given an image with unknown aspect ratio and a containing box with unknown aspect ratio, it is very difficult to specify a height and width that will display the image as large as possible without overflow or distortion. For instance, a portrait image displayed in a portrait box that is wider than the image would want to have a width: 100% to maximize its size. However, a portrait image in a landscape box would want to have a height: 100% (even though that behavior is somewhat undefined if the containing box is a page). For instance, a portrait image in a landscape box with a width: 100% will overflow the boxes height. Attempting to avoid overflow using max-width/height in such a case will result in distortion. While solutions exist for specific cases, there is not general solution using existing ePub. This can be a problem when creating a generic mechanism for cover images that need to be displayed in both portrait and landscape.

#### SNL\_R3.9 Enhance image float contral ####

Ranking: P11, in scope, priority in question

_Rationale: It is frequently desireable for design reasons to float images to locations other than right or left. One might for example wish to float images to the top left of a box, rather than just to the left. It seems that it may be desireable to float images to any of the following 8 locations within a box that they fall in: top/left, left, center/left, bottom/left, top/right, right, center/right, bottom/right._

**Requirement: Provide an easy method of floating images to locations other than left and right.**

#### SNL\_R3.10 Text Overlay of Images ####

Ranking: P16, in scope, priority in question

_Rationale: It is frequently desireable for design reasons to overlay text on top of an image and to position that overlay relative to the image or a page._

**Requirement: Provide an easy method of requesting text overlay for images.**

#### SNL\_R3.11 Expando Image Support ####

Ranking: P2, in scope, priority in question

_Rationale: It is frequently desirable to have an image (or interactive content constrained to a rectangle) be able, via a user gesture or other affordance, to expand its presentation to a larger area, in effect being temporarily resized and liberated from the rest of the page layout, either in a "full screen" sense or in some other "zoomed" presentation appropriate to the Reading System's application environment. However, it is not always appropriate for images to be "expando" in this fashion, as some are inherently part of the page layout and not sensibly expandable (a background image, area-delimiting rule, logo, etc.). On Web pages this is often accomplished by adding JavaScript rollover/popup scripts where such behaviors are appropriate, but if scripting is not to be allowed in chapter-level content then that will not be possible. And, a more declarative approach would be preferable._

Examples / user cases:

- a photo displayed as part of a photo gallery

- a video

- a quiz or other interactive content

**Requirement: Provide an easy method of declaring an image or interactive region to be "zoomable" (separable from the rest of the page layout) and define optional (SHOULD or MAY) Reading System behavior in support thereof.**

[Potential solutions](SolutionSNLR3_11.md)

### 4 Formatted (Paginated) Content Support ###

#### SNL\_R4.1 Specific sized renditions ####

Ranking: P5, priority and scope in question

**Requirement: in addition to a standard reflowable EPUB contained within an OCF file, it should also be possible to include additional OPS/OPF rendition(s) which are pre-formatted (paginated), together with standardized metadata describing the characteristics of each rendition, so that reading systems would have an easy way to identify which one was best for them.**

Examples/use cases:

- A publisher may want to deliver a rendition optimized for a particular device (screen size, color capabilities, resolution, etc.)

- A publisher may have content that is already pre-paginated, for example from digitization of paper or print-production workflows, and the reflowable text created from it may not be fully accurate

- A publisher may have formatted content that has an information and/or artistic design tied to a particular paginated layout, such that even on devices that may not match the page size, it may be preferable in some circumstances to display that formatted content rather than render the reflowable text. Examples: O'Reilly "Head First" series,  Dr. Seuss "Cat in the Hat"..

Note: Related to "Multiple Display Surface" (esp. first use case).

Note: overlapping requirement with the metadata sub-group for target device specification metadata.

Note: should also allow specification of portrait versus landscape renditions of a publication.

Note: related to identification of alternate renditions "future consideration" from EPUB 2.0.1 (http://www.daisy.org/epub/issues/identification-alternate-renditions)

[Potential solutions](SolutionSNL_R4_1.md)