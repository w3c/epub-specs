# Agenda, Dictionaries and Indexes Virtual Workshop 20111018 #

21:00 UTC on IDPF standard line (call-in and IRC info sent separately)



Scribe:  Matt Garrish

Attendees: George Kerscher (DAISY), Garth Conboy (Google), Peter Sorotokin (Adobe), Markus Gylling (IDPF), Matt Garrish, Karen Broome (Sony), Chow King-Wai (ASTRI), Jan Wright (Wright Information), Bill Kasdorf (Apex), Tzviya Siegman (Wiley), David K Ream (LevTech), Murata Makoto (JEPA), Edward O'Connor (Apple)

## Workshop Goals ##
  * Discuss and describe target functionality scope for Dictionary and Index support in EPUB 3
  * Among workshop attendees, measure interest in starting new projects for this
  * Identify additional expertise to invite to the project(s)
  * Formation of ad-hoc group for charter proposal creation

## Introduction ##
_On: Markus_

## Dictionaries ##
_On: DanH_

  * Revisit the outcomes of the deferred Dictionaries effort in EPUB 3.0. Summary and discussion.
    * [Top-level requirements](http://code.google.com/p/epub-revision/wiki/TextContent#Dictionaries/glossaries)
    * [Subgroup page](http://code.google.com/p/epub-revision/wiki/DictionariesGlossaries)
  * Discussion. Lessons learned. Scope and/or target functionality changes for a new IDPF project?

## Indexes ##
_On: JanW_

  * [List proposal](http://groups.google.com/group/epub-working-group/browse_thread/thread/8b816668ca7e3a0d)
    * [proposal in docx](http://www.google.com/url?sa=D&q=http://dl.dropbox.com/u/2248375/IDPF%2520Index%2520functionality%2520in%2520ePub.docx&usg=AFQjCNGw8FNdipC9jMm_xylFX_CSmEGaqw)
  * Discussion. Scope and/or target functionality for a new IDPF project?

## Summary, next steps ##
  * separate proposals/activities, or merged?
  * additional experts to invite?
  * ad-hoc group for charter proposal creation **(identify: one lead + members)**
    * _note: proposal should list use cases/functional requirements up front_
  * expected timelines (membership proposal, project span)

# Minutes #
## Introduction ##

Recording filename: 111018

This is an open workshop with no strings attached. Discovery phase.

If it develops into a project IDPF members and invited experts can join, but invited experts need to contact Markus Gylling or Bill McCoy, even if they have been invited for other projects before.

Future goal of IDPF developments is to become more modular, add extensions. EPUB3 will continue to be revised, but smaller projects dedicated to smaller problems will be created. Dictionaries and indexes would be such a modular extension.

BillK: How does modular impact reading systems?

Reading systems will have to specify which of these additional modules it supports. When the main EPUB spec undergoes a revision, some of these may be integrated into the standard (decided on case-by-case basis, not a given that they would merge).

Whatever is done in these groups should not break EPUB 3 itself. The extension points in the spec must be utilized. If the main spec must be revised, the work may have to wait as the goal is to have the parts live in harmony.

Introduction of new elements is not out of scope, but the schema that results from it is unknown to EPUB 3. Will need a mechanism to register the extension and schema (process still under development). We should not avoid doing the best job possible simply because it may modify the schemas.

A formal project will only be initiated after being ratified by membership and board.

We should look to move quickly, and not seek to address every possible nuance and detail at this stage to get to a first version. Additional detail can be added in future revision, look for the 80/20 split on functionality.

Projected Outcomes of this workshop:
  * Agreement on whether we should move ahead with charter proposal and people who will be involved in developing.
  * Rough scope of the issues we are trying to solve, to be further detailed and agreed upon during charter proposal stage.


## Dictionaries ##

Recap of EPUB 3.0 work (DanH):

Late start in focusing on, and a broad spectrum of issues

Publication metadata to identify as a dictionary

Lack of input and use cases

Take a vendor-specific implementation and tailor

In the end, did not yield a robust proposal and was deferred


Dictionary is lexical and defines words generally, a glossary is a select list of term in simplified form and localized to a specific work.

May be a need for a reading system to look up from a glossary first before moving to a dictionary.

A dictionary needs detailed semantic markup to do right, but not so true with glossaries (can omit the lexical).

It may be the case that people want to integrate glossary/terms into a custom type of dictionary for lookup. Author intention isn't the same as the user want and the two will collide.

Standalone glossaries and dictionaries are going to blur the lines.

We should capture the intent of the author, but not limit how they can be used.

We need to provide the building blocks and then at the application level functionality can be implemented to permit these kinds of use cases.

Markup may be easier than how to create fast lookup; example, by database.

In 3.0 this was out of scope, an RS would have to determine on its own how to process.

We may want to bring this into scope and possibly look at splitting into two groups so that implementers can look at the processing end.

Not define how to process, but to ensure that enough information is available for processing.

Moving into this detail may slow down progress. Database file that is perfect for all systems and platforms is an intractable problem.

Preliminary agreement that this kind of database work/integration is out of scope for this project.


## Indexes ##
JanW, use cases:

User has a need to access information and may think about it either as a term or concept.

Searching for information by typing and seeing entries to discover related information.

If the user returns to look for more information, the last display should be set (memory).

If the index does not contain what they are looking for, then plain text search should kick in.

Structured index document that identifies each term and provides means of navigating to the content.

Need for multiple indexes: recipe v. ingredient, case v. subject.

Mechanism for stemming so that as a person types or what they type can be matched against variations.

Local indexes v. an index for everything on the device. Need to give context of where the term is coming from in order to determine applicability.

May be limited by touch screens.

Need for disambiguation devices and cross-referencing, where only the latter may be needed in dictionaries.

Must not get drawn into authoring concerns, how to create a proper index and focus instead on the structure and semantics for expression during delivery.

Not many examples of indexes in the wild in ebooks. Display as chapters at the end of the book. InDesign does not include indexes, must be merged separately.

Popular publishing programs do not have the functionality for linking back into the content.

Agreement that an effort to support Indexes in EPUB would focus on delivery semantics/author intent, most probably by using the same approach as for Dictionaries (aka specialized grammar via extensions/subsets to EPUB Content Documents) and that Reading System behavior dictations and authoring time concerns are out of scope.

## Next steps ##

We should work on both proposals in conjunction but as two separate proposals; and likely later as two separate but tightly intertwined projects with identical timelines.

Jan and David to help Markus with index proposal

DanH to assist with dictionary proposal

Will need to elaborate on use cases for these proposals and tightly define scope

Need to investigate additional experts who can be brought in, please post suggestions to list or Markus

Timeline: Next board meeting on Dec. 5. Need to have proposals ready in November to go through membership, then target approx 3 months long project phase; delivery in first quarter of 2012.