

## Requirements Review Status ##

Requirements have been reviewed by: Daniel Weck; Garth Conboy; add-your-name-here

## Participants ##

| **Name** |  **Organization** | **Role** | **UTC time** | **Preferred con call time** |
|:---------|:------------------|:---------|:-------------|:----------------------------|
| Markus Gylling |  DAISY | (coordinator) |   |  |
| James Pritchett  |  [RFB&D](http://www.rfbd.org) |  | UTC -4  | 12:00-20:00 UTC |
| Eric Freese  |  Aptara |  | UTC -5  |  |
| Ben Trafford  | Invited Expert  | Extensibility Nerd | UTC -7 | 17:00 to 01:00 UTC |
| Adam Witwer | O'Reilly Media |  | UTC -4| 20:00 UTC |
| Liza Daly | Threepress Consulting Inc. |  | UTC -4 |  |
| Chelsea Valentine | LibreDigital |  |  UTC -6 | 19:00-22:00 UTC |
| Hadrien Gardeur | Feedbooks |  | UTC+1 | 07:00 UTC - 19:00 UTC |
| Benoît Larroque | Feedbooks |  | UTC+1 | 07:00 UTC - 19:00 UTC |
| John Prabhu | HOV Services |  |  |  |
| Takeshi Kanai | Sony Electronics |  | UTC -8 | 19:00 UTC - 01:00 UTC |
| Neil Soiffer | Design Science | Math Geek| UTC -7 | 15:30 UTC  - 24:00 UTC |
| Dave Makower | Apple, Inc. |  | UTC -7 | 16:00 UTC - 19:00 UTC |
| MURATA Makoto (FAMILY Given) | JEPA |  | UTC +9 |  |
| Karen Broome | Sony Electronics |  |UTC -7 | 19:00 UTC - 23:00 UTC|
| Paul Norton | Invited Expert |  | UTC -7 | 17:00 UTC - 23:00 UTC |
| Aline Pace | HarperCollins Publishers |  |UTC -5 | 1400-1700 UTC|
| Peter Sorotokin |  |  |  |  |
| Jeff Alexander | Intangible Press |  | UTC -4 |  |
| Andreas Gosling | Penguin Group UK |  | UTC +1 | 0800 UTC|

## Mission ##

This sub-group is tasked to update OPS for EPUB 2.1, including a new version of the preferred grammar and mechanisms for extensibility.

The subgroup is addressing problems 3, 7, 9, 10 and 12 in "Current Industry Problems" in the charter: http://www.idpf.org/idpf_groups/IDPF-EPUB-WG-Charter-4-27-2010.html

List of relevant lightning talks in the f2f:
  * [F2F201006Agenda#Semantics](F2F201006Agenda#Semantics.md)
  * [F2F201006Agenda#Extensibility](F2F201006Agenda#Extensibility.md)


## Requirements ##
### General ###



&lt;hr&gt;


#### TG.01 The HTML browser as a rendering engine (A) ####
**Requirement: The preferred grammar of EPUB must be designed so that an HTML browser rendering engine can be used as the basis for an EPUB rendering engine**

_Rationale:_ the ability of EPUB to be implemented using web technologies in general (and the browser as a rendering engine in particular) is considered one of the formats main strong points.

_TBD: needs qualification - exactly what does "be used as rendering engine" mean?_
  * _ability to use browser DOM and associated APIs_
  * _ability to use CSS 2.1 as the styling basis_
  * _inherit behaviors (beyond styling)_
  * _... more?_

_PeterS: I think that you should be able to render EPUB chapter content reasonably well in an off-the shelf browser, but you may have to write a whole bunch of JavaScript for your webapp to support it. Note that chapter content is not directly renderable in the browser in EPUB 2.0 already because of ops:switch._



&lt;hr&gt;



#### TG.02 Support inter-publication linking (A) ####
**Requirement: support of inter-publication linking between EPUBs files**

_Rationale:_ the ability to refer between books is common in published materials and should be supported electronically

Use cases:
  * Linking from Bible to associated concordance
  * Linking between textbook and companion study guide
  * Linking between volumes of large publications split into more than one EPUB file

Considerations:
  * what addressing mechanism to identify other EPUB files?
  * what happens when referenced EPUB is not available on device?
  * backward navigation

See also [NAV\_06](Navigation#NAV_06__Reading_System_must_provide__Bibliographic_reference_to.md) and [NAV\_07](Navigation#NAV_07Reading_System_must_Navigate_to_location_based_on_Bibliogr.md)

**Dependency:** META group re work identifiers



&lt;hr&gt;



#### TG.03 Support association of pronunciation lexica (A) ####
**Requirement: support the association of pronunciation lexica with an EPUB publication**

_Rationale:_ Reading systems with built-in TTS support are becoming increasingly common. For print disabled users in particular, the ability to increase the quality of speech output is of paramount importance, especially in the context of academic works, which tend to contain terms that are not covered by the hardwired TTS lexica.

See also TG.04.

See also http://www.w3.org/2005/Incubator/htmlspeech/



&lt;hr&gt;



#### TG.04 Support inline-level pronunciation expressions (B) ####
**Requirement: support inline-level pronunciation and prosody expressions**

_Rationale:_ The generalized pronunciation instructions provided by external lexica (see TG.03)  does not suffice as they do not provide the ability to specialize pronunciation depending on context, nor do they provide the ability to specify prosody.

See also http://www.w3.org/2005/Incubator/htmlspeech/



&lt;hr&gt;



#### TG.05 Support pre-compiled search indices (E) ####
**Requirement: The publication should contain a standardized pre-compiled index that reading systems can use to provide sophisticated searching.**

_Rationale: Sophisticated  searching in documents or dictionaries can be facilitated by building standardized pre-compiled indexes. Having a reading system do this would be time consuming, especially on low powered devices._

_Use case: Reader wants to use fuzzy logic to search in a technical document or textbook. The reader can benefit by having the results sorted by relevance, proximity (hits in consecutive paragraphs,  hits in headings, and similar words, i.e. synonyms._

_Use: Reader is in a dictionary and wants to look up a word. They don't want the occurrence of the word in definitions, but wants the key word entry. In addition, variations of the base root word should be found, e.g. suffix and variant spellings are found._



&lt;hr&gt;



#### TG.06 Inline Metadata (A) ####
**Requirement: Provide for the encoding of metadata in-line with text/content**

_Use Case:_ Content providers wish to deliver serial publications, medical, technical and scientific journals, scholarly publications, educational materials, technical documentation, illustrated books, catalogs, newspapers and other rich content to the eReader channel with metadata encoded in-line with text/content

**Dependency:** This requirement is related to META\_12

_Dianne: PRISM allows for metadata to be encoded inline with content to facilitate navigation within an article_ some examples are
  * 

&lt;pim:person&gt;

xxx

&lt;/pim:person&gt;


  * 

&lt;pim:event&gt;

xxx

&lt;/pim:event&gt;


  * 

&lt;pim:object&gt;

xxx

&lt;/pim:object&gt;


  * 

&lt;pim:industry&gt;

xxx

&lt;/pim:industry&gt;


  * 

&lt;pim:keyword&gt;

xxx

&lt;/pim:keyword&gt;





&lt;hr&gt;





&lt;hr&gt;



### Migration to HTML5 ###
#### Preamble ####
The move from XHTMLMOD 1.1 (as used in EPUB 2.01) towards HTML5 is outlined in the WG charter, and was discussed with a tentatively favorable outcome during the kickoff F2F.

The general direction was later decided on by the WG, and is recorded in [TextContent\_HTML5Relations](TextContent_HTML5Relations.md)



&lt;hr&gt;



#### TH.01 Allow for subsetting (A) ####
**Requirement: The EPUB adaption of HTML5 must allow the expression of proper subsets vis-a-vis the W3C version of HTML5.**

Rationale:
  * A grammar a.k.a "profile" that prohibits tagsoup and enforces rigid structure has substantial accessibility benefits (cf. DTBook of EPUB 2.01)
  * HTML5 has a set of "obsolete but conforming" elements and attributes, added for web forwards compatibility reasons. As EPUB has none of that baggage, we have no reason to include these elements.
  * TBD dependency on the [RichMediaAndInteractivity](RichMediaAndInteractivity.md) subgroup's outcomes re handling of the video element, scripts/sandboxing, et al.

_Comment: note that a strictened-up "profile" isn't necessarily exclusive; "loose" and "strict" versions could co-exist (but wouldn't have those names)._

_Comment: note that subsetting is used also in EPUB 2.0; this is really nothing new_

_Comment: related page at [HTML5Subsetting](HTML5Subsetting.md)_



&lt;hr&gt;



#### TH.02 Retain compatibility with XML (A) ####
**Requirement: Documents adhering to the EPUB adaption of HTML5 shall be expressed in the XML serialization thereof.**

Rationale: EPUB as a whole remains an XML-based framework. Allowing the HTML serialization of HTML5 in EPUB would mean that all reading systems would have to ship with two parsers; homogenizing the serialization to XML at production time seems more economical. This requirement explicitly defines the serialization of HTML/HTML5 to be used, and does not imply an "arbitrary XML vocabulary" direction.  This rationale dovetails with a desire to endorse and expand the use of tools such as "epubcheck" to ensure/verify "clean" EPUB content.

_Hadrien: Fully agree._

MURATA: I like XML, but will content providers listen to us?  Won't they anyway create non-XML HTML documents anyway?

_Dan Hughes: Agree. If the spec - and downstream distributor/device/software - requires valid XML, content providers will produce it. Content providers do not consider HTML/XML. They are only looking to sell product, and will adopt the specs, formats, and tools as provided by the marketplace or standards bodies._

_Liza Daly_: It is totally the case that all ereader software consumes HTML, not just XHTML.

_mgylling_: Liza, sure, as a schoolbook example of [Postels law](http://en.wikipedia.org/wiki/Jon_Postel#Postel.27s_Law) right? Use case for maintaining XML: I want my entire production and supply chain to be implementable using vanilla XProc.

_Garth_: Indeed.  With the advent of EPUB 2.0, we raised the bar from "well formed" to "valid."  Tools like "epubcheck" are now in heavy use, such tools rely on XML expression of content to perform their functions.  We now seem to be seeing likes of "epubcheck" being at the end of the EPUB production process or at the start of the EPUB ingest process (e.g. Apple iBooks); I view this as a GoodThing(tm).

_PeterS_: I do not quite understand what Liza means by "totally the case that all ereader software consumes HTML". Adobe SDK and Content Server do not (and most of dedicated ebook reading devices are based on those). EPubCheck does not either. HTML parser is a burden and it does not add anything new: HTML just provides different serialization, not different language capabilities.

### Extensibility ###



&lt;hr&gt;



#### TE.01 Allow for inflection of domain-specific semantics on top of HTML5 (A) ####
**Requirement: Adopt a mechanism to enable the inflection of domain-specific (books, magazines) semantics on the (X)HTML-based core grammar.**

Use case: A reading system with TTS capabilities implements the "skippability" behavior for notes and marginalia, e.g. allows the user to turn off the reading of note references, notes (and possibly other kinds of marginalia) during sequential TTS rendering. This behavior is only possible to implement if there are stable semantics available for noterefs, notes, author annotations, and so on.

Use case: A reading system with limited display real estate implements a feature where marginialia/the note apparatus can be toggled hidden/shown. This behavior is only possible to implement if there are stable semantics available for noterefs, notes, author annotations, and so on.

For details on semantics needed in the book+mag context, refer to [#Domain-specific\_semantics](#Domain-specific_semantics.md)



&lt;hr&gt;



##### TE.01\_1 Assure lexical predictability when addressing TE.01 (A) #####
**Requirement: When designing the solution for TE.01, avoid a solution that allows ad hoc values/vocabularies**

Rationale: In order for reading systems to be able to effectively enrich their behavioral repertoire based on semantic inflections, the mechanism used must be lexically predictable and validatable. (Read: the solution of "put arbitrary strings in the class attribute" has been tried and tested, and does not provide a stable enough framework.)



&lt;hr&gt;



#### TE.02 OCF Extensibility ####
**Requirement: ePub2.1/3.0 should keep OCF extensibility described in ePub2.0.**

Rationale:  Current OCF extensibility is used for Sony's periodical titles.
> Multiple root files:
> > In OCF, it allows to set multiple root files. Sony's periodical titles specifiy OPS and Atom file as root file. The Atom file contains semantics information for each article/section page and it helps article/section navigation.


> Metadata:
> > In OCF, metadata.xml itself is reserved. Since our periodical titles contain two types of root content, metadata for the package is described in the file.

Note:

> Relation to http://code.google.com/p/epubcheck/issues/detail?id=58.

Note:
> Related to [StylingAndLayout#SNL\_R4.1\_Specific\_sized\_renditions](StylingAndLayout#SNL_R4.1_Specific_sized_renditions.md)



&lt;hr&gt;



#### TE.03 Put metadata/semantic info about individual articles in the publication in a single place (B) ####

**Requirement: provide information about individual articles in the document in a single place (e.g. a separate section in NCX or a separate file) so it can be accessed quickly (without parsing individual articles).**

Note: this requirement was stated as "container.xml can specify a semantic information file as one of root files". On the 8/5/10 call everyone agreed that container.xml is probably not an appropriate place to hook this information to as it does not constitute an alternative rendition of the document, but ability to have this informtaion was seen as a good thing. I was given a task to re-state this requirement and remove the reference to container.xml -- PeterS

Rationale: Sony's periodical titles specifiy OPS and Atom file as root file. The Atom file contains semantics information for each article/section page and it helps article/section navigation.

_Use case 1: Access across the media_
> Each article should be recognized as one of digital articles, regardless of ePub or Web.

_mgylling: can use case 1 be solved via inline semantics (for example, an article element), or is there another need here?_

_Takeshi: It might be possible, but retrieving semantics from XHTML is not realistic for mobile devices. Commercial newspaper contains more than 100 articles and it will take more than two minutes to retrieve the data. The preprocessed data is required and it provides more capability._

_Use case 2: Semantic information for navigation_
> Sometimes, user encounter a long article. In print version, it is easy to distinguish a long article, but in ePub Reading system, it is a bit hard.
> To skip to other place, buttons which navigate to the section top page and next/previous article/section page are required as a part of UI.  Such semantic information, or relations,  needs to be written in a file.

_mgylling: Could the NCX be used for this purpose? If not, what's missing in NCX to allow that?_

_Takeshi: **updated**(Date and Time), **summary**, **category** in Atom, a type field which tells article or section and a reference filed which refers to an online article are missing. The nature of NCX is to point to a starting position, in my understanding, but each entry in Atom is good for describing metadata for a specific area. I could say the meaning of title in NCX and Atom are slightly different. The title in NCX is a label or tag and it is well designed for inserting labels into a series of text, I think. So, adding necessary elements might not make sense, especially if it is used for semantics._

Note:
> Related to [StylingAndLayout#SNL\_R4.1\_Specific\_sized\_renditions](StylingAndLayout#SNL_R4.1_Specific_sized_renditions.md)



&lt;hr&gt;



#### TE.04 Backward compatibility (A) ####

It should be possible to target EPUB 2.0 and 2.1 Reading Systems at the same time by utilizing fallback mechanisms present in EPUB 2.0. For instance if 2.1 requires MathML, it should be possible to use some feature such as the XML Island feature to fallback to SVG or image for EPUB 2.0 Reading Systems.

### Accessibility ###

_Note that [TH01](TextContent#TH.01_Allow_for_subsetting_(A).md) also pertains to accessibility._

#### TA01 Support WAI-ARIA (A) ####

Use case: JavaScript increasingly acts as a controller (in the MVC sense) for a web application instead of a browser, but screen readers are not provided with enough detail about the nature of the interaction model by the JavaScript (unlike a browser). WAI-ARIA defines enough semantics (roles,
states, properties) so that the JavaScript (application) controller can interact well with a screen reader or other assistive technology.

(Refer to [public working draft](http://www.w3.org/TR/wai-aria/), [latest editors draft](http://www.w3.org/WAI/PF/aria/))

**Requirement: Support WAI-ARIA markup in the EPUB 3.0 text definition** _(Note that this may be another case of late binding, as the ARIA section included in the HTML5 draft does not seem stable: WAI/PF has [a current change proposal](http://www.w3.org/html/wg/wiki/ChangeProposals/ARIAinHTML5) to the ARIA section of the HTML5 spec. The [standalone ARIA spec](http://www.w3.org/TR/wai-aria/) is in working draft status, and may still change. We also need to understand whether the HTML5 adaption excludes some ARIA constructs that are useful in our context._)

_Note that support for ARIA pertains not only to supporting certain markup constructs, but also [user agent requirements](http://www.w3.org/WAI/PF/aria/conformance); these should minimally be referred to as recommendations (as we at this point have no requirement that reading systems expose DOMs at all)._

### Domain-specific semantics ###

#### General book semantics ####
The following section contains semantics primarily from DTBook (cf EPUB 2.0.1) for use in the context of [TE.01](TextContent#TE.01_Allow_for_inflection_of_domain-specific_semantics_on_top_o.md)

The use case/rationale for these semantics is available in [TE.01](TextContent#TE.01_Allow_for_inflection_of_domain-specific_semantics_on_top_o.md)



&lt;hr&gt;



##### TB.01 Notes and note references (A) #####
**Requirement: the OPS vocabulary must allow unambiguous specification of _notes_ and _note references_**

Notes provide or reference sources of additional information or acknowledge the source of a quotation or idea. Each note is typically referenced by a noteref or prefixed by a page location where explicit references have been omitted from the text.

Notes in printed matter are generally distinguishable from annotations by their location either at the bottom of print pages, at the end of sections or in the back matter of a document. Annotations typically occur in the margin near the text being annotated.

Note references typically appear as superscripted numbers or symbols within the narrative flow.



&lt;hr&gt;



##### TB.02 Annotations and annotation references (A) #####
**Requirement: the OPS vocabulary must allow unambiguous specification of _annotations_ and _annotation references_**

Note: this requirement relates to _static content annotations_, such that are present in the original publication (as added by authors, translators, etc).



&lt;hr&gt;



##### TB.04 Non-structural headings (A) #####
**Requirement: the OPS vocabulary must allow the unambiguous specification of non-structural headings**

Rationale: in text books in particular, constructs such as tables, lists and figures sometimes contain headings that do not impact the overall sectioning structure of the content. It must be possible to distinguish these from proper structural section headings, for AT use, and to maintain NCX autogeneration capabilities.

Compare: Docbook _bridgehead_, DTBook _bridgehead_ and DTBook _hd_.



&lt;hr&gt;



##### TB.05 Maintain location of pagebreaks (B) #####
**Requirement: the OPS vocabulary must allow the unambiguous specification of the location of page breaks (as they appear in a paper print source being replicated as EPUB)**

Rationale: even though in general it is better (in a reflowable context) to maintain this information in the NCX alone, the ability to inline this information is useful when autogenerating NCX from the OPS content. Further, the ability to turn off the announcement of page breaks, when present in content, is a typical use of the skippability feature.



&lt;hr&gt;



##### TB.06 Figure descriptions with markup (A) #####
**Requirement: the OPS vocabulary must allow figure descriptions to be provided that contain rich markup**

Rationale: when providing descriptions of rich figures, _@alt_ is insufficient. Further, it is generally bad from an i18n perspective to provide information intended for human consumption in attribute values.



&lt;hr&gt;



##### TB.07 External figure descriptions (B) #####
**Requirement: the OPS vocabulary must allow figure descriptions to be provided out-of-line with unambiguous linking semantics**

Rationale:  The figure descriptions are not wanted by most people. However, persons with disabilities will need to use these figure descriptions upon demand.  The reading system will need to determine that this is a description associated with the image. In addition, a link may be provided to additional sources of information, e.g. a database of descriptions that convey the concept being presented in the image.



&lt;hr&gt;



##### TB.08 Support Math via MathML (A) #####
**Requirement:  support for math should be built-in and accessible**

Rationale:  Everyday, children are required to take math classes in K-10. Many students continue to take a STEM courses in secondary and post-secondary schools beyond the minimal requirement.  Probably over 1/4 of all textbooks contain math, and there are many trade books, journals, and professional magazines that contain math.  Images do not scale well for the variety of display platforms, nor are they accessible, so images are not an acceptable substitute.

Suggested path:  Math should be incorporated through the use of MathML.  MathML is part of HTML5. MathML is supported in many different browsers natively and a Javascript implementation exists that takes advantage of CSS positioning to do display on platforms that don't have native support.  There are a large number of authoring tools, and MathML allows for interaction with computation and graphing tools which allows for many interesting possibilities for ebooks in the future.



&lt;hr&gt;



#### Dictionaries/glossaries ####



&lt;hr&gt;



##### TD.01 Dictionary lookup (A) #####
**Requirement: Provide a vocabulary to support word lookup in dictionaries**

Rationale: Today, many reading systems include a dictionary lookup feature that utilizes
a built-in dictionary. Such solutions depend on proprietary data tagging and indexing
schemes, rather than being based on EPUB. This type of proprietary solution limits
consumers to using a single dictionary in a single language, preventing them from
replacing the built-in title with another dictionary, or from purchasing bilingual
dictionaries and other types of reference ebooks (eg, encyclopedias, medical
dictionaries, biographical dictionaries, etc.)

In defining a dictionary solution for EPUB, we need to consider the access methods
currently supported by reading systems for built-in dictionaries. The EPUB dictionary
vocabulary should make it possible for a reading system vendor to support all of these
access methods, even if they are not required to support all three:

a) Word lookup from a publication via user selection (eg, cursor positioning on non-touch screen devices, or tapping on word with finger/stylus on touch screen devices)

b) Direct word lookup via user input

c) Browsing of the dictionary, ie, standard EPUB navigation

All EPUB-based reading system manufacturers who include a dictionary lookup feature today
support method a), and some support both a) and b). A prominent non-EPUB-based manufacturer supports a), b), and c), as well as the ability for users to purchase additional dictionaries and change their primary lookup dictionary.



&lt;hr&gt;



##### TD.02 Dictionary entries (A) #####
**Requirement: Provide a way to identify a region of text as a dictionary entry**

Rationale: Dictionary content can be presented in a sequence of alphabetically-ordered
entries (ie, a book-like presentation). In electronic dictionary implementations, however,
it is common to present a dictionary entry matching a user query as a discrete block
of text, in isolation from the other entries. In order to enable this type of access,
we need to define a vocabulary for identifying a dictionary entry as a distinct semantic
unit.



&lt;hr&gt;



##### TD.03 Headwords and inflected forms (A) #####
**Requirement: Provide a way to mark one or more headwords, and the inflected forms of those headwords, as search terms associated with a dictionary entry**

Rationale: A headword is a word being defined by a dictionary entry. An inflection is a form of the headword with a specific grammatical function (eg, the 3rd person singular
past tense of a verb) and a spelling distinct from the headword form. (The spelling of an inflected form does not _have_ to differ from the headword's, but it is the distinct
spelling that is of concern to us here.)

The OPS vocabulary needs to allow both headwords and their inflected forms to be marked up
within dictionary entries. This information can then be indexed by a reading system for
word lookup purposes.

Dictionary entries can contain multiple headwords of different types. A headword does not
necessarily occur at the beginning of an entry.

_Example of a print entry from an English dictionary. Syllable divisions for hyphenation
purposes are marked with the | symbol, and the entry contains a "run-on" headword (one
derived from the main headword)._

**dis|til** _also US_ **dis|till** _verb_ **-tilled; -tilling**
to let precipitate in drops; to extract the essence of something
-- **dis|til|la|tion** _noun_

The OPS markup needs to capture the main headwords without | syllable dividers ("distil",
"distill") along with their fully spelled-out inflected forms ("distils", "distilled",
"distilling"), as well as the run-on headword "distillation" and its inflected form "distillations". The OPS markup should also allow one to associate the parts of speech
(ie, the "verb" and "noun" labels) with their respective headwords. This can be useful if
a reading system wants to present this information to the user for disambiguation, as in a
case where there are many entries matching a particular query.

The OPS vocabulary should allow for a "type" or similar attribute to distinguish between
headwords used for different types of lookup by reading systems. For example, in a
Japanese dictionary publication it would be important to distinguish between the headword written in the _hiragana_ and _kanji_ writing systems.

_Note on Inflections:_ When inflected forms follow a regular pattern, they will typically
not be displayed in an entry at all. An entry for the regular verb "parler" in a French
dictionary would typically show just the headword form. The OPS, however, would need to
store all 39 unique inflection spellings of this verb, which are statistically much more
likely to be looked up during reading than the headword form:

_parle, parles, parlons, parlez, parlent, parlais, parlait, parlions, parliez, parlaient, etc._

Storing all distinct inflection spellings in the OPS provides a common method of storing
the linguistic data needed for reading system indexing. The model works for many
languages, particularly those in the Indo-European language family, though it should be
recognized that it is not a universal solution. For instance, a full-featured word lookup
for Hungarian, an agglutinative language that allows for very large number of possible
combinations of affixes with a headword form, would require a custom algorithm at the
reading system level.



&lt;hr&gt;



##### TD.04 Dictionary metadata (A) #####
**Requirement: Provide a way to identify a dictionary as such in metadata, and to define the source and target languages of a bilingual dictionary**

Rationale: Unlike other ebooks, dictionaries are linked into special reading system
lookup features, making it essential that reading systems can differentiate them from
other ebooks in an efficient manner. Reading systems also need to be able to determine
the language of a dictionary. For monolingual dictionaries, the 

&lt;dc:Language&gt;

 attribute
is sufficient. A bilingual dictionary, however, is meant to translate a word from one
language into another, so it is important to store both the source and target languages in
metadata for reading system use.

Use case 1: A reading system offers a setting for user selection of the lookup dictionary.
Identifying available dictionaries from metadata is faster than looking deeper into the
publication for specific tags.

Use case 2: A reading system automatically searches all available dictionaries for
matches upon a user lookup request. This reading system needs a quick way to identify
dictionaries, and also to determine which ones are relevant for lookup. (If the user
looks up a word from a Spanish ebook, then a Spanish encyclopedia, Spanish-English
dictionary, and Spanish-Japanese dictionary are all relevant; a Chinese monolingual
dictionary is not.)

Use case 3: A device has an English monolingual selected in its lookup dictionary setting,
but a French-English bilingual is also present in memory. If the user is reading an ebook in French and looks up a word, a reading system _could_ choose to override the current setting and look up the word in the French-English dictionary, or could prompt the user to
do so.

**Dependency:** META group



&lt;hr&gt;



##### TD.05 Performance and indexing (C) #####
**Requirement: Ensure good word lookup performance via indexing**

Rationale: The uncompressed XHTML for a typical dictionary (putting aside the markup
yet to be defined) could be estimated to fall in the 5 - 75 MB range. Headwords and their
inflected forms are the only relevant parts of the dictionary content for search purposes,
yet searching the entire publication for headword elements will be too slow for an
acceptable user experience. A headword index is required to enable good search
performance. A second data structure is required to allow translation of an inflected
form into its base or headword form (that is, a spelling of the word that can be looked up
in the headword index).

The OPS markup in a dictionary publication must contain all semantic information needed
for building a headword index and translating inflected forms into headword forms.
Creating an index from the OPS markup should be a requirement for reading system vendors,
even if EPUB does not specify the exact form the index should take.

The format of the headword and inflection indexing information could be defined by EPUB
and included in the dictionary publication by the publisher or conversion house, or
reading system vendors could define their own indexing formats. In the latter scenario,
the indexing could be done at content ingestion or at run time, depending on the vendor's
preference. Any out-of-spine indexing information should be added to the publication in a
way that does not make it invalid.

It seems desirable to define the index as part of the publication. However, this path
would require that 1) a data structure could be identified that would be workable for
different reading system vendors, 2) the necessary data indexing tools are either publicly
available or could be made available to content developers by IDPF, and 3) there are no
major license/copyright obstacles to using this technology.

_Whether to define a dictionary indexing format and make it part of the publication is an
important question to resolve soon, as it significantly affects the scope of the work
later on._



&lt;hr&gt;



##### TD.06 Glossaries (A) #####
**Requirement: Provide a vocabulary for defining glossaries**

Rationale: A vocabulary is needed to define a part of a publication as a glossary,
to mark a glossary entry as a semantic unit, and to mark the term being defined
by that entry. A glossary can be thought of as a book-specific form of a dictionary
that is typically short with a simple structure.

It should be sufficient to mark up glossary entries and terms in OPS using the same
vocabulary that will be defined for dictionaries. Distinguishing between glossary and
dictionary entry markup could be achieved via a **type** attribute on the entry-surrounding
element.

There needs to be a way for a reading system to detect that a glossary is present.
This could be achieved either by looking for the presence of a semantic element surrounding the entire glossary, or by the presence of a metadata element in the OPF
that points to the manifest item representing the glossary. _(Comment from Markus; a glossary is not always an entire manifest item, might be just a part of a document)_

Use case: An educational publisher provides a glossary of terms at the end of a textbook.
When a student selects a word in text, a reading system could offer to look up that word
in the glossary, then display the glossary entry in a pop-up window.

The indexing requirement for dictionaries described above seems unnecessary for a reading
system to parse and efficiently search relatively short glossaries at run time. It may
be desirable, however, for a reading system to be able to take advantage of this
indexing mechanism in order to speed searching of large glossaries.



&lt;hr&gt;



##### TD.07 Audio pronunciations (E) #####
**Requirement: Enable references to embedded audio pronunciations**

There needs to be a way to embed audio recordings of dictionary headwords in a
publication, and to link to them from dictionary entries. This requirement should
already be addressed by the [RichMediaAndInteractivity](RichMediaAndInteractivity.md) requirements, but the dependency
is noted here.

See TR-1 and TR-3 of Rich Media:

http://code.google.com/p/epub-revision/wiki/RichMediaAndInteractivity#TR-1_Reading_Program_for_Multiple_Dialects



&lt;hr&gt;



#### Magazine/Article semantics ####
The following section contains semantics from PRISM (as used in the prism:class attribute) for use in the context of [TE.01](TextContent#TE.01_Allow_for_inflection_of_domain-specific_semantics_on_top_o.md). It is noted that this list is not exhaustive, and can/should be extended.

The use case/rationale for these semantics is available in [TE.01](TextContent#TE.01_Allow_for_inflection_of_domain-specific_semantics_on_top_o.md)

##### TP.01 PRISM semantics (A) #####

| **body** | The principal component of the resource. [NewsML](NewsML.md)|
|:---------|:------------------------------------------------------------|
| **box** |Ancillary content that is presented with an article and cannot stand alone.|
| **byline** |The byline (author) of the story.|
| **caption** | Text identifying or explaining, and printed in close proximity to, illustrations or other images. [AAT](AAT.md)|
| **credit** |An acknowledgement, appearing in the style of a caption.|
| **dateline** |The geographical location where the story was filed, e.g., city, state, and/or country where the story originated.|
| **deck** | A sub-head or secondary headline that generally is preceded by the article headline and precedes the body of the story.|
| **footnotes** |Note above the footer of the page made up of the note and the reference to the note.|
| **lead-in** | Eye catching beginning to a caption.|
| **pullQuote** |Eye catching quote pulled from the text of the body of an article.|
| **sidebar** | A substantive piece of content that is presented with an article and can stand alone.|
| **teaser** | A short description of the resource.|


### Relevant requirements from other groups ###
| [Annotations](Annotations.md) | [ANNOT\_R4.1 IDs](Annotations#ANNOT_R4.1_((A,_A,_A,_A))_XML/HTML_Unique_Identifiers.md) | |
|:------------------------------|:----------------------------------------------------------------------------------------|:|
| [Annotations](Annotations.md) | [ANNOT\_R4.2 XPath](Annotations#ANNOT_R4.2_((A,_A,_A,_B))_Structural_Paths_(XPath_Expressions).md) |  |

### Overarching implementation proposals ###
#### Remove DTBook as content type ####
The proposal is to
  * (content conformance) DTBook no longer allowed as a content type in OPS 3.0
  * (reading system conformance) 3.0 reading systems may recognize and render DTBook content as/when it appears in 2.0 content