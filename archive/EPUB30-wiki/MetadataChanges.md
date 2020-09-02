

## Changes to Package ##

### dc: elements ###
  * All of the dc elements from epub 2.0.1 will be reintroduced, but without the specialized attributes. Meta element chaining via @refines will be used instead, giving one consistent mechanism for augmentation.
  * [Guidelines for implementing Dublin Core in XML](http://dublincore.org/documents/dc-xml-guidelines/) will be used as an informative reference for:
    * the dc elements (defined in accordance with _4.1 Abstract model_ of http://dublincore.org/documents/dc-xml-guidelines/)
    * the use of the @refines and @scheme names (see meta element below)
  * Contrary to how the 2.0.1 spec defines the dc elements (listing them all as separate sections), the 3.0 spec will include a general statement that all terms in [DCMES](http://dublincore.org/documents/dces/) are available as repeatable elements. Only elements whose semantics and/or cardinality EPUB specializes will be discussed in detail, namely that:
    * at least one dc:identifier and dc:title are required, but repeatable (unchanged)
    * exactly one dc:language is required, with a value conforming to rfc5646 (unchanged)
    * dc:source replaces publication-source property as a specialized dc:identifier identifying the source (new)
    * dc:type replaces publication-type property for defining specialized publication types like dictionaries, etc. (new)
    * in the absence of an associated role property, a dc:creator element is treated as an author.
    * similar to dc:title, if no means of determining the significance of creators and contributors is provided (e.g., the display-seq property), the order of the elements in the metadata section will determine their display order
    * the specialized dcterms:`*` date properties should be used in preference to dc:date for consistency with the use of dcterms:modified for the package identifier.
  * @prefer is removed. No mechanism for local overrides is provided, as there is no longer a notion of a longer term transition from the dc: element set. There are no restrictions on combinations: for example, if both `<dc:creator>` and `<meta property='dc:creator'>` are included, then the publication has two creators. There is nothing we can do about the fact that there is an infinite amount of vocabularies that can potentially have a term whose semantics are similar to that of dc:creator (`<meta property='foo:author'>` is legal, as long as foo is properly declared). The fact that dc:creator is recognized by the spec should provide sufficient guidance for producers.
  * _The schema update will include a fix for [Issue 154](https://code.google.com/p/epub-revision/issues/detail?id=154)._

### The meta element ###

#### New syntax ####
The new meta element retains its basic syntactical design, with these differences:
  * as suggested by http://dublincore.org/documents/dc-xml-guidelines, @about is renamed to @refines
  * as suggested by http://dublincore.org/documents/dc-xml-guidelines, @datatype is renamed to @scheme, and takes a single value defined and processed/expanded the same way as for @property (see Solution to [Issue 158](https://code.google.com/p/epub-revision/issues/detail?id=158) below). The scheme value can accept xsd datatypes, as they get expanded and resolved in the same way.
    * @scheme is allowed on the new meta element

##### Solution to Issue\_158 #####
This proposal includes the proposed solution to [Issue 158](https://code.google.com/p/epub-revision/issues/detail?id=158), which is to use datatypes to reduce verbosity of meta element chains (where the terminating meta element has the purpose of expressing a datatype).

As per above, the scheme attribute is defined as accepting a single token as its value, this token being processed just as the token in @property. It defines how a processor should interpret the given lexical value (record).

The effect of this change is to reduce the example in [Issue 158](https://code.google.com/p/epub-revision/issues/detail?id=158) to:
```
   <dc:creator" id="creator">Haruki Murakami</dc:creator>
   <meta refines="#creator" property="alternate-script" xml:lang="ja">村上 春樹</meta>
   <meta refines="#creator" property="file-as">Murakami, Haruki</meta>
   <meta refines="#creator" property="role" scheme="marc:relators">aut</meta>
```

(With the possible addition of `<package prefix="marc: http://id.loc.gov/vocabulary/">`, depending on whether we predefine some prefixes for use in scheme. See the question below.)

The title example from the Publications spec would similarly be reduced to:
```
   <dc:title id="title">Norwegian Wood</dc:title>
   <meta refines="#title" property="title-type" scheme="onix:codelist15">01</meta>
```

(With the possible addition of `<package prefix="onix: http://www.editeur.org/ONIX/book/codelists/current.html#">`, depending on whether we predefine some prefixes for use in scheme. See the question below.)

As a part of this change, the scheme property will be removed from the acillary property list. To accommodate identifiers, that formerly used the scheme property directly, a new identifier-type property will be added.

The identifier example from the Publications spec will become:
```
   <dc:identifier id="pub-id">urn:uuid:A1B0D67E-2E81-4DF5-9E67-A64CBE366809</dc:identifier>
   <meta refines="#pub-id" property="identifier-type" scheme="xsd:string">uuid</meta>
```

(With the possible addition of `<package prefix="xsd: http://www.w3.org/2001/XMLSchema#">`, depending on whether we predefine some prefixes for use in scheme. See the question below.)

**TODO question to group**: Should we predefine some prefixes for datatype tokens in the specification? Doing so would allow the omission of @prefix for the most common cases, but was a controversial topic in the metadata subgroup.

The best candidates to predefine would be:
  * onix: http://www.editeur.org/ONIX/book/codelists/current.html# (many properties such as titles, identifiers and subjects can benefit from the onix code lists)
  * marc: http://id.loc.gov/vocabulary/ (for defining creator and contributor roles)
  * xsd: http://www.w3.org/2001/XMLSchema# (for use defining datatypes in the scheme attribute)

(Note that dcterms is already among the predefined prefixes, and includes datatypes too, so we are only extending, not adding anything entirely new.)

##### Examples of new meta element syntax #####
Simple element with one of the predefined prefixes
```
  <meta property="dcterms:modified">2011-01-01T12:00:00Z</meta>
```

Augmentation (chaining) using a property from the default vocab (no prefix):
```
  <dc:title id="title">Norwegian Wood</dc:title>
  <meta refines="#title" property="alternate-script" xml:lang="ja">ノルウェイの森</meta>
```


Augmentation (chaining) using a property not from the default vocab (must declare prefix):
```
<package … prefix="foaf: http://xmlns.com/foaf/spec/">
    <metadata>
        <dc:creator" id="auth">Samuel Johnson</dc:creator>
        <meta property="foaf:title" refines="#auth">Dr.</meta>
        …
    </metadata>
</package>
```

#### 2.x syntax ####
The 2.x meta element syntax will also be allowed for forward compatibility with 2.0 reading systems. The specification will explicitly say that it assigns no semantics to tokens/strings that appear in the name attribute, and that 3.0 Reading Systems must ignore any occurrence of this element. (This is the same as we do with occurrences of NCX.)

` <meta name="foo" content="bar"/> `


### The item element ###
The item element is unchanged from the current 3.0 draft, with the exception of how tokens in @properties are expanded (see vocabulary association below).


### The link element ###
The link element is unchanged from the current 3.0 draft, with the exception of how tokens in @rel are expanded (see vocabulary association below), and the rename of the optional @about to @refines

```
<link rel="xmp-record" href="..." />
<link refines="#meta-authority-01" rel="xml-signature" href="../META-INF/Signatures.xml#MAI-Signature"/>
```


### Vocabulary association and datatype ###
  * @profile is removed, and replaced with normative spec prose that reserves the same prefixes as the [current profile document](http://www.idpf.org/epub/30/profile/package/), with possible additions (marc, onix and xsd) depending on outcome of [Issue 158](https://code.google.com/p/epub-revision/issues/detail?id=158) (see above).
  * @prefix is retained, and uses the same syntax as in RDFa 1.1
  * it remains an error to override the reserved prefixes using the document instance @prefix

Regarding datatype for @property, @scheme and @properties

Since RDFa 1.0 sets the 'default prefix mapping' `to http://www.w3.org/1999/xhtml/vocab#` we cannot use CURIE, so a local definition of a 'property' datatype will be added instead:
```
  prefix      :=   NCName
  term        :=   irelative-ref (as defined in [RFC3987])
  property       :=   [ [ prefix ] ':' ] term
```

The specification prose will require the value of `prefix` to map either to the prefixes reserved by normative spec prose or to an arbitrary prefix defined in @prefix. Like before, the expanded URIs _should_ resolve to human- and/or machine-readable info at the target.

An informative note will point out that this datatype borrows its syntax from W3C CURIEs, including the notion of expanding to a absolute URI, but that the URI expansion mechanism differs.

Note: we do not point to QNames as the backing construct here, as QNames imply a specific (read: `@xmlns`) method for prefix expansion.

## Changes to Media Overlays ##
The vocabulary association mechanism (for use with @epub:type) is changed:
  * @profile is removed, and replaced with normative spec prose that reserves the same prefixes as the [current profile document](http://www.idpf.org/epub/30/profile/content/)
  * @prefix is renamed to @{http://www.idpf.org/2007/ops}prefix; retains semantics as defined for @prefix in Package


## Changes to Content Documents ##
### XHTML ###
The vocabulary association mechanism (for use with @epub:type) is changed:
  * @profile is removed, and replaced with normative spec prose that reserves the same prefixes as the [current profile document](http://www.idpf.org/epub/30/profile/content/)
  * @prefix is renamed to @{http://www.idpf.org/2007/ops}prefix; retains semantics as defined for @prefix in Package

### SVG ###
No changes to SVG, as it does not include @epub:type.