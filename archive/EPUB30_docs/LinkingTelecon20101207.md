# When #

Conference call from 2100-2200 UTC on 7 Dec 2010

# Who #

Present:

  * Graham Bell
  * John Rivlin
  * Daniel Weck
  * Keith Fahlgren
  * Markus Gylling
  * Bill McCoy
  * Eric Freese
  * Bill Kasdorf
  * Peter Sorotokin

Regrets:

# What #

## PURL Proposal ##

Keith F promises to write up a draft proposal on the Wiki for an HTTP-URI based solution focused around supporting both DOIs and PURLs.
The IDPF would host a PURL server on http://purl.idpf.org/epub. Most URIs to documents would look like:

> http://purl.idpf.org/epub/{id}?title={t}&creator={x}&version={a.b.c}

A URI to a fragment might look like:

> http://purl.idpf.org/epub/{id}?title={t}&creator={x}&version={a.b.c}&file={/path}&id={frag-id}

## Spec Timeline ##

EPUB3

**Consensus within Linking subgroup early Jan 2011** Discuss with entire EPUB Working Group later Jan 2011
**A public draft being implemented/commented before 1 Feb 2011** Draft iterations in Feb 2011
**Finalized text to include before XX Mar 2011**

John R: We may need to resort to voting, which is just fine.

Bill M: Subgroups may not reach consensus (this is a normal part of the process) and submit competing proposals up to the Working Group for decide. It'd be better to have two proposals rather than 0.

Keith F: Do we need to define more timing points?

Bill M: We really must publish something on the wiki for discussion in the wider community.

Keith F feels very strongly that there have to be some speculative implementations before it lands in EPUB3.

Keith F believes that we should limit the amount of fragment identifier schemes that are specified in EPUB3. We should reference a set of already-specified, working fragment identifier URLs and then also a place where the IDPF will collect new schemes as Informational Documents. The goal would be to encourage iterations and innovations (evolving ontheir own timeline). If they're interoperable and in use, they could always show up in EPUB3.1.

Bill M: Another way to limit the scope of what we're doing would be to say that we're only specifying EPUB-EPUB linking (rather than linking to an EPUB from anywhere).

Bill K: ...but isn't linking TO an EPUB part of our fundamental requirements?

We discuss Peter S's implementation of (essentially) Canonical Fragment Identifiers (ImplementationProposalFragmentIdentifier) at Adobe.

Graham B: He wonders how ISBNs will be integrated into. Additionally, how much change is allowed in the target document before the link (ideally) breaks.

Bill K & Peter S were discussing identifiers of fragments a single location/"point" or ranges. Keith F asserts that we should limit the scope of work to only identifying single locations. Daniel W believes that's reasonable (and concordant with the Annotations work).

**You should be able to identifying a file inside the EPUB resource.** Given a file, you should be able to identify a single location inside it
**Our focus should be on supporting the core Content Documents/Media Types**

Daniel W argues for a syntax that is able to be more strongly verfied (rather than an entirely open-ended approach). While innovation may be enabled by a loose syntax, a canonical syntax would allow content creators to expect better interoperability.