# Dictionaries Pseudomarkup Sandbox #

Current status: determining whether to use Approach 4 (search metadata separated from rendering content) or Approach 5 (embedded in rendering content).

Approaches 1 - 3 have been superseded by these proposals.

# Approach 5 (Embedding index in rendering contents) #

## English: COLOUR ##

```
<entry>
    <search-form-group search-results-form="colour">
        <!-- CONTENT -->
        <headword>colour</headword>
        <!-- INDEX -->
        <search-form value="colour"/>
        <search-form value="colours"/>
        <search-form value="school colours"/>
    </search-form-group>
    <!-- CONTENT -->
    |ˈkʌlə| (<i>US</i>
    <search-form-group search-results-form="color">
        <!-- CONTENT -->
        <headword>color</headword>
        <!-- INDEX -->
        <search-form value="color"/>
        <search-form value="colors"/>
        <search-form value="school colors"/>
    </search-form-group>
    <!-- CONTENT -->
    ) ▶ <i>noun</i>
    …
    (also <span class="run-in_headword">school colours</span>) a badge, cap, or other item in the distinctive colours of a particular school
    …
    <!-- IDIOM -->
    <search-form-group search-results-form="lend (or give) colour to">
        <!-- CONTENT -->
        <headword>lend (or give) colour to</headword>
        <!-- INDEX -->
        <search-form value="lend colour to"/>
        <search-form value="give colour to"/>
    </search-form-group>
    <!-- CONTENT --> 
    make something seem true or probable
    …
    <!-- IDIOM -->
    <search-form-group>
        <!-- CONTENT -->
        <headword>sail under false colours</headword>
        <!-- INDEX -->
        <search-form value="sail under false colours"/>
    </search-form-group>
    <!-- CONTENT --> 
    disguise one's true nature or intentions
    …
    <!-- IDIOM sections for "show one's true colours", "under colour of", etc.-->
    …
</entry>
```

  * _search-form-group_ groups multiple search forms.
  * _search-results-form_, if present, will be used to represent the entry for the search. If missing the search form value will be used.
  * Unlike in Approach 4, there is no _href_ pointing to an entry or a part of the entry, as index / search metadata occurs at the target location.

## Japanese: 赤い・紅い (red) ##

```
<entry>
    <search-form-group>
        <!-- CONTENT -->
        <headword>あかい【赤い・紅い】</headword>
        <!-- INDEX -->
        <search-form value="あかい" search-results-form="赤い【あかい】"/>
        <search-form value="あかい" search-results-form="紅い【あかい】"/>
        <search-form value="赤い" search-results-form="赤い【あかい】"/>
        <search-form value="紅い" search-results-form="紅い【あかい】"/>
    </search-form-group>
    <!-- CONTENT -->
    （形）《文クあかし》
    …
</entry>
```

  * _search-results-form_, if present, provides a way to differentiate multiple entries.
> > Note that here it is specified on the `<search-form>` rather than `<search-form-group>`,
> > allowing an individual _search-results-form_ to be specified for each value.

## English: LIE 1 & 2 ##

```
<entry>
    <search-form-group search-results-form="lie (recline)">
        <!-- CONTENT -->
        <headword canonical-form="lie">lie<sup>1</sup></headword>
        <!-- INDEX -->
        <search-form value="lie"/>
        <search-form value="lies"/>
        <search-form value="lay"/>
        <search-form value="lying"/>
        <search-form value="lain"/>
    </search-form-group> |lʌɪ| ▶ <i>verb</i>
    …
    <!-- IDIOM -->
    <search-form-group>
        <!-- CONTENT -->
        <headword>let something lie</headword>
        <!-- INDEX -->
        <search-form value="let something lie"/>
    </search-form-group>
    <!-- CONTENT -->
    take no action regarding a problematic matter
    …
    <!-- IDIOM sections for "lie heavy on one", "lie in state", etc.-->
    …
</entry>

<entry>
    <search-form-group search-results-form="lie (untruth)">
        <!-- CONTENT -->
        <headword canonical-form="lie">lie<sup>2</sup></headword>
        <!-- INDEX -->
        <search-form value="lie"/>
        <search-form value="lies"/>
        <search-form value="lied"/>
        <search-form value="lying"/>
    </search-form-group>
    <!-- CONTENT -->
    |lʌɪ| ▶ <i>noun</i>
    …
    <!-- IDIOM -->
    <search-results-group>
        <!-- CONTENT -->
        <headword>give the lie to</headword>
        <!-- INDEX -->
        <search-form value="give the lie to"/>
    </search-results-group>
    <!-- CONTENT -->
    serve to show that (something previously assumed to be the case) is not true
    …
    <!-- IDIOM sections for "I tell a lie", etc.-->
    …
</entry>
```

  * Here we differentiate between the two "lie" entries using only the _search-results-form_. Doing so is optional, but shown here to illustrate the capability.

## French: FAIRE ##

```
<entry>
	<search-form-group search-results-form="faire">
                <!-- CONTENT -->
                <headword>faire</headword>
                <!-- INDEX -->
		<search-form value="faire"/>
		<search-form value="fais"/>
		<search-form value="faisaient"/>
		<search-form value="faisais"/>
		<search-form value="faisait"/>
		<search-form value="faisant"/>
		<search-form value="faisiez"/>
		<search-form value="faisions"/>
		<search-form value="faisons"/>
		<search-form value="fait"/>
		<search-form value="faite"/>
		<search-form value="faites"/>
		<search-form value="faits"/>
		<search-form value="fasse"/>
		<search-form value="fassent"/>
		<search-form value="fasses"/>
		<search-form value="fassiez"/>
		<search-form value="fassions"/>
		<search-form value="fera"/>
		<search-form value="ferai"/>
		<search-form value="feraient"/>
		<search-form value="ferais"/>
		<search-form value="ferait"/>
		<search-form value="feras"/>
		<search-form value="ferez"/>
		<search-form value="feriez"/>
		<search-form value="ferions"/>
		<search-form value="ferons"/>
		<search-form value="feront"/>
		<search-form value="firent"/>
		<search-form value="fis"/>
		<search-form value="fisse"/>
		<search-form value="fissent"/>
		<search-form value="fisses"/>
		<search-form value="fissiez"/>
		<search-form value="fissions"/>
		<search-form value="fit"/>
		<search-form value="font"/>
		<search-form value="fîmes"/>
		<search-form value="fît"/>
		<search-form value="fîtes"/>
	</search-form-group>
        <!-- CONTENT -->
        <i>vt</i> {CONJUGATION 42}
        <span id="faire_1"></span>
        …
	<search-form-group search-results-form="se faire">
                <!-- CONTENT -->
                <headword>se faire</headword>
                <!-- INDEX -->
    	        <search-form value="se faire">
        </search-form-group>
        <!-- CONTENT -->
        <i>vr</i><br/><b>1</b> <b>ça ne se fait pas</b> : it's not done 
        …
</entry>
```

# Approach 4 (Separating index from the rendering contents) #

## English: COLOUR ##

```
<entry>
    <!-- INDEX -->
    <search-form-group search-results-form="colour">
        <search-form value="colour"/>
        <search-form value="colours"/>
        <search-form value="color"/>
        <search-form value="colors"/>
        <search-form value="school colours"/>
        <search-form value="school colors"/>
    </search-form-group>
    <search-form-group                            href="#colour_1_0" >
        <search-form value="lend colour to"/>
        <search-form value="give colour to"/>
    </search-form-group>
    <search-form value="sail under false colours" href="#colour_1_1"/>
    <search-form value="show one's true colours"  href="#colour_1_2"/>
    <search-form value="under colour of"          href="#colour_1_3"/>
    <search-form value="with flying colours"      href="#colour_1_4"/>
    <!-- CONTENT -->
    …
    <span id="colour_1_0"></span>
    …
</entry>
```

  * _search-form-group_ groups multiple search forms.
  * _search-results-form_, if present, will be used to represent the entry for the search. If missing the search form value will be used.
  * _href_ points to an entry or a part of the entry pointed by the index. If missing the surrounding element will be assumed. The actual format will be replaced by [epubcfi](http://idpf.org/epub/linking/cfi/epub-cfi.html).

## Japanese: 赤い・紅い (red) ##

```
<entry>
    <!-- INDEX -->
    <search-form value="あかい" search-results-form="赤い"  search-results-form-supplement="あかい"/>
    <search-form value="あかい" search-results-form="紅い"  search-results-form-supplement="あかい"/>
    <search-form value="赤い"                              search-results-form-supplement="あかい"/>
    <search-form value="紅い"                              search-results-form-supplement="あかい"/>
    <!-- CONTENT -->
    …
</entry>
```

  * _search-results-form-supplement_, if present, provides a way to differentiate multiple entries sharing the same _search-results-form_.

## English: LIE 1 & 2 ##

```
<entry>
    <!-- INDEX -->
    <search-form-group search-results-form="lie">
        <search-form value="lie"/>
        <search-form value="lies"/>
        <search-form value="lay"/>
        <search-form value="lying"/>
        <search-form value="lain"/>
    </search-form-group>
    <search-form value="let something lie"         href="#lie_1_0"/>
    <search-form value="lie heavy on one"          href="#lie_1_1"/>
    <search-form value="lie in state"              href="#lie_1_2"/>
    <search-form value="lie low"                   href="#lie_1_3"/>
    <search-form value="the lie of the land"       href="#lie_1_4"/>
    <search-form value="the lay of the land"       href="#lie_1_4"/>
    <search-form value="take something lying down" href="#lie_1_5"/>
    <search-form value="lie ahead"                 href="#lie_1_6"/>
    <search-form value="lie around"                href="#lie_1_7"/>
    <search-form value="lie about"                 href="#lie_1_7"/>
    <search-form value="lie behind"                href="#lie_1_8"/>
    <search-form value="lie in"                    href="#lie_1_9"/>
    <search-form value="lie off"                   href="#lie_1_10"/>
    <search-form value="lie over"                  href="#lie_1_11"/>
    <search-form value="lie to"                    href="#lie_1_12"/>
    <search-form value="lie up"                    href="#lie_1_13"/>
    <search-form value="lie with"                  href="#lie_1_14"/>
    <!-- CONTENT -->
    …
</entry>

<entry>
    <!-- INDEX -->
    <search-form-group search-results-form="lie">
        <search-form value="lie"/>
        <search-form value="lies"/>
        <search-form value="lied"/>
        <search-form value="lying"/>
    </search-form-group>
    <search-form value="give the lie to"           href="#lie_2_0"/>
    <search-form value="I tell a lie"              href="#lie_2_1"/>
    <search-form value="that's a lie"              href="#lie_2_1"/>
    <search-form value="lie through one's teeth"   href="#lie_2_2"/>
    <!-- CONTENT -->
    …
</entry>
```

  * _search-results-form-supplement_ can be used to differentiate between lie 1 and 2 (not shown)


## French: FAIRE ##

```
<entry>
    <!-- INDEX -->
	<search-form-group search-results-form="faire">
		<search-form value="faire"/>
		<search-form value="fais"/>
		<search-form value="faisaient"/>
		<search-form value="faisais"/>
		<search-form value="faisait"/>
		<search-form value="faisant"/>
		<search-form value="faisiez"/>
		<search-form value="faisions"/>
		<search-form value="faisons"/>
		<search-form value="fait"/>
		<search-form value="faite"/>
		<search-form value="faites"/>
		<search-form value="faits"/>
		<search-form value="fasse"/>
		<search-form value="fassent"/>
		<search-form value="fasses"/>
		<search-form value="fassiez"/>
		<search-form value="fassions"/>
		<search-form value="fera"/>
		<search-form value="ferai"/>
		<search-form value="feraient"/>
		<search-form value="ferais"/>
		<search-form value="ferait"/>
		<search-form value="feras"/>
		<search-form value="ferez"/>
		<search-form value="feriez"/>
		<search-form value="ferions"/>
		<search-form value="ferons"/>
		<search-form value="feront"/>
		<search-form value="firent"/>
		<search-form value="fis"/>
		<search-form value="fisse"/>
		<search-form value="fissent"/>
		<search-form value="fisses"/>
		<search-form value="fissiez"/>
		<search-form value="fissions"/>
		<search-form value="fit"/>
		<search-form value="font"/>
		<search-form value="fîmes"/>
		<search-form value="fît"/>
		<search-form value="fîtes"/>
	</search-form-group>
	<search-form value="se faire" href="faire_1"/>
    <!-- CONTENT -->
    …
    <span id="faire_1"></span>
</entry>
```

# Approach 3 #

  * The _display form_ of the headword is expressed in the text node of the `<headword>` element. This is how the user would view the headword when accessing the complete entry content.
  * The _canonical form_ is the standard spelling of the headword without any of the decoration (homograph, pronunciation, syllable markers) that might be present in the display form of the headword. This can be expressed as an optional _canonical-form_ attribute of `<headword>`. Reading systems can use this attribute to obtain the normative spelling of an entry headword for purposes such as identifying homograph entries. If no _canonical-form_ attribute is present, then the text node of `<headword>` represents the canonical form.
  * The _search results form_ is a presentation more suitable for search result display than the `<headword>` element's text node. It is expressed as an optional `<search-results-form>` element that is a child of `<headword>`. If no `<search-results-form>` is present, then the reading system should use the contents of `<headword>` in displaying search results. Possible uses include:
    * Specifying both the _kanji_ and _kana_ spellings for clarity in a Japanese dictionary;
    * Providing disambiguation information, such as homograph numbers, part of speech, or glosses.
  * The _search forms_ are captured as sibling `<search-form>` elements that are children of `<headword>`. Each valid match during a lookup or input search should be expressed in a `<search-form>`, whether it is an inflected form, headword displayed in the entry content, or an alternate spelling of the headword that may not be displayed in the entry content (eg, a _pinyin_ spelling of a Chinese headword). Thus, the reading system can find all relevant matches for a headword by examining `<search-form>` elements.
  * At least one `<headword>` element is **required** to be present in an entry, and each `<headword>` **must** contain at least one `<search-form>` child. Both the _canonical-form_ attribute of `<headword>` and the `<search-results-form>` element are **optional**.

```
<entry>
  <headword canonical-form=”lie”>lie<sup>1</sup>
    <search-results-form hidden="hidden">lie<sup>1</sup> (verb)</search-results-form>
    <search-form value=”lie”/>
    <search-form value=”lay”/>
    <search-form value=”lain”/>
    <search-form value=”lying”/>
  </headword>
  <definition>To rotate oneself 90 degrees towards the horizontal plane</definition>
</entry>
```

```
<entry>
  <headword canonical-form=”lie”>lie<sup>2</sup>
    <search-results-form hidden="hidden">lie<sup>2</sup> (verb)</search-results-form>
    <search-form value=”lie”/>
    <search-form value=”lied”/>
    <search-form value=”lying”/>
  </headword>
  <definition>The act of not sticking to truthiness</definition>
</entry>
```

```
<entry>
  <headword canonical-form="color">col*or <!--here * is used to separate syllables-->
    <search-results-form hidden="hidden">color</search-results-form>
    <search-form value="color"/>
    <search-form value="colors"/>
  </headword>
  or (UK)
  <headword canonical-form="colour">col*our
    <search-results-form hidden="hidden">colour</search-results-form>
    <search-form value="colour"/>
    <search-form value="colours"/>
  </headword>
</entry>
```

```
<entry>
  <headword canonical-form="橋">橋 (kanji ideograph) / はし (hiragana phonetic spelling)
    <search-results-form hidden="hidden">橋 (はし)</search-results-form>
    <search-form value="橋"/>
    <search-form value="はし"/>
  </headword>
   1. bridge
</entry>
```

```
<entry>
  <headword canonical-form="端">端 (kanji ideograph) / はし (hiragana phonetic spelling)
    <search-results-form hidden="hidden">端 (はし)</search-results-form>
    <search-form value="端"/>
    <search-form value="はし"/>
  </headword>
   1. edge, end 2. beginning, first
</entry>
```

# Approach 2 #

  * The _display form_ of the headword is expressed in the text node of the `<headword>` element. This is how the user would view the headword when accessing the complete entry content.
  * The _search results form_ is a presentation more suitable for search result display than the `<headword>` element's text node. It is expressed by an optional _search-results-form_ attribute of `<headword>` and/or its `<search-form>` children. If no _search-results-form_ attribute is specified on a `<search-form>`, then the value is inherited from any _search-results-form_ of its parent `<headword>`. Possible uses include:
    * Specifying both the _kanji_ and _kana_ spellings for clarity in a Japanese dictionary;
    * Specifying the canonical spelling of the headword when the `<headword>` element contents may include hyphenation or syllable markers, superscript homograph markers, etc.
  * The `<homograph>` element is an optional child of the `<headword>` element. It marks homograph entries as such, making that information available for possible reading system use. Numbers or other values used by the publisher to identify homograph entries are contained in the _value_ attribute.
  * The _search forms_ are captured as sibling `<search-form>` elements that are children of `<headword>`. Each valid match during a lookup or input search should be expressed in a `<search-form>`, whether it is an inflected form, headword displayed in the entry content, or an alternate spelling of the headword that may not be displayed in the entry content (eg, a _pinyin_ spelling of a Chinese headword). Thus, the reading system can find all relevant matches for a headword by examining `<search-form>` elements.

```
<entry>
  <headword search-results-form=”lie”>lie<sup>1</sup>
    <homograph value="1"/>
    <search-form value=”lie”/>
    <search-form value=”lay”/>
    <search-form value=”lain”/>
    <search-form value=”lying”/>
  </headword>
</entry>
```

```
<entry>
  <headword search-results-form=”lie”>lie<sup>2</sup>
    <homograph value="2"/>
    <search-form value=”lie”/>
    <search-form value=”lied”/>
    <search-form value=”lying”/>
  </headword>
</entry>
```

```
<entry>
  <headword search-results-form="color">col*or <!--here * is used to separate syllables-->
    <search-form value=”color”/>
    <search-form value=“colors”/>
  </headword>
  or (UK)
  <headword>colour
    <search-form value=”colour”/>
    <search-form value=”colours”/>
  </headword>
</entry>
```

```
<entry>
  <headword search-results-form="橋 (はし)">橋 (kanji ideograph) / はし
(hiragana phonetic spelling)
    <search-form value="橋"/>
    <search-form value="はし"/>
  </headword>
   1. bridge
</entry>
```

```
<entry>
  <headword search-results-form="端 (はし)">端 (kanji ideograph) / はし
(hiragana phonetic spelling)
    <search-form value="端"/>
    <search-form value="はし"/>
  </headword>
   1. edge, end 2. beginning, first
</entry>
```

# Approach 1 #

  * The _display form_ of the headword is expressed in the text node of the `<headword>` element.
  * The optional _search results form_ is expressed as an attribute of `<headword>`.
  * The _search forms_ of both headwords and their inflections are captured as sibling elements nested within `<headword>`, with the two distinguished via an attribute. These are meant to be values accessible by the reading system, but not displayed to the user.

```
<entry>
  <headword search-results-form=”lie (verb: recline)”>lie<sup>1</sup>
    <search-form type=”headword” value=”lie”/>
    <search-form type=”inflection” value=”lay”/>
    <search-form type=”inflection” value=”lain”/>
    <search-form type=”inflection” value=”lying”/>
  </headword>
</entry>
```

```
<entry>
  <headword search-results-form=”lie (verb: not tell the truth)”>lie<sup>2</sup>
    <search-form type=”headword” value=”lie”/>
    <search-form type=”inflection” value=”lied”/>
    <search-form type=”inflection” value=”lying”/>
  </headword>
</entry>
```

```
<entry>
  <headword>color
    <search-form type=”headword” value=”color”/>
    <search-form type=”inflection” value=“colors”/>
  </headword>
  or (UK)
  <headword>colour
    <search-form type=”headword” value=”colour”/>
    <search-form type=”inflection” value=”colours”/>
  </headword>
</entry>
```

```
<entry>
  <headword search-results-form="橋 (はし)">橋 (kanji ideograph) / はし
(hiragana phonetic spelling)
    <search-form type="headword" value="橋"/>
    <search-form type="headword" value="はし"/>
  </headword>
   1. bridge
</entry>
```


```
<entry>
  <headword search-results-form="端 (はし)">端 (kanji ideograph) / はし
(hiragana phonetic spelling)
    <search-form type="headword" value="端"/>
    <search-form type="headword" value="はし"/>
  </headword>
   1. edge, end 2. beginning, first
</entry>
```