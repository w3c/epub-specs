# The Sony Fixed Layout Format #

## Introduction ##

The Fixed Layout Format is an ePUB3 which applies specific metadata properties. It allows publishers or creators to control how the title is displayed.
The properties are not only for 'Fixed layout' purposes, but work for reflow text contents.


## Details ##
The followings are the vocabularies.

  * **orientation**
| Description | The _orientation_ property indicates appropriate orientation for the contents. |
|:------------|:-------------------------------------------------------------------------------|
| Value | portrait | landscape | auto |
| Initial | auto |

  * **page-spread**
| Description | The _page-spread_ property indicates whether the title is optimized for full screen or not. |
|:------------|:--------------------------------------------------------------------------------------------|
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


## Example ##

```
<package ... prefix="layout: http://xmlns.sony.net/e-book/prs/layoutoptions/" unique-identifier="pub-id">
 ...
<metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
 <dc:identifier id="pub-id">urn:uuid:A1B0D67E-2E81-4DF5-9E67-A64CBE366809</dc:identifier>
 <dc:title id="title">Norwegian Wood</dc:title>
 <dc:language>en</dc:language>
 <meta property="dcterms:modified">2011-01-01T12:00:00Z</meta>
 <meta property="layout:page-spread">double</meta>
 <meta property="layout:fixed-layout">true</meta>
 <meta property="layout:overflow-scroll">true</meta> 
</metadata>
```