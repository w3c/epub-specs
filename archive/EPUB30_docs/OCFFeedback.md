# OCF Feedback #



## 1.1 ##

<blockquote> What does "alternate rendition" mean? Is this a technical term? Throughout this document, "rendition" is unclear. </blockquote>
_TODO: Need more clarity about scope of OCF.  Can it contain multiple ebooks?  Or just multiple versions/formats of the same ebook?  "Version" might be a clearer term_

## 1.2 ##

<blockquote> <b>EPUB Publication (or publication)</b> - Are PDF documents (in a zip file) EPUB publications? </blockquote>
**JP:  Answer is no, and I don't think that it's implied in the definition; no action needed**

<blockquote> <b>Publication Resource</b> - "In the absence of this resource, the Publication cannot be rendered as intended by the Author" appears to be incorrect, since fallback resources are not always required. Or, are fallback resources not publication resources? Are there any resources that are not publication resources? </blockquote>
**JP:  Agreed; recommend that this sentence be removed.**

<blockquote> <b>EPUB content document</b> - The phrase "EPUB Content Document definitions" is not linked to anything.  </blockquote>
**No action necessary:  the links to the two different definitions (XHTML, SVG) follow the phrase.**

<blockquote> <b>EPUB content document</b> - "Publication resources are listed in the manifest <a href='Publications30.md'>Publications30</a> ."appears to be incorrect, since packages documents are not listed in the manifest.  </blockquote>
**Fixed:  Added an exception for the package document.**

<blockquote> <b>EPUB Style Sheet (or Style Sheet)</b> - Are SVG-extensions of CSS usable as part of EPUB style sheets? Proposal: Add SVG-extensions of CSS to the CSS Profile. </blockquote>
_TODO:  Sounds like a new issue for the tracker?_

<blockquote> <b>Author</b> - This definition talks about legal responsibility rather than content authoring by EPUB authoring tools (or converters). We think that content authoring should be persons (or organizations) that do authoring. </blockquote>
_TODO:  There's a comment in the document that seems to point out this issue and proposes a solution._

<blockquote> <b>EPUB Reading System (or Reading System)</b> - We are wondering if some important systems might not be covered byte phrase "for presentation to Users". For example, machine translation programs generate an EPUB from another EPUB. Some software converts EPUB to voice and store the voice without any presentation to the user. </blockquote>
_???_

<blockquote> Throughout. Some words begin with capitals but we do not understand why. For example, "Users" in the definition of "EPUB Reading System (or Reading System)" in 1.2 </blockquote>
**Fixed:  Added links for first appearances of "User" in both glossary and OCF body.**

## 1.3.2 ##

<blockquote> The first sentence suggests that there exist some non-conforming OCF abstract containers. We think that there are no such things. The same thing applies to the second sentence. </blockquote>
**Fixed. To harmonize with other specs, the prefix "conforming" has been removed throughout the OCF spec. The term "OCF Processor" has been added to the glossary. This subsection of the Conformance section is now redundant and has been removed**

## 1.3.3 ##

<blockquote> The term "EPUB reading system" belongs to an upper layer rather than OCF. In our opinion, all conformance requirements to "EPUB reading systems” in this document should be reworded as conformance requirements to OCFZIP containers or OCF Abstract containers, and 1.3.3 should be simply dropped. In general, we should always state data conformance as precisely as possible, since it can be easily tested. On the other hand, application conformance cannot be easily tested and thus even strict definitions of application conformance tend to be ignored. </blockquote>
**Fixed. "Reading System" no longer used; "OCF Processor" used instead (and added to glossary)**
## 2 ##

<blockquote> Is this section non-normative? If this is the case, please clearly state so. </blockquote>
**Fixed**

<blockquote> In the first sentence, we first use "set" and then use "collection". Unless there is a reason, we should use the same word. </blockquote>
**Fixed.**

<blockquote> What does OCF mean? OCF in the first para: a package (or technology), OCF in the second para: technology, and OCF in the 3rd para : this specification. </blockquote>
**Fixed:  Edited the third paragraph to make distinction between OCF and OCF specification clearer.**

<blockquote> Both sections 1 and 2 Shouldn't Introduction and Scope (1.1) be merged? Most of the paragraphs in the scope are already covered by the EPBU3 overview document. We do not see any reasons to repeat them in this document. Keep the first and last paragraphs in 1.1 and move everything in Introduction to 1.1. </blockquote>
**Fixed - moved introduction into 1.1, but left the boilerplate statement about other specifications, as it is currenly used this way in all the spec documents**

<blockquote> The itemized list should be made non-normative. </blockquote>
**Fixed: 1.1 is informative in its entirety**


## 3.1 ##

<blockquote> Make this subsection non-normative. </blockquote>
**Fixed**

<blockquote> 1st para Remove "which". </blockquote>
**Fixed.**

<blockquote> container.xml Here explicitly state that an PDF publication (is this the right term?) is also referenced. </blockquote>
_TODO:  This relates to the one-OCF/one-ebook question noted above._

<blockquote> We do not understand why we need manifest.xml. Is this only for backward compatibility with EPUB2, which should be compatible with ODF 1.1? </blockquote>
_TODO:  Is this one for the issue tracker?  Manifest is used strictly for ODF compatibility, I believe, but maybe there's more to it than that._

<blockquote> Are 3.1 and 3.2 consistent? In particular, do "direct child of the root directory" and "directory... at the root level" mean the same thing? </blockquote>
**Fixed:  Modified the language for consistency and clarity.**

## 3.2 ##

<blockquote> 4th para Remove "used by the publication rendition(s) "  </blockquote>
**Fixed.**

<blockquote> The same requirement appears to be specified three times: In 3.1, "The file system model also includes a mandatory directory named META-INF that is a direct child of the root directory..."In 3.2, "The OCF Abstract Container must include a directory named META-INF at the root level of the virtual file system.” In 3.3, "All valid OCF Abstract Containers must include a directory called META-INF at the root level of the container file system"  </blockquote>
_???_

## 3.3 ##

<blockquote> 2nd paragraph  Enumerate specific examples of "Note that some language specifications reference RFCs that preceded RFC3987, in which case the earlier RFC applies for content in that particular language." </blockquote>
_???_

<blockquote> 3rd paragraph Replace "folder" by "directory". </blockquote>
**Fixed.**

<blockquote> 3rd paragraph Replace "META-INF/" by "META-INF". </blockquote>
**Fixed.**

## 3.4 ##

<blockquote> Make clear that a PATH NAME does not begin with "/". </blockquote>
**No action necessary.  It is already clear that a directory name cannot use a slash, and section 3.3 deals with relative paths.**

<blockquote> Define "directory name" </blockquote>
**Fixed.  Changed to "directory File Name"**

<blockquote> The list of disallowed characters appear to be incomplete. Are C0 andC1 control functions allowed? It is probably a good idea to use the intersection of what RFC 3987 and ZIP allow. Note that OOXML also tries to create a list of forbidden characters. </blockquote>
_TODO:  Needs further review.  Don't think that this is a new issue._

<blockquote> Use "Default Caseless Matching" as specified in 3.1 in Unicode rather than an undefined term "case normalization". </blockquote>
_TODO:  Needs further review_

<blockquote> What does "accent normalization" mean?? </blockquote>
_???_

## 3.5 ##

<blockquote> Replace "the META-INF directory at the root level of the container filesystem" by "the META-INF directory". </blockquote>
**Fixed.**

<blockquote> Get rid of the 2nd sentence in 3.5, since its intention is much more precisely stated in subsections. </blockquote>
<blockquote> Is the hanging paragraph of 3.5 really necessary? It appears to be covered by elsewhere. If necessary, the hanging paragraph should become a new 3.5.1 </blockquote>
**Fixed:  The second and third sentences have been combined.**

<blockquote> 3rd paragraph Do not use undefined term "OCF Processors" </blockquote>
**Fixed:  OCF Processor added to glossary**

## 3.5.1 ##

<blockquote> "EPUB rendition" is an undefined term. </blockquote>
_TODO:  See earlier notes on rendition/version, etc._
<blockquote> 1st paragraph. Replace "MIME type" by "media type". </blockquote>
**Fixed.**
<blockquote> Third paragraph. What does "other namespaces" mean? Any namespace but "urn:oasis:names:tc:opendocument:xmlns:container"? </blockquote>
_TODO:  either remove this anyname allowance or make the schema support it natively_
<blockquote> Either delete " (including all child nodes of such elements)" or replace it by "(including all attributes and contents of such elements)" See <a href='http://www.w3.org/TR/REC-xml/#dt-content'>http://www.w3.org/TR/REC-xml/#dt-content</a> </blockquote>
**Fixed; used the alternative language**
<blockquote> Write an NVDL script or modify the RELAX NG schema rather than relying on prose about the deletion of foreign elements. </blockquote>
_TODO:  There is already a comment in the document to this effect_
<blockquote> Where does the schema ocf-container-30.rnc for content.xml come from? I cannot find it anywhere in ODF 1.1. </blockquote>
**No action needed.  This file is not a part of ODF 1.1, it is an EPUB addition.**

<blockquote> ocf-conteinaer-30.rnc Why the value of the attribute version is required to be '1.0' , when this spec is version 3?What should applications do when it encounters unintended versions of CF? </blockquote>
_TODO:  Do we change the version number here?_

<blockquote> Last para. Since unrecognized elements or attributes are by definition belong to foreign namespaces, the last para of 3.5.1 is misleading. Simply mention foreign elements and attributes without saying anything about “unrecognized elements". </blockquote>
**Fixed.  Reworded this as suggested.**

## 3.5.2 ##

<blockquote> What does "one or more container files" mean? Resources? </blockquote>
**Fixed:  clarified that these are files within the container.**

<blockquote> The 3rd paragraph "after removing all elements and attributes from other namespaces(including all child nodes of such elements)." is unnecessary since the RNG schema for XML encryption already allows foreign elements and attributes </blockquote>
**Fixed**

<blockquote> 4th para Delete "When the encryption.xml file is not present, the OCF Abstract Container provides no information indicating any part of the container is encrypted." In our understanding of the first paragraph, the absence of encryption.xml implies that nothing is encrypted. </blockquote>
**Fixed.  This entire paragraph has been removed.**

<blockquote> 6th paragraph We first misread "OCF encryption supports only encryption of whole files." and thought all the resources within a zip file are encrypted. It probably means that we do not encrypt parts of a resource but encrypt the entire resource. </blockquote>
**Fixed.  Clarified this.**

<blockquote> The last two paragraphs of 3.5.2 look unnecessary, since they cover topics already covered by other specifications. If they provide useful information, they should be presented as notes rather than normative paragraphs. </blockquote>
_TODO:  Find a way to do this_

## 3.5.3 ##

<blockquote> Why do we need manifest.xml? Is it used by somebody? </blockquote>
**No action needed.  My understanding is that this is necessary for ODF compatibility.**

<blockquote> Why "(Optional)" only in the title of 3.5.3? </blockquote>
**Fixed.  Removed this from the heading to match the others.**

## 3.5.4 ##

<blockquote> If metadata.xml is not used, simply reserve the file name "metadata.xml" and drop 3.5.4. </blockquote>
_TODO:  Figure out the best way to do this_

## 3.5.6 ##

<blockquote> The last four paragraphs of 3.5.6 look unnecessary, since they cover topics already covered by other specifications. If they provide useful information, they should be presented as notes rather than normative paragraphs. In general, do not provide a seemingly-normative summary of what other specifications standardize. </blockquote>
_TODO: Figure out the best way to do this_

## 4.2 ##

<blockquote> What does "corresponding representation " in the fifth bullet in the first itemized list mean? Are embedded PDF documents such corresponding representations? </blockquote>
**Fixed (I think): changed from "information ... that do not map to corresponding representation within the OCF Abstract Container" to "information ... that is not defined within the OCF Abstract Container."**

## 4.3 ##

<blockquote> Drop the first two paragraphs or make them non-normative, since they are just informative. </blockquote>
**Fixed: dropped these paragraphs, also replaced the magic numbers para with a reference to Appendix C**

<blockquote> In the third paragraph, please state that the Unicode signature (or the BOM) is not allowed at the beginning of the mimetype file. </blockquote>
**Fixed**

## 5.1 ##

<blockquote> This subsection should be non-normative. </blockquote>
**Fixed**

## 5.2 ##

<blockquote> The first occurrence of "publication's unique identifier" (in 5.2) does not reference anything, but the second one does. Should we mention identifiers only in 5.3?  </blockquote>
**Fixed; removed the details about the key from section 5.2 and replaced with a simple pointer to section 5.3**

## 5.3 ##

<blockquote> Make most of the first paragraph non-normative. </blockquote>
**Fixed.  Deleted much of this paragraph, since it is redundant to the OPF spec.**

## Appendix A ##

<blockquote> Rather than simply invoking the RELAX NG schemas for XML encryption, customized them and specify the content model when @Algorithm="<a href='http://www.idpf.org/2008/embedding'>http://www.idpf.org/2008/embedding</a>". </blockquote>
_???_

## Appendix B ##

<blockquote> Example B.3 - Replace "OEBPS/As You Like It.pdf" by "PDF/As You Like It.pdf". </blockquote>
**Fixed**

## Appendix C ##

<blockquote> Specify two other bytes (i.e., 03 04) that follow "PK" (i.e., 50 4B) as in ZIP. </blockquote>
**Fixed**

<blockquote> Please mention Javascript in security considerations. </blockquote>
**No action necessary.  It already mentions "content that has security implications beyond those described here," which would cover this.**

## General ##

<blockquote> Throughout In this specification, please summarize differences between OCF 2.0 and OCF3.0. </blockquote>
_TODO:  This should go into the Changes document_

<blockquote> Throughout When an PDF is included within a zip file and referenced in container.xml, is it a publication resource? Is it part of an EPUB publication? </blockquote>
**No.  It is an alternative version/format of the book that is transported within the container.  This will be made clearer throughout.**