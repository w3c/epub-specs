# Introduction #

EPUB3 depends on several moving targets such as W3C working drafts.  This document enumerates these moving targets and also shows our strategy for minimizing risks caused by such moving targets.


# W3C #


  * [HTML5 (CR)](http://www.w3.org/TR/2012/CR-html5-20121217/)
    * It is not clear if the HTML5 schemas used by EPUB3 faithfuly capture the latest language design.

  * [CSS3 Speech (CR)](http://www.w3.org/TR/css3-speech/)
    * EPUB CSS Profile uses only a few of the properties in this spec

  * [CSS3Text (Last Call Working Draf)](http://www.w3.org/TR/css3-text/)
    * EPUB CSS Profile uses only a few of the properties in this spec

  * [CSS3 Text Decoration (CR)](http://www.w3.org/TR/css-text-decor-3/)
    * This specification is immature.
    * EPUB CSS Profile uses only a few of the properties in this spec

  * [CSS3 Writing Modes (CR)](http://www.w3.org/TR/css3-writing-modes/)
    * This specification is immature.
    * EPUB CSS Profile uses only a few of the properties in this spec

  * [CSS Multi-column Layout Module (CR)](http://www.w3.org/TR/css3-multicol/)
    * Since this spec is expected to finalized soon, there are no significant risks.

  * [Media Queries (REC)](http://www.w3.org/TR/css3-mediaqueries/)

  * [CSS Fonts Module Level 3 (CR)](http://www.w3.org/TR/css3-fonts/)
    * EPUB CSS Profile uses only a few of the properties in this spec,  and they came from CSS 2.0.  There are no significant risks.

  * [CSS Lists and Counters Module Level 3 (WD)](http://www.w3.org/TR/css3-lists/)
    * This specification is immature.
    * EPUB CSS Profile does not use any of the properties in this spec.

  * [CSS3 Ruby Module (WD)](http://www.w3.org/TR/css3-ruby/)
    * This specification is immature.
    * EPUB CSS Profile uses only one of the properties in this spec

  * [XML DSIG Core  1.1 (REC)](http://www.w3.org/TR/xmldsig-core1/)

  * [XML ENC Core  1.1 (REC)](http://www.w3.org/TR/xmlenc-core1/)

  * [XML Security RELAX NG Schemas (W3C Working Group Note)](http://www.w3.org/TR/xmlsec-rngschema/)
    * This spec has not been updated to reflect changes in XML DSIG Core 1.1 and XML ENC Core 1.1.

# Unicode #

  * [UTR #50: Unicode Properties for Horizontal and Vertical Text Layout](http://www.unicode.org/reports/tr50/)  (This is considered stable.)


Unicode, The Unicode Consortium. The Unicode Standard, Version 5.0.0, defined by: The Unicode Standard, Version 5.0 (Boston, MA, Addison-Wesley, 2007. ISBN 0-321-48091-0) is strictly speaking a moving target, but it is reasonably stable now.

# Remarks #

CSS2.1: Cascading Style Sheets Level 2 [Revision 1](https://code.google.com/p/epub-revision/source/detail?r=1) (CSS 2.1) Specification is now a Recommendation. There are no risks.


XMP ISO/IS 16684-1 http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=57421 has been removed from this list, since it is an International Standard.

Scalable Vector Graphics (SVG) 1.1 (Second Edition) is now a Recommendation. There are no risks.

On the basis of the 2nd teleconference of SC34/AHG4, some specifications, namely Dublin Core Metadata Element Set, Version 1.1, DCMI Metadata Terms, MARC 21 XML Schema, and Metadata Object Description Schema (MODS), and ONIX for Books has been removed from this list.