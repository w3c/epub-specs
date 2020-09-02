#page for ad hoc group to work on rendition metadata vocabulary.

# Mission #
The group is defining a specification for additional package document metadata called rendition metadata, which while primarily applicable to fixed layout content, can also be used for reflowable content. Rendition metadata provides reading systems information about the renditions in the epub so that the reading systems can select the appropriate rendition to display based upon device characteristics and user input.

# Members #

  * Takeshi Kanai (Sony) - LEAD
  * Peter Sorotokin (Adobe)
  * Markus Gylling (IDPF)
  * Roger Webster (Barnes & Noble)
  * Jim Lester (Barnes & Noble)
  * Brady Kroupa (Barnes & Noble)
  * MURATA Makoto (JEPA)
  * Dave Cramer (Hachette)
  * Eric Freese (Aptara)
  * PLEASE ADD YOUR NAME TO END

# Action items #
  1. To review if the vocabulary is sufficient.
  1. To choose one from the ways to set the vocabulary for each item.


# General Principles #

  * The newly introduced items should follow ePub 3.0 schema as much as possible.



# Vocabulary #

  * **orientation**
| Description | The _orientation_ property indicates appropriate orientation for the contents. Reading systems should display the content in the orientation|
|:------------|:--------------------------------------------------------------------------------------------------------------------------------------------|
| Value | portrait | landscape | auto |
| Initial | auto |

  * **page-spread**
| Description | The _page-spread_ property indicates whether the title is optimized for full screen or not. The value 'full' indicates that the content should be displayed on entire screen. The value 'double' indicates the content requires 'double-page-spread' to display. The value 'auto' indicates that Reading system can drive the way to display the content.|
|:------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Value | full | double | auto |
| Initial | auto |

  * **fixed-layout**
| Description |  The property specifies whether the content prohibits style changes, such as font change or margin adjustment. |
|:------------|:---------------------------------------------------------------------------------------------------------------|
| Value | true | false |
| Initial | false |

  * **overflow-scroll**
| Description | The property specifies whether the content is visible by scrolling when it overflows display area. |
|:------------|:---------------------------------------------------------------------------------------------------|
| Value | true | false |
| Initial | false |

  * **viewport**
| Description | _(Same as CSS Device Adaption: viewport)_ Provides a way for publication to specify the initial size. |
|:------------|:------------------------------------------------------------------------------------------------------|
| Value | width, height, initial-scale, minimum-scale, maximum-scale, user-scalable |
| Initial | N/A |


Anything else?


# Syntax #

For the spine item rendition, the most appropriate one should be selected from the candidates.

## metadata in OPF ##
### Publication base ###
  * To use the vocabulary for meta@property.
> Example:
```
<meta property="page-spread">double</meta>
```

> Open questions:
    1. A prefix for the vocabulary should be assigned?

### Spine item base ###
  * To use the vocabulary for meta@property for each item.
> Example:
```
<metadata>
  :
 <meta refines="#page5" property="page-spread">double</meta>
  :
<metadata>
<manifest>
  :
 <item id="page5" href="page5.xhtml" media-type="application/xhtml+xml" />
  :
</manifest>
```

> Open questions:


## Manifest item Properties ##
### Spine item base ###
  * To use the vocabulary as Manifest item Properties.
> Example:
```
<item properties="page-spread-double" id="page5" href="page5.xhtml" media-type="application/xhtml+xml" />
```

> Open questions:
    1. Should we introduce a new attribute for this purpose?


## Spine itemref Properties ##
### Spine item base ###
  * To use the vocabulary as Spine itemref Properties.
> Example:
```
<itemref idref="page5" properties="page-spread-double" />
```

> Open questions:


## XHTML metadata ##
  * **viewport**
| Description | These dimensions determine the aspect ratio of a page, allowing a page to maintain its precise layout on any size device, in any orientation, for both landscape-dominant and portrait-dominant books. |
|:------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inherited | yes |
| Value | width, height  |
| Initial | N/A |


## CSS viewport ##
viewport property**See [CSS Device Adaption viewport](http://www.w3.org/TR/css-device-adapt/#viewport-meta-element)**

> Open questions:
    1. The spec is a technical report. Should we support it at this stage?


# Relation To Other Specifications #

  * [Mapping|RenditionMappingAdHocGroup](Rendition.md)
Rendition Metadata helps in the process of selecting a rendition to view, while Rendition Mapping provides a way of expressing the relationship between content in the rendition.  For instance in a document with 3 renditions - text, portrait-fixed, and landscape-fixed, the Rendition Metadata allows the  Reading System to select the appropriate rendition - such as selecting between portrait and landscape as the user rotates the device.  The Rendition Mapping allows the Reading system to synchronize the content while switching between those renditions.

  * Others (TBD - Media Queries, CSS as the syntax for the metadata is agreed upon)

# Use cases #

  1. A publication containing double-page spread as an image file. E.g.) Comics, Children books
    * The publication will be set page-spread:full to indicate that each spine item is designed to display it on entire screen.
    * The publication will be set viewport to indicate its aspect ratio, expecting the content will be fit to the screen size automatically.
    * The publication will be set fixed-layout:true to indicate that the content does not need any adjustments, such as font-size change, font face change and margin adjustment.
    * The publication might be set orientation:landscape to indicate that the content is designed for landscape.
  1. A publication offering Web like user experience. E.g.) Magazines
    * The publication will be set page-spread:full to indicate that each spine item is designed to display it on entire screen.
    * The publication will be set overflow-scroll:true to indicate that the content requires scroll control, not pagination.
    * The publication might be set fixed-layout:true to indicate that the content does not need any adjustments.
  1. A publication which contains single page as an image file, and needs to be displayed with the previous or next page. E.g.) Comics, Children books
    * The publication will be set page-spread:double to indicate that two spine item should be displayed simultaneously.
    * The publication will be set fixed-layout:true to indicate that the content does not need any adjustments.
  1. A publication containing a huge stuff, such as tables or maps, in a page. In most cases, the page has linear='no' attribute in the spine.
    * The page will be set overflow-scroll:true to indicate that it requires scroll view to display the content.


# Rendition Metadata Processing model #
(To be updated)

  1. Parse the rendition metadata written in the target OPF and calculate 'Viewport' width and height for each EPUB Content Document following the rules below.
    1. **orientation** Calculate available Viewport dimension by using the direction of 'orientation' to render an EPUB Content Document. 'orientation:landscape' indicates that the content calls for vertical 'Viewport'. 'orientation:portrait' indicates that the content calls for horizontal 'Viewport'. 'orientation:auto' indicates that Reading Systems can display the content in anyways.
    1. **page-spread** Update the caliculated Viewport dimension by using page-spread setting. When 'page-spread:double' is set, Reading Systems should split the Viewport into two and display both at the same time. If it is 'page-spread:full', Reading Systems should use entire the Viewport for rendering the content. 'page-spread:auto' indicates that Reading Systems can display the content in anyways.
    1. **overflow-scroll** When 'overflow-scroll:true' is set, Reading Systems should display the content on scrollable view. If it is 'overflow-scroll:false' or Reading Systems have no capability to switch the view mode, Reading systems should ignore the setting and follow EPUB Content Document processing model.
    1. **fixed-layout** When 'fixed-layout:true' is set, Reading Systems should render the EPUB Content Document as it is.
    1. **viewport** Reading systems should apply the setting to each EPUB Content Document.
  1. Render an EPUB Content Document into the 'Viewport' following EPUB Content Document processing model.


# Proposals #
(To be updated.)
  * [iBooksFixedLayout](iBooksFixedLayout.md)
  * [BNFixedFormat](BNFixedFormat.md)
  * [SonyFixedLayoutFormat](SonyFixedLayoutFormat.md)
  * [AAPProposalForFixedLayout](AAPProposalForFixedLayout.md)
  * [AzardiFixedLayoutMetadata](AzardiFixedLayoutMetadata.md)