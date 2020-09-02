

## Status of this proposal ##

The IDPF Board on September 14, 2011 approved the proposed charter for a 14-day member comment period. This comment period is from September 14, 2011 through September 28, 2011. Comments by preference should be submitted as comments on this Wiki page, or alternatively via email to the charter ad hoc group coordinator.

## Need for this proposal ##

Its a well-known problem in the high end digital publishing industry today that for complex layouts in paginated publications, the CSS solutions available do not enable the representation of constructs such as spanning heads, sidebar-main content relations, and layouts that adapt to different screen sizes. When faced with this kind of content, publishers today typically distribute content in a fixed-format representation such as PDF, which is not dynamically adaptive, and is likely to have poor accessibility.

While the W3C develops CSS3 modules pertaining to this problem area, the domain of complex paginated layouts as a whole remains a lower priority within the W3C CSS WG.

XSL-FO offers a dynamic page-layout model, but is very difficult to reconcile with content represented in HTML that already uses CSS for other styling/layout aspects, it has only a very simple page-layout geometry and it does not have the concept of dynamic adaptation (e.g. the ability to adapt the layout to different screen sizes).


## Scope and Deliverables ##
The scope of this working group is to produce a model and specification for template-based paginated layouts and adaptive styling. The specification will be published by the IDPF and designated as an optional feature in terms of EPUB 3 Reading System conformance.

The model shall enable EPUB authors to include the following features in EPUB Style Sheets (see below in _Initial Direction_ for further details):
  * Declarative page geometry (page masters and page master selection)
  * Multi-region flows, exclusion areas, and repeatable content
  * Declarative triggers for applying CSS properties based on UI interaction events
  * Ability for layouts to adapt to different screen sizes

The model shall have the following properties:
  * use CSS syntax
  * be implementable on top of modern browser engines, without need to rework their internals
  * minimize deviation from W3C specifications and maximize the opportunity for any added constructs to evolve into W3C specifications in the future
  * not collide with the EPUB 3 spec (i.e. content including the features defined in this specification will be valid EPUB 3 content)

_(Note: as mentioned below, much of the targeted functionality was part of the EPUB 3 WG Styling and Layout Subgroup functional requirements, but was deferred from inclusion in EPUB 3 proper. The already existing draft of [CSS Page Templates](http://epub-revision.googlecode.com/svn/trunk/src/proposals/css_page_templates/csspgt-doc.xhtml) is intended to be the basis for this Working Group's effort.)_

## Out of Scope ##
While a javascript implementation of the model is planned to be provided, it is not a formal deliverable of this working group.

## Timeline and Participation ##

The working group will be chartered through December 31st 2012. As the working group has not yet convened, the following milestone schedule is tentative, and may be modified by the working group during the project initial stages.

| Call for Participation Announcement | Sept 15, 2011 |
|:------------------------------------|:--------------|
| First WG Draft |  Oct 29, 2011 |
| Second WG Draft |  Dec 15, 2011 |
| Proposed Specification | Feb 2012 |
| Rec Specification | July 2012 |

## Working Group Leads ##
Suggested Leads of this working group are:
  * Brady Duga (Google Inc) _Chair_
  * Markus Gylling (DAISY) _Vice Chair_
  * Garth Conboy (Google Inc) _Vice Chair_


## Initial Direction ##

This section provides more specific direction to address a large subset of the original requirements listed below (see _Original EPUB 3 WG Requirements_). One underlying assumption is that all new features should be implementable on top of modern browser engines, without need to rework their internals.

_Note: the priority rankings below are tentative and will be stabilized by the WG during the project initial stages._

### 1. Integrate with subset of CSS3 Regions and CSS3 Exclusions ###
_Priority: high_

This is a portion of "SNL\_R2.1 Multi-region flow". There are two new CSS Level 3 Modules: [CSS Regions](http://www.w3.org/TR/css3-regions/)  and [CSS Exclusions](http://dev.w3.org/csswg/css3-exclusions/). These modules are still in the early stages on the standardization track, but there are already implementations being done.

CSS Regions introduce the concepts of flow and region. Flow is a sequence of content (potentially from many parts of the document) and region is an area where flow can be presented. Flow can proceed from one region to the next, much like content flows from one column to the next in multi-column layout.

CSS Exclusions define a way to position an exclusion area (generalization of CSS2 float) and give it a more complex shape (not just rectangular).

Implementation of these specifications becomes much simpler if it is limited to only apply to the components of a page master (see next subsection), hence a proposal to subset it.

### 2. Define concept of page masters and page master selection ###
_Priority: high_

This is a remaining portion of "SNL\_R2.1 Multi-region flow". A page master is a template for page partitioning. Page area is broken in multiple regions and content is assigned to a particular region (or sequence of regions). This integrates naturally with CSS Regions.

Page masters are important because they allow design to be centered on the overall page; regions are placed relative to the page geometry, not relative to the content (as it is done traditional CSS layout). This also addresses the problem of conflicts between various "sidebar" elements. In traditional "long scroll" CSS layout this can be dealt with by pushing content down, but that does not always work well for paginated content. For instance, using page masters, a designer may define a page master with a pull quote and a page master with sidebar. This way a sidebar will never be used on the same page with pull quote. (Alternatively, a designer could design a third page master that has both, but position the pull quote and the sidebar so that they don't conflict with each other visually).

Since for most rich layout documents multiple page masters are required, there is a need for page master selection mechanism. Two complimentary methods are useful: one is based on device characteristics (e.g. minimal size) and the other one based on the content (e.g. only use this page master if there is content available for this region). The content-based method requires some sort of lookup in the not-yet-laid-out content.

### 3. Define "variables" and property calculation ###
_Priority: high_

This addresses "SNL\_R1.2 Property value calculation based on environment", "SNL\_R2.3 Page elements alignment", and "SNL\_R2.5 Dynamic formatting based on intersection of multiple properties". For complex layouts, it is not sufficient to express box geometry in terms of single CSS value, even when using percentages. In many cases, certain reference points for layout are calculated based on the page geometry and the default font size and then these values are used as a reference position to place various pieces of content on the page.

Most of these issues can be resolved using one of the CSS Level 3 positioning modules (Grid Layout, Flex Box, or Templates) and calc value in CSS Level 3 Values that allows for simple expressions. This makes it simpler for hand coders, but much harder for tools and tools implementers that rely on precise positioning.

The alternative approach is to extend calc to allow "variables" or, more precisely, named values (calculated once and unchanged). This approach was proposed before ([CSS Variables](http://oocss.org/spec/css-variables.html)), but was never standardized. There was indication at the Adaptive Layout workshop that this area will be looked at again on W3C level.

If expressions and named values are defined, it also may be useful to allow one region to refer to geometry of other regions for relative positioning in the context of a page master.

Yet another convenience feature would be able to use named values in media-query-like conditional styling.

### 4. Flow properties (repeated content, exclusive flows) ###
_Priority: high_

This stems from "SNL\_R2.2 Fixed (repeatable) content". Even when an element is placed in a flow, it is still displayed only once. In paginated environments, though, some parts of the layout are typically repeated (e.g. headers and footers, but in some cases sidebars as well). Also, some parts of the content may be displayed if there is space for them and may not be displayed at all if they cannot be displayed close enough to the relevant part of the body content (pull quotes). These types of behaviors could be represented by additional properties on top of what CSS Regions spec provides.

### 5. integration with interactivity (CSS3 Animations and Transitions) ###
_Priority: medium_

Modern tablet devices typically have screen sizes which are smaller than a typical magazine page. On the other hand, electronic devices provide some level of interactivity which is completely missing in paper. A trend can be observed to use interactivity as an additional "axis" in the layout to overcome space limitations imposed by the device screens and provide more engaging experience for the reader. "SNL\_R3.11 Expando Image Support" is a good example: if there is not enough space for the image, it makes sense to make image zoomable. Another example is to stack several pieces of content on top of each other and present the relevant one on demand (for instance a movie review might have actor names linked to their pictures which are presented in a sidebar when the link is activated).

Mixing rich layout and scripting is somewhat challenging, especially if the layout itself is implemented on top of the browser engine. Fortunately, a lot of the visual effects can be encoded using CSS Transitions and CSS Animation Level 3 modules, which are widely implemented. What's missing is a declarative trigger that could apply CSS properties when certain UI gestures are performed.

### 6. region-based styling ###
_Priority: medium_

This corresponds to "SNL\_R2.4 Region-based styling". Content in a particular region may need to be styled in a special way. One example is that the leading region may use slightly larger font size or different color than the rest of the text. The other example is that floated boxes may be floated to the left on the left column of the page and to the right in the right column.

CSS Regions spec has some solutions, but they are still under heavy discussions and are not implemented.

This feature is relatively straightforward to implement on top of the browser engine.

### 7. text fitting ###
_Priority: medium_

In some cases it is desirable to layout some text-based content so that it fits completely in the area provided. For instance, in many US magazines articles always end at the page boundary. This can be done by inserting extra word and letter spacing, stretching the text, etc.

It would be desirable to express such intent using some CSS properties.


## References ##
### Original EPUB 3 WG Requirements ###
From http://code.google.com/p/epub-revision/wiki/StylingAndLayout :
  * [SNL\_R1.2 Property value calculation based on environment](http://code.google.com/p/epub-revision/wiki/StylingAndLayout#SNL_R1.2_Property_value_calculation_based_on_environment)
  * [SNL\_R2.1 Multi-region flow](http://code.google.com/p/epub-revision/wiki/StylingAndLayout#SNL_R2.1_Multi-region_flow)
  * [SNL\_R2.2 Fixed (repeatable) content](http://code.google.com/p/epub-revision/wiki/StylingAndLayout#SNL_R2.2_Fixed_(repeatable)_content)
  * [SNL\_R2.3 Page elements alignment](http://code.google.com/p/epub-revision/wiki/StylingAndLayout#SNL_R2.3_Page_elements_alignment)
  * [SNL\_R2.4 Region-based styling](http://code.google.com/p/epub-revision/wiki/StylingAndLayout#SNL_R2.4_Region-based_styling)
  * [SNL\_R2.5 Dynamic formatting based on intersection of multiple properties](http://code.google.com/p/epub-revision/wiki/StylingAndLayout#SNL_R2.5_Dynamic_formatting_based_on_intersection_of_multiple_pr)
  * [SNL\_R3.7 Vertical image centering](http://code.google.com/p/epub-revision/wiki/StylingAndLayout#SNL_R3.7_Vertical_image_centering)
  * [SNL\_R3.9 Enhance image float control](http://code.google.com/p/epub-revision/wiki/StylingAndLayout#SNL_R3.9_Enhance_image_float_contral)
  * [SNL\_R3.10 Text Overlay of Images](http://code.google.com/p/epub-revision/wiki/StylingAndLayout#SNL_R3.10_Text_Overlay_of_Images)
  * [SNL\_R3.11 Expando Image Support](http://code.google.com/p/epub-revision/wiki/StylingAndLayout#SNL_R3.11_Expando_Image_Support)


> ### Additional Reading ###
  * [RichLayout (pdf)](http://code.google.com/p/epub-revision/downloads/detail?name=RichLayout.pdf)

  * [CSS Page Templates](http://epub-revision.googlecode.com/svn/trunk/src/proposals/css_page_templates/csspgt-doc.xhtml) (draft)

  * [2011-07 GooglePlex Workshop Slides](http://idpf.org/sites/idpf.org/files/workshop_072011/Workshop_072011_Peter_Sorotokin.pdf)