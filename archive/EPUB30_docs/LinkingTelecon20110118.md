

# When #

Conference call from 2100-2200 UTC on 18 Jan 2011

# Who #

Present:

  * Peter Sorotokin
  * Keith Fahlgren
  * Daniel Weck
  * Markus Gylling
  * Graham Bell
  * Eric Freese
  * Bill Kasdorf

Regrets:

  * Hadrien Gardeur

# What #

## Discussion of current Proposals & whether any should be sent to the Working Group ##

  * Peter S: Implementation Proposal for Linking: links to RDFa-encoded reference data [ImplementationProposalLinkingToRDFa](ImplementationProposalLinkingToRDFa.md)
  * John R: URI Links Proposal [LinkingImplementationProposals#URI\_Links\_Proposal](LinkingImplementationProposals#URI_Links_Proposal.md)
  * Keith F: PURL-based EPUB Identifiers [LinkingImplementationProposals#PURL-based\_EPUB\_Identifiers](LinkingImplementationProposals#PURL-based_EPUB_Identifiers.md)

Markus believes that the two active proposals are Peter S's and Keith F's.

Peter S primary concern is embedding URIs (not URLs) in hrefs attributes, but he also believes that the data is structural (so best encapsulated in markup). Conversely, Keith F believes that the output should be captured as a unified URI. He believes that this is the primary concern.

Keith F doesn't fully understand how to turn this RDFa data into a URI.

Peter S proposes an 'epub:'-something scheme. While Peter S prefers a markup-based approach, he does think that a new scheme would be acceptable.

Markus notes that an RDFa-based model makes future extensibility more straightfoward.

Keith F believes that we should discuss an 'epub:' scheme at tomorrow's call to understand whether it has support from the wider Working Group.

## Persistence & changes to dc:identifiers and the Publication Identifier ##

Summary of what BillK proposes:

  * include language that makes it clear what me mean by unique identifier; articulate that there is persistence in the identifier; should not change for minor revs of the file; only when publisher considers it a new epub
  * this is so that links and citations dont break; other use cases too in distribution channels
  * the primary id identification mechanism remains (@uid)
  * the identifier referenced from @uid is persistent between minor revisions to the work
  * the content-version property is used to express minor revs
  * content-version is three-segment string (hyphen-seprated), typically digits; last position must change even for the most trivial change
  * a reading system must regard _package identity_ as compound: primary identifier + content-version; add the version property the the uid string to create a truly unique identifier

We still need to settle on final terminology; while "package identity" is primary id + version, what is the term to use for id without version? "epub identity"?

Matt: Note that roughed-in prose detailing the above has been added to the Publication Identifier section. This section has been relocated (for now) under Section 3. EPUB Publications.

## Recommendations for content-version values ##
The spec will for now say that its a three-segment string, hyphen separated, typically but not necessaruily using digits in the segments; and that at least the right-most segment must change any time an edit is made to the Publication (= any time the checksum would change...)