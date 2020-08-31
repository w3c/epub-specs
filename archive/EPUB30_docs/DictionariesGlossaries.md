This page contains samples and implementation proposals for [TextContent#Dictionaries/glossaries](TextContent#Dictionaries/glossaries.md)



## Use Cases ##

### Accessibility ###

  * Screen reader conveys semantic context of entry data that is traditionally expressed through styling or layout such as part-of-speech etc.
  * User plays audio clip of pronunciation
> _comment_: In addition to the audio clip, an example of a word or phrase could also be pronounced by TTS engine

### User ###
  * User reads as a normal ebook
  * User searches for specific term entry
  * User searches for term in usage examples
  * User selects default dictionary, thesaurus, etc.
  * Users sets default level of detail returned/displayed from resource entries.
  * User cites reference from specific resource.
  * User annotates publication with citation from specific resource.

### Publication ###
  * Publication contains embedded glossary, dictionary etc.
  * Publication is standalone reference, dictionary, thesaurus etc.
  * Publication is part of series or collection.
  * Publication cites specific ebook resource.

### User Agent / Reading System ###
  * UA displays reference based on user interaction
  * UA display information not based on user interaction
    * e.g. some type of sidebar or help panel
  * UA parses dictionary/glossary info embedded in non-resource publication and provides alternate access or navigation.

## Necessary Lexical/Terminological Concepts ##
Concepts followed by '+' are baseline minimum required for basic functionality.

### Glossaries ###

  * Lexicographical
    * Lemma (Headword) +
    * Ontologies
    * Taxonomies
  * Semantic
    * Meaning +
    * Sense
    * Inflection
    * Equivalence


### Dictionaries ###
  * Lexicographical
    * Lemma (Headword) +
    * Ontologies
    * Taxonomies
  * Syntax/Grammar
    * Function or Part-of-Speech +
    * Phrasing
    * Voice
    * Tense +
    * Gender +
  * Semantic
    * Meaning +
    * Sense
    * Inflection
    * Equivalence
  * Morphological
    * Etymology or derivation
    * Loanword status
    * Phonetics or pronunciation +

### Translation Dictionaries ###
  * Lexicographical
    * Lemma (Headword) +
    * Ontologies
    * Taxonomies
  * Syntax/Grammar
    * Function or Part-of-Speech +
    * Phrasing
    * Voice
    * Tense +
    * Gender +
  * Semantic
    * Meaning
    * Sense
    * Inflection
    * Equivalence
  * Morphological
    * Etymology or derivation
    * Loanword status
    * Phonetics or pronunciation +

### Thesauri ###
  * Lexicographical
    * Lemma (Headword) +
    * Ontologies
    * Taxonomies
  * Syntax/Grammar
    * Function or Part-of-Speech +
    * Tense
    * Gender
  * Semantic
    * Meaning
    * Sense
    * Inflection
    * Equivalence +
      * synonym +
      * antonym +
      * meronym
      * holonym
      * hyponym
      * hypernym

## Indexing Issues ##

Indexing method _should not_ be specified in 3.0, however spec _should_ recommend that any resource used for indexing be placed into META-INF.
  * Resources placed in META-INF may be unmanifested.
  * Resources should be named with a leading reverse DNS qualifier e.g. org.idpf.resource.XXX

## Package declaration ##

A publication can declare that it is a standalone dictionary resource using the following syntax [[1](ImplementationProposalsMetadata#EPUB_publication_nature_specification.md)]:

```
   <meta property="publication.type">Dictionary</meta>
```

## Sample: Standalone TEI ##

```
<?xml version="1.0" encoding="UTF-8"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <teiHeader/>
  <text>
    <body>
      <!-- basic repeating element -->
      <entry n="1001">
        
        <form>
          <!-- headword / main term -->
          <orth>book</orth>
        </form>
        
        <gramGrp>
          <!-- part of speech -->
          <pos>n</pos>
        </gramGrp>
        
        <sense>
          <!-- definition -->
          <def>a written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within
          covers.</def>
          
          <!-- transference to foreign language -->
          <cit type="translation" xml:lang="fr">
            <quote>livre</quote>
          </cit>
          
          <cit type="translation" xml:lang="sp">
            <quote>libros</quote>
          </cit>
          
         <!-- synonym --> 
         <usg type="syn">tome</usg>
        </sense>

      </entry>

    </body>
  </text>
</TEI>
```

## Sample: XHTML+TEI compound document ##
todo: comments _-dan_
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html
 PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:ops="http://www.idpf.org/2011/ops" xmlns:tei="http://www.tei-c.org/ns/1.0">
<head>
 <title>OPS Spec</title>
</head>
<body>
 <h1>Glossary of OPS Terms</h1>

    <ops:switch id="if-tei">

      <ops:case required-namespace="http://www.tei-c.org/ns/1.0">
        <tei:entry n="1001">
          <tei:form>
            <tei:orth>Content Publisher</tei:orth>
          </tei:form>
          <tei:sense>
            <tei:def>A publisher, author, or other information provider who provides a publication to one or more Reading Systems in the form
              described in this specification.</tei:def>
            <tei:usg type="dom">OPSGlossary</tei:usg>
          </tei:sense>
        </tei:entry>

        <tei:entry n="1002">
          <tei:form>
            <tei:orth>Deprecated</tei:orth>
          </tei:form>
          <tei:sense>
            <def>A feature that is permitted, but not recommended, by this specification. Such features might be removed in future
              revisions. Conformant Reading Systems must support deprecated features.</def>
            <tei:usg type="dom">OPSGlossary</tei:usg>
          </tei:sense>
        </tei:entry>

      </ops:case>

      <ops:default>
        <h3 class="headword">Content Provider</h3>
        <p class="definition">A publisher, author, or other information provider who provides a publication to one or more Reading Systems
          in the form described in this specification.</p>
        <h3 class="headword">Deprecated</h3>
        <p class="definition">A feature that is permitted, but not recommended, by this specification. Such features might be removed in
          future revisions. Conformant Reading Systems must support deprecated features.</p>
      </ops:default>

    </ops:switch>

  </body>
</html>
```

## Sample: Standalone OLIF ##
```
<?xml version="1.0" encoding="UTF-8"?>
<olif xmlns="http://www.idpf.org/2011/olifns" OlifVersion="2.0">
<header>
<body>

<!--  basic repeating element -->
<entry EntryUserId="1001" conceptUserID="9001">
	
<!--  required module of parent 'entry' -->
<mono MonoUserId="1002">
		
	<!-- required block of parent 'mono' -->
	<keyDC>		
                <!-- canonical form of the main term -->
                <canForm>book</canForm>

		<!-- language -->
                <language>en</language>

		<!-- part of speech -->
                <ptOfSpeech>noun</ptOfSpeech>

		<!-- suggested list, extensible -->
                <subjField>general</subjField> 

		<!-- identifier to disambiguate terms where the above fields are identical -->
                <semReading>01</semReading>  
	</keyDC>
				
	<!-- optional block of parent 'mono' -->
	<monoDC>
		<monoAdmin>
			<originator>IDPF</originator>
		</monoAdmin>
		<monoMorph>
			<inflection>like: book, books, booked, booking</inflection>
		</monoMorph>
		<monoSem>
			<definition>a written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.</definition>
			<semType>cnc</semType>
		</monoSem>
	</monoDC>					
</mono>
				
<!-- optional repeating modules of parent <entry>:
     <crossRefer> is a reference within the same language 
     <transfer> is a reference to a term in another language -->
			

<!-- indicates relationship to word 'tome'; denotes book is a synonym of tome -->
<crossRefer>
	<keyDC>
		<canForm>tome</canForm>
		<language>en</language>
		<ptOfSpeech>noun</ptOfSpeech>
		<subjField>general</subjField>
		<semReading>18</semReading>
	</keyDC>
	<crLinkType>synonym</crLinkType>
</crossRefer>

<!-- indicates relationship to word 'page'; denotes book has a subordinate part of page
     This cross reference uses a compact syntax via @CrTarget -->
<crossRefer CrTarget="1010">
	<crLinkType>has-meronym</crLinkType>
</crossRefer>

<!-- indicates equivalence transfer from English 'book' to French 'livre' and Spanish 'libros' -->
<transfer>
	<keyDC>
		<canForm>livre</canForm>
		<language>fr</language>
		<ptOfSpeech>noun</ptOfSpeech>
		<subjField>general</subjField>
		<semReading>001</semReading>
	</keyDC>

       <!-- degree of equivalence -->
       <equival>Full</equival>
</transfer>
<transfer>
	<keyDC>
		<canForm>libros</canForm>
		<language>sp</language>
		<ptOfSpeech>noun</ptOfSpeech>
		<subjField>general</subjField>
		<semReading>001</semReading>
	</keyDC>
</transfer>

<!-- indicates equivalence transfer from English 'book' to Swedish 'bok'
     uses compact form via @TrTarget -->
<transfer TrTarget="2020">
        <equival>Full</equival>
</transfer>

</entry>
</body>
</header>
</olif>

```

## Sample: XHTML+OLIF compound document ##
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html
 PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:ops="http://www.idpf.org/2011/ops" xmlns:olif="http://www.idpf.org/2011/olifns">
  <head>
    <title>OPS Spec</title>
  </head>
  <body>
    <h1>Glossary of OPS Terms</h1>

    <ops:switch id="if-olif">

      <ops:case required-namespace="http://www.idpf.org/2011/olifns">

        <olif:entry conceptUserID="OPSGlossary">
          <olif:mono MonoUserID="001">
            <olif:keyDC>
              <olif:canForm>Content Provider</olif:canForm>
              <olif:language>en</olif:language>
              <olif:ptOfSpeech>noun</olif:ptOfSpeech>
              <olif:subjField>general</olif:subjField>
              <olif:semReading/>
            </olif:keyDC>
            <olif:monoDC>
              <olif:monoSem>
                <olif:definition>A publisher, author, or other information provider who provides a publication to one or more Reading
                  Systems in the form described in this specification.</olif:definition>
              </olif:monoSem>
            </olif:monoDC>
          </olif:mono>
        </olif:entry>

        <olif:entry conceptUserID="OPSGlossary">
          <olif:mono MonoUserID="002">
            <olif:keyDC>
              <olif:canForm>Deprecated</olif:canForm>
              <olif:language>en</olif:language>
              <olif:ptOfSpeech>adj</olif:ptOfSpeech>
              <olif:subjField>general</olif:subjField>
              <olif:semReading/>
            </olif:keyDC>
            <olif:monoDC>
              <olif:monoSem>
                <olif:definition>A feature that is permitted, but not recommended, by this specification. Such features might be removed in
                  future revisions. Conformant Reading Systems must support deprecated features.</olif:definition>
              </olif:monoSem>
            </olif:monoDC>
          </olif:mono>
        </olif:entry>

      </ops:case>

      <ops:default>

        <h3 class="headword">Content Provider</h3>
        <p class="definition">A publisher, author, or other information provider who provides a publication to one or more Reading Systems
          in the form described in this specification.</p>
        <h3 class="headword">Deprecated</h3>
        <p class="definition">A feature that is permitted, but not recommended, by this specification. Such features might be removed in
          future revisions. Conformant Reading Systems must support deprecated features.</p>

      </ops:default>

    </ops:switch>
    
    
  </body>
</html>
```

## Sample: Apple Dictionary Services Markup ##

### Example of Existing 1.0 Dictionary Services ###
```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:ops="http://www.idpf.org/2011/ops"
      xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng">

<head>

 <title>Dictionary Example</title>

</head>

<body>

 <h1>Dictionary Entry</h1>

<d:dictionary>

 <d:entry id="1" d:title="book">

  <d:index d:value="booked"/>

  <d:index d:value="booking"/>

   <div d:priority="1">

    <h1>book</h1>

   </div>

     <span d:pr="US">book</span>

   <div>

    <ol>

     <li>a written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.</li>

    </ol>

   </div>

   <div d:parental-control="1" d:priority="2">

    <h3>PHRASES</h3>

    <p id="2"><b>wrote the book</b> : to have established or defined a common practice</p>

   </div>

 </d:entry>

</d:dictionary>

</body>

</html>
```

### Proposed Semantic Extensions ###
This table shows proposed extensions to the Apple Dictionary format.

| **Lexical Concept** | **Element or Attr** | **New** |
|:--------------------|:--------------------|:--------|
| Root | dictionary | N |
| Entry | entry | N |
| Inflections, Variants | index | N |
| Term | @title | N |
| Language | @pr | N |
| Meaning | @def | Y |
| Part of Speech | @part | Y |
| Gender | @gen | Y |
| Pronunciation | @pr | N |
| Audio Clip | @audio-pr | Y |
| ~~Syllable Boundaries~~ | ~~syl~~ | ~~Y~~ |
| Tense | @tense | Y |
| Antonym | @has-ant | Y |
| Synonnym | @has-syn | Y |
| Usage | @usage | Y |
| Etymology | @etym | Y |
| Yomi | @yomi | N |


### Example w/ Proposed extensions ###

Using ops:type to express proposed extensions

```
<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" 
      xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng" 
      xmlns:ops="http://www.idpf.org/2011/ops"
      xml:lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>R</title>
</head>
<body>
<style>
h1.headword {
    display: inline
}

.praud {
    display: block
}

h2 {
    font-variant: small-caps
}

ol {
    font-weight: bold
}

ol span {
    font-weight: normal
}

.part {
    font-style: italic
}

.althwref {
    font-weight: bold
}

.usage {
    font-style: italic
}

.prgroup {
    font-family: monospace
}

.defannot {
    font-family: sans-serif
}

.foreign {
    font-weight: bold;
    font-style: italic
}

.subheadword {
    font-weight: bold
}

.copyright {
    margin-top: 2em;
    font-style: italic;
    font-size: small
}

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
            <span class="prgroup" d:priority="2">|
                <span d:pr="US" class="pr">&#x2C8;r&#x113;&#x2CC;s&#xF4;rs</span>
                <span class="sep">;</span>
                <span d:pr="US" class="pr">&#x2C8;r&#x113;&#x2C8;z&#xF4;rs</span>
                <span class="sep">;</span>
                <span d:pr="US" class="pr">ri&#x2C8;s&#xF4;rs</span>
                <span class="sep">;</span>
                <span d:pr="US" class="pr">ri&#x2C8;z&#xF4;rs</span>
                <span class="sep">;</span>
                <span d:pr="US_IPA" class="pr">&#x2C8;ri&#x2CC;s&#x254;rs</span>
                <span class="sep">;</span>
                <span d:pr="US_IPA" class="pr">r&#x259;&#x2C8;s&#x254;rs</span> |
                <span class="praud">
                    <audio d:pr="US" controls="controls" src="audio/pronunciation/resource_US.m4a">Text here for systems that do not support audio.</audio>
                </span>
            </span>
            <div id="resource_sense_1" d:priority="1">
                <div ops:type="dict:part" class="part" d:priority="2">noun</div>
                <div>
                    <ol>
                        <li ops:type="dict:def"><span class="def">(usu. <span class="althwref">resources</span>) a stock or supply of money, materials, 
                            staff, and other assets that can be drawn on by a person or 
                            organization in order to function effectively:
                            <span ops:type="dict:usage" class="usage" d:priority="2">local authorities complained that they lacked resources.</span>
                            </span>
                            <ul>
                                <li><span class="def">(<span class="althwref">resources</span>) a country's collective means of supporting itself or 
                                    becoming wealthier, as represented by its reserves of minerals, land, 
                                    and other assets.</span></li>
                                <li><span class="def">(<span class="althwref">resources</span>) available assets.</span></li>
                            </ul>
                        </li>
                        <li ops:type="dict:def"><span class="def">an action or strategy that may be adopted in adverse circumstances: 
                            <span ops:type="dict:usage" class="usage">sometimes anger is the only resource left in a situation like this.</span></span>
                            <ul>
                                <li><span class="def">(<span class="althwref">resources</span>) one's personal attributes and capabilities regarded as able to help or sustain 
                                    one in adverse circumstances: 
                                    <span ops:type="dict:usage" class="usage" d:priority="2">we had been left very much to our own resources.</span></span></li>
                                <li><span class="def">the ability to find quick and clever ways to overcome difficulties: 
                                    <span ops:type="dict:usage" class="usage" d:priority="2">a man of resource.</span></span></li>
                                <li><span class="def">a teaching aid.</span></li>
                                <li><span class="def">(<span class="defannot" d:priority="2">archaic</span>) the possibility of aid or assistance:
                                    <span ops:type="dict:usage" class="usage" d:priority="2">the flower of the French army was lost without resource.</span></span>
                                </li>
                            </ul>
                        </li>
                        <li><span class="def">(<span class="defannot">archaic</span>) a leisure occupation.</span></li>
                    </ol>
                </div>
            </div>
            <div id="resource_sense_2" d:priority="1">
                <div ops:type="dict:part" class="part">verb [ trans. ]</div>
                <div ops:type="dict:def"><span class="def">provide (a person or organization) with materials, money, staff, 
                    and other assets necessary for effective operation:
                    <span ops:type="dict:usage" class="usage">ensuring that primary health care workers are adequately resourced.</span></span></div>
            </div>
            
            <div d:priority="2">
                <h2>Synonyms</h2>
                <ul>
                    <li><span class="syn"><a ops:type="dict:synonym" href="./dictionary-a.html#asset">asset</a></span></li>
                </ul>
            </div>
            
            <div d:priority="2">
                <h2>Derivatives</h2>
                <ul>
                    <li id="shw_resourceless"><span class="subheadword">resourceless</span> <span ops:type="dict:part" class="part">adjective</span></li>
                    <li id="shw_resourcelessness"><span class="subheadword">resourcelessness</span> <span ops:type="dict:part" class="part">noun</span></li>
                </ul>
            </div>
            
            <div d:priority="2">
                <h2>Origin</h2>
                <div ops:type="dict:etym">early 17th cent.: from obsolete French <span class="foreign" xml:lang="fr">ressourse</span>, feminine past participle 
                    (used as a noun) of Old French dialect <span class="foreign" xml:lang="fr">resourdre</span> ‘rise again, recover’ 
                    (based on Latin <span class="foreign" xml:lang="la">surgere</span> ‘to rise’ ).</div>
            </div>
        </div>
    </d:entry>
</d:dictionary>
                <div class="copyright">The text of this dictionary entry is exemplary content from the Apple Dictionary application built into Mac OS X.
                     Copyright of the text in this dictionary entry remains the property of the copyright holder.</div>
</body>
</html>
```



### RNG Schemas for Apple Dictionary ###

These seem to be the relevant parts of the RNG schemas for the above example.  I _hope_ these are okay to post, as they were sitting without copyright on my Mac.

**AppleDictionarySchema.rng**

```
<!-- Dictionary Schema + XHTML Strict -->

<grammar ns="http://www.w3.org/1999/xhtml"
         xmlns="http://relaxng.org/ns/structure/1.0">

<include href="http://thaiopensource.com/relaxng/xhtml/modules/datatypes.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/attribs.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/text.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/hypertext.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/list.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/image.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/ssismap.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/base.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/link.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/meta.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/param.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/object.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/bdo.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/pres.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/edit.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/applet.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/form.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/style.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/script.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/table.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/csismap.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/events.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/inlstyle.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/target.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/iframe.rng"/>
<include href="http://thaiopensource.com/relaxng/xhtml/modules/nameident.rng"/>
<include href="modules/dict-struct.rng"/>

</grammar>
```

**modules/dict-struct.rng**

```
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Dictionary Structure Module -->
<grammar xmlns="http://relaxng.org/ns/structure/1.0">


<start>
	<ref name="dictionary"/>
</start>

<define name="entry">
	<element name="entry" ns="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
		<ref name="entry.attlist"/>
		<zeroOrMore>
			<ref name="index"/>
		</zeroOrMore>
		<ref name="Flow.model"/>
	</element>
</define>

<define name="entry.attlist">
	<ref name="id.attrib"/>
	<optional>
		<ref name="parental-control.attrib"/>
	</optional>
	<optional>
		<attribute name="title" ns="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
			<text/>
		</attribute>
	</optional>
</define>

<define name="index">
	<element name="index" ns="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
		<ref name="index.attlist"/>
	</element>
</define>

<define name="index.attlist">
	<attribute name="value" ns="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
		<text/>
	</attribute>
	<optional>
		<attribute name="title" ns="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
			<text/>
		</attribute>
	</optional>
	<optional>
		<ref name="parental-control.attrib"/>
	</optional>
	<optional>
		<ref name="priority.attrib"/>
	</optional>
	<optional>
		<attribute name="anchor" ns="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
			<text/>
		</attribute>
	</optional>
	<optional>
		<attribute name="yomi" ns="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
			<text/>
		</attribute>
	</optional>

</define>

<define name="dictionary">
	<element name="dictionary" ns="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
		<zeroOrMore>
			<ref name="style"/>
		</zeroOrMore>
		<ref name="dictionary.attlist"/>
		<oneOrMore>
			<ref name="entry"/>
		</oneOrMore>
	</element>
</define>

<define name="dictionary.attlist">
	<ref name="XHTML.version.attrib"/>
	<ref name="I18n.attrib"/>
</define>

<define name="XHTML.version.attrib">
	<optional>
		<attribute name="version">
			<ref name="FPI.datatype"/>
		</attribute>
	</optional>
</define>

<!-- add new attribute for div,span -->
<define name="priority.attrib">
	<attribute name="priority" ns="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
		<ref name="Number.datatype"/>
	</attribute>
</define>

<define name="parental-control.attrib">
	<attribute name="parental-control" ns="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
		<value>1</value>
	</attribute>
</define>

<define name="pr.attrib">
	<attribute name="pr" ns="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
		<text/>
	</attribute>
</define>


<!-- Add attribute for XHTML -->

<define name="div.attlist" combine="interleave">
	<optional>
		<ref name="priority.attrib"/>
	</optional>
	<optional>
		<ref name="parental-control.attrib"/>
	</optional>
	<optional>
		<ref name="pr.attrib"/>
	</optional>
</define>

<define name="span.attlist" combine="interleave">
	<optional>
		<ref name="priority.attrib"/>
	</optional>
	<optional>
		<ref name="parental-control.attrib"/>
	</optional>
	<optional>
		<ref name="pr.attrib"/>
	</optional>
</define>


</grammar>
```