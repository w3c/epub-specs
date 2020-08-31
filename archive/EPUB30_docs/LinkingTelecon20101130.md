# When #

Conference call from 2100-2200 UTC on 30 Nov 2010

# Who #

Present:

  * Graham Bell
  * Dan Hughes
  * John Rivlin
  * Keith Fahlgren
  * MURATA Makoto
  * Peter Sorotokin
  * Daniel Weck

Regrets:

  * Markus Gylling
  * Will Manis

# What #

## Recap of Current State ##

Keith F recaps the current state:

> This work was broken off from the main track of the EPUB3, but Markus still asserts that he'd like to see a specification sooner, as it's fairly critical architectural/plumbing for other work.

> While a new (epub://) scheme was discussed, it was also dismissed, as were URNs (sort of out of hand). HTTP URI are the focus of current discussion (alongside DOIs).

> We've basically resigned ourselves to developing the core of the URI around the unique-identifier (to ensure compability with both EPUB & EPUB3).
> We've also discussed the idea of including (optionally?) the dc:title and/or dc:creators in the URI (maybe as query paramaters).

> We've also discussed the idea of the PURLs.

> Significant discussion of DOI, which seems like it could be a component of the solution (rather than the whole solution).


## John R's LinkingURIImplementationProposal ##

Available at LinkingURIImplementationProposal

### Open Issues ###

  * What data needs to be included in the EPUB to be able to create these references?
  * Do we need to be able

## New requirements ##

Keith F wonders if we should be adding a new requirement?

  * Linking to URIs should be able to be created without having the complete EPUB available.

Peter S believes that we should really borrow the semantics from standardized
references in printed bibliographies. There are two pieces:

  * How do you find the book when given a reference?
  * How do you create a new reference?

John R tries to split Peter S's comments into two different goals:

  * Canonical & precise reference identifiers (unambiguous but fragile)
  * Loosely matched identifiers

Peter S does not believe that we can encode all of the different domains of
referencing information (from bibliographic citation standards) in the URI.

Peter S does not believe each EPUB will/should have a URL. Keith F agrees, but
does not believe that that specific requirement has been proposed.

## Linking outside EPUB ##

Keith F tries to assert that the fundamental problem we need to solve is **how to identify** a document. Peter S believes that the MLA-style references....

{Keith F becomes incapable of taking meaningful notes, but Keith F, Peter S, and John R discuss the various upsides and downsides for HTTP URIs (not URLs), consumers of HTML content's expectations, a new epub:// scheme.}

Peter S believes that the biggest problems will be references TO EPUBs from the outside world.

## Requirement Fragment Identifiers ##

Peter S discusses Canonical Fragment Identifiers for EPUB (from ImplementationProposalFragmentIdentifier). This solves a problem of not being able to sort fragment identifiers.

We already have one working solution: #element-id

New requirements:

  * Page-ish references (via NCX)
  * We may/will have multiple fragment identificiations in a single link

## Recommendations for when to change unique-identifier ##


Not discussed.