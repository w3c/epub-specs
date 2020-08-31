**This proposal addresses [issue 49](https://code.google.com/p/epub-revision/issues/detail?id=49), [issue 79](https://code.google.com/p/epub-revision/issues/detail?id=79) and [issue 104](https://code.google.com/p/epub-revision/issues/detail?id=104) in the tracker.**

# Issue #

A few metadata properties (e.g., `dcterms:language` and `dcterms:modified`) have semantics defined by the Publications specification because of the function they serve. For the rest, however, there is currently no mechanism to determine the purpose of the data they contain.

At best, this approach to metadata results in the order of metadata implying meaning (e.g., the first `title` property is the primary title and all others are alternate titles, regardless of their actual role) and/or metadata being treated as generic strings. At worst, metadata goes unused because it cannot be reliably processed.

One of the goals of the EPUB specification, however, is to provide rich metadata, in part to provide for more intelligent processing by Reading Systems but also to improve access by Assistive Technologies. A means of opening this data up to proper interpretation is consequently needed, but also one that does not impose unnecessary restrictions and/or limit the usability of EPUBs.

# Proposal #

Mention of specific code lists will be removed from the `role`, `scheme` and `title-type` properties in the Ancillary properties section. (Other metadata requirements detailed in the specification are not affected by this proposal.)

The `scheme` property will have its scope be broadened so that it can serve to identify the scheme any property conforms to. If a Reading System recognizes the scheme, it will treat the associated property value accordingly (i.e., the `scheme` takes precedence over any value parsing).

The `scheme` property will now take either a URI or string as its value, which will identify the code list or other enumerated value set the associated property is drawn from (the `datatype` attribute will be added for indicating scheme value type).

The URI is not required to resolve to a resource, but preferably should do so for consistency of identification. (Note: it is understood that this method of identification is itself imperfect, but the alternative would be IDPF becoming a registrar all of such identifiers.)

Example of an ONIX-defined `title`:

```
<meta property="dcterms:title" id="title">Norwegian Wood</meta>
<meta about="#title" property="title-type" id="title-type">01</meta>
<meta about="#title-type" property="scheme"
   datatype="xsd:anyURI">http://www.editeur.org/files/ONIX%20for%20books%20-%20code%20lists/ONIX_BookProduct_Codelists_Current.html#codelist15</meta>
```

Example of a MARC-defined `creator` (also OPF2 compliant):

```
<meta property="dcterms:creator" id="author">Haruki Murakami</meta>
<meta about="#author" property="role" id="role">aut</meta>
<meta about="#role" property="scheme"
   datatype="xsd:anyURI">http://www.loc.gov/marc/relators/</meta>
```