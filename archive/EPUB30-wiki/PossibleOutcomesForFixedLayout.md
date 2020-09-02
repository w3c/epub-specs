## Introduction ##

In preparation to the [IDPF EPUB Workshop for Fixed Layout in Taipei on 2011-10-25](TaipeiFixedLayoutWorkshop.md), a list of possible outcomes for fixed layout is
presented.

No final decisions for outcomes will be made in the workshop.  The goals for this workshop is to develop shared understanding of current situation and start to brainstorm & discuss potential mechanisms for addressing gaps. As a result of this workshop, IDPF could create proposed working group charter(s) to address priority gaps

Feedback on this list is welcome. Additions or modifications are
also very welcome, but please contact the facilitator, MURATA Makoto
(eb2m-mrt atmark asahi-net.or.jp), in advance.

## PO1: EPUB extension modules ##

In this approach, new
specifications for EPUB fixed layout are created.  Ideally, it should
be possible to use such extension modules without changing EPUB3
specifications or breaking conformance to EPUB3.

Example: M4B3 in [4: Granularity](http://code.google.com/p/epub-revision/wiki/TaxonomyOfMechanismsForFixedLayout#M4:_Granularity) can be provided as an extension module.

## PO2: New vocabularies ##

EPUB3 already allows the use of vocabularies such as
[Structural Semantics Vocabulary](http://idpf.org/epub/vocab/structure/) and [Package Metadata Vocabulary](http://idpf.org/epub/30/spec/epub30-publications.html#sec-package-metadata-vocab).  In this approach, more vocabularies for EPUB fixed layout
are created.  Existing EPUB3 specifications need not be revised.

Example: M2A1 in [M2: Mechanisms for announcing fixed layoutness](http://code.google.com/p/epub-revision/wiki/TaxonomyOfMechanismsForFixedLayout#M2:_Mechanisms_for_announcing_fixed_layoutness) requires a new vocabulary.

## PO3: Subsets or conformance classes ##

In this approach, additional specifications are created for those
EPUB3 publications which represent fixed layout.  To be precise, such
specifications define either profiles (i.e, subsets the set of
conformant EPUB publications) and/or conformance classes (i.e., small
collections of requirements on reading systems).

Although this approach does not introduce new features, it may address [Overkill](http://code.google.com/p/epub-revision/wiki/ConcernsAboutFixedLayout#C2:_Overkill?), since some key features such as HTML and SVG can be dropped.  One could
argue that this approach also addresses [Fragmentation](http://code.google.com/p/epub-revision/wiki/ConcernsAboutFixedLayout#C3:_Fragmentation?), but one could also argue that it rather cause [Fragmentation](http://code.google.com/p/epub-revision/wiki/ConcernsAboutFixedLayout#C3:_Fragmentation?).

## PO4: Best practices ##

In this approach, rather then creating a subset or conformance class, technical reports for  best practices are created.  Note that most of the mechanisms shown in [TaxonomyOfMechanismsForFixedLayout](TaxonomyOfMechanismsForFixedLayout.md) are already available in EPUB3, although they are probably not well-known.

This approach differs from PO3 in that it does not strongly encourage implementations of subsets.  However, one could argue that such subset implementations will appear and have already appeared.

## PO5: EPUB 3.0.X ##

It might be necessary to introduce some mechanisms to EPUB 3.0.X.

Example: M2C in [M2: Mechanisms for announcing fixed layoutness](TaxonomyOfMechanismsForFixedLayout#M2:_Mechanisms_for_announcing_fixed_layoutness.md) requires changes to EPUB3 OCF.

## PO6: Adoption of other specifications ##

Some of the specifications being developed by W3C or other standardization organizations might be very useful for fixed layout.  It might be a good idea to adopt them for EPUB  and also contribute to their development.  For example,
[CSS3 Device Adaptation](http://dev.w3.org/csswg/css-device-adapt/) is intended to represent desired device
dimensions and other related information.

## PO7: EPUB 3.X ##

A major update to EPUB may be necessary or desirable. This would require more process and time than a minor (maintenance) release.