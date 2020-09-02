# Publications Feedback #

## 1.1 ##
<blockquote> 1.1 Scope and 2. Introduction should be merged. Move generic text in 1.1 to the overview document.</blockquote>

**FIXED: The Overview does now make this intro redundant, so the generic text has been dropped. Prose defining this specification has been moved to P+S section.**

## 1.2 ##
<blockquote> Please add some figures for depicting the taxonomy of resources. Here is our first cut.<br>
<pre>
Resource<br>
- Publication Resource<br>
+ Core Media Type Resource<br>
- Content Document<br>
+ XHTML content document<br>
- EPUB Navigation document<br>
+ SVG content document<br>
- Media Overlay Document<br>
- EPUB Stylesheets<br>
- PLS<br>
- NCX<br>
- Fonts (OpenType and WOFF)<br>
- Image (GIF, JPEG, and PNG)<br>
- Audio (MP3 and MP4 AAC LC)<br>
- Video (MP4)<br>
+ Foreign Resource<br>
+ Package Document<br>
- Supplementary Resource<br>
+ Metadata records...<br>
</pre>
</blockquote>

_TODO: The definitions are auto-generated, so such a taxonomy may not be possible within the terminology section. Consider adding to section 5?_

<blockquote><b>Publication Resource</b> - Please state that publication resources are located in the container with the possible exception of audio or video resources. It might be a good idea to define internal resources and external resources here.</blockquote>

**FIXED: added clarification that audio and video may be external.**

<blockquote> <b>Publication Resource</b> - "In the absence of this resource, the Publication cannot be rendered as intended by the Author" in the definition of "publication resource" appears to be incorrect, since resources in the fallback chain are not always used.</blockquote>

**FIXED: changed to "...the Publication may not render as intended by the Author, or at all.". to cover that the absence of unused fallbacks may have no appreciable effect, but there is no certainty what will happen as it depends on the function of the missing resource.**

<blockquote> <b>Supplementary Resource</b> - The definition of "Supplementary Resource" should explicitly mention the href attribute of link elements. If there are other supplementary resources, they should also be explicitly mentioned. For example, when some resource is referenced by an anchor element of HTML5 or SVG, is the resource a supplementary resource? Furthermore, state that multiple supplementary resources are allowed as part of an EPUB publication.</blockquote>

**FIXED: Noted the link element as the current known use for supplementary resources, but enumerating all possible supplementary resources isn't possible as it's an open-ended list.**

<blockquote> <b>EPUB Navigation document</b> - Are EPUB Navigation documents always top-level content documents?</blockquote>

**FIXED: moved normative statement that addresses this in the Nav introduction in Content Docs to the Content Conformance section.**

<blockquote> <b>EPUB Navigation document</b> - Can an EPUB Navigation document be a scripted content document?</blockquote>

**UNCHANGED: Yes. EPUB Nav Content Conformance states the documents are conformant XHTML Content Docs (only the content model is currently constrained to lists).**

<blockquote> <b>Package document</b> - In our understanding, a package document is a publication resource, but it is neither core nor foreign. Please clearly state this observation.</blockquote>

**UNCHANGED: Unsure what this information adds to the definition, so leaving as is.**

<blockquote> <b>Viewport</b> - Why is "CSS Viewport" defined while "SVG viewport" is left undefined?</blockquote>

**FIXED: SVG Viewport was added as a part of changes to CD req for CSS.**

<blockquote> <b>EPUB Container</b> - Are there one-to-one correspondences between EPUB publications and OCF Abstract Containers?</blockquote>

**DEFERRED: to be addressed with OCF Feedback.**

<blockquote> <b>EPUB Container</b> - Can a zip file (application/epub+zip) contain more than one EPUB publication?</blockquote>

**DEFERRED: to be addressed with OCF Feedback.**

## 2 ##

<blockquote> Introduction - Replace "Web content" by "content", since some XHTML5 or SVG content documents are not distributed on the web.</blockquote>

**FIXED: Removed as per 1.1 above.**

## 3.1 ##

<blockquote> Additional Publication Resource - What are additional publication resources? Are they different from supplementary resources? This term is never used elsewhere.</blockquote>

**FIXED: Rewritten to make clearer that "additional" refers to Publication Resources not already enumerated in the preceding requirements.**

## 3.2 ##

<blockquote> The second bullet in the first itemized list Define "presentation logic".</blockquote>

**FIXED: added examples to clarify aspects of Package that control presentation.**

<blockquote> The third bullet, namely "Unless specified as conditional behavior in this section, it must support rendering of all Core MediaType Resources.", in the first itemized list What about media overlay documents? Are reading systems required to support it? If so, shouldn't such a requirement be stated in the media overlay specification?</blockquote>

**DEFERRED: to be addressed in Overlays in a RS requirements section.**

<blockquote> The third bullet, namely "Unless specified as conditional behavior in this section, it must support rendering of all Core MediaType Resources.", in the first itemized list What does "it must support rendering" mean when the core media type resource is a PLS, NCS, Font file, or EPUB stylesheet?</blockquote>

**FIXED: Changed "support rendering of" to "support"**

<blockquote> The third bullet, namely "Unless specified as conditional behavior in this section, it must support rendering of all Core MediaType Resources.", in the first itemized list What does "support rendering" mean in the case that the core mediatype resource is an XHTML or SVG? Note that later bullets simply say “process".</blockquote>

**FIXED: as per previous**

<blockquote> The last bullet in the first itemized list. Mention SSML attributes attached to MathML or SVG.</blockquote>

**FIXED: Changed wording to "attributes in" to clarify that it applies to all content**

## 4.2 ##

<blockquote> Replace "Package Document Content Conformance" (the title of this subsection) by "Package Document Conformance" since it is not talking about content documents.</blockquote>

**FIXED: These subsections all repeat the parent section title, so for greater clarity those names have been removed from all instances (e.g., "Package Document Content Conformance" is now just "Content Conformance").**

<blockquote> The second bullet in Document Properties Shouldn't foreign elements in package documents be allowed? If this is the case, revise the RELAX NG schema or write an NVDL script.</blockquote>

**FIXED: No change. OPF2 did not allow this, neither have we discussed nor agreed to add support for this in OPF3.**

## 4.3 ##

<blockquote> Do we really need "Package Document Reading System Conformance"? We propose that it should be removed and that al requirements be moved to "3.2 EPUB Reading System Conformance".</blockquote>

**FIXED: 3.2 should have been "Publication" Reading System Conformance. Fixed the title and have not moved the reqs.**

## 4.4.2 ##

<blockquote> What does "abstract content" mean? It is never used.</blockquote>

**FIXED: removed redundant clause.**

<blockquote> The third paragraph ("Properties from....") Replace "other vocabularies" by "vocabularies other than DCMES and DCMI".</blockquote>

**FIXED: changed to "Properties from vocabularies not defined in this specification" ("other" also means other than the EPUB3 vocab).**

## 4.4.9 ##

<blockquote> Introduce an co-occurrence constraint in the schema for package documents: (1) when the media-type attribute specifies a core mediatype, the fallback attribute should be prohibited; and (2) when the media-type attribute does not specify a core media type, the fallback attribute should be required.</blockquote>

**Comment: fallbacks are not prohibited when core media types are used. Schematron can indeed be used to check the opposite though. Adding a TODO to the schematron file; we will implement this test as late as possible.**

<blockquote> The second paragraph ("All Publication ...") Why should we allow absolute IRIs as the value of @href of item elements? Do they reference video or audio?</blockquote>

**FIXED: Changed to "relative IRI reference"**

## 6.4 ##

<blockquote> Replace "XML Document Content Conformance" by "XML conformance", since it is not talking about content documents.</blockquote>

**FIXED: Changed to XML Conformance.**