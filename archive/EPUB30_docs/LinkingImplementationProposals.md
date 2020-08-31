

This page outlines the various proposals for EPUB Linking & Identification.


# Problem Scope #

The following implementation proposals attempt to solve a problem (linking) that is effectively 2-fold:

  * How to reference EPUB and EPUB3 publications in a non-ambiguous manner (uniqueness), independently from their respective physical locations.
  * How to reference specific content / resources within EPUB and EPUB3 publications (e.g. a paragraph, a figure, etc.).

One design goal is to enable the encoding of both types of information within a single format, based (most likely) on the Uniform Resource Identifier syntax (URI - RFC3986). However, for the sake of clarity, it would be desirable to clearly distinguish Part A (identification of an EPUB publication) and Part B (identification of content within an EPUB publication).

In the future, this dichotomy would allow the design scope for more sophisticated linking use-cases (such as annotating documents containing video/audio clips) to be de-facto restricted to Part B only, leaving Part A untouched. In this version of EPUB3, the emphasis is put on the simple "fragment identifier" linking mechanism, for referencing XML/XHTML content in a relatively abstract manner.

# URI Links Proposal #

## Introduction ##
Historically each EPUB document has been identified using a “unique-identifier” property which references a meta element containing the unique identifier by id. Although this identifier has in theory been unique, there has been no prescribed method for insuring its uniqueness across the universe of publishers.

In addition, it has been unclear when to change a publication’s identifier. Some publishers change the identifier each time a new version is created, while others change the identifier only when a new “work” is created.

As EPUBs have increased in prominence and longevity, it has become important to introduce a permanent unambiguous way of referring to an EPUB both offline and online. This proposal seeks to describe an approach to solving these problems using URIs.

## URI Syntax ##
Each EPUB will be identified by a URI that is constructed from the following components:

#### scheme ####
The URI scheme such as “http” or “ftp”. The scheme may be sued as a protocol to access the EPUB in the event that the URI happens to be a URL but there is no mandate that this be the case.

#### authority ####
The authority under which the URI has been created. The authority must be DNS registered to insure that URIs are globally unique. Example authorities include: “epubs.idpf.org” or “randomhouse.com”.

#### path ####
The publisher controlled path of the EPUB. Publishers may choose paths in any way that is convenient to them. For example if one wished to organize content by language, one might have paths like: “/epubs/english/history” and “/epubs/japanese/cooking”.

#### unique-identifier ####
The unique identifier string identified in the EPUB’s OPF file. The definition of the unique-identifier for EPUB3 will be augmented to specify the unique-identifier of a publication will only be changed when a new “work” is created.

#### version ####
The version number specified using the new EPUB3 “opf:content-version” property specified in the EPUB. Version numbers may be specified with a varying precision. For example, if an EPUB has a version of “1.2.511” it should be considered as matching URIs that specify a version number of “1.2” or “1” or which omit the “version” segment of the URI entirely. A reference that fails to specify a more granular version number should receive the highest version available in response.

#### file ####
The name of a file within the manifest of an EPUB. This URI segment is entirely optional and in general will be omitted. It will only be present when one wishes to refer to a specific file within an EPUB to provide a deep linking capability.

#### id ####
The id portion of the URI will only be specified when a link refers to a specific xml element within an EPUB content file. In general the id field will be omitted. If an id is specified, a file must be specified.

## Canonical URI syntax ##
Following is the canonical form a URI that may be used reference an EPUB. The segments contained within “{}” brackets may be omitted.

```
    scheme:://authority/path/unique-identifier{/version}{{/file}#id}
```

## Example URIs ##
```
    http://epub.idpf.org/us/0741021137
    http://epub.idpf.org/us/0741021137/1.2.511
    epub://mydomain.com/alice_in_wonderland
```

## URI Processing ##
All user agents that handle EPUB links are required to handle them in such a way that version numbers degrade gracefully as described above under “version”. This would mean that if one were to process EPUB URI requests over the web, it would be necessary to return success from multiple locations depending on the specificity of the link provided.

## Handling EPUB2 Publications ##
EPUB2 publications do contain unique identifiers, but they do not contain version numbers. As a result, EPUB2 publications must only be referred to using a URI that omits the version segment.

Because EPUB2 publications do not contain a scheme, authority or path, a default for these fields must be provided. Whenever there is no scheme authority or path specified, the default, for processing purposes will be assumed to be “http://idpf.org/epub”.

## Open Issues ##
  1. Should scheme, authority and path be stored in an EPUB’s OPF file to insure that a complete URI can be constructed from the OPF?
  1. Should it be possible to specify a “file” component as part of the URI as described above? This could make it difficult to identify which part of the URL is the unique-identifier and which part is the version.  The file could also be specified as a CGI parameter.

# PURL-based EPUB Identifiers #

## Summary ##

A PURL-based EPUB Identifier (PEI) identifies an EPUB or EPUB 3 publication and allows EPUB/3 publications to reference other EPUB/3 publications. PEIs are valid HTTP URIs that can be distinguished from other URIs by their consistent prefix and created or used without network access. Additional optional metadata MAY be added to a PEI to identify a specific EPUB/3 publication, a single file inside the publication, or a single location inside a file. Finally, some PEIs MAY be resolved to an available resource using HTTP and redirects against a Persistent Uniform Resource Locator (PURL) service hosted by the IDPF.

## Notational Conventions ##

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in `[RFC2119]`.

## Parts of a PEI ##

```
http://purl.idpf.org/{epub-publication-identifier}?{key1=value1&key2=value2...}
```

PEIs are made up of three components:

  1. A consistent prefix for the IDPF-hosted PURL service, `http://purl.idpf.org/`
  1. A URI-escaped version of the EPUB/3 publication's Publication Identifier
  1. A number of optional query parameters as key-value pairs that form a query section following a `?`

## Creating a PEI ##

Given an EPUB or EPUB3 publication, a PEI is constructed by escaping the Publication Identifier from the EPUB/3 metadata and appending it to the address for the IDPF-hosted PURL service, `http://purl.idpf.org/`. The Publication Identifier, defined in the section "Publication Identifiers" of `[EPUBPUB3]`, is the text content of the `dc:identifier` element referenced as the publication's `unique-identifier`. This text content MUST be stripped of leading and trailing whitespace before escaping following `FIXME` (this is often referred to as "percent encoding").

All PEIs MUST be valid Uniform Resource Identifiers (URIs) as defined in `[RFC3986]`.

Additionally, PEIs SHOULD include a query component following a `?` character that contains at least two sets of key-value pairs ("query parameters") from the EPUB/3 metadata:

  * `creator`: A reference to the creators of the EPUB/3 publication. The value of this parameter is the value of each `dc:creator` (mutiple pairs MUST be created if the metadata includes multiple `dc:creator`s) in the publication metadata.
  * `title`: A reference to the title of the EPUB/3 publication. The value of this parameter is the the value of the first `dc:title` element in the publication metadata.

All query parameters MUST be stripped of leading and trailing whitespace before escaping following `FIXME`.

Future versions of this document MAY specify additional query parameters for identifying parts or versions of publications using different techniques.

### Identifying Part of a Publication ###

PEIs MAY include additional query parameters to identify a single file in an EPUB/3 publication and/or a single location inside that file. These query parameter keys are defined:

  * `file`: A reference to one file within the EPUB/3 publication. The value of this parameter is the absolute path (relative to the root of the OCF Abstract Container of the EPUB/3 publication) to one valid "File Name" (per the OCF spec).
  * `fragment-id`: A reference to one element in XML content within the file specified by the `file` parameter. The value of this parameter is the value of the `id` attribute of the target element.
  * `text`: A reference to one continuous section of text within any one element within XML content inside the EPUB/3 publication. The value of this parameter is the escaped text itself.


### Identifying a Specific Version of a Publication ###

PEIs MAY include additional query parameters to more explicitly identify a precise version or instance of an EPUB/3 publication. These query parameter keys are defined:

  * `content-version`: A reference to a specific version of an EPUB3 publication. The value of this parameter is the value of the `content-version` metadata element from an EPUB3 publication's metadata.
  * `md5sum`: A reference to a specific EPUB/3 publication instance as a file. The value of this parameter is the MD5 message digest of the EPUB/3 publication as a file as defined in `[RFC1321]`.

## Using PEIs in EPUBs ##

Valid PEIs MAY be used inside EPUB/3 publications to reference other EPUB/3 publications. For example, this XHTML markup could be used inside an EPUB/3 publication to reference another work:

```
For more information on creating ebooks in the EPUB format, 
see <a href="http://purl.idpf.org/0132366991?title=EPUB+Straight+to+the+Point&creator=Liz+Castro">Liz Castro's EPUB Straigh to the Point</a>.
```

A PEI-aware EPUB/3 Reading System MAY use this hyperlink to switch titles (if the user already had access to this title and an Exact Match was made) or to invoke a local or remote acquisition attempt or search (following deconstruction of the PEI, as described in the section "Reading PEIs").

## Reading PEIs ##

PEIs can be deconstructed and used by EPUB/3 Reading Systems or PEI clients by extracting and unescaping the Publication Identifier value. This value can then be matched against the Publication Identifier of available EPUB/3 publications. This is an Exact Match.

If an Exact Match is not found, an EPUB/3 Reading System or PEI client MAY also choose to attempt a to locate similar publications based on available `title`, `creator`, and/or other query parameter values, if available. This is an Approximate Match. A user SHOULD be notified if an Approximate Match is returned.

Some PEIs MAY have resources availabe via HTTP `[RFC2616]`, as described in the section "PEIs and PURLs".

## Processing Expectations ##

PEI creators PEIs MUST NOT require an active internet connection to create a PEI from an available EPUB/3 publication.

PEI clients MUST NOT:

  * require an active internet connection to perform Exact Matches
  * stop processing or signal an error if the PURL service is unavailable
  * stop processing or signal an error if a PEI is not registered with the PURL service
  * stop processing or signal an error if a PEI registered with the PURL service returns an unexpected result via HTTP

PEI clients MUST ignore unexpected query parameters in a PEI. PEI clients SHOULD preserve the entire query component, including unknown parameters, when storing or retransmitting PEIs.

## PEIs and PURLs ##

The IDPF will provide a PURL service for registering and maintaining HTTP redirects from valid PEIs. (FIXME some detail here.) Please see http://purl.idpf.org for more information.

PURLs are discussed in more detail in `[PURL-Overview]`.

### Registering a PEI with the PURL service ###

Valid PEIs MAY have HTTP redirects registered with the PURL service. The resources returned by these redirects are out of the scope of this document.

Existing PEIs registered with the PURL service SHOULD be maintained by the original registrant using the interfaces provided by the service.

## Examples ##

A simple PEI identifying an EPUB publication with the Publication Identifier `<dc:identifier id="pubid">urn:uuid:6C049021-7236-4866-82C6-6743B59B77A4</dc:identifier>`:

```
http://purl.idpf.org/urn%3Auuid%3A6C049021-7236-4866-82C6-6743B59B77A4
```

The same PEI with the recommended `title` and `creator` query parameters:

```
http://purl.idpf.org/urn%3Auuid%3A6C049021-7236-4866-82C6-6743B59B77A4?title=PEI+Example&
                                                                       creator=Creator1+Gda%C5%84sk&
                                                                       creator=Creator2
```

A PEI identifying a specific file in an EPUB3 publication:

```
http://purl.idpf.org/0132366991?file=%2FOEBPS%2FePub-STTP-4.xhtml
```


A PEI identifying a specific location inside a specific file in an EPUB3 publication:

```
http://purl.idpf.org/0132366991?title=EPUB+Straight+to+the+Point&
                                creator=Liz+Castro&
                                file=%2FOEBPS%2FePub-STTP-4.xhtml&
                                fragment-id=toc-anchor-4&
                                text=The+mimetype+file+is+a+simple+text+file
```


A PEI with a number of optional parameters:

```
http://purl.idpf.org/the_hound_of_the_baskervilles-AAH812&title=The+Hound+of+the+Baskervilles&
                                                          creator=Sir+Arthur+Conan+Doyle&
                                                          file=%2FOPS%2Fthe_hound_of_the_baskervilles-AAH812_chapter_03.html&
                                                          fragment-id=rw-p_39510-00001&
                                                          md5sum=24aeed0b82aadf061d88c7143dc6ca2b
```

### DOI and PEI ###

DOIs can integrate seamlessly into PEIs. The registration, maintenance, and specifics of DOIs for EPUB/3 publication is out of scope. DOIs are described in more detail in `[ISO-26324]`. Valid DOIs MAY be used as a Publication Identifier, like:

```
<dc:identifier id="pubid">urn:doi:10.1000/182</dc:identifier>`:
```

This DOI would then be escaped as usual to create a PEI:

```
http://purl.idpf.org/urn%3Adoi%3A10.1000%2F182
```

The difference would be that DOI-aware applications would recognize the `urn:doi:` prefix and retreive more information about the DOI after extracting the Publication Identifier from the PEI.


## TODO ##

  * Clarify what should happen with localized or muliple dc:titles or dc:creators.
  * Establish reference to Media Query Fragments and other fragment specs?

## References ##

### Normative References ###

  * `[EPUBPUB3]` Conboy, G., Gylling, M., McCoy, W., Weck, D., and D. Hughes, "EPUB Publications 3.0", FIXME 2011.
  * `[ISO-26324]` "Information and documentation -- Digital object identifier system", ISO 26324:2010
  * `[RFC1321]` R. Rivest. "The MD5 Message-Digest Algorithm", RFC 1321, April 1992.
  * `[RFC2119]` Bradner, S., "Key words for use in RFCs to Indicate Requirement Levels", BCP 14, RFC 2119, March 1997.
  * `[RFC2616]` Fielding, R., Gettys, J., Mogul, J., Frystyk, H., Masinter, L., Leach, P., and T. Berners-Lee, "Hypertext Transfer Protocol -- HTTP/1.1", RFC 2616, June 1999.
  * `[RFC3986]` Berners-Lee, T., Fielding, R., and L. Masinter, "Uniform Resource Identifier (URI): Generic Syntax", STD 66, RFC 3986, January 2005.

### Informative References ###

  * `[PURL-Overview]` Wood, D., "Overview of of PURLs", http://purl.org/docs/help.html#overview