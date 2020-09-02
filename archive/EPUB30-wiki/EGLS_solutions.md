

# Introduction #
Each section or subsection in this wiki references to a section or subsection  in the [EGLS requirement list wiki](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list).

# Solutions to Page Progression Direction [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Page_Progression_Direction) #

## Solutions to Page progression direction [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Page_progression_direction) ##

### EGLS\_PPD1 Solution A (Murata): OPF ###
Allow the OPF 'item' element to have an optional attribute @page-progression-direction, which announces the page progression direction.  To specify a package-level default, allow the OPF 'package' element to have the same attribute.

Pros:
  * Reading systems can detect page progression direction without opening each OPS document.

Cons:
  * Not aligned with http://dev.w3.org/csswg/css3-page/#progression.  It uses ‘direction’ and ‘block-progression’ properties to determine the page progression direction, but does not address our requirements (separation of page progression direction from these two properties).
  * If the OPS document is rendered without considering the OPF package, the page progression direction will be ignored.

### EGLS\_PPD1 Solution B (Murata): CSS ###

Introduce an IDPF-extension CSS property `idpf-page-progression-direction`.

Pros:
  * Even if the OPS document is rendered without considering the OPF package, the page progression direction will not be ignored.

Cons:
  * The W3C CSS WG has not agreed on such a property.  This property is not aligned with http://dev.w3.org/csswg/css3-page/#progression.
  * Reading systems cannot detect page progression direction without opening each OPS document.

### EGLS\_PPD1 Solution C (Murata): both OPF and CSS ###

Introduce @page-progression-direction to the OPF 'item' element and also introduce an IDPF-extension CSS property `idpf-page-progression-direction`.


Pros:
  * Even if the OPS document is rendered without considering the OPF package, the page progression direction will not be ignored.
  * Reading systems can detect page progression direction without opening each OPS document.

Cons:
  * The W3C CSS WG has not agreed on such a property.  This property is not aligned with http://dev.w3.org/csswg/css3-page/#progression.
  * What happens when @page-progression-direction and `idpf-page-progression-direction` differ?

### EGLS\_PPD1 Solution D (Takeshi): OPF(spine) ###
Allow the OPF 'spine' element to have an optional attribute @page-progression-direction, which announces the page progression direction.

Pros:
  * Reading systems can detect page progression direction without opening each OPS document.
  * Could avoid 'multiple' page progression settings.

Cons:
  * If the OPS document is rendered without considering the OPF package, the page progression direction will be ignored.

### EGLS\_PPD1 Solution E (kojiishi) ###

Follow http://dev.w3.org/csswg/css3-page/#progression to decide page progression. Exceptional cases like translated comics can set primary direction as vertical, then set inner div or each span to be horizontal.

Pros:
  * No additions.
Cons:
  * Makes producing those exceptional cases a little complex for content provider.
  * Requires vertical text in EPUB3.0 can mix horizontal text within vertical books.


## Solutions to Two-page-spread [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Two-page-spread) ##

### EGLS\_PPD2 Solution A (kojiishi): CSS 2.1 ###

Use 'left' or 'right' to [page-break-before/after/inside property in CS 2.1](http://www.w3.org/TR/2009/CR-CSS2-20090908/page.html#page-break-props).

Pros:
  * CSS 2.1 will be ready before EPUB 3.0.

Cons:
  * There is no clear agreement how to interpret left/right values in the right-hand-bindings.
  * Readers must map left to odd, and right to even for the fallback scenario to work, but it is quite possible for W3C to reject such idea for future CSS to include.

### EGLS\_PPD2 Solution B (kojiishi): CSS Paged Media ###

Although [CSS 3 Paged Media](http://dev.w3.org/csswg/css3-page/#pg-br-before-after) doesn't state yet, but there's [a discussion to add "even" and "odd" values](http://lists.w3.org/Archives/Public/www-style/2010Aug/0581.html).

Pros:
  * Behavior on different bindings is clearly defined.

Cons:
  * CSS 3 Paged Media may not be ready in time for EPUB 3.0.

### EGLS\_PPD2 Solution C (kojiishi): CSS Paged Media ###

EPUB 3.0 uses its own 'idpf-page-break-before' and 'idpf-page-break-after' properties.


### EGLS\_PPD2 Solution D (Takeshi): OPF ###

To introduce a new page positioning attribute to 'itemref' element in OPF and specify the starting position of each OPS document.
Let's say @odd-or-even and available value will be 'odd', 'even' and 'any'. The default is 'any'. It is the same as [XSL-FO](http://www.w3.org/TR/xsl11/#odd-or-even).

Pros:
  * Do not bother existing ePubs.

Cons:
  * It can not control page position inside of OPS content.


# Solutions to Vertical Writing [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Vertical_Writing) #
## Solutions to Two Styles of Vertical Writing [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Two_Styles_of_Vertical_Writing) ##

### EGLS\_VW1 Solution A (kojiishi): CSS ###

Use `writing-mode` property.

Cons:
  * writing-mode may not be ready by the time EPUB 3.0 requires.

### EGLS\_VW1 Solution B (kojiishi): CSS ###

Define `idpf-writing-mode` property.

Pros:
  * No need to wait until `writing-mode` is finalized.
Cons:
  * May not be aligned with CSS `writing-mode` when it's finalized.
  * Need to come up with a good spec by EPUB team.

## Solutions to Principal Writing Mode [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Principal_Writing_Mode) ##

### EGLS\_VW2 Solution A (Murata): OPF ###

Allow the OPF 'item' element to have an optional attribute @writing-mode, which announces the page progression direction.  To specify a package-level default, allow the OPF 'package' element to have the same attribute.

Pros:
  * Reading systems can detect the writing mode without opening each OPS document.

Cons:
  * Not aligned with CSS3 Text Layout.
  * If the OPS document is rendered without considering the OPF package, the writing mode  will be ignored.

### EGLS\_VW2 Solution B (Murata): CSS ###

Adopt the `writing-mode` property of an upcoming working draft for CSS Text Layout.

Pros:
  * Aligned with CSS
  * Even if the OPS document is rendered without considering the OPF package, the writing mode will not be ignored.

Cons:
  * The future of CSS3 Text Layout is still unclear.
  * Reading systems cannot detect the writing mode without opening each OPS document.

### EGLS\_VW2 Solution C (Murata): both OPF and CSS ###

Introduce `@writing-mode` to the OPF 'item' element and also adopt the writing-mode property of an upcoming working draft for CSS Text Layout.

Pros:
  * Even if the OPS document is rendered without considering the OPF package, the writing mode will not be ignored.
  * Reading systems can detect the writing mode without opening each OPS document.

Cons:
  * The future of CSS3 Text Layout is still unclear.
  * What happens when OPF `@writing-mode` and CSS `writing-mode` differ?

### EGLS\_VW2 Solution D (kojiishi): Alternate Stylesheets ###

Use HTML 4.0 alternate stylesheets with appropriate guidelines, by following the [Alternate Style Tags](http://fantasai.inkedblade.net/style/specs/altss-tags/).

Pros:
  * All information is in the HTML document itself, so works in browsers as well.
  * The method itself is already defined.
Cons:
  * Requires `writing-mode` property finalized.

## Solutions to Column Progression [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Column_Progression) ##

### EGLS\_VW3 Solution A (Murata) ###

Use [CSS Multi-column Layout Module](http://www.w3.org/TR/css3-multicol/), which is a W3C candidate recommendation.


## Solutions to Writing Mode of Captions and Table Entries [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Writing_Mode_of_Captions_and_Table_Entries) ##

### EGLS\_VW4 Solution A (kojiishi) ###

Use `writing-mode` CSS property to the `table` tag.

Pros:
  * Authors can choose whether the table follows the same direction of the body or be always horizontal regardless of the body direction.

Cons:
  * The future of CSS3 Text Layout is still unclear.

## Solutions to Providing Reasonable Fallbacks to Horizontal Writing [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Providing_Reasonable_Fallbacks_to_Horizontal_Writing) ##

### EGLS\_VW5 Solution A (kojiishi) ###

Content providers can provide two stylesheets, one for each direction, and link to them using alternate stylesheets defined in HTML 4.0. Readers use alternate stylesheets to select which stylesheet to use. The use of alternate styleshets is detailed at [Alternate Style Tags](http://fantasai.inkedblade.net/style/specs/altss-tags/).

In the case the stylesheet for the other direction is not available, readers can synthesisze it.

EPUB3 may or may not define the guideline how to synthesize the stylesheets to switch the direction.

Cons:
  * Reader must be able to synthesize stylehseets in the case it's missing.
  * Readers may synthesize the stylesheet differently if EPUB3 does not define guidelines.
  * Requires `writing-mode` finalized.

### EGLS\_VW5 Solution B (kojiishi) ###

Content providers can use logical properties to author stylesheets that works both in horizontal and in vertical writing mode.

Cons:
  * Logical properties may not be ready by the time EPUB 3.0 requires.

## Solutions to Providing Optimal Layouts for more than one Principal Writing Mode [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Providing_Optimal_Layouts_for_more_than_one_Principal_Writing_Mo) ##

### EGLS\_VW6 Solution A (kojiishi) ###

`writing-mode` property should solve the vertical glyph issue.

For the number conversions, since it's a feature that requires cotextual information, readers can go through DOM and change the text as needed. The algorithm is up to the reader.

For styles that can change by CSS, content providers can use [Alternate Style Tags](http://fantasai.inkedblade.net/style/specs/altss-tags/) to provide different stylesheets for each directions.

Cons:
  * writing-mode may not be ready by the time EPUB 3.0 requires.

## Solutions to Announcing non-optimality [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Announcing_non-optimality) ##

### EGLS\_VW7 Solution A (kojiishi) ###

Content providers can write any text within the contents. Printed books sometimes contain "this book was originally written in vertical" in the cover page or anywhere else. Content providers can do the same thing in EPUB 3.0.

### EGLS\_VW7 Solution B (kojiishi) ###

Add a flag or value in OPF to specify that information, and reader prompts it to users when viewing in a speicifc direction.

Please note that directions are also useful for accessibilty purposes; there are some people in the world who can read horizontal text but can't read vertical, or vice-versa.

### EGLS\_VW7 Solution C (kojiishi) ###

In the case content provider does not provide [Alternate Style Tags](http://fantasai.inkedblade.net/style/specs/altss-tags/) for a direction, readers may prompt that the direciton is missing and is going to synthesize it.

### EGLS\_VW7 Solution D (kojiishi) ###

In the case content provider provides stylesheet for each direction using [Alternate Style Tags](http://fantasai.inkedblade.net/style/specs/altss-tags/), EPUB3 can define another class tag for the reader to prompt.

# Solutions to Mixed Text [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Mixed_Text) #
## Solutions to One by One [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#One_by_One) ##

### EGLS\_MT1 Solution A (kojiishi) ###

Write them in fullwidth forms.

### EGLS\_MT2 Solution B (kojiishi) ###

[text-transform](http://dev.w3.org/csswg/css3-text/#text-transform) property in CSS3 Text can achieve the same result as Solution A in styles.

Pros:
  * Can apply styles without modifying the source text.
Cons:
  * CSS3 Text may not be ready by the time EPUB3.0 requires.

### EGLS\_MT2 Solution C (kojiishi) ###

[text-orientation](http://dev.w3.org/csswg/css3-text-layout/#text-orientation-the-text-orientation-pr) property in CSS Writing Modes Module Level 3.

Cons:
  * CSS Writing Modes Module Level 3 may not be ready by the time EPUB3.0 requires.

## Solutions to Rotation [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Rotation) ##

### EGLS\_MT2 Solution A (kojiishi) ###

Write them in canonical (narrow-width) forms.

## Solutions to Tate-chu-yoko [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Tate-chu-yoko) ##

### EGLS\_MT3 Solution A (kojiishi) ###

Wrap them in a span with `writing-mode` and some other CSS properties to display them as Tate-chu-Yoko.

Pros:
  * No new syntax other than vertical writing are required.
Cons:
  * CSS Writing Modes Module Level 3 may not be ready by the time EPUB3.0 requires.

### EGLS\_MT3 Solution B (kojiishi) ###

Wrap them in a span with [text-combine](http://dev.w3.org/csswg/css3-text-layout/#text-combine) property.

Pros:
  * Specialized markup helps readers to recognize the span as Tate-tyu-Yoko.
  * Readers can define its own fallback behavior.
Cons:
  * CSS Writing Modes Module Level 3 may not be ready by the time EPUB3.0 requires.

## Solutions to Selection of the Three Setting Styles [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Selection_of_the_Three_Setting_Styles) ##

### EGLS\_MT3 Solution A (kojiishi) ###

Readres can go through DOM and make necessary changes as needed.

# Solutions to Line Breaking Rules [Line Breaking Rules +](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Line_Breaking_Rules) #
## Solutions to Line-start and Line-end Prohibition Rules [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Line-start_and_Line-end_Prohibition_Rules) ##

### EGLS\_LBR1-1 Solution A (kojiishi) ###

[line-break](http://dev.w3.org/csswg/css3-text/#line-break) property in CSS3 Text.

Pros:
  * Can probide abstracted way to specify the set between content provider and readers.
  * Content providers can ask device to change the set depends on the line length.
Cons:
  * CSS Text may not be ready by the time EPUB3.0 requires.
  * Does not allow content providers to specify exact set of characters.

### EGLS\_LBR1-1 Solution B (kyojitahara) ###

[line-break](http://dev.w3.org/csswg/css3-text/#line-break) and [text-justify](http://dev.w3.org/csswg/css3-text/#text-justify) property in CSS3 Text.

Pros:
  * Can provide abstracted way to specify the set between content provider and readers.
  * Content providers can ask device to change the set depends on the line length.
  * Can provide Reading System a value of text-justify property after line breaking process.
Cons:
  * CSS Text may not be ready by the time EPUB3.0 requires.
  * Nobody can specify additional characters more than default set.
Note: line adjustment rule should be described in this section.

In JIS X 4051, a standard for Japanese layout, line adjustment rule is described in the section of Line-start (4.3 in JIS X 4051)and Line-end Prohibition Rules(4.4 in JIS X 4051). It is very important and pricipal in Japanese layout to make all lines aligned because of the following point of views.

  1. to be easy to read
  1. to escape misreading
  1. to be well designed
  * Refer: a. in http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_1_12
  * Refer: [Line breaking sample](http://epub-revision.googlecode.com/files/line-breaking-sample.pdf)

Line-start/line-end prohibition and line adjustment are tightly related and we need both to realize the principal.

Solution for line adjustment:
  * [text-justify](http://dev.w3.org/csswg/css3-text/#text-justify) property in CSS3 Text and ExampleⅤ in the document describes the soluton for Japanese text adjustment.


### EGLS\_LBR1-2 Solution A (kyojitahara) ###

Add EPUB3.0 original CSS property 'characters-not-starting-line' and 'characters-not-ending-line'.

Example:
  * Line-start prohibition
```
Strict prohibition

div.line-breaking-rule-a{characters-not-starting-line: '！），．。々〉》：？｝］】〕”％';}

Loose prohibition

div.line-breaking-rule-b{characters-not-starting-line: '！），．。々〉》：｝］】〕” ';}
```
  * Line-end prohibition
```
Strict prohibition

div.line-breaking-rule-a{characters-not-ending-line: '（〈《｛［【〔￥＠＄＃〒“';}

Loose prohibition

div.line-breaking-rule-b{characters-not-ending-line: '（〈《｛［【〔“';}
```

Pros:
  * Can specify additional characters more than default set.
Cons:
  * Would be EPUB3.0 original extension because current CSS does not have such properties.

## Solutions to Unbreakable Character Sequences [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Unbreakable_Character_Sequences) ##

### EGLS\_LBR2-1 Solution A (kojiishi) ###

[line-break](http://dev.w3.org/csswg/css3-text/#line-break) property in CSS3 Text.

Pros:
  * Can probide abstracted way to specify the set between content provider and readers.
  * Content providers can ask device to change the set depends on the line length.
Cons:
  * CSS Text may not be ready by the time EPUB3.0 requires.
  * Does not allow content providers to specify exact set of characters.

### EGLS\_LBR2-1 Solution B (kyojitahara) ###

[line-break](http://dev.w3.org/csswg/css3-text/#line-break) and [text-justify](http://dev.w3.org/csswg/css3-text/#text-justify) property in CSS3 Text.

Pros:
  * Can provide abstracted way to specify the set between content provider and readers.
  * Content providers can ask device to change the set depends on the line length.
  * Can provide Reading System a value of text-justify property after unbreakable characters process.
Cons:
  * CSS Text may not be ready by the time EPUB3.0 requires.
  * Nobody can specify additional characters more than default set.
Note:
  * See [EGLS\_LBR1-1 Solution B Note](http://code.google.com/p/epub-revision/wiki/EGLS_solutions#EGLS_LBR1-1_Solution_B_(kyojitahara))

### EGLS\_LBR2-2 Solution A (kyojitahara) ###

Add EPUB3.0 original CSS property 'unbreakable-characters'.

Example:
```
div{unbreakable-characters: '―‥…';}
```
Pros:
  * Can specify additional characters more than default set.
Cons:
  * Would be EPUB3.0 original extension because current CSS does not have such properties.

## Solutions to Hanging Punctuations [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Hanging_Punctuations) ##

### EGLS\_EGLS\_LBR3-1 Solution A (kojiishi) ###

[hanging-punctuation](http://dev.w3.org/csswg/css3-text/#hanging-punctuation) property in CSS3 Text.

Cons:
  * CSS Text may not be ready by the time EPUB3.0 requires.

### EGLS\_LBR3-1 Solution B (kyojitahara) ###

[hanging-punctuation](http://dev.w3.org/csswg/css3-text/#hanging-punctuation) and [text-justify](http://dev.w3.org/csswg/css3-text/#text-justify) property in CSS3 Text.

Pros:
  * Can provide Reading System a value of text-justify property after hanging punctuations process.
Cons:
  * CSS Text may not be ready by the time EPUB3.0 requires.
  * Nobody can specify additional characters more than default set.
Note:
  * See [EGLS\_LBR1-1 Solution B Note](http://code.google.com/p/epub-revision/wiki/EGLS_solutions#EGLS_LBR1-1_Solution_B_(kyojitahara))

### EGLS\_LBR3-2 Solution A (kyojitahara) ###

Add EPUB3.0 original CSS property 'hanging-punctuation-characters'.

Example:
```
div{hanging-punctuation-characters: '、。，．';}
```
Pros:
  * Can specify additional characters more than default set.
Cons:
  * Would be EPUB3.0 original extension because current CSS does not have such properties.

## Solutions to Non-separating Characters [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Non-separating_Characters) ##

### EGLS\_EGLS\_LBR4-1 Solution A (kojiishi) ###

Justification logic described in [text-justify](http://dev.w3.org/csswg/css3-text/#text-justify) property covers the case as an example for the UA to implement.

Cons:
  * CSS Text may not be ready by the time EPUB3.0 requires.

### EGLS\_LBR4-2 Solution A (kyojitahara) ###

Add original CSS property 'inseparable-characters'.

Example:
```
div{inseparable-characters: '―‥…';}
```
Pros:
  * Can specify additional characters more than default set.
Cons:
  * Would be EPUB3.0 original extension because current CSS does not have such properties.

# Solutions to Ruby and Emphasis Dots [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Ruby_and_Emphasis_Dots) #



## Q1: Should we use [HTML5 ruby](http://www.w3.org/TR/html5/text-level-semantics.html#the-ruby-element) or should we use [Ruby Annotation](http://www.w3.org/TR/ruby/) (XHTML)? ##

Quite a few people think that HTML5 ruby is easier to write and implement than Ruby Annotation.  Meanwhile, some people think that HTML5 ruby fails to handle some important use cases in [Multiple Ruby Text (Japanese) EGLS\_RE6](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Multiple_Ruby_Text_(Japanese)), which can be addressed by ["complex ruby markup"](http://www.w3.org/TR/ruby/#complex) in Ruby Annotation.

Some implementers are strongly against "complex ruby markup".  It has not been widely implemented, although there are three implementations: a Firefox add-on ([XHTML Ruby Support](https://addons.mozilla.org/en-US/firefox/addon/1935/) ), [a Firefox patch](https://bugzilla.mozilla.org/show_bug.cgi?id=256274), and Amaya.

Proposal (MURATA): Adopt HTML5 ruby

## Q2: Should we use OPS switch elements (i.e., `<ops:switch>`) for wrapping `ruby` or should we use `ruby` directly? ##

We assume that EPUB 3.0 is going to use HTML5 rather than XHTML 1.1 as a basis.  If  this is the case, wrapping HTML5 ruby by `<ops:switch>` does not make a lot of sense.  Wrapping Ruby annotation ruby by `<ops:switch>` makes sense.

If we wrap `ruby` with `<ops:switch>`, we do not need `rp`, which is for fallback.  If not, we do need `rp`.

## Q3: Should we distinguish Japanese ruby, Chinese ruby, and Bopomofo Ruby?  If so, how? ##

Japanese [mono ruby](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Mono-Ruby) and Chinese mono ruby are rendered similarly, and Japanese [group ruby](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Group-ruby) and Chinese group ruby are also rendered similarly.

[Jukugo ruby](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Jukugo-ruby) and [Multiple ruby text](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Multiple_Ruby_Text_(Japanese)) are specific to Japan.

[Bopomofo ruby](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Bopomofo_Ruby_(Zhuyin_Fuhao)) is similar to Japanese or Chinese mono ruby, although bopomofo ruby text, which is always represented by Unicode characters in the ranges 3100-312F or 31A0-31BF, is rendered differently.  Moreover, [Bopomoto ruby positioning is different from Japanese or Chinese ruby](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Ruby_Positioning).

In this document we assume that we can use the same HTML syntax for Japanese ruby, Chinese ruby, and Bopomofo Ruby except that jukugo ruby and multiple ruby text need different syntax.

## Q4: Which of the three styles of Japanese ruby, namely mono, group, and jukugo ruby is supported by HTML5 and Ruby Annotation (XHTML)? ##

The latest HTML5 working draft (as of 2010-09-26) does not mention mono, group, or jukugo ruby.  The [Ruby annotation](http://www.w3.org/TR/ruby/) mentions mono ruby and group ruby only in the glossary and does not mention jukugo ruby.

  * An [e-mail](http://lists.w3.org/Archives/Public/public-html-ig-jp/2010Mar/0027.html) to the public-html-ig-jp@w3.org by Roland Steiner (the author of the current WebKit implementation of ruby) shows how to capture mono/group/jukugo ruby in HTML5.

  * [Ruby use cases from the JLReq document](http://www.w3.org/International/datespace/2010/02/jlreq-examples/) shows how HTML5 and and Ruby Annotation (XHTML) can be used for capturing mono, group, and jukugo ruby.

  * (note 2) in "ii JUkugo-ruby" in "2." in "a. PURPOSE" in "3.3.1 Usage of Ruby says

```
The following examples show the relationship between ruby letters and base kanji characters.

Example of mono-ruby: "凝+(ぎよう)" "視+(し)"

Example of jukugo-ruby 1: "凝+(ぎよう) 視+(し)"

Example of jukugo-ruby 2: "(凝視)+(ぎよう/し)"
```



## Q5: Should we use CSS3 Ruby? ##

[CSS3 Ruby](http://www.w3.org/TR/css3-ruby/) is a candidate recommendation, but is likely to be thoroughly changed for HTML5 ruby.  [The latest editor's draft](http://dev.w3.org/csswg/css3-ruby/) is available.  Here we assume that we will not use CSS3 ruby for EPUB 3.0.



## Q6: Should we replace ぁぃぅぇぉ in ruby text by あいうえお? ##

In traditional publishing in Japan, ruby text typically uses あいうえお in stead of ぁぃぅぇぉ.  Unicode has あいうえお(U+3042 U+3044 U+3046 U+3048 U+304a) as well as ぁぃぅぇぉ(U+3041 U+3043 U+3045 U+3047 U+3049).

In this document, we assume that an EPUB document always uses ぁぃぅぇぉ and the reading system replaces them by あいうえお when they are displayed as part of ruby text.

Note: Yamamoto-san wrote "Traditionally in Japanese typography, it is true that a small kana character is usually not used for a palatalized or labio-velarized syllable, if it is used as a ruby character. However, it is the author or editor who decides which kana style is to be used (small or large) in the real-world publishing business. Hence, it should be noted that this is neither a glyph issue, nor a font issue. This issue is clearly on the abstracted layer of characters and text. Therefore, any automatic conversion or replacement of characters must not be allowed usually. In fact, there are not a few authors and editors who want to use small kana characters in ruby instances to describe palatalized or labio-velarized syllables, depending on the usages and purposes of their content."

Note: [The latest editor's draft](http://dev.w3.org/csswg/css3-fonts/) for CSS Fonts Module Level 3 provides `font-variant:ruby`, which enables display of ruby glyphs (OpenType feature: ruby).



Note: Yamamoto-san also wrote "On the other hand, I think this issue is on the layer of glyphs. For example, if you specify the "ruby" OpenType glyph substitution feature, its effect is only that the stroke weight of your ruby glyphs are added. This "ruby" glyph substitution is intended to prevent ruby characters from looking too thin, because composing ruby glyphs by reducing the body size of ordinary kana glyphs in the font to 1/2 the type size used will usually make them look too thin. The "ruby" glyph substitution feature replaces the specified ruby glyphs only. It doesn't affect any characters at all. Therefore, even if you specify the "ruby" OpenType glyph substitution feature to a small kana character that you have specified to be used as a ruby character, the character won't be replaced with its larger version, and must not be."



Comments by kojiishi: [text-transform:large-kana](http://dev.w3.org/csswg/css3-text/#text-transform) can transform small Kana to large Kana without modifying the source text.

## Solutions to Mono-Ruby [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Mono-Ruby) ##

### EGLS\_RE1 Solution A (Murata): HTML5 ruby without `ops:switch` (and with `rp`) ###

Example:
```
<p>
  <ruby>東<rp>(</rp><rt>とう</rt><rp>)</rp></ruby><ruby>京<rp>(</rp><rt>きょう</rt><rp>)</rp></ruby>は日本の首都です。
</p>
```

```
<p>
  <ruby>东<rp>(</rp><rt>dōng</rt><rp>)</rp></ruby><ruby>京<rp>(</rp><rt>jīng</rt><rp>)</rp></ruby>是日本首都
</p>
```

Pros:
  * Reading systems that does not support ruby can provide reasonable fallback.
Cons:
  * `rp` looks ugly

Note: Since the latest HTML5 working draft (as of 2010-09-26) does not mention mono ruby, it is not completely clear HTML5 can capture mono ruby.

### EGLS\_RE1 Solution B (Murata): HTML5 ruby with `ops:switch` (and without `rp`) ###
Example:
```
<p>
  <ops:switch>
    <ops:case ...>
      <ruby>東<rt>とう</rt></ruby><ruby>京<rt>きょう</rt></ruby>
    </ops:case>
   <ops:default>
      <span>東（とう）京（きょう）</span>
   </ops:default>
  </ops:switch>は日本の首都です。
</p>
```

```
<p>
  <ops:switch>
    <ops:case ...>
      <ruby>东<rt>dōng</rt></ruby><ruby>京<rt>jīng</rt></ruby>
    </ops:case>
      <span>东(dōng)京(jīng)</span>
   </ops:default>
  </ops:switch>是日本首都
</p>
```

Pros:
  * Reading systems that does not support ruby can provide reasonable fallback.
Cons:
  * OPS switch elements between HTML5 p and HTML5 ruby looks clumsy and verbose.

### EGLS\_RE1 Solution C (Murata): Ruby annotation  with `ops:switch` (and without `rp`) ###

Example:
```
<p>
  <ops:switch>
    <ops:case ...>
      <ruby><rb>東</rb><rt>とう</rt></ruby><ruby><rb>京</rb><rt>きょう</rt></ruby>
    </ops:case ...>
   <ops:default>
      <span>東（とう）京（きょう）</span>
   </ops:default>
  </ops:switch>は日本の首都です。
</p>
```

Pros:
  * Reading systems that does not support ruby can provide reasonable fallback.
Cons:
  * What's the point of using Ruby annotation when HTML5 supports ruby?

## Solutions to Jukugo-ruby [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Jukugo-ruby) ##

### EGLS\_RE2 Solution A (Murata): HTML5 ruby without `ops:switch` (and with `rp`) ###

Example:
```
<p>
  <ruby>東<rp>(</rp><rt>とう</rt><rp>)</rp>京<rp>(</rp><rt>きょう</rt><rp>)</rp></ruby>は日本の首都です。
</p>
```
### EGLS\_RE2 Solution B (Murata): HTML5 ruby with `ops:switch` (and without `rp`) ###
Example:
```
<p>
  <ops:switch>
    <ops:case ...>
      <ruby>東<rt>とう</rt>京<rt>きょう</rt></ruby>
    </ops:case ...>
   <ops:default>
      <span>東（とう）京（きょう）</span>
   </ops:default>
  </ops:switch>は日本の首都です。
</p>
```
### EGLS\_RE2 Solution C (Murata): Ruby Annotation with `ops:switch` (and without `rp`) ###

## Solutions to Group-ruby [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Group-ruby) ##
### EGLS\_RE3 Solution A (Murata): HTML5 ruby without `ops:switch` (and with `rp`) ###

Example:
```
<p>
   <ruby>東京<rp>(</rp><rt>とうきょう</rt><rp>)</rp></ruby>は日本の首都です。
</p>
```
```
<p>
  <ruby>东京<rp>(</rp><rt>dōng jīng</rt><rp>)</rp></ruby>是日本首都
</p>
```
### EGLS\_RE3 Solution B (Murata): HTML5 ruby with `ops:switch` (and without `rp`) ###
Example:
```
<p>
  <ops:switch>
    <ops:case ...>
      <ruby>東京<rt>とうきょう</rt></ruby>
    </ops:case>
   <ops:default>
      <span>東京（とうきょう）</span>
   </ops:default>
  </ops:switch>は日本の首都です。
</p>
```
```
<p>
  <ops:switch>
    <ops:case ...>
      <ruby>东京<rt>dōng jīng</rt></ruby>
    </ops:case>
      <span>东京(dōng jīng)</span>
   </ops:default>
  </ops:switch>是日本首都
</p>
```
### EGLS\_RE3 Solution C (Murata): Ruby Annotation with ops:switch (and without rp) ###
## Solutions to Bopomofo Ruby (Zhuyin Fuhao) [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Bopomofo_Ruby_%28Zhuyin_Fuhao%29) ##

### EGLS\_RE4 Solution A (Murata): HTML5 ruby without ops:switch (and with rp) ###
Example:
```
<p>
  <ruby>世<rp>（</rp><rt>ㄕˋ</rt><rp>）</rp></ruby><ruby>上<rp>（</rp><rt>ㄕㄤˋ</rt><rp>）</ruby>
</p>
```

### EGLS\_RE4 Solution B (Murata): HTML5 ruby with `ops:switch` (and without `rp`) ###
```
<p>
  <ops:switch>
    <ops:case ...>
      <ruby>世<rp>（</rp><rt>ㄕˋ</rt><rp>）</rp></ruby><ruby>上<rp>（</rp><rt>ㄕㄤˋ</rt><rp>）</ruby>
    </ops:case>
    <ops:default>
      <span>世（ㄕˋ）上（ㄕㄤˋ）</span>
    </ops:default>
  </ops:switch>
</p>
```
## Solutions to Ruby Positioning [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Ruby_Positioning) ##
### EGLS\_RE5-1/2 Solution A (Murata) ###
Do nothing in the EPUB 3.0 specification.  Details of ruby positioning should ideally be described in HTML5 ruby or XHTML Ruby annotation.  If these specifications do not provide enough information, it might be a good idea for each country or region to create some guideline document and submit it to IDPF so that it can be linked from the IDPF web site.

## Solutions to Multiple Ruby Text (Japanese) [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Multiple_Ruby_Text_%28Japanese%29) ##

### EGLS\_RE6 Solution A (Murata) ###
```
<ruby>
     <ruby>東<rp>（</rp><rt>とう</rt><rp>)</rp>南<rp>（</rp><rt>なん</rt><rp>）</rp></ruby>
     <rt><rp>[</rp>たつみ</rt><rp>]</rp>
</ruby>
```

Pros:
  * This approach does not require extensions to HTML5 ruby syntax.

Cons:
  * Nothing about nested ruby is mentioned in HTML5.
  * One could argue that both pieces of ruby text should be attached to a base and that attaching ruby to the combination of a base to another ruby is not correct.

## Solutions to Handling Ruby According on User preferences or Displays Properties [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Handling_Ruby_According_on_User_preferences_or_Displays_Properti) ##

### EGLS\_RE7 Solution A (Murata) ###
The EPUB specification should make clear what is intended by the content provider but should not try to restrict the behavior of reading systems.  In other words, reading systems should be allowed to do anything.  This point is already made clear in [2.7: Rendering of Documents on Reading Systems](http://www.idpf.org/2007/ops/OPS_2.0_final_spec.html#Section2.7) in OPS 2.0.  We might want to add some examples for ruby.


## Solutions to Emphasis Dots [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Emphasis_Dots) ##

### EGLS\_RE8 Solution A (Murata) ###
Ideally, W3C will create a candidate recommendation for the 'text-emphasis' property of (currently in [CSS Text](http://www.w3.org/TR/css3-text/#text-emphasis)) in a very timely manner, and EPUB 3.0 should simply adopt it.

### EGLS\_RE8 Solution B (Murata) ###

EPUB 3.0 uses 'idpf-text-emphasis', which is based on a non-CR working draft from W3C.

### EGLS\_RE8 Solution C (Murata) ###

EPUB 3.0 provides its own 'idpf-text-emphasis' without relying on any W3C specs.


# Solutions to Characters or Glyphs [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Characters_or_Glyphs) #
## Solutions to Versions of Unicode or ISO/IEC 10646 [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Versions_of_Unicode_or_ISO/IEC_10646) ##

### EGLS\_CG1 Solution A (MURATA) ###

Reference to Unicode 6.0 without mandating all conformance requirements present in Unicode 6.0.

Pros:
  * Unicode is well-known.
  * Unicode has more information about semantics of each code point and imposes more requirements on conformant implementations.
Cons:
  * Unicode sometimes imposes too demanding requirements.
  * Normative reference to Unicode 6.0 without mandating its conformance requirements is strange.

### EGLS\_CG1 Solution B (MURATA) ###

Reference to a particular version of ISO/IEC 10646 that has all code points of Unicode 6.0.  Do not reference to Unicode.

Pros:
  * ISO/IEC 10646 does not impose too demanding conformance requirements.
Cons:
  * ISO/IEC 10646 has too little information about semantics of each code point and does not impose enough requirements on conformant implementations.
  * ISO/IEC 10646 is not as well-known as Unicode.

## Solutions to Prohibiting Private-use Characters [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Prohibiting_Private-use_Characters) ##

### EGLS\_CG2 Solution A (MURATA) ###
Deprecate the use of code values in the range U+E000--U+F8FF (Private Use Area in the BMP),
the range U+F0000-U+FFFFD (The Plane 15 without U+FFFFE and U+FFFFF), and
the range U+100000-U+10FFFFD (The Plane 16 without U+FFFFE and U+FFFFF) for EPUB 3.0 documents.

## Solutions to In-line Graphics [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#In-line_Graphics) ##

### EGLS\_CG3 Solution A (Fujisawa) ###
Use HTML `img` element to reference an SVG graphics file or SVG fragment
in the same HTML file. This solution also satisfies EGLS\_CG4.

It may be difficult to align the baseline of text with SVG graphics. CSS
2D Transforms can be used to rotate SVG graphics to support vertical
layout.

<http://www.w3.org/TR/css3-2d-transforms/>

### EGLS\_CG3 Solution B (Fujisawa) ###

Use the `font` element to define graphics as SVG Font and put that
definition directly into the HTML `head` element. In the same HTML file, we
can just specify the 'font-family' for the SVG Font to display the
corresponding graphics. This solution also satisfies EGLS\_CG4.

A SVG Font definition can contain one or more graphics. SVG 1.1 supports
both vertical and horizontal layout for SVG Fonts, but SVG Tiny 1.2 only
supports horizontal layout.


## Solutions to Font Embedding [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Font_Embedding) ##

### EGLS\_CG4 Solution A (Fujisawa) ###

Ideally, W3C will create a CR for [CSS Fonts Module Level 3](http://www.w3.org/TR/css3-fonts/), and EPUB will use its `@font-face` property to reference to SVG fonts (([SVG 1.1 Fonts](http://www.w3.org/TR/2003/REC-SVG11-20030114/fonts.html) and [SVG Tiny 1.2](http://www.w3.org/TR/2008/REC-SVGTiny12-20081222/fonts.html)) or [WOFF fonts](http://www.w3.org/TR/WOFF/).  Relative URIs specified in `@font-face` reference to SVG fonts or WOFF fonts within the ZIP file.

Note: WOFF is not a W3C recommendation, but is widely implemented already.  It is expected to become a CR in 2010.

# Solutions to Others [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Others) #
## Solutions to Phonetics in Metadata [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Phonetics_in_Metadata) ##
### EGLS\_O1 Solution A (Murata): `xml:lang` ###
Use two elements of the same tag name.  One is for a kanji string (which may contain
non-Kanji characters) and the other is for a katakana string.  Specify xml:lang="ja-jp" and xml:lang="ja-ka-jp" for the first and second elements, respectively.

This is actually possible in EPUB 2.0 but has never been clarified.

```
<metadata xmlns:dc="http://purl.org/dc/elements/1.1/"
          xmlns:opf="http://www.idpf.org/2007/opf">
   <dc:title xml:lang="ja-jp">伊達姿五侍</dc:title>
   <dc:title xml:lang="ja-kana-jp">ダテスガタゴサムライ</dc:title>
   ...
</metadata>
```

Pros:
  * This approach directly simulates forms in Japan, which provide two fields for a name, for example.
  * Many metadata formats (such as [National Diet Library metadata](http://www.ndl.go.jp/jp/library/data/meta.html)) in Japan use two fields.

Cons:
  * Need two elements

### EGLS\_O1 Solution B (kojiishi): INTERLINEAR ANNOTATION ###
Use Unicode INTERLINEAR ANNOTATION to embed phonetics into the text as defined in http://www.unicode.org/charts/PDF/UFFF0.pdf

  * U+FFF9 INTERLINEAR ANNOTATION ANCHOR marks start of annotated text
  * U+FFFA INTERLINEAR ANNOTATION SEPARATOR marks start of annotating character(s)
  * U+FFFB INTERLINEAR ANNOTATION TERMINATOR marks end of annotation text

What epub applications should do against this Unicode sequence is described in ["Unicode in XML and other Markup Languages" (Unicode Technical Report #20 and W3C Working Group Note 16)](http://www.w3.org/TR/unicode-xml/#Interlinear).

Reading systems are recommended to take one or more of the following actions:
  1. introduce two text fields, and display all characters between U+FFF9 and U+FFFA in the first field while displaying all characters between U+FFFA and U+FFFB in the second field.
  1. remove U+FFF9 together with removing all characters between U+FFFA and following U+FFFB
  1. ignore U+FFF9 and turn U+FFFA and U+FFFB  into "[" and "]" respectively, or into similar characters
  1. tentatively convert into appropriate ruby markup for further editing and formatting by the user

Note that the use of these code point in general markup is discouraged in the above Technical Note, EPUB3 can define its interpretation and where it can be used clearly to avoid those issues.


**Example:**
```
<metadata xmlns:dc="http://purl.org/dc/elements/1.1/"
          xmlns:opf="http://www.idpf.org/2007/opf">
   <dc:title xml:lang="ja-jp">U+FFF9伊達姿五侍U+FFFAダテスガタゴサムライU+FFFB</dc:title>
   ...
</metadata>
```
Where U+FFF9, U+FFFA, and U+FFFB in the example represents single Unicode characters.

Pros
  * Does not need two elements.
  * Requires less additional code for application developers.

Cons
  * This method is not commonly used.
  * Pre-epub 3.0 devices may display this Unicode sequence incorrectly if it does not follow rules described in http://www.w3.org/TR/unicode-xml/#Interlinear
  * ["Unicode in XML and other Markup Languages" (Unicode Technical Report #20 and W3C Working Group Note 16)](http://www.w3.org/TR/unicode-xml/#Interlinear) discourages the use of Interlinear Annotation Characters in the context of generic markup in XML/HTML.

## Solutions to Language Inheritance [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Language_Inheritance) ##

### EGLS\_O2 Solution A (Takeshi) ###

Content author specifies primaliry language of a package and use it as the default langage.
Use opf:priority attribute and set 'primal'.

Pros:
  * Authors do not need to set 'xml:lang' or 'lang' attribute in each OPS/OPF document.
```
<dc:language opf:priority="primal">ja</dc:language>
<dc:language>en</dc:language>
```
Cons:
  * It potentially introduce less portability of OPS documents.

### EGLS\_O2 Solution B (Takeshi) ###

Reading system uses the first entry of language element as the primal language and use it as default language.
```
<dc:language>en</dc:language>
<dc:language>fr</dc:language>
```
Pros:
  * Authors do not need to set 'xml:lang' or 'lang' attribute in each OPS/OPF document.
> No need to change OPS 2.0.1 format.

Cons:
  * It potentially introduce less portability of OPS documents.


## Solutions to Normalization [+](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Normalization) ##
### EGLS\_O3 Solution A (Murata) ###

Make Unicode Normalization optional in [OPS](http://www.idpf.org/2007/ops/OPS_2.0_final_spec.html#TOC1.3.6) and [OPF](http://www.idpf.org/2007/opf/OPF_2.0_final_spec.html#TOC1.3.4).

Pros:
  * We can avoid normalization when it unifies what should not be unified.
Cons:
  * Since normalization is not guaranteed, consistent searching and sorting behavior is not guaranteed.


### EGLS\_O3 Solution B (Murata) ###
Use variation selectors of Unicode rather than avoiding Unicode Normalization C. See [ISO/IEC JTC1/SC2 WG2 N3525](http://www.google.co.jp/url?q=http://www.dkuug.dk/jtc1/sc2/wg2/docs/n3525.pdf&sa=U&ei=u6VwTPPZApGavAP4luWiDg&ved=0CB4QFjAC&sig2=JR61RqVXb1T5G_9Dmt6a6w&usg=AFQjCNHMzUF1bPqWEKGbgOUI8-KMM8zmCg).

Pros:
  * Consistent searching and sorting behavior is guaranteed.
Cons:
  * Have to register all required variation selectors.
  * The support of variation selectors is not common yet.