

## Status ##

This is a draft copy and will undergo further editing prior to final status.

Contributors:

Kida Yasuo (Apple, Inc.), Dave Makower (Apple, Inc.), Daniel Hughes (Liguori Publications).

## Summary ##
This proposal defines a method to encode portions of OPS content that represent
lexical or terminological data in a manner suitable for machine processing and
accessible human consumption.

OPS content encoded in this manner are representations of traditional dictionary, glossary, thesaurus, or multilingual references. These representations may occur as fragments of OPS markup, entire OPS documents, and conceptually as entire ePub 3.0 publications.

A separate schema will be published to define the subset of ePub 3 OPS grammar defined
in this proposal, herein referred to as OPS-D.

## Requirements ##
### Requirements met ###
[TD.01 Dictionary Lookup](http://code.google.com/p/epub-revision/wiki/TextContent#TD.01_Dictionary_lookup_(A))

[TD.02 Dictionary Entries](http://code.google.com/p/epub-revision/wiki/TextContent#TD.02_Dictionary_entries_(A))

[TD.03 Headwords and Inflected Forms](http://code.google.com/p/epub-revision/wiki/TextContent#TD.03_Headwords_and_inflected_forms_(A))

[TD.04 Dictionary Metadata](http://code.google.com/p/epub-revision/wiki/TextContent#TD.04_Dictionary_metadata_(A))

[TD.05 Performance and Indexing](http://code.google.com/p/epub-revision/wiki/TextContent#TD.05_Performance_and_indexing_(C))

[TD.06 Glossaries](http://code.google.com/p/epub-revision/wiki/TextContent#TD.06_Glossaries_(A))

[TD.07 Audio Pronunciations](http://code.google.com/p/epub-revision/wiki/TextContent#TD.07_Audio_pronunciations_(E))

### Requirements not met ###
There are no listed requirements that are not met by this proposal.

## Items specifically not addressed in this proposal ##
### Method of indexing entries ###
This proposal **does not** specify a format for an index of OPS-D publication content,
or a method of indexing OPS-D publication content, or a method for lookup & retrieval of OPS-D content from an index. These are implementation specific choices.

NOTE: This proposal **does** specify a method to encode a reasonable amount of data for indexing purposes in OPS-D content so that implementation specific techniques are guaranteed a predictable means to perform indexing on OPS-D content.

### Setting default reference ###
This proposal **does not** specify a method for users to set an OPS-D publication as a default resource, or a method for reading systems to set an OPS-D publication as a default resource. These are implementation specific choices.

NOTE: This proposal **does** specify a method for a publication to declare that it is capable and/or intended to serve as a reading system resource, such as a default reference.

### Multiple references ###
This proposal **does not** specify a method for reading systems to query, compare, or display entries from multiple resources. These are implementation specific choices.

## OCF ##
### Indexing resources in META-INF ###
Resources produced to support indexing should be placed in META-INF. Resources placed in META-INF may be non-manifested items. Resources in META-INF should be named with a reverse DNS prefix and a unique identifier for the resource such as: org.idpf.RESOURCE-ID.

## OPF ##
### Metadata ###
#### Package declaration as OPS-D resource ####
A package that is capable and/or intended to serve as a resource may declare so by means of a publication.type @property with a value of “Dictionary”.

```
<meta property="publication.type">Dictionary</meta>
```

TODO: what if any additional items to include: extended resource description, declaration of default language, or language scheme i.e. FR>EN, or JP-Kanji<>JP-Katakana<>EN-US, etc.

#### OPF manifest item declaration ####
An OPF manifest item may declare availability of resource by means of @property with value of "dictionary".

```
<item id="R" property="dictionary" href="dictionary-r.xhtml" media-type="application/xhtml+xml"/>
```

## OPS ##
### Namespace of OPS-D elements and attributes ###
Certain elements and attributes defined in this proposal are included from the Dictionary Services Markup grammar (Copyright Apple, Inc.), and are prefixed with **d:**.

Additional semantics are introduced as values of the global **ops:type** attribute and are prefixed with **dict:**.

### Elements ###

The following elements are prefixed with **d:**.

**dictionary**: root element that represents a lexical reference

  * attributes: id, name, title, xml:lang
  * child elements: entry (required : occurs 1-N)

**entry**: primary repeating element

  * attributes: id (required), parental control, title (required), xml:lang
  * child elements: index (required : occurs 1-N), OPS-D markup (required : occurs 1-N)

**index**: element to express key values for indexing

  * attributes: anchor, id, parental-control, title (required) value (required), yomi, xml:lang
  * child elements: none

**gi**: expresses a private character for which there is no Unicode representation or is
lacking a glyph. A font containing the character glyph may be specified

  * attributes: name, ps-font-name, set
  * child elements: none

### Attributes ###

The following attributes are prefixed with **d:**.

**@anchor**: highlights a portion of entry text

**@name**: character identifier for glyphs

**@parental-control**: numeric flag to prevent entries from being returned in search results

**@pr**: indicates language or phonetic system of pronunciation

**@priority**: allows fragments of entries to be not displayed or skipped

**@ps-font-name**: the PostScipt name of a font used to display special glyphs

**@set**: a glyph set name; only supported value is ''AdobeJapan1.''

**@title**: text label and primary key for entry & index elements

**@value**: text value of index elements

**@yomi**: used to provide phonetic spellings for ideographic languages, e.g., Hiragana or Katakana hints for Kanji ideograms

### Semantic ops:type values ###

The following enumerated values are prefixed with **dict:**.

**antonym**: a term that has an opposing or contradictory meaning

**audio-pr**: an audio clip to aid pronunciation

**def**: the meaning of a word or phrase

**etym**: the origin or derivative ancestry of a word or phrase

**gender**: expresses feminine, masculine, or neutral qualities of a word or phrase

**part**: the part-of-speech of a word

**syl**: represents the boundary between syllables

**synonym**: a term that has a similar or complimentary meaning

**tense**: the relation to time or occurrence that a word or phrase has

**trans**: used to indicate (transfer) the meaning of a word or phrase in one language to another

**usage**: an example of a word or phrase

### Linking ###
#### Necessary aspects of linking ####
  * A mechanism to declare that a given link should trigger reading system dictionary functionality, if available.

  * A link that does not have a document identifier, but instead is agnostic and refers to a default dictionary resource, if available. Call this an Optimistic link, in that the link is making an optimistic assumption that there is a dictionary resource available, and not concerned with the specific identity of the resource itself.

  * A link that does not contain a path to the target [entry containing a term, phrase, etc.](the.md), but instead contains a value that can be run against an index, which will determine the path to the target. Again, this link is optimistic in that there is an assumption that an entry for a given target will exist. We expect that where possible, reading systems will wish to use an index resource to speed lookup and retrieval, and so this is very similar to passing a value to a search mechanism.

#### Inter-publication linking - TBD as develops ####
TODO: track inter-publication linking

### Schema version ###
ePub 3 OPS-D packages will reference a specific schema

TODO: determine schema reference

### Document type ###
TODO: determine doctype

### Use of xml:lang ###
The xml:lang attribute is used to declare the default language of a resource, or to declare that constituent elements of a resource, including an entry or fragments of an entry are of a language other than the default.

TODO: clarify use of xml:lang

## Conformance ##
### Content Conformance ###
OPS-D content documents **must** provide an index value for each _entry_ contained in a _dictionary_. Documents that contain _entry_ elements without a child _index_ element are **non-conforming**.

### Reading System Conformance ###
#### ePub 3.0 Generic Reading Systems ####
ePub 3 reading systems that follow general conformance requirements defined elsewhere should also support OPS-D.

TODO: Clarify conformance

#### ePub 3.0 Specialized Reading Systems ####
ePub 3 reading systems that are dedicated or specialized for dictionary use are not expected to be fully conforming ePub 3 reading systems, but instead adhere to a subset of conformance requirements.

TODO: Clarify conformance

## Pseudo-code outline ##
```
= dictionary

== entry

=== index

=== markup content

== entry

=== index

=== markup content
```

## Example: OPF Package + OPS-D Content ##

OPF package file
```
<?xml version="1.0"?>
<package version="3.0"
  unique-identifier="package-uuid"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns="http://www.idpf.org/2011/opf"
  profile="http://www.idpf.org/opf-profile/3.0/">  
  <metadata>
    <dc:title>Example Dictionary</dc:title>
    <dc:identifier id="package-uuid">package-uuid-string</dc:identifier>
    <dc:creator>Team Dictionary</dc:creator>
    <dc:language>en</dc:language>
    <meta property="publication.type">Dictionary</meta>
  </metadata>
  <manifest>
    <item id="front" href="front.xhtml" media-type="application/xhtml+xml"/>
    <item id="A" property="dictionary" href="dictionary-a.xhtml" media-type="application/xhtml+xml"/>
    <item id="B" property="dictionary" href="dictionary-b.xhtml" media-type="application/xhtml+xml"/>
    <item id="C" property="dictionary" href="dictionary-c.xhtml" media-type="application/xhtml+xml"/>
    <!-- … -->
    <item id="R" property="dictionary" href="dictionary-r.xhtml" media-type="application/xhtml+xml"/>
    <item id="toc" href="toc.ncx" media-type="application/x-dtbncx+xml"/>
  </manifest>
  <spine toc="ncxtoc">
    <itemref idref="front"/>
    <itemref idref="A"/>
    <itemref idref="B"/>
    <itemref idref="C"/>
    <itemref idref="D"/>
    <!-- …… -->
    <itemref idref="R"/>
      </spine>
</package>
```
OPS-D content file
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng"
  profile="http://www.idpf.org/opf-profile/3.0/" xml:lang="en-US">
 <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
   <title>R</title>
 </head>
 <body>
  <style>
   h1.headword { display: inline }
   .praud { display: block }
   h2 { font-variant: small-caps }
   ol { font-weight: bold }
   ol span { font-weight: normal }
   .part { font-style: italic }
   .althwref { font-weight: bold }
   .usage { font-style: italic }
   .prgroup { font-family: monospace }
   .defannot { font-family: sans-serif }
   .foreign { font-weight: bold; font-style: italic }
   .subheadword { font-weight: bold }
   .copyright { margin-top: 2em; font-style: italic; font-size: small }
  </style>
    <d:dictionary>
      <d:entry id="hw_resource" d:title="resource" class="entry">
        <d:index d:value="resource" d:title="resource"/>
        <d:index d:value="resources" d:title="resources"/>
        <d:index d:value="resourced" d:title="resourced"/>
        <d:index d:value="resourcing" d:title="resourcing"/>
        <d:index d:value="resourcelessness" d:title="resourcelessness" d:anchor="#shw_resourcelessness"/>
        <d:index d:value="resourceless" d:title="resourceless" d:anchor="#shw_resourceless"/>
        <div d:priority="1">
          <h1 class="headword">resource</h1>
          <span class="prgroup" d:priority="2">| <span d:pr="US" class="pr">&#x2C8;r&#x113;&#x2CC;s&#xF4;rs</span>
            <span class="sep">;</span>
            <span d:pr="US" class="pr">&#x2C8;r&#x113;&#x2C8;z&#xF4;rs</span>
            <span class="sep">;</span>
            <span d:pr="US" class="pr">ri&#x2C8;s&#xF4;rs</span>
            <span class="sep">;</span>
            <span d:pr="US" class="pr">ri&#x2C8;z&#xF4;rs</span>
            <span class="sep">;</span>
            <span d:pr="US_IPA" class="pr">&#x2C8;ri&#x2CC;s&#x254;rs</span>
            <span class="sep">;</span>
            <span d:pr="US_IPA" class="pr">r&#x259;&#x2C8;s&#x254;rs</span> | <span class="praud">
              <audio d:pr="US" controls="controls" src="audio/pronunciation/resource_US.m4a">Text here for systems that do not support
                audio.</audio>
            </span>
          </span>
          <div id="resource_sense_1" d:priority="1">
            <div ops:type="dict:part" class="part" d:priority="2">noun</div>
            <div>
              <ol>
                <li ops:type="dict:def">
                  <span class="def">(usu. <span class="althwref">resources</span>) a stock or supply of money, materials, staff, and other
                    assets that can be drawn on by a person or organization in order to function effectively: <span ops:type="dict:usage"
                      class="usage" d:priority="2">local authorities complained that they lacked resources.</span>
                  </span>
                  <ul>
                    <li>
                      <span class="def">(<span class="althwref">resources</span>) a country's collective means of supporting itself or
                        becoming wealthier, as represented by its reserves of minerals, land, and other assets.</span>
                    </li>
                    <li>
                      <span class="def">(<span class="althwref">resources</span>) available assets.</span>
                    </li>
                  </ul>
                </li>
                <li ops:type="dict:def">
                  <span class="def">an action or strategy that may be adopted in adverse circumstances: <span ops:type="dict:usage"
                      class="usage">sometimes anger is the only resource left in a situation like this.</span></span>
                  <ul>
                    <li>
                      <span class="def">(<span class="althwref">resources</span>) one's personal attributes and capabilities regarded as
                        able to help or sustain one in adverse circumstances: <span ops:type="dict:usage" class="usage" d:priority="2">we
                        had been left very much to our own resources.</span>
                      </span>
                    </li>
                    <li>
                      <span class="def">the ability to find quick and clever ways to overcome difficulties: <span ops:type="dict:usage"
                          class="usage" d:priority="2">a man of resource.</span></span>
                    </li>
                    <li>
                      <span class="def">a teaching aid.</span>
                    </li>
                    <li>
                      <span class="def">(<span class="defannot" d:priority="2">archaic</span>) the possibility of aid or assistance: <span
                          ops:type="dict:usage" class="usage" d:priority="2">the flower of the French army was lost without
                          resource.</span>
                      </span>
                    </li>
                  </ul>
                </li>
                <li>
                  <span class="def">(<span class="defannot">archaic</span>) a leisure occupation.</span>
                </li>
              </ol>
            </div>
          </div>
          <div id="resource_sense_2" d:priority="1">
            <div ops:type="dict:part" class="part">verb [ trans. ]</div>
            <div ops:type="dict:def">
              <span class="def">provide (a person or organization) with materials, money, staff, and other assets necessary for effective
                operation: <span ops:type="dict:usage" class="usage">ensuring that primary health care workers are adequately
                  resourced.</span>
              </span>
            </div>
          </div>
          <div d:priority="2">
            <h2>Synonyms</h2>
            <ul>
              <li>
                <span class="syn">
                  <a ops:type="dict:synonym" href="./dictionary-a.html#asset">asset</a>
                </span>
              </li>
            </ul>
          </div>
          <div d:priority="2">
            <h2>Derivatives</h2>
            <ul>
              <li id="shw_resourceless">
                <span class="subheadword">resourceless</span>
                <span ops:type="dict:part" class="part">adjective</span>
              </li>
              <li id="shw_resourcelessness">
                <span class="subheadword">resourcelessness</span>
                <span ops:type="dict:part" class="part">noun</span>
              </li>
            </ul>
          </div>
          <div d:priority="2">
            <h2>Origin</h2>
            <div ops:type="dict:etym">early 17th cent.: from obsolete French <span class="foreign" xml:lang="fr">ressourse</span>, feminine
              past participle (used as a noun) of Old French dialect <span class="foreign" xml:lang="fr">resourdre</span> ‘rise again,
              recover’ (based on Latin <span class="foreign" xml:lang="la">surgere</span> ‘to rise’ ).</div>
          </div>
        </div>
      </d:entry>
    </d:dictionary>
    <div class="copyright">The text of this dictionary entry is exemplary content from the Apple Dictionary application built into Mac OS X.
      Copyright of the text in this dictionary entry remains the property of the copyright holder.</div>
  </body>
</html>
```

## Example Resource Types ##

### Glossary ###
```
<d:dictionary id="idpf-glossary">  
  <d:entry id="idpf-g-1" d:title="Extended Module">
  <d:index d:value="Extended Module" d:title="Extended Module"/> 
  <h1>Extended Module</h1> 
  <span ops:type="dict:def">   
    <p>A module of a modularized XML vocabulary (i.e. a set of named modules is defined
 in its specification) that is not mandated to be supported by its specification (e.g. the XHTML ruby or forms modules in the OPS context).</p>   
  </span>  
  </d:entry>  
  <d:entry id="idpf-g-2" d:title="Inline XML Island">
    <d:index d:value="Inline XML Island" d:title="Inline XML Island"/>   
    <span ops:type="dict:def">      
      <p>An inline XML Island is an XML document fragment using a non-Preferred
Vocabulary or using an Extended Module that exists within an XHTML Preferred Vocabulary document within an OPS Publication.</p>     
    </span>    
  </d:entry>  
  <d:entry id="idpf-g-3" d:title="NCX">
    <d:index d:value="NCX" d:title="NCX"/>
    <span ops:type="dict:def">
      <p>A declarative global navigation definition (the Navigation Center eXtended or NCX).</p>
    </span>
  </d:entry>  
  <d:entry id="idpf-g-4" d:title="OCF">
    <d:index d:value="OCF " d:title="OCF "/>
    <span ops:type="dict:def">
     <p>The Open Container Format defines a mechanism by which all components of an OPS
Publication can be combined into a single file-system entity. OCF is defined by the OCF Specification.</p>
    </span>    
  </d:entry>  
</d:dictionary>
```

### Thesaurus ###
```

<d:dictionary id="idpf-thesaurus">
 <d:entry id="idpf-t-1" d:title="Publication">
  <d:index d:value="publication" d:title="publication"/>
  <h1>Publication</h1>
   <ul>
    <li><span ops:type="dict:synonym"><a href="#book">book</a></span></li>
   </ul>
   <ul>
    <li><span ops:type="dict:synonym"><a href="#magazine">magazine</a></span></li>
   </ul>
   <ul>
    <li><span ops:type="dict:synonym"><a href="#journal">journal</a></span></li>
   </ul>
  </d:entry>
<d:dictionary>
```

### Multilingual Reference ###
```
<d:dictionary id="idpf-multilingual">
 <d:entry d:value="book" d:index="Book">
  <d:index d:value="book " d:title="book"/>  
  <h1>Book</h1>
  <span ops:type="dict:def">
   <p>a written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.</p>
  </span>
  <h2>Spanish</h2>
   <ul>
    <li><span xml:lang="sp" ops:type="trans"><a href="#libro">Libro</a></span></li>
   </ul>
  <h2>French</h2>
   <ul>
    <li><span xml:lang="fr" ops:type="trans"><a href="#livre">Livre</a></span></li>
   </ul>
 </d:entry>
</d:dictionary>
```