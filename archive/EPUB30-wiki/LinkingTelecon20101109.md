# When #

Conference call from 2100-2200 UTC on 9 Nov 2010

# Who #

  * Bill Kasdorf
  * Keith Fahlgren
  * Karen Broome
  * Graham Bell
  * Daniel Weck

## Regrets ##

  * Will Manis

# What #

## Handoff from Metadata Subgroup ##

Bill K clarifies that the Metadata Subgroup needed to close its deliverables to Markus and Bill M. Because of the active discussion about identifiers, it was obvious that this discussion should be driven by the Cross-Document Linking group. With that we'll be working on identifiers as part of this work going forward.

Karen B raises concerns about the identifiers being driven by changes in the structure of the document rather than by changes in the content itself. Bill K and Karen B discuss where the best site for the dicussion of indentifiers should be.

## Fragment Identifiers ##

Not discussed (no Peter S).

## Backwards Conformance ##

Keith F raises the issue of supporting EPUB (not 3). If the Linking Spec works with EPUB (which we've raised as a goal), then we're forced to use the unique-id. He is not particularly concerned about non-unique historical identifiers not working because he doesn't feel that they'll work anyway.

Bill K asks whether duplicated identifiers are not in fact a useful trait (rather than mistake). Graham B reminds us that the issue is not broken along works/doesn't work is that there are specific cases where we **want** links to break and cases where we don't.

Karen B wonders if we need to define more of the specifics of our vocabulary (versions, changes, etc) around what we're hoping to solve.

Keith F quotes from the Assumptions about "This specification should be developed with a focus on a quicker initial publication"

Keith talks about our ability to limit the specification to only covering EPUBs that have unique-id that seem more useful (have a @scheme or are a URI/URL, for example).

Bill K raises that we also have a dc:title and a dc:creator required in **every** in EPUB/EPUB3. This comes with a lot of danger, but also could be useful for disambiguation.

Karen B asks whether content creators that publish parallel texts in multiple versions are really able to handle tracking the versions in multiple languages with only a numeric verson string.

Bill K clarifies that the components of the Rivlin-inspired versioning string are not necessarily numeric.

Keith F wonders if we need to include title, creator, and identifier in the left hand side.  Instead, should we talks about constraining on URN/URL or scheme?

Bill K notes that "sloppy" identifier practices could be "solved" by having clear benefits to following a "good" model.

Karen B doesn't like "sloppy" per se because there will be communities for whom the contraints of the model don't match their actual business. She asserts that consistency is more desirable than conformance.

Keith F reiterates his hope that a "carrot" approach that provides real, attainable benefits to using/creating identifiers in the correct way will be the _only_ technique that will provide good usage in the wild.

## Many Identifiers ##

Graham B suggests that part of this will be defining techniques for walking through a plethora of identifiers. ISTC will pick up some things, internal-work-id works for others, X even more. A client will have to figure how to match on any of them.

Graham B asks whether these multiple identifiers actually add anything beyond dc:title & dc:creator.

## PURL ##

Keith F has had various folks recommend creating HTTP URIs using a PURL (something like http://purl.idpf.org/). Keith F describes at a high-level how a PURL would work.

Graham B says that these sound like DOIs. Bill K agrees. Keith F tries to clarify that these PURLs MAY return meaningful representations, but would **not** be required to (URIs, not necessarily URLs). Additionally, there would be strong language in the spec to require clients to treat them as URIs if the PURL server is unavailable (like in 20 years).

Karen B hopes to ask other resources inside Sony for more opinions about using PURLs for this problem.