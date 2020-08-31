# Charter Proposal - Dictionaries and Glossaries #




## Status of this proposal ##
This charter proposal has been [accepted by vote of the IDPF membership as of 1/31/2012](http://idpf.org/news/dictionary-indexes-working-groups-formed) and a Working Group formed.  Please see the [Dictionaries Working Group Main Page](http://code.google.com/p/epub-revision/wiki/DictionariesMainPage) for current activity on this project. **The final charter document is available at http://idpf.org/charters/2012/dictionaries/**.

## Need for this proposal ##
Dictionaries, glossaries, thesauri, and similar works are ubiquitous published resources that users expect to have available in the EPUB3 ecosystem. The primary use of a dictionary or glossary from a user point of view is the ability to search for a term and quickly retrieve its definition or translation. Currently, EPUB has no mechanism for an author to mark up the needed semantic information to enable such reading system search features, making it impossible to publish a dictionary in EPUB that serves its primary purpose. While EPUB-based reading systems often bundle dictionaries with devices and offer a word lookup feature, this is achieved by storing the dictionary in a proprietary format and essentially treating it as part of the reading system software, rather than an independent publication.

The current situation does not allow users to choose the dictionary content that best suits their needs, and instead limits them to using a single bundled dictionary. Publishers of EPUB3 content wish to make a broad range of reference resources available to users and to serve needs that cannot be met by a general monolingual dictionary typically bundled with a reading system: children need dictionaries designed for their reading level, language learners need dictionaries that translate from a foreign language to their native tongue, and users reading material in fields such as medicine and law need dictionaries covering a broad specialized vocabulary. Publishers also wish to offer users the ability to look up words in a publication's glossary while reading, thereby enhancing the user's experience of educational and other types of content.

Reading system developers wish to utilize and innovate around these types of publications.

This proposal describes the scope, required functionality, and timeline to deliver a standard for producing EPUB3 Publications that meet the use cases that are also included in this proposal.


## Scope ##
### In-scope (Deliverables) ###
The scope of this project is to define a declarative mechanism for the representation of [dictionaries](#dict.md) and [glossaries](#glossary.md) in EPUB Publications sufficient to enable development of reading system features specific to these publication types. As further detailed in [Use Cases](#Use_Cases.md) and [Needed Publication Properties](#Needed_Publication_Properties.md) below, the delivered mechanism shall have the following top-level functional properties:
  * Allow publishers to embed a glossary in a publication, and allow users to [look up](#lookup.md) terms in the glossary local to that publication
  * Allow publishers to make a wide range of monolingual dictionaries, bilingual dictionaries, and thesauri available to consumers
  * Allow users to search for [headwords](#headword.md) by [entering text in a search field](#text_entry_search.md) while accessing the dictionary publication
  * Allow users to select the dictionaries that will be their [preferred resources](#preferred_resource.md) for [lookup](#lookup.md) of unfamiliar words while reading
  * Allow users to select text for [lookup](#lookup.md) while reading, and to obtain results from their [preferred resources](#preferred_resource.md) that are appropriate to the language context of the text selected
  * Allow publication authors mechanisms to provide all semantic information necessary for reading system support of these features
  * Allow reading system developers to innovate around methods for users to set their [preferred resources](#preferred_resource.md) for dictionary [lookup](#lookup.md) (eg, by reading level, by language, preference ordering, etc.)

### Out of Scope ###
  * Low-level, system oriented functionality for fast lookup and retrieval, typically described in terms of a database-like index.
  * Development of a full-fledged authoring language for dictionaries.

### Integration Constraints ###
The defined mechanism shall integrate with EPUB 3 as follows:
  * _Graceful fallback_: it must allow EPUB 3 Reading Systems to open and reasonably render Publications containing the mechanism, even if the Reading System has not been updated to explicitly support the mechanism.
  * _Native grammars and extension points_: it must utilize EPUB 3 Content Document grammars to the maximum extent possible, and it must only use extension points defined within EPUB 3 and XHTML 5.
  * _Shallow implementation_: Reading System implementation of the mechanism must not require changes to underlying (browser-based or other) XHTML rendering engines; full implementations must be possible on the Reading System level alone.

## Timeline and Participation ##

Project participation is open to IDPF members and invited experts. _(Note that invited expert status needs to be renewed for each IDPF project.)_

The project charter spans one year in total. Once formed, the working group will decide on feature prioritization and possibly also versioning strategies, after which the milestones below can be dated.

| Draft Charter Proposal to WG for review | December 2, 2011 |
|:----------------------------------------|:-----------------|
| Submission to Membership for Approval | January 6, 2012 |
| WG creation, formal project start | January 23, 2012 |
| WG Face-to-face | Feb timeframe _TBD_ |
| First WG Draft | _TBD_ |
| Second WG Draft | _TBD_ |
| Proposed Specification | _TBD_ |
| Recommended Specification | _TBD_  |
| Maintenance/Tutorials | Through Jan 2013  |

This project is intended to be run concurrently with the project on [indexes](IndexesCharterProposal.md), and so shares the the charter span with that project.


## Working Group Leads ##
Suggested Leads of this working group are:
  * Jeff Alexander, Intangible Press (Co-Chair)
  * Daniel Hughes, Liguori Publications (Co-Chair)



## Use Cases ##
_Actors: publishers, users_
  * A user opens and interacts with a dictionary publication as they would any other EPUB3 publication.
  * A user selects text in a publication and performs a [lookup](#lookup.md) on that text, expecting to access [entry](#entry.md) content in the same language as the selected text.
  * A user selects text in a publication and performs a [lookup](#lookup.md) on that text, expecting to access bilingual [entry](#entry.md) content offering translations of the selected text into another language.
  * A user selects text in a publication and performs a [lookup](#lookup.md) on that text, expecting to access multilingual [entry](#entry.md) content offering translations of the selected text into two or more other languages.
  * A user searches for a term by [entering text into a search field](#text_entry_search.md), and expects results to be offered from the dictionary publication currently being accessed.
  * A user sets a [preferred resource](#preferred_resource.md) for [lookup](#lookup.md), or sets the order and/or context in which [dictionary resources](#dictionary_resources.md) are used for lookup when multiple resources are available.
  * A user sets the default level of detail returned or displayed from [dictionary resource](#dictionary_resource.md) entries.
  * A user sets a default level of detail returned to a screen reader or other AT for the purposes of 'skimming'.
  * A user references a term located in a specific resource for the purposes of citation, annotation, or sharing.
  * A publisher indicates that an EPUB3 publication should prefer to use embedded entries, e.g. a [glossary](#glossary.md) local to publication.
  * A publisher indicates that an EPUB3 publication should prefer to use a specific stand-alone [dictionary resource](#dictionary_resource.md), if available.

_System: reading system, content_
  * A publication contains an embedded glossary or dictionary, and declares this resource via package metadata.
  * A publication is a stand-alone dictionary and declares this in package metadata.
  * A publication contains [headwords](#headword.md) in one or more languages, and declares the available languages and relationships through package metadata.
  * A publication indicates that it has an intended audience, such as users within a certain age range, or students in a specific grade level.


## Needed Publication Properties ##

_Package Metadata_
  * A publication contains an embedded [glossary](#glossary.md) and declares this resource via package metadata.
  * A publication is a monolingual dictionary, bilingual dictionary, multilingual dictionary, or thesaurus, and declares this via package metadata.
  * A publication is a bilingual or multilingual dictionary and declares the languages it covers and the relationships between them via package metadata.
    * If a bilingual dictionary publication only consists of a French-to-English translation direction (ie, a collection of entries containing French headwords with corresponding English translations), it would need to declare one relationship: French as the [source language](#source_language.md) and English the [translation language](#translation_language.md). Such a publication contains one [dictionary resource](#dictionary_resource.md).
    * If a bilingual dictionary publication contains both French-to-English and English-to-French translation directions (ie, both a collection of entries containing French headwords and their English translations, as well as a collection of entries containing English headwords and their French translations), then two different relationships need to be declared and distinguished in package metadata. A reading system must be able to determine that there are two [dictionary resources](#dictionary_resource.md) present and to distinguish between them.
  * A publication has an intended audience of students at specific grade levels, users in a certain age range, users who are learners (non-native speakers) of a language, or users with a specified level of vocabulary, and declares this audience via package metadata. It should be possible to combine these audience descriptors and to specify multiple combinations; for example, a dictionary for students ages 9 to 12 could also be appropriate for adults in a literacy program at a similar reading level.

_Entry Structure_
  * A dictionary or glossary [entry](#entry.md) is both content in the publication flow that can be accessed as any other EPUB content, and syndication content that can be accessed by a reading system for presentation to a user who is reading a different publication.
  * The delivered mechanism must allow authors to clearly mark the boundaries of entries to enable syndication-type access to entry content during [lookup](#lookup.md).
  * Authors must be able to identify an entry's domain so that all similar entries form a collection, or [dictionary resource](#dictionary_resource.md). If two or more [dictionary resources](#dictionary_resource.md) are available in a publication, a reading system must be able to identify the collection of entries comprising each resource, and associate that collection with relevant information in package metadata.
  * Authors should also be able to distinguish different types of entries that may not necessarily qualify as separate dictionary resources as discussed above. For instance, monolingual dictionaries in some languages (notably French) distinguish between proper nouns and all other headwords, and group them into separate sections. There should be a mechanism to distinguish such entry types within a publication.
  * Authors should be able to nest an entry within another entry. This capability is not necessarily required for an initial dictionary implementation, but can help enable features that actors may choose to offer. For example, if a reading system developer decides to offer a feature to let users search the [examples](#example.md) in a dictionary, a publisher could enable such a search by marking up each entry's examples as nested entries with appropriate semantics.

_Headwords and Inflections_
  * The delivered mechanism must allow publication authors rich markup capabilities for [headwords](#headword.md) (both main entry headwords and other types such as [alternate](#alternate_headword.md), [variant](#variant_headword.md), and [run-on headwords](#run-on_headword.md)) and their associated [inflections](#inflection.md) sufficient to enable both [lookup](#lookup.md) and [text entry](#text_entry_search.md) searches.  The following types of headword and inflection markup should be supported:
    * The normalized spelling of a [headword](#headword.md), as opposed to the form in which it may be displayed in the entry. For example, a headword that may be represented in the [entry's](#entry.md) content as '**in`*`val`*`id**' or '**invalid**<sup>1</sup>**' needs to be marked up as 'invalid' for search purposes.
    * A form of a [headword](#headword.md) for display in search results, which may be distinct both from the displayed form in [entry](#entry.md) content and the normalized spelling matched during a search. For instance, a publication author may wish to specify that a headword displayed in entry content as '**in`*`val`*`id<sup>1</sup>' should display as 'invalid<sup>1</sup>' or 'invalid<sup>1</sup> _(adjective)_' in a list of matching results presented after a [text entry search](#text_entry_search.md). This distinction is more critical for some languages than others; for example, in Japanese dictionaries numerous entries may have the same _kanji_ (ideographic) form but distinct spellings in the _hiragana_ (syllabic) writing system. In an electronic Japanese dictionary's search results, these forms are typically combined in ways not reflected in entry content.
    * [Inflected forms](#inflection.md) of a [headword](#headword.md). In print dictionaries, inflections generally do not have their own entries. In electronic dictionaries, however, [inflections](#inflection.md) users may look up while reading should be associated with their root headwords and stored as non-viewable content. For example, when a user performs a [lookup](#lookup.md) of an inflected form of the verb "run" such as "ran", "running", or "runs", a reading system must be able to match the dictionary entry "run"; in other words, the root form "run" and its inflections "ran", "running", and "runs" should be treated as equivalent for lookup purposes.
    * As there are multiple types of [headwords](#headword.md) that can occur in dictionary entries, the delivered mechanism should allow for the possibility of multiple headword/inflection combinations located at any point within an entry.

_Other Semantic Markup_
  * The delivered mechanism should provide a vocabulary for markup of both required and optional dictionary [semantic concepts](#Structure_and_Semantics.md). The latter group should cover at least important semantic elements of [entry](#entry.md) content that developers and publishers may choose either to utilize in certain reading system features (such as a narrowly-focused [idiom](#idiom.md) or [example](#example.md) search) or to suppress in certain contexts (for example, an [etymology](#etymology.md) in a pop-up window on a mobile phone).

## Structure and Semantics ##
**N.B.**: The following terms are representative of the range of lexical and semantic qualities that will be needed to support stated use cases and also allow for innovation. For the purposes of this charter proposal to initiate a working group, these terms are not intended to be interpreted as a strict requirement for inclusion into a specification.

### Glossaries ###
_Lexicographical_
  * [Entry](#entry.md)
  * [Headword](#headword.md) (Lemma)
  * [Alternate Headword](#alternate_headword.md)
  * [Variant Headword](#variant_headword.md)
  * Ontologies
  * Taxonomies
_Morphological_
  * [Inflection](#inflection.md)
_Semantic_
  * [Sense](#sense.md)
  * [Definition](#definition.md)
  * [Equivalence](#equivalence.md)
  * [Example](#example.md)
### Dictionaries ###
_Lexicographical_
  * [Entry](#entry.md)
  * [Headword](#headword.md) (Lemma)
  * [Alternate Headword](#alternate_headword.md)
  * [Variant Headword](#variant_headword.md)
  * [Run-on Headword](#run-on_headword.md)
  * [Run-in Headword](#run-in_headword.md)
  * [Phrasal Headword](#phrasal_headword.md)
  * [Idiom](#idiom.md)
  * Ontologies
  * Taxonomies
_Phonetic_
  * [Pronunciation](#pronunciation.md)
  * [Audio Pronunciation](#audio_pronunciation.md)
_Morphological_
  * [Displayed Inflection](#displayed_inflection.md)
  * [Inflection](#inflection.md)
_Historical_
  * [Etymology](#etymology.md)
  * [Date](#date.md)
_Syntax/Grammar_
  * Function or [Part-of-Speech](#part-of-speech.md)
    * [Voice](#voice.md)
    * [Tense](#tense.md)
    * [Case](#case.md)
    * [Gender](#gender.md)
_Semantic_
  * [Sense](#sense.md)
  * [Sense Label](#sense_label.md)
  * [Definition](#definition.md)
  * [Equivalence](#equivalence.md)
  * [Example](#example.md)
  * [Register Label](#register_label.md)
  * [Subject Label](#subject_label.md)
  * [Stylistic Label](#stylistic_label.md)
  * [Regional Label](#regional_label.md)
  * [Temporal Label](#temporal_label.md)
  * [Usage Section](#usage_section.md)
### Bilingual / Multilingual Dictionaries ###
_Lexicographical_
  * [Entry](#entry.md)
  * [Headword](#headword.md) (Lemma)
  * [Alternate Headword](#alternate_headword.md)
  * [Variant Headword](#variant_headword.md)
  * [Run-on Headword](#run-on_headword.md)
  * [Run-in Headword](#run-in_headword.md)
  * [Phrasal Headword](#phrasal_headword.md)
  * [Idiom](#idiom.md)
_Phonetic_
  * [Pronunciation](#pronunciation.md)
  * [Audio Pronunciation](#audio_pronunciation.md)
_Morphological_
  * [Displayed Inflection](#displayed_inflection.md)
  * [Inflection](#inflection.md)
_Syntax/Grammar_
  * Function or [Part-of-Speech](#part-of-speech.md)
    * [Voice](#voice.md)
    * [Tense](#tense.md)
    * [Case](#case.md)
    * [Gender](#gender.md)
_Semantic_
  * [Sense](#sense.md)
  * [Sense Label](#sense_label.md)
  * [Translation](#translation.md)
  * [Equivalence](#equivalence.md)
  * [Example](#example.md)
  * [Register Label](#register_label.md)
  * [Subject Label](#subject_label.md)
  * [Stylistic Label](#stylistic_label.md)
  * [Regional Label](#regional_label.md)
  * [Temporal Label](#temporal_label.md)
  * [Usage Section](#usage_section.md)
  * [Cultural Note](#cultural_note.md)
### Thesauri ###
_Lexicographical_
  * [Entry](#entry.md)
  * [Headword](#headword.md) (Lemma)
  * [Alternate Headword](#alternate_headword.md)
  * [Variant Headword](#variant_headword.md)
  * [Phrasal Headword](#phrasal_headword.md)
  * [Idiom](#idiom.md)
_Morphological_
  * [Displayed Inflection](#displayed_inflection.md)
  * [Inflection](#inflection.md)
_Phonetic_
  * [Pronunciation](#pronunciation.md)
  * [Audio Pronunciation](#audio_pronunciation.md)
_Syntax/Grammar_
  * Function or [Part-of-Speech](#part-of-speech.md)
_Semantic_
  * [Sense](#sense.md)
  * [Definition](#definition.md)
  * [Synonym](#synonym.md)
  * [Antonym](#antonym.md)
  * [Meronym](#meronym.md)
  * [Holonym](#holonym.md)
  * [Hyponym](#hyponym.md)
  * [Hypernym](#hypernym.md)
  * [Example](#example.md)
  * [Register Label](#register_label.md)
  * [Regional Label](#regional_label.md)


## Definitions ##

##### affix #####
> A prefix, infix, or suffix that is attached to another form to make a  word with a distinct meaning, eg, _laugh_ + **ed**. (1)

##### alternate headword #####
> A form related to a primary [headword](#headword.md) but generally carrying a somewhat different meaning. For example, an entry with the primary headword **aestivate** might have **aestivation** as an alternate headword. An alternate headword should be indexed for search purposes along with the primary headword.

##### antonym #####
> Terms with opposite sense or meaning.

##### audio pronunciation #####
> An audio file containing a recording of the pronunciation of a particular [headword](#headword.md). This feature of many electronic dictionaries can be offered in addition to or in place of the traditional written [pronunciation](#pronunciation.md).

##### case #####
> An [inflection](#inflection.md) of a noun, adjective, or pronoun according to its function in a sentence. German, Russian, and Latin are examples of languages in which words have many different written forms according to case.

##### cultural note #####
> A note providing detailed cultural context on a [headword](#headword.md).

##### date #####
> The date of the first recorded use in a language of a particular [headword](#headword.md).

##### definition #####
> An explanation of the meaning of a particular [sense](#sense.md) of a [headword](#headword.md).

##### dictionary resource #####
> A collection of entries that have headwords in a particular [source language](#source_language.md) and that a reading system can access to [look up](#lookup.md) terms a user selects while reading a publication.

##### displayed inflection #####
> An [inflection](#inflection.md) of a headword that is part of the viewable content of an entry. Irregular inflections are often explicitly printed in entries to provide guidance to the user, eg, the displayed inflection "mice" in "**mouse** _noun, plural_ **mice**"

##### entry #####
> The fundamental organizational unit of a glossary or dictionary, consisting of at least one [headword](#headword.md) _and_ a [definition](#definition.md), [translation](#translation.md), or [equivalence](#equivalence.md) cross-reference.

##### equivalence #####
> A statement that a headword or particular sense of a headword is equivalent in meaning to another dictionary headword, typically supplied in lieu of a definition and acting as a cross-reference to the equivalent entry cited. An example would be a short entry for **color** in a British English dictionary that informs the user this is a US equivalent of **colour**: '**color** _noun_ _(US)_ = **colour**'.

##### etymology #####
> An explanation of the historical origin of a headword, eg, a statement that it is derived from a particular Latin word.

##### example #####
> A sentence or phrase illustrating the usage of a headword in a particular [sense](#sense.md).

##### gender #####
> A label indicating the gender of a noun, generally subsumed in part-of-speech at the beginning of an entry; in bilingual dictionaries, often a stand-alone label associated with a particular [translation](#translation.md).

##### glossary #####
> A glossary section of a publication that a reading system can access to [look up](#lookup.md) a term a user selects while reading that particular publication.

##### headword #####
> The word occurring at the start of an [entry](#entry.md) whose meanings the entry covers; in a broader sense, a word whose meanings are discussed at any point in the entry (see [alternate headword](#alternate_headword.md), [variant headword](#variant_headword.md), [run-in headword](#run-in_headword.md), and [run-on headword](#run-on_headword.md)). In a monolingual dictionary or glossary, the headword is _defined_, while in a bilingual dictionary the headword is _translated_, and in a thesaurus [synonyms](#synonym.md) are provided. In most languages, entries are arranged alphabetically according to the spelling of the headword.

##### holonym #####
> A relation between a whole and a part, eg, a wiki is a holonym of constituent wiki pages; 'has-parts'.

##### hypernym #####
> A relation between a class and sub-class; 'has-types'.

##### hyponym #####
> A relation between a sub-class and a class; 'is-type-of'.

##### idiom #####
> An idiomatic expression that is defined or translated in an entry. For example, an entry for **cold** might contain the _idiom_ '**to get cold feet**'.

##### inflection #####
> An [affixed](#affix.md) form of a [headword](#headword.md) that conveys a specific grammatical meaning; for example, the past tense of a verb (eg, 'ran' is an inflection of 'run') or plural form of a noun (eg, 'mice' is an inflection of 'mouse'). Related to the concept of [stemming](IndexesCharterProposal#Stemming.md) in indexes.

##### lookup #####
> A search for a user-selected term in dictionary or glossary [headwords](#headword.md) (including [alternate](#alternate_headword.md), [variant](#variant_headword.md), [run-on](#run-on_headword.md), and [run-in](#run-in_headword.md) headwords) and [inflections](#inflection.md). When a user initiates a glossary lookup, the reading system should search the local publication's embedded glossary, while when a user initiates a dictionary lookup, the reading system should search the user's [preferred resources](#preferred_resource.md). Matching glossary or dictionary entries are then displayed to the user, typically in a pop-up window.

##### meronym #####
> A relation between a part and a whole, eg, a wiki page is a meronym of a wiki; 'is-a-part-of'.

##### quotation #####
> A quotation from a cited source illustrating the usage of a headword in a particular [sense](#sense.md).

##### part-of-speech #####
> A label indicating the grammatical function of the headword (_noun_, _verb_, _adjective_, _interjection_, _transitive verb_, _reflexive verb_, etc.)

##### phrasal headword #####
> A headword of two or more words typically formed from another headword and listed within that headword's entry. For example, the items '**get out**' and '**get up**' listed in the entry for '**get**' would be phrasal headwords.

##### preferred resource #####
> An available [dictionary resource](#dictionary_resource.md) which a reading system uses during [lookup](#lookup.md) based on a user's indicated preferences.

##### pronunciation #####
> One or more written phonetic pronunciations given for a [headword](#headword.md).

##### register label #####
> A label indicating usage register of a [headword](#headword.md) or [sense](#sense.md), eg, _formal, slang, offensive_.

##### regional label #####
> A label indicating geographic range of a [headword](#headword.md) or [sense](#sense.md), eg, _Latin America, Western US, Australia_.

##### run-in headword #####
> A headword occurring in the middle of an entry, generally associated with a particular [sense](#sense.md).

##### run-on headword #####
> A headword occurring at the end of an entry and that is derived from that entry's headword. For example, the adverb **softly** at the end of the entry for the adjective **soft** would be a _run-on headword_.

##### sense #####
> A particular meaning of a headword, and a unit for organizing information pertaining to this meaning. Sense units are typically distinguished from one another by numeric and/or alphabetic labels.

##### sense label #####
> A short phrase that restricts and clarifies the meaning of a particular [sense](#sense.md).

##### source language #####
> The language of the term(s) which a user wishes to looks up; in bilingual dictionaries, the language of the [headwords](#headword.md) in a section of the publication.

##### stylistic label #####
> A label identifying stylistic usage of a [headword](#headword.md) or [sense](#sense.md), eg, _literary_.

##### subject label #####
> A label indicating subject area of a [headword](#headword.md) or [sense](#sense.md), eg, _biology, architecture_.

##### synonym #####
> Terms with identical or similar meanings. Groups of synonyms are often tied to a particular [sense](#sense.md) of a headword in a thesaurus or dictionary.

##### temporal label #####
> A label indicating current usage status of a [headword](#headword.md) or [sense](#sense.md), eg, _archaic_.

##### tense #####
> An [inflected form](#inflection.md) of a verb that indicates when the action is taking place.

##### text entry search #####
> A feature by which a user can directly input text into a search field and select [entries](#entry.md) with matching [headwords](#headword.md) from a list. Reading system developers could implement such a feature in a variety of ways, depending on their preference: by displaying matching results only after the user has input a full string and launched the search, or displaying partial matches as the user types, or positioning a highlight in a scrollable, complete list of dictionary headwords (to cite just a few possibilities).

##### translation #####
> In a bilingual dictionary, the translation of a particular [sense](#sense.md) of a [source language](#source_language.md) [headword](#headword.md) into the [translation language](#translation_language.md).

##### translation language #####
> In bilingual dictionaries, the language in which translations are offered for [headwords](#headword.md) in the [source language](#source_language.md).

##### usage section #####
> A note providing usage information on a headword, or a more extensive section covering the difficult and confusing aspects of a particular headword's usage.

##### variant headword #####
> An alternative spelling of a primary [headword](#headword.md) that carries the same meaning and that should be treated as of equal rank to it for search purposes. For example, an entry with the primary headword **kabbalah** could have numerous variant headwords: '**kabbalah** _also_ **kabbala** _or_ **kabala** _or_ **cabala** _or_ ...' (2)

##### voice #####
> A relationship between the subject and object of a verb that is either _active_ or _passive_.


## References ##

1. Crystal, David. (1995). _The Cambridge Encyclopedia of the English Language_ (pp. 448-60). Cambridge: Cambridge University Press.

2. Merriam-Webster, Incorporated. (2003). _Merriam-Webster's Collegiate Dictionary, Eleventh Edition._ Springfield, Massachusetts: Merriam-Webster, Incorporated.


<a href='Hidden comment: 
<dl>
<dt id="dict">Dictionary

Unknown end tag for &lt;/dt&gt;


<dd>...

Unknown end tag for &lt;/dd&gt;


<dt id="gloss">Glossary

Unknown end tag for &lt;/dt&gt;


<dd>...

Unknown end tag for &lt;/dd&gt;




Unknown end tag for &lt;/dl&gt;


'></a>