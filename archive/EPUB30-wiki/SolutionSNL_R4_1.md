This page has potential solutions for [StylingAndLayout##SNL\_R4.1\_Specific\_sized\_renditions "Specific Size Renditions"] from the [Styling and Layout Sub-group Page](StylingAndLayout.md).

# SNL\_R4.1\_PS1 Allow spine-level SVG References in OPF #

This potential solution is to a) legitimize direct references to SVG in the spine and b) clarify Reading System behavior if multiple OPF rootfiles are present in container.xml.

THIS SOLUTION HAS BEEN SUBSTANTIALLY REVISED TO REFLECT SUBGROUP DISCUSSION AT F2F

This solution would, specifically:

1. relax the restriction that content referenced by OPF spine has to be XHTML, so SVG can be referenced directly, i.e. without a wrapper XHTML.

2. clarify the statement in OCF that "The 'rootfiles' element MUST contain at least one 'rootfile' element that has a media-type of 'application/oebps-package+xml'. Only one 'rootfile' element with a media-type of application/oebps-package+xml SHOULD be included. The file referenced by the first 'rootfile' element that has a media-type of 'application/oebps-package+xml' will be considered the EPUB rootfile." to "The first 'rootfile' element that has a media-type of 'application/oebps-package+xml' MUST be considered to be the default representation of the publication"

Pros:
  1. Simple generalization of existing SVG support in EPUB
  1. Tightens up current spec ambiguities wrt multiple rootfiles situation
  1. Enables all requirements to be met
  1. Since page size is logically per-page in prepaginated documents a global width/height attribute is arguably not generally appropriate.
  1. SVG in spine facilitates support of SVG pages within an otherwise reflowable publication.
Cons:
  1. Reading Systems will still need to probe to understand characteristics of additional renditions that may be provided, if they wish to support multiple renditions.
  1. Removing guidance about not using SVG in the spine with default publications has potential negative backwards compatibility consequences (but the most prevalent EPUB2 Reading System that supports SVG at all, already supports direct spine references to SVG).