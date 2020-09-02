# Introduction #

EPUB3 will include more details on how to select an appropriate unique `dc:identifier` (the Publication Identifier), what other `dc:identifier`s should be included, and when the Publication Identifier should change.

# OPF 2.0 #

  * A string or number used to uniquely identify the resource. An OPF Package Document must include at least one instance of this element type, however multiple instances are permitted.
  * At least one identifier must have an id specified (the value being of the XML "ID" data type), so it can be referenced from the package unique-identifier attribute described in Section 2.1.
  * The identifier element has an optional OPF scheme attribute defined by this specification. The scheme attribute names the system or authority that generated or assigned the text contained within the identifier element, for example "ISBN" or "DOI." The values of the scheme attribute are case sensitive only when the particular scheme requires it.
  * This specification does not standardize or endorse any particular publication identifier scheme. Specific uses of URLs or ISBNs are not yet addressed by this specification. Identifier schemes are not currently defined by Dublin Core.

# Details #

Publication Identifiers SHOULD be modified when the content of an EPUB3 publication has ....
Publication Identifiers SHOULD NOT be modified when ...
Publication Identifiers SHOULD NOT be ISBNs, but ISBNs SHOULD be included in separate `dc:identifier` elements.

Whenever possible, `dc:identifier` values SHOULD be URIs.

Any valid URN used in a `dc:identifier`, such as ISBNs, ISSNs, DOIs, or UUIDs SHOULD include a `urn:` scheme. Some examples:
```
<dc:identifier id="pubid">urn:uuid:6C049021-7236-4866-82C6-6743B59B77A4</dc:identifier>:
<dc:identifier>urn:issn:0167-6423</dc:identifier>
<dc:identifier>urn:isbn:9781440488887</dc:identifier>
```