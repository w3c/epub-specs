# Introduction #

In preparation to the [IDPF EPUB Workshop for Fixed Layout in Taipei on 2011-10-25](TaipeiFixedLayoutWorkshop.md), a list of generic requirements for fixed layout is presented. It is hoped that this list allow IDPF to understand existing mechanisms or upcoming proposals for fixed layout and compare different mechanisms or proposals.


Feedbacks to this list are very welcome.  Additions or modifications are also very welcome, but please contact the facilitator, MURATA Makoto (eb2m-mrt atmark asahi-net.or.jp), in advance.



# C1: Device-dependence #

Fixed layout EPUB publications intended for a certain device should reasonably well for other devices.  In particular, even when the screen size is different, the result should be reasonable.  The corpus of fixed layout EPUB publications should not strongly discourage device manufactures from inventing devices with new form-factors.

Since use of Javascript is likely to decrease device-independence, it should be possible to provide fixed layout without relying on Javascript.

Differences of fonts available in reading systems should not ideally lead to different results for fixed layout EPUB publications without embedded fonts.

# C2: Light-weight #

Fixed layout should not impose too much burden on implementors.
For example, those who like CBX/CBR for fixed layout manga might think that EPUB is not llight-weight.

# C3: Avoiding Unnecessary Fragmentation #

There are several methods for achieving fixed layout in EPUB3.
Different methods for different genres may be fine, but more than one method for a single genre (e.g., magazines) may
multiply implementation and authoring efforts and hamper interoperability.  Subsetting EPUB3 for
some fixed-layout genre may also cause fragmentation, since implementations dedicated to such subsets might appear.

# C4: Accessibility #

Allowing accessibility is always crucial to EPUB.  Fixed layout should not hamper but rather enhance accessibility.  However, one way to provide fixed layout is to represent text with images, and such images likely to hamper accessibility.  See  M1C but also M1A1 and M1B1 in [M1: Mechanisms for specifying fixed layout](TaxonomyOfMechanismsForFixedLayout#M1:_Mechanisms_for_specifying_fixed_layout.md).

## C4.1: Semantic integrity ##

One specific requirement related to accessibility is continuity of semantic constructs split due to presentational layout. A common example is a paragraph that spans 2 pages. If this is split into 2 paragraphs in a fixed-format publication, TTS quality could be impaired and potentially the meaning could be altered. This could theoretically happen in reflowable EPUB since basic content comes in multiple "chunks", but typically these chunks are large and start/end at semantic boundaries such as chapters. But with most reflow mechanisms, the content is split per page without reference to semantic boundaries. A mechanism for associating split entities is therefore needed. This is arguably a general presentation issue as well, not just an accessibility issue as without special tricks the paragraph formatting cues of continuity can't be maintained (see example provided by Hachette Livre).