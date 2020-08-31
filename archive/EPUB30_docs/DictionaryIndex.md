Comments and Questions are very much appreciated.

# EPUB Dictionary Search Index document #

Example:
```
<!- COLOUR ->
<search-index xml:lang="en_GB">
    <article-index headword="colour"  href="#epubcfi(/6/2[entry-c-to-d]!/563[colour0001]">
        <!- Search Index to the entry itself ->
        <search-form-group lemma="colour">
            <search-form value="colour"/>
            <search-form value="colours"/>
            <search-form value="color"/>
            <search-form value="colors"/>
        </search-form-group>

        <search-form-group lemma="school colours">
            <search-form value="school colours"/>
            <search-form value="school colors"/>
        </search-form-group>

        <!- Search Index to idioms. They have relative href within an article. ->
        <search-form-group                            href="#colour_1_0" >
            <search-form value="lend colour to"/>
            <search-form value="give colour to"/>
        </search-form-group>
        <search-form value="sail under false colours" href="#colour_1_1"/>
        <search-form value="show one's true colours"  href="#colour_1_2"/>
        <search-form value="under colour of"          href="#colour_1_3"/>
        <search-form value="with flying colours"      href="#colour_1_4" parental-control="1"/>
    </article-index>
</index>
```


```
<!- Example of a Japanese word, with "yomi" or secondary headword ->
<search-index xml:lang="ja">
    <article-index headword ="赤い・紅い"  phonogram="あかい"  href="#epubcfi(/6/1[entry-a]!/235[akai0005]"">
        <search-form-group phonogram="あかい">
            <search-form value="あかい" search-result-form="紅い"/>
            <search-form value="あかい" search-result-form="赤い"/>
            <search-form value="赤い"/>
            <search-form value="紅い"/>
        </search-form-group>
    </article-index>
</index>

```

## EPUB Search Index document ##
Markus asked if it might be useful to define a document that aggregates all Search Indexes in the dictionary publication, and possibly making it the only format that we define. After some thought I agree to this direction as it makes scanning of the Search Index at run time much more efficient.

A reading system can use this xml file directly to implement the search, but more commonly reading systems would construct a binary Search Index from this file when the publication is opened. It would take a few seconds to a minutes (needs more concrete numbers here) depending on the size of the Search Index and the machine resource available. Such file can be cached so it is done only once.

All elements and attributes defined below will be in the epub namespace.

## Package structure ##
The EPUB Search Index consists of one or more files. Each file contains single **_index_** element defining an index. Bilingual dictionary covering translation in both direction will contain two indexes. A reading system can choose to handle each index in an EPUB publication separately, or merge multiple indexes together.

The properties of the index will be captured in the package metadata also.

## Elements ##

### _search-index_ ###
The _search-index_ element represents machine readable data that implements the search capability of the dictionary or the glossary. It **does not** contain human readable contents.

**_xml:lang_** mandatory attribute indicates the language of the index. (to do: define what to do when the index is not a natural language, such as C reserved words, emoji dictionary, etc.).

Contains one or more _article-index_ elements.

### _article-index_ ###
An _article-index_ element groups one or more search forms that point to an article that can be displayed independently. The independent article is either an _article_ element or an html document.

The _article-index_ element is contained by _search-index_ element. It contains one or more _search-form-group_ or _search-form_ elements.

**_href_** mandatory attribute indicates the location of an article element or an html document using epubcfi. In case it points to an article element the last step must include the unique identifier of the corresponding _article_ element of the dictionary content documents that is indicated with id attribute.

**_headword_** mandatory attribute is a user visible string that represents the article, typically the headword.


### _search-form-group_ ###
It groups _search-forms_ elements that share the same attributes.

It contains _search-forms_ elements and allows the same set of attributes as _search-forms_.


### _search-form_ ###
It defines a search key that can be used to lookup the corresponding article or a part of the article. When a _search-form-group_ is a direct parent, it inherits all attributes from the parent. (is it useful if it can override attributes defined in the parent?)

**_value_** mandatory attribute indicates the search key string for the _search-form_.

**_lemma_** optional attribute indicates the lemma of the _search-form_. Typically this attribute is used with _search-form-group_ that groups all inflection forms of the lemma.

**_search-result-form_** optional attribute indicates a user visible string that represents the _search-form_. This is used when the search key string indicated by the _value_ attribute is not appropriate to show matches of a search. For example when the search is done using the pronunciation of the word such as Japanese yomi and Chinese pinyin, the matching entries will be shown by means of the lemma rather than the pronunciation associated with it.

**_phonogram_** optional attribute a user visible string that is shown together with the _search-result-form_ to help users to identify an article. The intended use is to store Japanese yomi and Chinese Pinyin.

(describe here how the _value_, _lemma_, _search-result-form_, and _search-result-form-supplement_ iterate each other. These attributes need a bit more polish.)

**_href_** optional attribute indicates a location within the corresponding article. It is used to define a search form that points to a part of the corresponding article. For example it might point to a specific sense, an idiom or a derivative. It can be a regular URL or a epubcfi. In all cases the path will be relative to the article. It can be a range using epubcfi, and in such a case the reading system can choose to highlight the indicated portion of the article rather than just jumping to it. When _href_ is missing the search form points to the beginning of the article.


---

## TO DOs ##
  * Need schema for validation (Markus can work on this with Kida)
  * Look at proposals from the Index subgroup to see if there are anything we can take advantage of.
  * Obtain concrete performance numbers of building a binary index. probably with sqlite and with marisa.
  * Does it need to identify main search-forms of the entry? Similarly, it might be useful if a reading system can tell if a search-form is either main entry, idiom, derivatives, etc?
  * √ It needs to work with grosseries or other general case that do not have explicit `<`**_article_**`>` structure.
  * √ Put aside the parental-controls issue for the moment, come back to it later. Could have a “register” attribute that takes any value; this would describe the dictionary data rather than a software feature, making this a local dictionary issue rather than a global one
  * √ Rename **_index_** element to **_search-index_**
  * √ Markus would recommend changing **_article_** to avoid conflict/overlap with HTML. Kida will think about what to call this (**_entry_**, **_article-index_** or the like).
  * √ More polish on attributes of _search-form_ element.
  * √ Define multiple indexes for bilingual dictionary (or other cases).

Meta data To Dos
  * Need to have a mimetype included in the package file
  * Need to have specification language to integrate this into core epub mimetypes and to define the fallback mechanism

Notes
  * Each separate search-index, whether for a glossary, part of a bilingual dictionary, etc., should be in its own file.


---

## Change History ##
Ordered from more recent changes.
#### 1/4 01:30 CIT UTC+8 (kida) ####
Renamed **_article_** element to **_article-index_**.
Added support for general case that do not have explicit article structure.

#### 12/18 15:36 PST (kida) ####
Renamed **_index_** element to **_search-index_**.


---

#### 11/20 9:40 PST (kida) ####
Added **_xml:lang_** attribute to the **_index_** element. Added **Packaging** section.

#### 11/20 9:40 PST (kida) ####
Changed from "canonical-form" to "headword", which is more clear.
Changed from "search-result-form-supplement" to "phonogram".

#### 11/12 9:55 PST (kida) ####
Added _lemma_ attribute to the _search-form_ element.


---


#### 11/12 9:05 PST (kida) ####
Changed the term "Index" to "Search Index" to avoid confusion with the human readable index that the Index subgroup is working on.

#### 11/8 9:55 PST (kida) ####
Added href as an attribute of the article element so the reading system can locate the article is in the dictionary content documents. Removed article\_id attribute in favor of href.

#### 11/8 9:35 PST (kida) ####
Clarified if an attribute is intended as user visible.

#### 11/8 9:30 PST (kida) ####
Added "canonical-form" attribute to the article element. The intent is to allow reading system to show the headword when one of inflection, derivatives or idioms are typed.

e.g. when a user typed "show" it might have these matches. The reading system can indicate the headword in addition to the match.


> <font face='serif'><font size='3'>show one's true colors</font> <font color='#777777'>→ color</font></font><br>
<blockquote><font face='serif'><font size='3'>show up</font> <font color='#777777'>→ show</font></font><br></blockquote>


Removed from the color example "search-result-form" in favor of "canonical-form" as it better describes the entry. The "search-result-form" is still necessary for the case the match itself is very different from what is typed for example for the Japanese and Chinese case.