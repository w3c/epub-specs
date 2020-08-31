This page discusses the HTML5 elements and attributes that can be used to markup the model(s) defined by the Dictionaries WG. It is based on the W3C [HTML5 specification](http://www.w3.org/TR/html5/) (which is still a work in progress and released as a Working Draft from 20 March 2012 at the time of writing).

Note: though not comprehensive and not maintained by the W3C, the simpler [Web Developer version](http://developers.whatwg.org/) of the HTML5 spec has a nice layout for on-screen reading.



# Entries #

This section presents the pros and cons of various approaches that have been discussed for marking-up an "entry" within a dictionary and/or a glossary.

**Note**: On the [August 14 concall](https://docs.google.com/document/d/1tdCUak30UfjHHlMVg7ZJTecoN0x8UE2ijZf7MeZVMEg/edit), we reached a working consensus that the `article` element best suited our purposes. Please refer to the [Using the article element](http://code.google.com/p/epub-revision/wiki/DictionariesMarkup#Using_the_article_element) section below for a summary of our current approach. Prior to this decision, the [`section`](http://www.w3.org/TR/html5/the-section-element.html#the-section-element) element was ruled out on the [Aug 7th concall](https://docs.google.com/document/d/1tENhGOIbHmkCiLqEgTCZeJrvuA0rbvmCIApwxf2-fas/edit), since it doesn't offer any advantage over the more specialized [`article`](http://www.w3.org/TR/html5/the-section-element.html#the-article-element) element.

## @epub:type ##

It could make sense to define a specific vocabulary term for a dictionary _entry_ (e.g. "dictentry"), to be declared as a semantic inflection with the `@epub:type` attribute. The property can alternatively be implied depending on the markup used to represent the entry and its ancestors. For instance if we decide that a dictionary (section) must have an epub:type="dictionary", it can be implied that all its `article` children are therefore entries in which case an `@epub:type="dictentry"` would be redundant:

```
<body epub:type=”dictionary”>
	<article><!-- @epub:type="dictentry" is implied because of the body epub:type  -->
		...
	</article>
</body>
```

For glossaries, the [EPUB 3 Structural Semantics Vocabulary](http://idpf.org/epub/vocab/structure/#h_glossaries) define the terms _glossary_, _glossterm_ and _glossdef_. It shall be noted that there is no term for the "entry" itself, probably because the typical way of representing a glossary is with a `dl` element where there is no element containers for entries. The WG could either extend the vocabulary with a "glossentry" term or keep status quo.

## Using the `article` element ##

See the specification of the HTML [`article`](http://www.w3.org/TR/html5/the-section-element.html#the-article-element) element:

> The article element represents a self-contained composition in a document, page, application, or site and that is, in principle, independently distributable or reusable, e.g. in syndication. This could be a forum post, a magazine or newspaper article, a blog entry, a user-submitted comment, an interactive widget or gadget, or any other independent item of content.

Example (the inner content model is subject to change, it's not the point of this example):

```
<article epub:type="dictentry">
	<h1><dfn>lie</dfn><sup>2</sup></h1>
	<p>The act of not sticking to truthiness</p>
</article>
```


Pros:
  * semantically represents a self-contained piece of content.
  * in principle distributable or reusable (fits well in the use case where an entry is extracted/isolated from the dictionary, e.g. the result of a lookup).
  * as a _sectioning content_, it takes part of the [HTML5 outline](http://www.w3.org/TR/html5/headings-and-sections.html#outlines)
  * very open content model (any _flow content_), allowing the representation of complex entries and corner cases.
  * container element for the entry

Cons:
  * no particular "term/definition" semantics
  * takes part of the HTML5 outline (this might be unwanted)

## Using the `dl` element ##

See the specification of the HTML [`dl`](http://www.w3.org/TR/html5/the-section-element.html#the-dl-element) element (see also [`dt`](http://www.w3.org/TR/html5/the-section-element.html#the-dt-element) and [`dd`](http://www.w3.org/TR/html5/the-section-element.html#the-dd-element)):

> The dl element represents an association list consisting of zero or more name-value groups (a description list). (...) Name-value groups may be terms and definitions, metadata topics and values, questions and answers, or any other groups of name-value data.

### Entry = `dt`/`dd` group ###

Example (adapted from the HTML5 spec):

```
<dl>
	<dt><dfn>happiness</dfn></dt>
	<dd epub:type="pronunciation">/'hæ p. nes/</dd>
	<dd epub:type="part-of-speech"><i><abbr>n.</abbr></i></dd>
	<dd>The state of being happy.</dd>
	<dd>Good fortune; success. <q>Oh <b>happiness</b>! It worked!</q></dd>
	<dt><dfn>rejoice</dfn></dt>
	<dd epub:type="pronunciation">/ri jois'/</dd>
	<dd><i epub:type="part-of-speech"><abbr>v.intr.</abbr></i> To be delighted oneself.</dd>
	<dd><i epub:type="part-of-speech"><abbr>v.tr.</abbr></i> To cause one to be delighted.</dd>
</dl>
```

Pros:
  * native "term/definition" semantics
  * good fit for a simple name/values list

Cons:
  * not part of the HTML5 outline
  * no element container for the entry
  * constrained content model: a `dl` can only contain `dt` or `dd` elements

### Entry = `dl` ###

Example:

```
<dl epub:type="dictentry">
	<dt><dfn>lie</dfn><sup>1</sup></dt>
	<dd>To rotate oneself 90 degrees towards the horizontal plane</dd>
</dl>
<dl epub:type="dictentry">
	<dt><dfn>lie</dfn><sup>2</sup></dt>
	<dd>The act of not sticking to truthiness</dd>
</dl>
```

Pros:
  * native "term/definition" semantics
  * good fit for a simple name/values list
  * container element for the entry

Cons:
  * not part of the HTML5 outline
  * constrained content model: a `dl` can only contain `dt` or `dd` elements

### Entry = `article`, `dl` = internal entry structure ###

This approach would use `<article>` as the entry container. It would be required to contain at least one `<dl>`, which would provide structure for the main, top-level components of the entry. (Note: `<dd>` has a flow content model, so multiple approaches are possible for content nested within a `<dd>`.)

```
<article epub:type="dictentry">
	<dl>
                <dt><dfn>lie</dfn><sup>2</sup></dt>
        	<dd epub:type="dict:sense">The act of not sticking to truthiness</dd>
                <dt epub:type="dict:phrases"><dfn>lie through one's teeth</dfn></dt>
                <dd epub:type="dict:sense">To violate truthiness flagrantly and shamelessly</dd>
        </dl>
</article>
```

Pros:
  * semantically represents a self-contained piece of content.
  * in principle distributable or reusable (fits well in the use case where an entry is extracted/isolated from the dictionary, e.g. the result of a lookup).
  * as a _sectioning content_, it takes part of the [HTML5 outline](http://www.w3.org/TR/html5/headings-and-sections.html#outlines)
  * container element for the entry
  * native "term/definition" semantics

Cons:
  * takes part of the HTML5 outline (this might be unwanted)
  * constrained content model: a `dl` can only contain `dt` or `dd` elements (eg, we would not be able to use nested `<section>` as a container for a phrase and its definitions)

### Potential issues with `dl`/`dt`/`dd` ###

#### Structuring and semantics of `dd`s within a `dt`/`dd` group ####

A dictionary entry often cannot be simplified as a term+values group, it usually has a deeper structure. Consider for instance the following structure:

  * headword
    * pronunciation
    * etymology
    * part of speech 1 (e.g. verb)
      * meaning 1
      * meaning 2
    * part of speech 2 (e.g. noun)
      * meaning 1
      * meaning 2
    * phrases
      * phrase 1
      * phrase 2

Whether the entry is marked up as a `dl` or a `dt`/`dd` group, each "part" of the entry would need to be marked up with `dd` elements with a custom semantic inflection. Note that nested `dl` could be used within the entry sub-parts.

Example:

```
<dl>
	<dt><dfn>lie</dfn><sup>1</sup></dt>
	<dd epub:type="dict:pronunciation">/laɪ̯/</dd>
	<dd epub:type="dict:etymology">from Old English lēogan (“to lie”)</dd>
	<dd epub:type="dict:meanings">
		<dl>
			<dt>verb</dt>
			<dd>To give false information intentionally</dd>
			<dd>To convey a false image or impression</dd>
			<dt>noun</dt>
			<dd>An untrue statement.</dd>
		</dl>
	</dd>
	<dd epub:type="dict:phrases">
		...
	</dd>
</dl>

```

Note that the semantics of `dd` in the HTML5 spec is slightly ambiguous. In the `dl` element, it is stated that "values within a groups are alternatives; multiple paragraphs forming part of the same value must all be given within the same dd element", which would not really apply to the solution in the example above. Some examples in the spec however use the approach above where `dd`s are used with semantic inflections and not as "alternatives".

_Alternate perspective on the above issue (Jeff):_

When there are both multiple parts of speech and phrases present, it is more common for the phrases to be grouped with their relevant part of speech:

  * headword
    * pronunciation
    * etymology
    * part of speech 1 (e.g. verb)
      * meaning 1
      * meaning 2
      * phrase 1
    * part of speech 2 (e.g. noun)
      * meaning 1
      * meaning 2
      * phrase 1
      * phrase 2

Further, while using "verb" or "noun" as the `<dt>` contents may strictly meet the definition of a name:value pair, it does seem a bit odd. It would be possible instead to have these parts of speech be `<dd>` contents, with the senses structured under each using `<p>`, `<div>`, or `<ol>` with the epub:type attribute. A `<dl>` would then only be needed when a new term occurs; the term would be captured in `<dt>`, and its definition or translation in `<dd>`.

Here is an example that shows phrases nested under the appropriate part of speech, and shows alternative approaches to marking up the nested senses:

```
<dl>
	<dt><dfn>lie</dfn><sup>1</sup></dt>
	<dd epub:type="dict:pronunciation">/laɪ̯/</dd>
	<dd epub:type="dict:etymology">from Old English lēogan (“to lie”)</dd>
	<dd><span epub:type="part-of-speech">verb</span>
		<ol start="1">
			<li epub:type="dict:sense">To give false information intentionally</li>
			<li epub:type="dict:sense">To convey a false image or impression</li>
                </ol>
                <dl epub:type="dict:phrases">
                        <dt><dfn>lie through one's teeth</dfn></dt>
                        <dd epub:type="dict:sense">To violate truthiness flagrantly and shamelessly</dd>
                </dl>
        </dd>
        <dd><span epub:type="part-of-speech">noun</span>
                <p epub:type="dict:sense">An untrue statement.</p>
                <dl epub:type="dict:phrases">
                        <dt><dfn>give the lie to</dfn> <i>(formal)</i></dt>
                        <dd epub:type="dict:sense">to show that (something) is not true</dd>
                        <dt><dfn>I tell a lie</dfn> <i>(Brit, informal)</i></dt>
                        <dd epub:type="dict:sense">used to correct something you have just said</dd>
		</dl>
	</dd>
</dl>

```

#### lack of container element for `dt`/`dd` groups ####

In a `dl`, one or several `dt` elements followed by one or several `dd` elements form an implicit group (named a name/values group) but there is no container element for the group itself. It can be problematic for group-level metadata (e.g. language) or content (e.g. heading text), which would have to be placed either on the `dt` or within a specialized `dd` element. See the specialized "etymology" and "pronunciation" `dd` elements in the example above.

Using a single `dl` element per entry removes this limitation at the entry-level, but the same issue occurs for sub-parts within the entry. The only solution is to use a `dd` as a structuring element as in the example above.

#### the impossibility of using anything other than `dt`/`dd` in a `dl` ####

The content model of the `dl` element is limited to `dt` and `dd` children. It can make it difficult for a publisher to find the appropriate markup when "glue content" is wanted between elements.

For instance the following pseudo-markup:

```
<entry>
	<headword>color</headword> or (UK) <headword>colour</headword>
	...
</entry>
```

Could be translated like this at the cost of pruning the glue text:

```
<dl>
	<dt lang="en-US">color</dt>
	<dt lang="en-GB">colour</dt>
	<dd>...</dd>
</dl>
```

Or like this at the cost of merging the "two" headwords in a single `dt`:

```
<dl>
	<dt><dfn lang="en-US">color</dfn> or (UK) <dfn lang="en-GB">colour</dfn></dt>
	<dd>...</dd>
</dl>
```

The above solution would work reasonably well, but we might face situations were some "glue content" might not fit well in the constrained content model. To be investigated.

#### default rendering of `dl`/`dt`/`dd` ####

Browsers support the `dl` element with a default rendering that works well for simple name/values list. But for more complex structures, especially when `dd` elements start to be used for sectioning, the default rendering would certainly need to be overridden with custom styling anyway.

# Headwords and search metadata #

## The headword ##

The word _headword_ refers to a term defined in a dictionary entry. Typically, a headword is visually set off from other entry content in some manner, for instance, use of boldface or a larger relative type size.

The headword's presentation in the entry must convey the word's spelling to the reader. In addition, publishers often convey other useful information (such as syllable division, pronunciation, or grammatical features) via special marks on the headword. Hereafter we call the headword as rendered in the content, possibly containing additional information not part of its normal written form, its _entry display form_. We call the headword's normal written form, unadorned by any additional marks, its canonical form_. Though the two may be identical, in many cases they are not; our approach to EPUB dictionary markup allows them to be distinguished when necessary._

### `<dfn>` element ###

In [HTML5](http://www.w3.org/TR/2010/WD-html5-20100624/text-level-semantics.html#the-dfn-element), "the `<dfn>` element represents the defining instance of a term", a meaning equivalent to the lexicographic term _headword_. In EPUB3 Content Documents, when the `<dfn>` element is used in an `<article>` containing a dictionary or other lexical entry [<i>note: article semantics to be defined</i>], it represents a headword and must be processed as such by a conforming reading system.

The `<dfn>` element must be used to mark up each headword defined in an entry. Its text node contains the entry display form to be rendered to the user.

A valid entry must contain one or more `<dfn>` elements.

A `<dfn>` may occur anywhere in the entry, as long as it conforms to the HTML5 [requirement](http://www.w3.org/TR/2010/WD-html5-20100624/text-level-semantics.html#the-dfn-element) that the "paragraph, description list group, or section that is the nearest ancestor of the dfn element must also contain the definition(s) for the term given by the dfn element". In most cases, this simply means that the nearest ancestor element of a `<dfn>` should be the `<article>` element that encloses the entry. [_note: phrases at end of entry are likely exception; to be covered later_]

#### Semantics of `title` attribute ####

The optional `title` attribute carries special semantics when used with `<dfn>`.
  * When the text node of `<dfn>` corresponds to the canonical form, the use of `title` is not required.
  * When the text node of `<dfn>` does not correspond to the headword's canonical form, then the canonical form must be supplied in the `title` attribute.

In the following example, there are two dfns, neither of which has a title attribute:

```
  <dfn>colour</dfn> (<i>US</i> <dfn>color</dfn>)
```

Since each `<dfn>` contains only the canonical form of the headword and no other content, the `title` attribute is not needed. (Also note that though the above presentation conveys that the first headword given is the standard spelling for the dictionary's audience, both headwords are marked up identically.)

If, however, the text node of `<dfn>` contains any character not part of the headword's normal written form (such as a homograph indicator, syllable divider, pronunciation symbol, or the like), then the `title` attribute must be used to supply the canonical form. This usage is in line with the [HTML5 spec](http://www.w3.org/TR/2010/WD-html5-20100624/text-level-semantics.html#the-dfn-element), which states that "if the dfn element has a title attribute, then the exact value of that attribute is the term being defined", and further restricts the `title` attribute in the dfn context by stating that "it must contain only the term being defined".

In the following example, the publisher uses the middle dot character (U+00B7) to show a headword's syllable divisions to the reader. As this mark is not actually part of the headword's spelling, the content document's author must provide the canonical form of each headword in a `title` attribute:

```
  <dfn title="color">col·or</dfn> (<i>chiefly British</i> <dfn title="colour">col·our</dfn>)
```

In the following German example, the publisher uses underlining to indicate that a syllable is pronounced with a long vowel, and the | character to indicate the part of the word used in forming compounds. As in the preceding example, the canonical form of the headword is provided in the `title` attribute:

```
  <dfn title="ausgehen"><u>au</u>s|gehen</dfn> 
```

### Summary ###

  * Each headword in an entry must be marked up with the `<dfn>` element.
  * At least one `<dfn>` must be present in an entry.
  * The text node of the `<dfn>` element contains the entry display form of the headword, that is, the form the reading system displays to the user in rendering the content document.
  * The canonical form of the headword is given in the `title` attribute of `<dfn>`, if present; otherwise, when no `title` attribute is present, the text node of `<dfn>` represents the canonical form.

## Search metadata ##

### Search groups and search forms ###

The headword and all its search forms related to it form a _search group_, which we mark up in a `<span>` element with `epub:type`:

`<span epub:type="search-group">...</span>`

This grouping contains not only the forms that should be matched by a reading system during word lookup, but information on how the match should be presented to the user in search results.

Search forms are marked up with the HTML5 `<data>` element in conjunction with epub:type:

`<data epub:type="search-form" value="..."/>`

Search forms may represent diverse types of words: the headword itself, the headword's inflected forms, the headword written in another writing system (Japanese _hiragana_, for instance), an outdated spelling of the headword not presented in the content, etc. This markup approaches treats these different word types in a uniform manner since their functional importance is the same: they all represent word forms that should be matched by a reading system when a user looks them up.

The `<data>` element allows us to embed machine-readable search information in a content document while keeping it separate from content presented to the user. (Note: the `<data>` element is detailed in the [WHATWG HTML5 spec](http://www.whatwg.org/specs/web-apps/current-work/multipage/text-level-semantics.html#the-data-element).)

```
<span epub:type="search-group">
  <dfn title="...">...</dfn>
  <data epub:type="search-form" value="..."/>
</span>
```

A dictionary entry must contain at least one `search-group`. Each search group consists of one `<dfn>` element and at least one `search-form`.

The following is a simple example of the use of the `search-group`. This entry contains two search groups, each corresponding to a headword with two associated search forms. On a user lookup of a word contained in the `value` of a `<data epub:type=search-form">` element, a reading system must match the `<article>` containing this `search-form` and make it available to the user.

```
<body epub:type="dictionary">
  <article>
    <span epub:type="search-group">
      <dfn title="color">col·or</dfn>
      <data epub:type="search-form" value="color"/>
      <data epub:type="search-form" value="colors"/>
    </span>
    or (UK)
    <span epub:type="search-group">
      <dfn title="colour">col·our</dfn>
      <data epub:type="search-form" value="colour"/>
      <data epub:type="search-form" value="colours"/>
    </span>
    <p><i>noun</i> : a phenomenon of light (as red, brown, pink,
    or gray) or visual perception that enables one to differentiate 
    otherwise identical objects</p>
  </article>
</body>
```

### Search result forms and `title` attribute ###

In a dictionary word lookup implementation, some reading systems may wish to present a list of matching search results to the user before presenting the entry content. While in many cases displaying the headword is sufficient, in other contexts it is not. Hence, we allow for a distinct _search results form_, which lets the publisher make it clear to the user which headword has been matched.

A search results form for the entire `search-group` may be given via a `title` attribute on the `<span epub:type="search-group">` element. This value applies to the entire group.

A search results form for a particular `<data epub:type="search-form">` element may be given in a `title` attribute. If the parent `<span>` element also bears such an attribute, then the value of the `<data>` element's `title` attribute overrides it.

In the following example, we have two homograph entries for the English word "lie". Here, the publisher uses the `title` attribute of `<span>` to add a gloss to the search results form that will help the user disambiguate these two entries.

```
<article>
  <span epub:type="search-group" title="lie (verb: recline)">
    <dfn title=”lie”>lie<sup>1</sup></dfn>
    <data epub:type="search-form" value=”lie”/>
    <data epub:type="search-form" value=”lies”/>
    <data epub:type="search-form" value=”lay”/>
    <data epub:type="search-form" value=”lain”/>
    <data epub:type="search-form" value=”lying”/>
  </span>
  <p>To rotate oneself 90 degrees towards the horizontal plane</p>
</article>

<article>
  <span epub:type="search-group" title="lie (verb: not tell the truth)">
    <dfn title=”lie”>lie<sup>2</sup></dfn>
    <data epub:type="search-form" value=”lie”/>
    <data epub:type="search-form" value=”lies”/>
    <data epub:type="search-form" value=”lied”/>
    <data epub:type="search-form" value=”lying”/>
  </span>
  <p>The act of not sticking to truthiness</p>
</article>
```

For a reading system that presents a list of results when a lookup has more than one match, a user lookup of the word "lies" would then result in this list:

```
  lie (verb: recline)
  lie (verb: not tell the truth)
```

In the below Japanese example, the two entries have distinct ideographic (ie, _kanji_) headwords with identical phonetic (ie, _hiragana_) spellings. Both the ideographic and phonetic forms are valid ways of writing the word and need to be  given as `search-form`s that can be matched during lookup or text input searches.

The first entry specifies a search results form in the `title` attribute of `<span>` (the same method used in "lie" above), while the second entry shows how the same result can be achieved using the `title` attribute of `<data>`.

```
<article>
  <span epub:type="search-group" title="橋 (はし)"><!--combined ideographic (phonetic) search results form-->
    <dfn>橋</dfn><!--ideographic headword-->
    <data epub:type="search-form" value="橋"/><!--ideographic search form-->
    <data epub:type="search-form" value="はし"/><!--phonetic search form-->
  </span>
  <p>1. bridge</p>
</article>

<article>
  <span epub:type="search-group">
    <dfn>端</dfn><!--ideographic headword-->
    <data epub:type="search-form" title="端 (はし)" value="端"/><!--ideographic search form with search results form-->
    <data epub:type="search-form" title="端 (はし)" value="はし"/><!--phonetic search form with search results form-->
  </span>
  <p>1. edge, end 2. beginning, first</p>
</article>
```

Here the two methods are interchangable. The important point to note is that they can be used in conjunction as well: a general `title` attribute can be given on `<span>`, while a search results form specific to a `search-form` can be given in the `title` attribute of a particular `<data>` element.

### Summary ###

  * The `<span epub:type="search-group">` serves to group together the `<dfn>` and other search data.
  * The `value` attribute of `<data epub:type="search-form">` provides forms that should be matched by a reading system during user word lookup.
  * When a word lookup results in a match, the _search results form_  presented to the user in any menu/result list is represented by the contents of the `title` attribute of `<data epub:type="search-form">, if present; otherwise, it is represented by the `title` attribute of `<span epub:type="search-group">.

# Miscellaneous semantics #

The following optional semantic properties could be marked up within a dictionary or glossary entry using EPUB3 vocabulary terms proposed below. In this scheme, they would generally be allowed as epub:type values on any element within an entry, with a few exceptions noted below.

The proposed uses of each semantic are supplied at the end of the description. These are limited to _accessibility_, _disambiguation in search results_, and _filtering of entry details_ (which relates to items 8 and 9 in our use case spreadsheet).

## Note on semantic inflections and accessibility ##

Individual semantic inflections do not provide enhanced accessibility _ex nihilo_: by default Reading Systems must ignore all semantics they don't understand or don't have built-in processing for. However, they generally _enable_ the implementation of accessibility features on Reading Systems that support them.

A well-known "standard" vocabulary (as opposed to a "custom" or "publisher-defined" vocabulary) increases the likelihood of support of these semantic inflections by reading systems.

Features enabled by accurate semantic inflections include:
  * improved navigability, if supported by Reading Systems. E.g. skippability (the ability to ignore a structure) and escapability (the ability to move out of a chunk of content).
  * the definition of custom stylesheets relying on @epub:type and that work across publications - such stylesheets can be used for accessibility purposes to add contrasts, visual cues, etc.
  * audio cues/announcements: a TTS-enabled reading system or Media Overlays production tool can use semantic inflections to "announce" what is going to be read next.
  * better republishing (creation of other format out of an EPUB source ; although EPUB is not intended to be a source format, the situation practically happens)/

Note that the features listed above not only address accessibility concerns but also improve the general user experience.

## Phonetic Transcription ##

  * epub:type="phonetic-transcription"
  * One or more written phonetic transcriptions for a headword.
  * As the pronunciation is written out using phonetic symbols, its use is limited to sighted users. A screen reader can ignore text marked up with `epub:type="phonetic-transcription"`.
  * For accessibility, the `ssml:ph` attribute should be used to supply a phonetic string on the `<dfn>` element whenever a particular headword spelling has multiple possible pronunciations. This ensures the headword is pronounced correctly when the entry is read aloud by a screen reader.
  * Uses: filtering of entry details; audio cues

## Etymology ##

  * epub:type="etym"
  * An explanation of the historical origin of a headword, eg, a statement that it is derived from a particular Latin word.
  * Uses: filtering of entry details; audio cues

## Part of Speech ##

  * epub:type="pos"
  * A label indicating the grammatical function of the headword (noun, verb, adjective, interjection, transitive verb, reflexive verb, etc.); can apply to the entire entry, a certain set of senses (see _pos-group_), or to a run-on headword.
  * Any value supplied by the publisher here is valid; in other words, there is no enumerated list of acceptable values.
  * Is not required to be nested within a _pos-group_.
  * Uses: disambiguation in search results; entry navigation; filtering of entry details; audio cues

## Grammatical Information ##

  * epub:type="gram-info"
  * A container for grammatical information not included in the _pos_ semantic. This could be information following the part of speech but not strictly part of it (such as a note stating the headword is always used in the plural), or it could be grammar information specific to another semantic element in the entry (such as a note in a _sense-group_ stating the headword is always used in the plural when expressing that particular meaning).
  * Uses: entry navigation; audio cues; filtering of entry details

## Part of Speech Group ##

  * epub:type="pos-group"
  * A unit for organizing information pertaining to a particular part of speech
  * Uses: entry navigation; audio cues; filtering of entry details

## Sense Group ##

  * epub:type="sense-group"
  * A unit for organizing information pertaining to a particular sense, or meaning, of a headword or idiom.
  * Uses: entry navigation; audio cues; filtering of entry details

## Phrase Group ##

  * epub:type="phrase-group"
  * A unit for organizing information pertaining to a phrase.
  * Should contain a `<dfn>` or an element bearing the _idiom_ or _ex_ (example) semantic.
  * Uses: entry navigation; audio cues; filtering of entry details

### Sequence Number ###

  * epub:type="snum"
  * A number or letter identifying a particular _sense-group_ or _pos-group_ in a sequence of like items.
  * Should always be nested within epub:type="sense-group" or epub:type="pos-group".
  * Uses: entry navigation; audio cues; filtering of entry details

### Definition ###

  * epub:type="def"
  * An explanation of the meaning of a particular sense of a headword.
  * Should always be nested within epub:type="sense-group" or epub:type="phrase-group".
  * Uses: filtering of entry details; audio cues

### Translation ###

  * epub:type="trans"
  * In a bilingual dictionary, the translation of a particular sense of a source language headword into the target language.
  * Should always be nested within epub:type="sense-group" or epub:type="phrase-group".
  * Uses: filtering of entry details; audio cues

### Translation Information ###

  * epub:type="trans-info"
  * In a bilingual dictionary, a container for various types of information on a _trans_: grammatical (eg, gender of a noun), register (eg, "offensive"), regional usage, etc. This can also be thought of as a metadata container for a translation.
  * Should always be nested within epub:type="sense-group" or epub:type="phrase-group".
  * Uses: filtering of entry details; audio cues

### Example ###

  * epub:type="ex"
  * A sentence or phrase illustrating the usage of a headword in a particular meaning.
  * Should always be nested within epub:type="sense-group" or epub:type="phrase-group".
  * Uses: filtering of entry details; audio cues; entry navigation

### Idiom ###

  * epub:type="idiom"
  * A phrase whose overall meaning cannot be determined from the meanings of its constituent words.
  * Should always be nested within epub:type="sense-group" or epub:type="phrase-group".
  * Uses: highlighting of search match; filtering of entry details; audio cues; entry navigation

## Synonym Group ##

  * epub:type="syn-group"
  * A group of terms with identical or similar meaning to the headword.
  * Uses: entry navigation; audio cues

## Antonym Group ##

  * epub:type="ant-group"
  * A group of terms with opposite sense or meaning to the headword.
  * Uses: entry navigation; audio cues


## Change History for Miscellaneous Semantics ##

**Nov 12  10:43 PM EST (JA)**

Added _gram-info_ and _trans-info_ semantics.

**Nov 12 9:16 PM EST (JA)**

Added _phrase-group_, _idiom_, _pos-group_ semantics. Reorganized list. Edited _pron_ description.

**Nov 12 8:30 PM EST (JA)**

Changed _sensenum_ to _snum_, _sense_ to _sense-group_, _syn_ to _syn-group_, _ant_ to _ant-group_; revised definitions accordingly. Revised "Uses" for all semantics. Specified that semantics that can be nested in "sense-group" can also be nested in "phrase-group".