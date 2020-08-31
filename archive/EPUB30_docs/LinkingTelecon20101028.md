# When #

Conference call from 2100-2130 UTC on 28 Oct 2010

# Who #

  * John Rivlin
  * Will Manis
  * Graham Bell
  * Keith Fahlgren
  * Eric Freese
  * Garth Conboy
  * Bill McCoy
  * Dan Hughes
  * Bill Kasdorf
  * MURATA Makoto
  * Daniel Weck

# What #

## Introduction and Background ##

Keith F explains the decision from the Oct2010 EPUB3 F2F to "detach" the work on developing a Cross-Document Specification on a separate timeline from EPUB3.

Bill M notes that Markus feels that this work is very important to EPUB3 and hopes it will be concurrently published and/or reintroduced into EPUB3.

Makoto M suggests publishing the specification as IETF Internet Drafts.

## Working Assumptions ##

Keith F suggests that the group focus on developing a smaller specification on a shorter timeline, with a focus on a quicker initial publication rather than attempting to solve more problems/requirements; consensus.

Consensus was also reached on reusing existing standards as much as practical.

## Requirements ##

The group then discussed a number of prioritized requirements. Consensus was reached on the following:

### Highest Priority ###

These requirements must be solved in the initial specification:

  * The specification should specify a technique for creating valid URIs (http://tools.ietf.org/html/rfc3986) to identify both EPUB and EPUB3 publications
    * Bill K notes that this will identify a publication rather than an instance of a publication {there will be lots of EPUB files in the world for the same publication identified by one of these URIs}.
  * The specification must support both EPUB and EPUB3 publications (ideally equally)

### High Priority ###

These requirements must be solved in the initial specification:

  * The specification should include some techniques to identify "fragments" in EPUB Content Documents inside the publication

### Medium Priority ###

These requirements may be solved in the initial specification:

  * The specification should define how these URIs should be resolved
    * Will M notes that these could resolve to actual EPUB3 bytes (free content) or a DRM record with instructions on how to get it (DRMed content) or something else.
  * The specification should include some techniques to identify "fragments" in non-EPUB Content Documents (continuous media, for example) inside the publication
  * The specification should include techniques for strongly verifying the strength of a link matching a publication or fragment
  * The specification should include techniques for weakly/loosely/fuzzily matching a link to publications or fragments
    * John R adds that these weak matches may be used both for improved versions of a publication (a revision to correct errata, say) or alternate versions (two versions of a novel with the same text but different forewords)
    * Keith F and Bill K refer to ISTC (the International Standard Text Code, a numbering system developed to enable the unique identification of textual works)

### Priority TBD ###

Other requirements not yet prioritized:

  * Will M believes that we should strive to create URIs that are human-readable
    * Bill M notes that many of the discussed techniques for strong or weak matching will be difficult for humans to read

## Future Meetings ##

A number of attendees express an interest in developing the specification via teleconferences for the time being.

There is some discussion of moving new meetings to 1300UTC.

# Action Items #

  * Keith to schedule next meeting (probably 1300UTC next week).