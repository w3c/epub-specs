

# When #

Conference call from 2100-2200 UTC on 25 Jan 2011

# Who #

Present:

  * Markus Gylling
  * Keith Fahlgren
  * Peter Sorotokin

Regrets:

# What #

## Harmonization of RDFa approach and single URLs ##

  * Peter S: Implementation Proposal for Linking: links to RDFa-encoded reference data [ImplementationProposalLinkingToRDFa](ImplementationProposalLinkingToRDFa.md)
  * Note: link to structural semantics vocab: http://epub-revision.googlecode.com/svn/trunk/build/vocab/structure/epub30-vocab-structure.html


Keith discusses the fact that the identification of EPUB/3 documents is a quite different problem than the linking of one EPUB document to another. Keith feels that Peter's markup-based approach solves the Linking problem more attractively than alternatives, but wonders what we can do pragmatically.

Peter believes that the biggest problems for referencing will come from publications that are prepared in an ad-hoc matter (will make MLA harder).

Keith wonders if we could simply include some machine-readable metadata in the markup to tell a Reading System that we're trying to reference another EPUB by Publication Identifier. Peter does not believe that this would be useful. Specifically, he doesn't feel that specific publications could be referenced clearly enough (academic works, for example).

Peter outlines a proposal where an EPUB would include metadata to reference a specific HTTP resolver (like OpenURL) that would be able to resolve the Publication Identifier into (a resource). Maybe following? http://bitworking.org/news/URI_Templates / http://tools.ietf.org/html/draft-gregorio-uritemplate-04

(Keith stops being good at taking notes. Peter explains a new proposals that he'll outline on the wiki.)