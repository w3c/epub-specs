# When #

Conference call from 2100-2200 UTC on 4 Jan 2011

# Who #

Present:

  * Bill Kasdorf
  * Karen Broome
  * Graham Bell
  * Keith Fahlgren
  * Markus Gylling
  * Eric Freese
  * Daniel Weck
  * John Rivlin

Regrets:

  * Will Manis

# What #

## PURL-based EPUB Identifiers ##

### Uniqueness ###

John R wonders what this proposal says about uniqueness. Keith F acknowledges that this is one of the major problems with the current draft. He believes that supporting existing EPUBs means that uniqueness is a myth.


### The PURL service itself ###

Bill K wonders what the IDPF would have to do to host a PURL service. Keith F suggests that there are open source PURL servers that could be operated by IDPF or a provider.

John R asks what performance characteristics this PURL service would need. What about serving the interational market equally? Bill K suggests that providing really performant, reliable identifiers should suggest a DOI implementation rather than this PURL thing. Keith F admits that he does not know the performance requirements

### DOI ###

Keith F and Bill K discuss how DOIs might be intergrated.

The implementation of DOIs for EPUB/3 creators is indepentent of this work, we hope.

Bill K will communicate with Beat Barblan about DOI and this proposal.

Markus G reviews the DOI page at Wikipedia and notices the section on 'Resolution' and turning DOIs into HTTP URL by prefixing with "http://dx.doi.org/". How would a DOI integrate into this PEI thing? Keith F suggests that a DOI `10.1000/182` would be registered for an EPUB/3 in the "normal" way. It would be used in the Publication Identifier with the prefix `urn:doi:` as `<dc:identifier id="pubidex">urn:doi:10.1000/182</dc:identifier>`. This Publication Identifier would then be embedded in the PEI as would any other, but the `urn:doi:` prefix would be very meaningful to Reading Systems (just like `urn:isbn:`).

Bill K, Karen B, and Graham B note that asserting rights is extremely difficult/legally fraught/dangerous.

### Identifier changes ###

Karen B wonders when we're going to finally decide on **what** we suggest should be identified. Keith F believes that the larger Working Group is much closer to consensus on keeping the Publication Identifier more stable and modify the `content-version` metadata often. We punt on this issue and raise it to the larger group.

Graham B hopes that this work does not recreate the existing work about identifying changing documents at the ISTC and/or ISBN level. Keith F hopes that EPUB3 is able to suggest that multiple `dc:identifier`s with meaningful `urn:` or other prefixes are a good choice, but he suspects that it won't be exclusively ISTC or ISBN but that that language should be explicitly referenced in the spec...

### The Prefix ###

Graham B wonders what the value of the prefix is? Keith F says that the `http://purl.ipdf.org/` prefix allows PEIs be distinguished from all other URIs. He believes this is a fundamental need of any solution (disinguishing). Keith F suggests that the prefix is **the** critical distinction between John R's proposal and this PEI one.

John R wonders if we could harmonize the two solutions by only requiring a prefix `http://epub.`. This would allow `http://epub.randomhouse.com/books/{epub-publication-identifier}`, for example.

Daniel W wonders what value the PURL service/prefix brings, if a shorter `http://epub.` prefix would provide the way to distinguish between these PEIs and other URIs? Keith F asks how a valid PEI would be created given only an EPUB.

### Asian characters in query parameters ###

Karen B wonders if international characters can be effectively included in query parameters. Keith F acknowledges that this may be an issue, but does hope that IRI or something provides the answer.

### Parameters will grow ###

Markus G would like the spec to more explicitly clarify that more parameters may be added in the future. Daniel W worries that we have not discussed the "Identifying a Specific Version of a Publication" at all. He also asks what exactly we need to have finished when we make the Proposal to the larger Working Group? Keith F clarifies that it can be fairly minimal but Markus G notes that we're very constrained for time, so we need to be careful not to try to specify too much.

## Topics to Raise ##

  * When does the Publication Identifier change? What about the same content being offered in different markets (perhaps by different "publishers"/"rightsholders").

## Spec Timeline ##

  * 11 January 2011: Subgroup: Refine Proposal(s) & get consensus on which Proposal(s) to send up to EPUB Working Group
  * 17 January 2011: Subgroup: Publish Proposal(s) to EPUB Working Group for review before 19 January 2011
  * 18 January 2011: Subgroup: Refine Proposal(s)
  * 19 January 2011: Discuss Proposal(s) with entire EPUB Working Group
  * 25 January 2011: Incorporate Working Group feedback
  * 31 January 2011: Publishing something for wider comment
  * February 2011: Draft iterations
  * March 2011: Final version

# Action Items #

  * Keith F: Expand the clarifiation of future query parameters in the PEI proposal
  * Daniel W: Reoranize the PEI proposal to show which pieces have gotten discussion and which haven't
  * Keith F: Make a concrete example of embedding a usable DOI in a PEI in the PEI proposal
  * John R: Review the comments here http://blog.threepress.org/2011/01/03/a-simpler-epub-linking-proposal/