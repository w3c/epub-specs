# Annotations - 'metadata on content' #



## Implementation Proposal ##

  * http://code.google.com/p/epub-revision/wiki/ImplementationProposalAnnotations

## Requirements Review Status ##

Requirements have been reviewed by: Daniel Weck; Alexis Wiles; Will Manis

## Mission ##

The goal of the annotations sub-group is to provide a specification for schema and storage of data associated with content in an EPUB document. It is quite likely that the specification will be an entirely separate document (e.g. not unlike OPS, OCF, OPF) under the EPUB umbrella. (Needs refinement.)

**Slides from f2f:
  * [Annotations.ppt](http://files.me.com/wmanis/c2o1l8)
  * [Mei-Li Chen Institute of Information Industry](http://files.me.com/wmanis/ce9tb1)**



## Process ##

  * **Requirements due end of July 2010**
  * Please use email subject line: "annot" : subject for all email communications
  * Scheduled Skype call:<br>
<ul><li>tbd</li></ul></li></ul>

<h2>Participants ##

| **Name** |  **Organization** | **Role** | **UT time** | **Preferred con call time** |
|:---------|:------------------|:---------|:------------|:----------------------------|
| Will Manis |  Viscous Documents | (coordinator) |  UTC/GMT -8 | late afternoon/evenings |
|  Mei-Li Chen | Institute for Information Industry |  | UTC/GMT +8 |  |
|  Cho Ching Lu |  Institute for Information Industry |  |  UTC/GMT +8 |  |
|  King Wai Chow |  ASTRI |  | UTC/GMT +8 | 02:00 - 10:00, 13:00 - 16:00, 22:00 - 23:00UTC |
| Jon Noring | Invited expert |  | UTC/GMT -5 |  |
| Norm Walsh | MarkLogic Corporation |  | UTC/GMT -5 |  |
| Ben Trafford | Invited expert |  | UTC/GMT -8 | 14:00 - 00:00UTC, 03:00-08:00UTC |
| Roger Sperberg | Invited expert |  | UTC/GMT -5 |  |
| Wen Hsuan Hsieh | Institute for Information Industry |  | UTC/GMT +8 | 00:00 ~ 04:00 UTC |
| Keith Fahlgren | Threepress |  | UTC/GMT -8 | 20:00-23:00 UTC |
| Chelsea Valentine | LibreDigital |  | UTC/GMT -6 | 19:00-22:00 UTC |
| Karen Broome | Sony Electronics |  | UTC/GMT -8 |  |
| Daniel Weck | DAISY Consortium |  | UTC/GMT (London) |  |
| Takeshi Kanai | Sony Electronics |  | UTC/GMT -8:00 | 1PM - 4PM |
| Ronnie Gambon | HarperCollins Publishers |  | EST (New York) |  |
| Alex Zu | ASTRI |  | UTC/GMT +8 | 10am - 4pm local |
| name | org | role | tz | preferred time |


## Scenarios ##

This section should have scenarios that describe the creation and use of metadata/annotations. It is not a requirement that the final specification covers every scenario. It should not go into technical details about implementation issues:
  * Authors annotations  ancillary content included at content packaging/publication time, these may be included in the EPUB (shared)
    1. Last minute errata
    1. Pronunciation (e.g. voice/sound, phonetic (rubi, IPA, etc.)
    1. Footnote
    1. Commentary (e.g voice, text, video, etc.)
  * Readers private annotations  annotations and bookmarks developed by a single reader for their private use
    1. Underlining/highlighting significant content (text, images, tables, video, etc.)
    1. Adding a bookmark (perhaps automatically by the reading system for the farthest position read)
    1. Adding a comment (textual note) to a range of selected content (text, image, video).
    1. Mindless drawing/doodles
    1. Adding an image to a range of selected content
    1. Adding an audio or video recording to a range of selected content
    1. Create a linkage between a point in a document and any other resource
  * Published annotations  may be part of a commercial offering or an explicit group context (shared)
    1. All of the above
    1. Answers to a quiz (rich media) meant for teacher.
    1. Notes from a teacher to students.
    1. Notes from myself to members of my book club.
    1. Adding a table containing additional experimental data to an existing table in a scholarly journal.
    1. Annotations from a third party for sale to students reading Huckleberry Finn.
    1. Errata
    1. Definitive commentary from an interesting voice (editor, celebrity, historical player, etc).
    1. Annotations on annotations

## Requirements & issues ##

#### ISSUE\_I1 How far should this specification go in suggesting how user agents display annotations? ####

_Rationale: The display of annotations can be an exceedingly complex problem, we need to allow UA freedom to handle accessibility, device limitations, domain requirements, etc. Should we focus on the data representations and integrity of annotations and a very set of minimal display requirements that ensure the integrity of the annotation, the annotator and the annotated content? Or more display requirements?_

#### ANNOT\_R1 ((B, A, A, C)) Mechanism to guarantee that document content has not changed ####

_Rationale: The scenario we need to prevent here is  - an author creates a document and says Vinay is a good guy, I come along and add an annotation that says I agree (that Vinay is a good guy), the author later edits the document to read Vinay is a criminal, my I agree annotation will now be misinterpreted by subsequent viewers of my annotation._

COMMENT by WillManis: The digital signature section of the OCF specification allows for this requirement (3.5.4 Digital Signatures  META-INF/signatures.xml (Optional))  unfortunately this section is not required. Unfortunately the originator of the document does not have a strong impetus to provide these DSIGs (the benefit only accrues downstream). The document containing the annotations could store signatures of the annotated data, provided the user agent(s) provided the data in a form that could be used to generate a dsig consistently. The user agent would have to guarantee that it had not introduced any additional content that would pollute the DSIG.

#### ANNOT\_R1.1 ((B, A, C, C)) Mechanism to guarantee identity of document author ####
#### ANNOT\_R1.2 ((B, A, C, C)) Mechanism to guarantee anonymity of document author ####

#### ANNOT\_R2 ((B, A, A, B)) Mechanism to guarantee that the public annotation has not changed ####

_Rationale: The scenario we need to prevent here is  - an author creates a document and says Vinay is a good guy, I come along and add an annotation that says I agree, I do not want a subsequent annotator to change my annotation to "I disagree"._

PROPOSAL by KingWai: ANNOT\_R2.1 ((A, F)) => The published annotation maybe revoked or recalled by the annotator. In this case, all the subsequent annotations with respect to this annotation are removed. For the anonymous annotator(ANNOT\_R7 below), the published annotation can't be revoked. COMMENT (and ranking) from WillManis: Once published no ability to revoke. This could only be implemented by a  private network or reliance on CAs that really provides no guarantee of anything.

PROPOSAL by KingWai: ANNOT\_R2.2 ((A, A)) => User is free to change or erase his/her personal annotations (i.e. local to his/her reader system and not published). The revoked annotations are considered local also.

#### ANNOT\_R3 ((A, A, A, A)) Document identifiers ####

_Rationale: Annotations stored seperately from the referenced document should be able to reliably identify the referenced document._

PROPOSAL by KingWai: ANNOT\_R3.1 ((A, A)) => The annotation for the whole document is allowed. In this case, the annotation references only the document but not the specific content inside the document.

COMMENT by WillManis: This is a general problem that is covered in the metadata working group. This requirement provides a high level correlation between the annotation and the referenced document. Minor versions of document will have the same identifier, so relying solely on the document identifier maybe problematic if the annotated content is changed in a minor version, thus the need for the next requirement. That being said for annotations that are not sensitive this level of identity may be sufficient.

#### ANNOT\_R4 Content identification ####

_Rationale: Annotations must be able to reference text, audio, video, spatial (ink circle of a face in an image), etc._

- 2010/07/16, Daniel Weck: I suggest breaking-down ANNOT\_R4 into several, more accurate requirements. I have drafted a few and named them "4.x", as follows:


#### ANNOT\_R4.1 ((A, A, A, A)) XML/HTML Unique Identifiers ####

_Description: Identification of an annotation target as a named (i.e. predefined, authored with a unique identifier), media-agnostic structural point/location in the content document._

_Rationale: annotations must be able to reference a particular XML element in the content document, regardless of the type of content the pointed element represents (e.g. text markup, video or audio tag from HTML5...etc.), using unique names (such as XML fragment identifiers) that have been authored explicitly in the targeted content document (i.e. predefined/prepared intentionally by the content producers)._

COMMENT by WillManis: This assumes the presence of an html:id or xml:id attribute, or the ability to introduce one to the document. None of these strike me as assumptions that we should rely on.

#### ANNOT\_R4.2 ((A, A, A, B)) Structural Paths (XPath Expressions) ####

_Description: Same as ANNOT\_R4.1, but instead of targeting predefined unique identifiers, here the identification of the point/location in the content document is based on a given path leading to the XML element in question, which requires structural assumptions (i.e. the knowledge from the annotation creator about the structure of the document)._

NOTE: by virtue of ANNOT\_R1, the structure of the content document is considered immutable which guarantees that the annotation targets described in ANNOT\_R4.1 and ANNOT\_R4.2 cannot be broken.

COMMENT by WillManis: An XPath to content. Current browsers do not make this an easy assumption, either by Javascript DOM manipulation or by under the cover content mutation. The UA would needs to provide a canonical xpath to the content. The canonical xpath will need to be precisely defined, avoiding problematic xpath constructs.

#### ANNOT\_R4.3 ((A, A, A, B)) Unicode Character Offset ####

_Description: Identification of an annotation target as a location in between 2 consecutive unicode characters inside the XML content document._

_Rationale: annotations must be able to reference a particular point/location in a stream of unicode characters, expressed relatively to a particular structural point in the document that contains this text (ancestor/descendant relationship), such as an XML element (opening "tag") defined by the mechanisms described in ANNOT\_R4.1 and ANNOT\_R4.2._

COMMENT by WillManis: An XPath to content. The same problems exist as those outlined in ANNOT\_R4.2. The issue here may be that the user is viewing glyphs and the backing store is in characters, the UA must help in disambiguating.

#### ANNOT\_R4.4 ((A, A, A, B)) Unicode Character Range ####

_Description: Identification of an annotation target as a range of unicode characters inside the XML content document._

_Rationale: annotations must be able to reference a particular contiguous (i.e. non-disjoint) "selection" of text, based on two points/locations specified using the mechanism described in ANNOT\_R4.3._

COMMENT by WillManis: An XPath to content. The same problems exist as those outlined in ANNOT\_R4.2 and ANNOT\_R4.3. Given that the range may span multiple elements, a simple XPath will not suffice.

#### ANNOT\_R4.5 ((A, C, A, C)) Time Offset ####

_Description: Identification of an annotation target as a time offset inside audio or video resources that are part of the EPUB publication._

_Rationale: annotations must be able to reference media objects contained inside the main content document or part of the synchronized audio content of the publication._

COMMENT by KingWai: There could be a good number of possible scenarios. We would like to focus on the simple case first and would like to assign a higher priority to the case of selecting entire multimedia objects for annotation (instead of a range or with some offset). This requirement primarily targets the rich media content embedded inside /co-located with the ePUB file. For online content (e.g. from a streaming A/V server), this may require further clarification.

#### ANNOT\_R4.6 ((A, C, A, C)) Time Range ####

_Description: Same as ANNOT\_R4.5, but for a range of time (i.e. a particular "clip" of the media object) defined by a begin and an end time offset relative to the starting point of the media object._

#### ANNOT\_R4.7 ((A, C, A, C)) Spacial Area ####

_Description:  Identification of an annotation target as a spacial area in media objects inside the content document_

_Rationale: annotations must be able to reference a particular graphical zone/region of the target visual media (i.e. image, video), based on a specified geometrical shape and associated coordinates in the space domain (e.g. rectangle, circle, arbitrary outline)._

#### ANNOT\_R4.8 ((A, C, A, C)) Mix of Structural, Spacial and Time ####

_Description: Identification of an annotation target can mix the structural, spacial and time domains._

_Rationale: annotations (particularly the ones addressing video objects) must be able to reference a specific graphical area for the duration of a specific time range in the target media object._

#### ANNOT\_R4.9 ((C, B, B, C)) Single Annotation, Multiple Targets ####

_Description: Annotation may be defined for several targets in the document._

_Rationale: "There are 7 misspelled instances of the word 'accessability'"_


#### ANNOT\_R5 ((A, A, A, A)) Content identification resilient to reflow ####

_Rationale: The content identification scheme must be resilient to content reflow._

#### ANNOT\_R6 ((B, A, C, B)) Annotator identification ####

_Rationale: The annotator should be able to be reliably identified if they so desire._

COMMENT by WillManis: this type of feature would need to rely on a third party id provider.

#### ANNOT\_R7 ((B, A, A, B)) Annotator anonymity ####

_Rationale: In the event the annotator does not want to be identified the annotation should contain no PI._

COMMENT by WillManis: we need to ensure that no PI data is required.

#### ANNOT\_R8 ((A, A, A, B)) Annotation content can contain either/any of: audio, video, image, text. ####

_Rationale: annotations must be able to contain multimedia objects, TO BE DEFINED: can one given annotation contain more than one object, such as a mix of video and images for example ? If yes, are there any presentation requirements for these mixed media objects, or should the user-agent be responsible for orchestrating the presentation flow of these multiple media items ?_

PROPOSAL by KingWai: ANNOT\_R8.1 ((A)) => Annotation content can be one and only one of the following elements: audio, video, image, and text. Easier for the reader system to handle

PROPOSAL by KingWai: ANNOT\_R8.2 ((A)) => Annotation content can be a mixture of audio, video, image, and text. This is useful for commercial entities which may want to sell their content associated with the book in the annotation format. However, the structure of the mixed/blended annotation is yet to be defined.

PROPOSAL by KingWai: ANNOT\_R8.3 ((A)) => Bookmarks are considered special annotations. Bookmarks maybe considered a special kind of annotation with just the content position and a bookmark description defined (null description is okay)

#### ANNOT\_R9 ((B, D, E)) Synchronized audio annotates the text ####
_Use case: A audio book producer wants to add a narration to the EPUB text version. They want synchronization to take place at various levels of granularity, i.e. paragraph, sentence, word._

_Use case 2: A EPUB document contains poetry and somebody wants to add a human reading of the poem. Different human presentations can be compared, which interprets the meaning of the poem in different ways. e.g. "this is my son" one version is with pride, the other with shame._

Note: this relates to the concept of "Transparent Overlay" described in RM-21:
http://code.google.com/p/epub-revision/wiki/RichMediaAndInteractivity#RM-21._Transparent_overlay

Note: this also relates to the concept of "Synchronized Audio":
http://code.google.com/p/epub-revision/wiki/RichMediaAndInteractivity#Synchronized_audio

#### ANNOT\_TW\_R1 ((A, A, B)) Annotation Structure ####

_Rationale: We consider personal annotation structure can divide into three elements: Annotation Type, Anchor and Annotation content as follow：_<ul>
<li>Annotation Type may include : highlight, underline, circle, margin bar, mark, doodles, anchor+content, comment, footnote. </li>
<li>Annotation anchor should be able to mark accurately to point, word, sentence, paragraph, chapter, document.</li>
<li>Annotation content should contain text, image, symbol, audio, video.</li>
</ul>
(We read DAISY Portable Bookmarks and Highlights, seems it only divided the annotation type into highlight and bookmark, and less multimedia support(only text and audio), maybe we could base on it and add more annotation types, anchor position and multimedia for annotation content.)

#### ANNOT\_TW\_R2 ((A, B, A, A)) Portable Annotation ####

_Rationale: For the use of digital learning, such as notes from a teacher to students, students to students, answers to the examination, etc. We need a portable method that can read these annotations on different devices_

COMMENT by KingWai: Several reference scenarios for portable annotation:  (1) one can save one's annotation on a server and has the annotation synchronized with all the devices/reading systems via the server's copy. The time-stamp could be used in synchronization. (1.1) one can also share one's annotation with other users. (similar to the "social reading" platforms some vendors are advocating) (2)  one can transfer an offline copy of the annotation from one reading system to another as long as the same version of the electronic book is present on both reading systems.

COMMENT by WillManis: Making this a high priority will ensure that annotations do not live in walled gardens. Annotations for content annotated in an iBook should work on a Nook, provided they both are consuming epub.

## Background material ##

  * DAISY
    * Portable Bookmarks and Highlights http://www.daisy.org/z3986/2005/Z3986-2005.html#Bkmk.
  * Cathy Marshall
    * http://www.csdl.tamu.edu/~marshall/pubs.html
    * http://research.microsoft.com/en-us/people/cathymar/
  * AJ Bernheim Brush
    * http://research.microsoft.com/en-us/people/ajbrush/ajbprojects.aspx#annotations
  * Barry Brahier
    * http://www.cehd.umn.edu/Reading/documents/reports/Brahier-report.pdf
  * Heck, Luebke, Obermark
    * http://www.math.grin.edu/~rebelsky/Blazers/Annotations/Summer1999/Papers/survey_paper.html

## Discussion ##

## Specification ##