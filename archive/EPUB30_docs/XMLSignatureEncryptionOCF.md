# W3C XML Security status #

The current recommendation for
[XML Signature Syntax and Processing](http://www.w3.org/TR/xmldsig-core)
is 1.0 "Second edition" (2008).  The current recommendation for
[XML Encryption Syntax and Processing](http://www.w3.org/TR/xmlenc-core)
is 1.0 (2002).

Both are being revised for version 1.1 as part of the
[XML Security 1.1](http://www.w3.org/2008/xmlsec/wiki/Roadmap)
activity of the XML Security WG.  The roadmap shows 1.1 versions of both XML Signature and XML Encryption going to Candidate Recommendation in "Fall 2010".  Both are currently in last call.

Here's the XML Security WG's description of the 1.1 revisions:

> The intent of XML Security 1.1 is to provide a non-breaking additive update to the current XML Security specification that does the following:
    * Updates list of required/recommended/optional algorithms to add new algorithms based on SHA algorithms stronger than SHA-1.
    * Clarify that SHA algorithms stronger than SHA-1 should be used, given the pace with which attacks on SHA-1 are progressing.
    * Add elliptic curve algorithms based on a limited selection of curves to meet Suite B requirements and to provide alternative to RSA family.
    * Only require DSAwithSHA1 for signature verification, but not signature generation.
    * Add explicit support for OCSP information in KeyInfo in XML Signature 1.1
    * Clarify various aspects of the specifications, update references,and recognize existing work developed since the original specification, including Exclusive Canonicalization and XPath Filter 2.0.
    * The Algorithms cross-references provides a summary of various algorithm URI identifiers used in XML Security and references to the various documents that define them, to avoid confusion and possible usage errors.

# Proposal for OCF #

The OCF spec points to the version 1.0 specs.  At the very least, the XML Signature reference should be updated to the second edition.  This should introduce no incompatibilities from what I can tell.  The question is whether to plan on pointing to the 1.1 versions.

The list above does not look like much in the way of new functionality, but I am not expert in the use cases here.  I would ask members of this WG to review that to see if anything being proposed for version 1.1 is a must-have -- this would push us towards referencing 1.1 in the OCF spec.  Unless there's something compelling coming in 1.1, my proposal is to reference the latest recommendations.

As indicated, the design of 1.1 is intentionally non-breaking, and our use in the OCF is pretty basic, so we should have no compatibility issues.  Markus has identified issues with using the RNG schemas, but I'd postpone resolution of that until we make a decision on which version to reference.