

## Proposals Summary ##
### OPF summary ###
  * Introduce and _strongly encourage_ use of DCTERMS for 3.0 package metadata, with a mechanism for compatibility between 3.0 reading systems and 2.0 packages, as well as the reverse, 2.0 reading systems and 3.0 packages. State intention to migrate fully to DCTERMS and formally deprecate use of DCMES in a _future_ revision of this standard, version number not specified.
  * Currently required 2.0.1 DCMES will remain, but changed with the addition of an optional extension mechanism (opf:override)
  * non-required 2.0.1 DCMES will be deprecated. Use DCTERMS instead.
  * add a new element `meta` with a required attribute `property` and an optional attribute `about`
  * the 2.0.1 `meta` element is _invalid_ per Content Conformance and _should be recognized_ per 3.0 Reading System conformance
  * Attributes which in 2.0.1 were part of the OPF namespace, and prefixed by `opf:`, will now be defined in the OPF profile document, and shall be expressed in the RDFa @property syntax.
  * add a new element `link` with the required attribute `rel` and the required attribute `href`
  * add the attribute `prefix` to the OPF root element
  * add the attribute `profile` to the OPF root element
  * create a "OPF metadata vocabulary" for the properties that OPF needs to define itself, as a separate profile document
  * allow the attributes `rel` and `property` on manifest `item` elements to allow expressing metadata about EPUB fileset members
  * use a vocabulary-based mechanism to provide values for the `rel` and `property` attributes (such as the DCTERMS and PRISM vocabularies)
  * ... let RDFa 1.1 provide the definition of all attributes mentioned above

### OPS summary ###
  * Add the attribute `ops:type` as global attribute in OPS. Refer to [ImplemenationProposalRoleOpsType](ImplemenationProposalRoleOpsType.md)

### NCX summary ###
  * Add the attribute `ops:type` attribute on navMap navList, navPoint and navTarget elements in NCX, as optional. Refer to  [ImplemenationProposalRoleOpsType](ImplemenationProposalRoleOpsType.md)
  * Add `source-identifier` property to to express relation to print sources

## OPF 3.0 namespace and package version ##

The namespace of OPF 3.0 remains the same as in 2.0.1, `http://www.idpf.org/2007/opf`.

The package version is `3.0`.

```
   <package xmlns="http://www.idpf.org/2007/opf"
            version="3.0">
```

## Metadata expression mechanism ##
<a href='Hidden comment: 
=== Property definitions ===

In the ideal case, we are able to reuse properties from existing vocabularies defined by other specifications. There are however a number of properties that we need to define ourselves because they do not exist externally (examples from above: "onix-record", "alternate-script", "cover-image").

These properties taken together constitute the "OPF metadata terms vocabulary". We can either provide this vocabulary as a separate document, normatively referenced from the OPF spec, or we can use the spec itself as the vocabulary document
(names and meanings of terms are defined inline). It does not matter from a technical standpoint which we choose, the choice is primarily one of ergonomics for the human consumer.
'></a>
### RFDFa 1.1 Profile + Prefix ###

Use the RDFa 1.1 profile mechanism to define a set of "core" vocabulary prefixes (specifically, opf and dcterms). We normatively reserve these prefixes.

  * Add @profile to the OPF package element only
  * Add @prefix to the OPF package element only (This simplifies processing vs. XML namespaces, which does not include this simplification).

The use of the profile mechanism to reserve prefixes simplifies processing even further, since there is now no need to resolve the most common prefixes. Plain simple XPath can be used to retrieve the `meta` element with `property="dcterms:title"` for example, since the `dcterms` prefix is fixed globally. Note that a validator such as epubcheck would be able to enforce these constraints.

In RDFa, the terms from one vocabulary can be used without a prefix. It is proposed that the OPF metadata terms vocabulary be fixed to be that prefix-less vocabulary.

NOTE: in this proposal, for purposes of clarity, OPF properties that are intended to assume a prefix-less syntax are shown in examples with the `opf:` prefix.

NOTE: when used, the `about` attribute must resolve to another element inside the package file. This is the opposite behavior of the `rel` attribute on `item`, which may resolve to an external entity - see below.

NOTE: multiple space separated values in a property attribute are allowed. `property="dcterms:creator foaf:name"` is legal.

Ancillary properties may be associated with any given meta element, using one or several additional `meta` elements with the `about` attribute.

The following example references the ID of the `dcterms:creator` element to express additional metadata properties of the `dcterms:creator` element:
```
  <meta property="dcterms:creator" id="creator">Haruki Murakami</meta>
  <meta about="#creator" property="opf:alternate-script" xml:lang="ja">村上 春樹</meta>
  <meta about="#creator" property="opf:file-as">Murakami, Haruki</meta>
```

## Package metadata ##

Principles:
  * The amount of required metadata should ideally not be extended in 3.0
  * Using a content nature neutral language (such Dublin Core) as the core language items remains desirable. EPUB is not used exclusively for books.
  * The primary purpose of package metadata is to describe the package, not the abstract work. Inlining complete bibliographic records remains out of scope.
  * Fragments of abstract work metadata are included only as and if there are uses cases for simple access to these fragments by reading systems.
  * An optional method to associate external, rich, complete bibliographic records with an EPUB is however defined as well, for current and future usage contexts where this association is needed.
  * We propose to use a subset of RDFa 1.1 as the expression form for all new OPF metadata, as this creates an extension and enrichment pattern that does not require the addition of new homegrown elements and/or attributes for each case.
  * The new syntax for expressing metadata must remain simple from a processing perspective. As an example, it must remain possible to use a plain good old XPath statement to retrieve the title of the publication.

### Meta element content model ###
The attributes `name` and `content` are removed from the `meta` element content model.

The attributes `property` and `about` are added to the `meta` element content model.

The meta element contains only plain text. Support for inline markup may be added in the future.

### Required metadata ###
  * for forwards compatibility purposes, the 3 required DCMES elements of OPF 2.0.1 remain required in 3.0.
  * The required elements `identifier` , `language` , `title` cannot be empty, and must provide a value.
  * the three required DCMES elements are placeholders for DCTERMS equivalents for 3.0 package conformance.
  * The content models and attribute sets of the 3 DCMES elements remain the same as in 2.0.1, with one exception: the `override` attribute, see below.
  * On the required DCMES elements in question, we provide a way to link (via IDREF) to an equivalent DCTERMS element that, if the (3.0) reading system recognizes the link, overrides the information in the DCMES element. This override link ('opf:override`) is optional in the grammar.

```
 <dc:language opf:override="idref">...</dc:language>
```

This allows complete package metadata to be provided using non-deprecated elements, and allows for making use of the richer expression mechanisms available in the new expression form.

The schema will require that the destination of any given `opf:override` attribute is the 'expected' DCTERMS element, with the following mapping:
  * dc:language ==> dcterms:language
  * dc:title ==> dcterms:title
  * dc:identifier ==> dcterms:identifier

In a future version of this standard, the `ops:override` attribute, along with DCMES, will be formally deprecated. The override attribute is transitional.

### Content Version ###

To enhance the ability of content providers and distribution channels to make subsequent iterations of a package available in a clear and consistent manner, we define a `content-version` property. Subsequent iterations must increment the value.

Example 1: Incrementing `content-version` for successive iterations of package
```
  <!-- iteration 1 -->
  <meta property="opf:content-version">1.0.0</meta>
  <!-- iteration 2 -->
  <meta property="opf:content-version">2.0.0</meta>

  <!-- OR -->

  <!-- iteration 1 -->
  <meta property="opf:content-version">1.1.1</meta>
  <!-- iteration 2 -->
  <meta property="opf:content-version">1.1.2</meta>
```


Example 2: General usage of `content-version` within the metadata section
```
  <package xmlns="http://www.idpf.org/2007/opf"
           xmlns:dc="http://purl.org/dc/elements/1.1/"
           unique-identifier="bookid" version="3.0">
   <metadata>
    <dc:identifier id="bookid">6f24dfc73eb7</dc:identifier>
    <meta property="opf:content-version">1.2.3</meta>
   </metadata>
  </package>
```

### The new DCTERMS elements and 'ancillary properties' ###
All new (as of 3.0) meta elements use the `meta` element with the RDFa attributes `property` (required) and `about` (optional), where the value of the property is the element content. Note that this is a subset of the full RDFa attribute set. Note also that the current (as of 2.0.1) `name` attribute is removed on the 3.0 `meta` element.

#### Identifier ####
The expression form for a DCTERMS identifier is:
```
  <meta property="dcterms:identifier">123456789</meta>
```

The use of the unique-identifier attribute on the package element remains unchanged.

When multiple identifiers are present, the existing `opf:scheme` ancillary property must be used to distinguish them:

```
  <meta property="dcterms:identifier" id="id1">123456789</meta>
   <meta about="#id1" property="opf:scheme">issn</meta>

  <meta property="dcterms:identifier" id="id2">0A920021223F3320</meta>
   <meta about="#id2" property="opf:scheme">istc</meta>

  <meta property="dcterms:identifier" id="id3">10.1000/0A920021223F3320</meta>
   <meta about="#id3" property="opf:scheme">doi</meta>
```

In the case of `dcterms:identifier`, the following ancillary properties are defined in the spec (see further "Property definitions" below).
  * `opf:scheme`

The use of additional ancillary properties to `dcterms:identifier` is not illegal.

#### Creator ####
The expression form for a DCTERMS creator is:
```
  <meta property="dcterms:creator">Haruki Murakami</meta>
```

In the case of `dcterms:creator`, the following ancillary properties are defined in the spec (see further "Property definitions" below).

  * `file-as`
  * `alternate-script`

```
  <meta property="dcterms:creator" id="creator">Haruki Murakami</meta>
   <meta about="#creator" property="opf:alternate-script" xml:lang="ja">村上 春樹</meta>
   <meta about="#creator" property="opf:file-as">Murakami, Haruki</meta>
```

Example usage of party identifiers e.g. ISNI or proprietary, attached to creator and contributor elements.
```
  <meta property="dcterms:creator" id="author1">John A. Smith</meta>
   <meta property="dcterms:identfifier" about="#author1" id="author1-id">1234567812345678</meta>
    <meta property="opf:scheme" about="#author1-id">isni</meta>

  <meta property="dcterms:contributor" id="author2">John B. Smith</meta>
   <meta property="dcterms:identfifier" about="#author2" id="author2-id">AR-1509-342-z</meta>
    <meta property="opf:scheme" about="#author2-id" id="poetry-guild-number">proprietary</meta>
```

The use of additional ancillary properties to `dcterms:creator` is not illegal.

Multiple `meta` elements with the property `dcterms:creator` is allowed.

#### Title ####
The expression form for a DCTERMS title is:
```
  <meta property="dcterms:title">Norwegian Wood</meta>
```

... and, just as in the case with `dcterms:creator`, ancillary information is added using additional `meta` elements with the `about` attribute:

```
  <meta property="dcterms:title" id="title">Norwegian Wood</meta>
  <meta about="#title" property="opf:alternate-script" xml:lang="ja">ノルウェイの森</meta>
```

In the case of `dcterms:title`, the following ancillary properties are defined in the spec (see further "Property definitions" below).
  * `file-as`
  * `alternate-script`

##### Extended titles and sorting #####
This addresses META [R03](http://code.google.com/p/epub-revision/wiki/Metadata#META_R03_Series_Titles_and_Subtitles_(A)) and [R04](http://code.google.com/p/epub-revision/wiki/Metadata#META_R04_Sorting_information_(F))

Extend dcterms:title via additional OPF properties. Define properties for `title-type`, `sort-order`, and `display-seq`. Allow `file-as` attribute in dc:title element.

The `title-type` attribute will have a defined list of values corresponding to commonly used forms of title nomenclature. Recommended values are primary, short, long, sub, series, collection, edition, slang.

The `sort-order` attribute will be a numerical value indicating the order within a range of the same `title-type` of title as the element.

The `display-seq` attribute will be a numerical value to express how multiple _types_ of dc:title elements should be sequenced for display purposes, as this may vary widely.

The `file-as` attribute would behave as currently described in OPF for dc:creator and dc:contributor.

The existing `xml:lang` attribute usage should be encouraged on dc:title elements where appropriate.

An example, for the fictional cookbook "The Great Cookbooks of the World: Mon premier guide de cuisson, un Mémoire. The New French Cuisine Masters, Volume Two. Special Anniversary  Edition"

```
  <dc:title opf:override="t1" id="ot1" xml:lang="fr">Mon premier guide de cuisson, un Mémoire</dc:title>
   <meta property="dcterms:title" id-"t1" xml:lang="fr">Mon premier guide de cuisson, un Mémoire</meta>
   <meta about="#t1" property="opf:title-type">primary</meta>
   <meta about="#t1" property="opf:display-seq">2</meta> 

  <dc:title opf:override="t2" id="ot2">The Great Cookbooks of the World</dc:title>
   <meta property="dcterms:title" id="t2">The Great Cookbooks of the World</meta>
   <meta about="#t2" property="opf:title-type">collection</meta>
   <meta about="#t2" property="opf:display-seq">1</meta>
   <meta about="#t2" property="opf:file-as>Great Cookbooks of the World, The</meta>

   <dc:title opf:override="t3" id="ot3">>The New French Cuisine Masters, Volume Two</dc:title>
   <meta property="dcterms:title" id="t3">The New French Cuisine Masters, Volume Two</meta>
   <meta about="#t3" property="opf:title-type">series</meta>
   <meta about="#t3" property="opf:file-as">New French Cuisine Masters, The</meta>
   <meta about="#t3" property="opf:sort-order">2</meta>
   <meta about="#t3" property="opf:display-seq>3</meta>

  <dc:title opf:override="t4" id="ot4">Special Anniversary  Edition </dc:title>
   <meta property="dcterms:title" id="t4">Special Anniversary  Edition</meta>
   <meta about="#t4" property="opf:title-type">edition</meta>
   <meta about="#t4" property="opf:display-seq">4</meta>
```

The use of additional ancillary properties to `dcterms:title` is not illegal.

Multiple meta elements with the property `dcterms:title` are allowed.

#### Other DCTERMS elements ####

Other elements from the dcterms vocabulary may occur in metadata. Like with all meta elements, ancillary properties may be used with these (so that `dcterms:subject` could be provided in multiple scripts/languages for example).

The following specific recommendations regarding the use of the other dcterms elements is provided in the spec:

  * the `dcterms:subject` property has the ancillary property `opf:scheme` where values _should_ be drawn from ONIX 3.0 Code List 27.

  * the `dcterms:contributor` property has the ancillary property `opf:role` where values _should_ be drawn from ONIX 3.0 Code List 17

### Metadata Authority ###

Define the following new OPF properties:

  * `meta-auth` property to denote the responsible party or authority for metadata elements.
  * `date-ref` property that will refer by id value to a dcterms:date element with opf:event value of 'meta-update'. (see dcterms:date regarding _opf:event_)
  * `signature` property, that will be optional and refer by id value to an XML Signature that must reside in the META-INF/Signatures.xml file.
  * `authority` property that will be allowed on meta elements, and will have a value of the id of a metadata authority.

Example 1: Metadata Authority Inc. injects publication with ISBN-13, preserving the package @unique-identifier, uses a (currently defined in OCF) XML Signature.

```
  <package version="3.0" xmlns="http://www.idpf.org/2007/opf" unique-identifier="my-uuid">
  <metadata>
  <meta property="dcterms:identifier" id="my-uuid">UUID-1234-5678</meta>
  <meta property="dcterms:identifier" id="isbn-id">>9780101010101</meta>
   <meta about="#isbn-id" property="opf:scheme">isbn13"</meta>
   <meta about="#isbn-id" property="opf:authority">meta-authority-01</meta>

  <meta property="dcterms:date" id="dt-01">2010-10</meta>
   <meta about="#dt-01" property="opf:event">meta-update</meta>

  <meta property="opf:meta-auth" id="meta-authority-01">>Metadata Authority Inc</meta>
   <meta about="#meta-authority-01" property="opf:signature">MAI-Signature</meta>
   <meta about="#meta-authority-01" property="opf:date-ref">dt-01</meta>
  ...
  <!-- in Signatures.xml -->
  <signatures>
   <Signature Id="MAI-Signature" xmlns="http://www.w3.org/2000/09/xmldsig#">
  </signatures>
```

Example 2: ExampleEbookRetailer.com adds proprietary identifier into publication, preserving original publisher supplied UUID, but changing package @unique-identifier. Does not use signature.

```
  <package version="3.0" xmlns="http://www.idpf.org/2007/opf" unique-identifier="pID">
  <metadata>
  <dc:identifier id="my-uuid">UUID-1234-5678</dc:identifier>

  <meta property="dcterms:identifier" id="pID">bk-555-555-5555</meta>
   <meta about="#pID" property="opf:scheme">proprietary</meta>
   <meta about="#pID" property="opf:authority">meta-authority-01</meta>

  <meta property="dcterms:date" id="update05">2008-07-16T12:32:27.21</meta>
   <meta about="#update05" property="opf:event">meta-update</meta>

  <meta property="opf:meta-auth" id="meta-authority-01">ExampleEbookRetailer.com</meta>
   <meta about="#meta-authority-01" property="opf:date-ref">update05</meta>
```

### EPUB publication nature specification ###

Define `publication-type` property, enumerate values for specific types of packages that require global declaration.

The meta element that specifies that an EPUB is a dictionary:
```
  <meta property="opf:publication.type">Dictionary</meta>
```

The meta element that specifies that an EPUB is an annotation (as per annotation proposal)
```
  <meta property="opf:publication.type">Annotation</meta>
```

### PRISM metadata ###

To allow prism metadata at the package level, all that is needed is that the `prism` prefix be defined using the generic mechanism to associate prefixes with vocabularies (see "Prefix association" below). Because of this generic solution, the OPF spec does not really need to say anything specific about prism. Other "new" metadata vocabularies are hooked up the same way.

Note: PRISM contains multiple vocabularies. If multiple vocabularies from PRISM are referenced in the same package file, they need different prefixes.

<a href='Hidden comment: 
=== Series information ===

Declaring that the current EPUB is part of a collection, and which position

```
  <meta property="dcterms:isPartOf" id="coll">The Collection Name</meta>
   <meta about="#coll" property="position-in">1</meta>
```
'></a>

### Manifest ###

  * add the RDFa `property` and `about` attributes to the manifest `item` element as a way to express semantice metadata about a manifest item

#### Cover Image ####
  * define the `cover-image` property
  * specify that if the `cover-image` property occurs on an item which does not reference a core image type, then it is an error

```
 <item property="opf:cover-image" href="cover.png" ... />
```

  * add spec prose that require 3.0 reading systems to also recognize the non-de-jure mechanism used for this purpose in 2.0 content

  * Current non-standard mechanism of specifying cover image

```
 <metadata>
  <meta name="cover" content="img_cover"/>
 </metadata>
 <manifest>
  <item id="img_cover" href="Cover.jpg" media-type="image/jpeg"/>
 </manifest>
```

#### Manifest item special properties ####

  * utilize the RDFa `property` attribute on the manifest `item` element as a way to express that a given manifest item possesses a particular property. These properties are generally related to the type of content markup vocabulary used, the presence of scripted content, networked-resource requirements, or special presentation requirements.

Example 1: Special property declared on manifest item.

```
 <item property="opf:scripted" href="chap1.xhtml" ... />
```

Note that this could be done using meta/@about as well, but we suggest using this approach for authoring convenience. Note also that the properties we define for use on item/@property will be reserved for use on item/@property, so we retain the one-single-way-to-do-things principle.

Properties defined for manifest/item/@property:
  * `scripted` Specifies that the resource contains, directly or by reference, HTML5 script. Meaningful on: manifest XHTML5 items
  * `online-resources` Specifies that the resource contains inline references to online resources (TBD “online” is an unspecific term, may use WWW instead?)
  * `mathml` Specifies that the resource contains, directly or by reference, MathML. Meaningful on: manifest XHTML5 items
  * `svg` Specifies that the resource contains, directly or by reference, MathML. Meaningful on: manifest XHTML5 items
  * `cover-image` Specifies that the item is a cover image. Meaningful on: manifest image items
  * `page-progression-direction-ltr` Meaningful on: manifest XHTML5 items
  * `page-progression-direction-rtl` Meaningful on: manifest XHTML5 items

### External metadata ###
  * Add an unambiguous method to identify external bibliographic records. These records may be located in the container, but the default assumption is that they are container-external.
  * Links to external records is optional in the OPF schema
  * Support for retrieving the data in external records is optional for Reading Systems
  * The package manifest does not include these as `item`s, as they are not formally part of the EPUB publication
  * Add a new element `link` as an allowed child of metadata with the RDFa attributes `rel` and `resource`
  * predefine values for ONIX `onix-record`, MARC21-XML `marc21xml-record`, MODS `mods-record`, and XMP `xmp-record`. The use of other values on link/@rel is not illegal.
  * There is no provision for specifying the version of the record (this assumes that version information is available inline in the referenced resources)
  * If data provided in the external record conflicts with data given inline in the OPF, then the inline data takes precedence.

```
<metadata>
  <link rel='onix-record' resource='anyURI' />  
  <link rel='mods-record' resource='anyURI' />
  <link rel='marc21xml-record' resource='anyURI' />  
  <link rel='xmp-record' resource='anyURI' />  
</metadata>
```

## NCX ##
### Page Navigation Source ###

  * the NCX now only contains one pageList, so given that the package file references a print source, this information is available. We need a specified syntax to refer to identifiers of print sources, therefore, we need to introduce the `source-identifier` property, and mandate the following usage when the property is used:

```
  <meta property="dcterms:identifier" id="pid">9781234567891</meta>
  <meta about="#pid" property="opf:scheme">isbn13</meta>
  <meta about="#pid" property="opf:source-identifier" />
```

## META-INF ##
  * Resources placed in META-INF may be non-manifested items.
  * Resources in META-INF should be named with a reverse-dns prefix and a unique identifier for the resource such as: `org.idpf.resource-id`.

## OPS head metadata ##

The OPS head `meta` element remains defined as the HTML5 `meta` element. EPUB/OPS specifies no particular use for this element.

## OPS inline metadata ##
TODO: Review and finalize how the [ops:type/role attribute](ImplemenationProposalRoleOpsType.md) covers identified use cases re semantic inflection.

## Full examples ##

### Minimal 3.0 OPF metadata ###
Identical to OPF 2.0.1.
```
 <package unique-identifier="uid" xmlns="http://www.idpf.org/2007/opf" profile="http://www.idpf.org/.../3.0/">
   <metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
     <dc:identifier id="uid">123456789</dc:identifier>
     <dc:title>Norwegian Wood</dc:title>
     <dc:creator>Haruki Murakami</dc:creator>
   </metadata>
 </package>
```
<a href='Hidden comment: 
Minimal 4.0 OPF metadata (projection)

Since the three required DC elements are deprecated in 3.0, in 4.0 the above would instead be

```
 <package unique-identifier="uid" xmlns="http://www.idpf.org/2007/opf" profile="http://idpf.org/.../4.0/">
   <metadata>
     <meta property="dcterms:identifier" id="uid">123456789</meta>
     <meta property="dcterms:title">Norwegian Wood</meta>
     <meta property="dcterms:creator">Haruki Murakami</meta>
   </metadata>
 </package>
```
'></a>

### Minimal OPF metadata with a DCTERMS override and an ancillary property ###
Using the new `opf:override` attribute that allows 3.0 aware reading systems to locate richer data for the required-but-deprecated DC elements (in this case, the title), and an ancillary property added.

```
 <package unique-identifier="uid" xmlns="http://www.idpf.org/2007/opf" xml:lang="en" profile="http://idpf.org/.../3.0/">
   <metadata xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:opf="http://www.idpf.org/2007/opf">
     ...
     <dc:title opf:override="title">Norwegian Wood</dc:title>
     ...
     <meta id="title" property="dcterms:title">Norwegian Wood</meta>
     <meta about="#title" property="opf:alternate-script" xml:lang="ja">ノルウェイの森</meta>
   </metadata>
 </package>
```

### Extension metadata with an ancillary property ###
An example of how metadata not specified by the OPF spec is included. Note that all extension metadata must be prefixed, as properties without a prefix belong to the "default" vocabulary that is defined in the OPF spec. If an extension property is provided without a prefix, it will be interpreted as a non-existant item from the default vocabulary.

The prefix used must be defined in the root element `prefix` attribute.

```
 <package unique-identifier="uid" xmlns="http://www.idpf.org/2007/opf" xml:lang="en"
    profile="http://idpf.org/.../3.0/" 
    prefix="happy: http://happy.info/vocab/#">
   <metadata ...>
     ...          
     <meta property="happy:foo" id="happy">...</meta>
     <meta about="#happy" property="happy:bar">...</meta>
   </metadata>
 </package>
```

### Manifest metadata ###
In the example below,  the first `item` shows how a cover image is identified, and the second `item` shows how a an OPS item is declared to contain scripting.

```
 <package unique-identifier="uid" xmlns="http://www.idpf.org/2007/opf" xml:lang="en"
    profile="http://idpf.org/.../3.0/">
   ...
   <manifest>
      <item property="cover-image" href="cover.png" ... />
      <item property="scripted" href="chapter1.xhtml" ... />
   </manifest>
 </package>
```

## Table: OPF 3 elements & attributes ##
| **OPF Block** | **element** | **attributes** |
|:--------------|:------------|:---------------|
| root | `package` | `version`, `unique-identifier`, `profle`, `prefix` |
| metadata | `metadata` | NA |
| metadata | `meta` | `property`, `about` |
| metadata | `link` | `rel`, `resource` |
| metadata | `dc:identifier` | `scheme` |
| metadata | `dc:title` | `file-as`, `alternate-script`, `sort-order`, `display-sequence`, `title-type` |
| metadata | `dc:language` | `xml:lang` |
| metadata | `dcterms:creator` | `role`, `file-as`, `alternate-script` |
| metadata | `dcterms:contributor` | `role`, `file-as`, `alternate-script` |
| metadata | `dcterms:subject` | `scheme` |
| metadata | `dcterms:date` | `event` |
| manifest | `manifest` | NA |
| manifest | `item` | `id`, `href`, `media-type`, `fallback`, `fallback-style`, `required-namespace`, `property`, `rel` |
| spine | `spine` | `toc` |
| spine | `itemref` | `idref`, `linear` |

## Table: OPF 3 values for @property ##
| **Value** |  **allowed content values** |  **applies to** |
|:----------|:----------------------------|:----------------|
| `alternate-script` |  text |  title, creator, contributor |
| `authority` |  id of meta-auth |  any |
| `content-version` |  version string e.g. '1.1.1' |  meta |
| `cover-image` |  declarative flag |  manifest/item |
| `date-ref` |  id of dc:date or dcterms:date |  any |
| `display-seq` |  numerical, relative to other similar metadata e.g. multiple dcterms:title |  any, emphasis on title, creator, contributor |
| `event` |  | date |
| `file-as` |  text |  title, creator, contributor |
| `mathml` |  declarative flag |  manifest/item |
| `meta-auth` |  text |  any |
| `online-resource` |  declarative flag |  manifest/item |
| `override` |  idref of dcterms equiv of legacy element |  any DCMES legacy element |
| `page-progression-direction-ltr` |  declarative flag |  manifest/item |
| `page-progression-direction-rtl` |  declarative flag |  manifest/item |
| `publication.type` |  `dictionary` OR `annotation` |  meta |
| `role` |  text, suggested from MARC/ONIX lists |  creator, contributor |
| `scheme` |  text, contextual values e.g. subject v. identifier, suggested ONIX lists | identifier, subject |
| `scripted` |  declarative flag |  manifest/item |
| `signature` |  idref of signature in signatures.xml |  meta |
| `sort-order` |  numerical, relative to other similar metadata e.g. multiple dcterms:title |  any, emphasis on title, creator, contributor |
| `source-identifier` |  idref of dc or dcterms identifier that relates to print nav source of NCX |  meta |
| `svg` |  declarative flag |  manifest/item |

## Table: OPF 3 values for @rel ##
| **Value** |  **allowed content values** |  **applies to** |
|:----------|:----------------------------|:----------------|
| `onix-record` | href | link |
| `marc21-record` | href | link |
| `mods-record` | href | link |
| `xmp-record` | href | link |

## Table: DCTERMS + DCMES ##
|DCTERMS | DCMES | Notes |
|:-------|:------|:------|
|abstract  |  |  |
|accessRights  |   |  |
|accrualMethod |   |  |
|accrualPeriodicity |   |  |
|accrualPolicy |   |  |
|alternative  |   |  |
|audience  |   |  |
|available  |   |  |
|bibliographicCitation  |  |  |
|conformsTo  |   |  |
|contributor  | --contributor--  |  |
|coverage  | --coverage--  |  |
|created  |   |  |
|creator  | --creator--  |  |
|date  | --date--  |  |
|dateAccepted  |   |  |
|dateCopyrighted  |   |  |
|dateSubmitted  |   |  |
|description  | --description--  |  |
|educationLevel  |   |  |
|extent  |   |  |
|format | --format-- |  |
|hasFormat  |   |  |
|hasPart  |   |  |
|hasVersion  |   |  |
|identifier  | identifier  | required |
|instructionalMethod  |   |  |
|isFormatOf  |   |  |
|isPartOf  |   |  |
|isReferencedBy  |   |  |
|isReplacedBy  |   |  |
|isRequiredBy  |   |  |
|issued  |   |  |
|isVersionOf  |   |  |
|language  | language  | required |
|license  |   |  |
|mediator  |   |  |
|medium  |   |  |
|modified  |   |  |
|provenance  |   |  |
|publisher  | --publisher--  |  |
|references  |   |  |
|relation  | --relation--  |  |
|replaces  |   |  |
|requires  |   |  |
|rights  | --rights--  |  |
|rightsHolder  |   |  |
|source  | --source--  |  |
|spatial  |   |  |
|subject  | --subject--  |  |
|tableOfContents  |   |  |
|temporal  |   |  |
|title  | title  | required |
|type  | --type--  |  |
|valid |   |  |