#page for ad hoc group to work on rendition mapping (aka replica map) data structure.

# Members #

  * Jim Lester (BN) - LEAD
  * Roger Webster (BN)
  * Brady Kroupa (BN)
  * Dave Cramer (Hachette)
  * Peter Sorotokin (Adobe)
  * Markus Gylling (IDPF)
  * MURATA Makoto (JEPA)
  * Eric Freese (Aptara)
  * Luc Audrain (Hachette Livre)
  * Shunichirou NONAKA (Fujifilm)
  * Masao MURATA (Fujifilm)
  * PLEASE ADD YOUR NAME TO END

# General Purpose #

Within an EPUB there may be multiple renditions of the same content.  For instance a pre-rendered layout of the document as one rendition, and the XHTML content as a different rendition.  For a user to navigate between those renditions it is useful to be able to creating a mapping between locations in the two renditions.

# Grammar #
See renditionMap-P-A.xml and renditionMap-P-P.xml for the old proposal.  This following is a quick sketch of the new proposal that is updated to:

  1. use polygon instead of polyline (more correct syntax)
  1. make the polygon syntax conform more closely to the SVG syntax for polyline
  1. also update rectangle syntax to conform more closely to the SVG syntax
  1. include additional SVG primitives for circle and ellipse.

```
<map        source-full-path="path to OPF file" 
          destination-full-path= "path to OPF file">
     <targetMaps>
          <targetMap>
<!-- Note: all points follow the spatial offset convention in the CFI spec and are expressed 
                 as a percentage of the graphic width (for x coordinates) and height (for y coordinates). 
                 The syntax for the regison selection elements (rect, circle, etc...)  follow the SVG syntax 
                 for those elements, but we will want it in a different namespace, to allow for the points 
                 to be CFI style spatial offsets.
      Note2: A targetMap contains one or more sourceTarget, and one and only one destinationTarget elements -->
                <sourceTarget sourceID="manifest id in source-full-path">
                    <polygon points="75.2,80.0 90.1,40.2 22.0,35.0">
<!-- or -->
                    <rect x="5.0" y="10.0"  width="10" height="15.0"/>
<!-- or -->
                    <circle cx="100" cy="50" r="40" />
<!-- or -->
                     <ellipse cx="210" cy="45" rx="170" ry="15"/>
                </sourceTarget>
                <destinationTarget destID="destinationID1">
<!-- follow the rules for CFI ranges http://idpf.org/epub/linking/cfi/epub-cfi.html#sec-ranges 
        Note that the initial subPath part is redundant /6/4[destinationID1]! since the destID covers this --> 
                    <cfirange subPath="/6/4[destinationID1]!/4[body01]/10[para05]" start="/2/1:1" end="/3:4" />
                </destinationTarget>
            </targetMap>
        </targetMaps>
</map>
```

Proposed addition - child element of map to handle guided view
```
<threads>
    <thread>
         <view index="integer index within thread">
                    <polygon points="75.2,80.0 90.1,40.2 22.0,35.0">
<!-- or -->
                    <rect x="5.0" y="10.0"  width="10" height="15.0"/>
<!-- or -->
                    <circle cx="100" cy="50" r="40" />
<!-- or -->
                     <ellipse cx="210" cy="45" rx="170" ry="15"/>
<!-- reading system may choose the closest enclosing bounding box for the zoom -->
         </view>
    </thread>
<!-- additional thread elements as needed -->
```


The region selection (polygon, rect, circle, ellipse) are undefined in behavior for XHTML content, just as the cfirange behavior is undefined for bitmap content.

Open questions:
  * Multiple map files or a single map file
  * Map file naming:
    * META-INF/renditionMap.xml for a single
    * META-INF/renditionsMaps/OPFSource-OPFDest.xml for multiple?

# Other Considerations #

A request from the Fixed Format workshop was to consider the work being done for Advanced Adaptive Layout, to see if we can leverage the work being done for specifying regions within the document. The latest versions of the AAL work is being done as CSS Regions, and the closest thing for specifying the regions is the CSS3 Exclusions and Shapes: http://dev.w3.org/csswg/css3-exclusions/ which adopts a microformat version of SVG circle, elipse, rectangle, and polyline, and (as well as indirect inclusion in css of those SVG).

The current proposal for rendition map is a XML based format, which makes the direct inclusion of the CSS syntax uninteresting.  However it may be useful to keep the same element set and parameters, and adopt (with a different namespace) the SVG XML representation that they came from.

# Documents #
  * Example Fixed Format Cosmo Magazine, COSMO-BNFF\_V2.drp.epub: http://epub-revision.googlecode.com/files/COSMO-BNFF_V2_drp.epub
  * [BNFixedFormat](BNFixedFormat.md)
  * renditionMap-P-A.xml: http://code.google.com/p/epub-revision/downloads/detail?name=renditionMap-P-A.xml
  * renditionMap-P-P.xml: http://code.google.com/p/epub-revision/downloads/detail?name=renditionMap-P-P.xml