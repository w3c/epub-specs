


# Requirements Review Status #

Requirements have been reviewed by: SampleFirst SampleLast; Sample2First Sample2Last; add-your-name-here

# Status in the sub-group #

The EGLS sub-group will start the ranking process very soon.

# Outside the scope #

Some typographical features can be supported by reading systems
without introducing any mechanisms to EPUB.  Even if such features are
not supported by existing reading systems, they are outside the scope
of this document.

Such features include:

  * Fonts for non-ASCII characters
  * Sophisticated letter spacing and word spacing
  * Line justification
  * BIDI
  * Appropriate positioning of diacritical marks
  * Avoiding rivers in Western typography

Reading systems certainly have to be improved, and some guidelines (ideally in the natural language in question as well as English) on
implementations would be useful.

**Note:** One could argue that some requirements shown in this document are actually
similar to these features and should thus be kept outside the scope of this document.

# Page Progression Direction #

## Page progression direction ##

**Requirement EGLS\_PPD1:** It should be possible for content providers to specify the page progression direction of an OPS content document, irrespective of any other page layout setting.

**Rationale:** There are two types of print books. One starts from the left side and the other starts from the right side.  The former is common in most of the Western language countries and the latter is used in the CJKT area. Most of the Japanese-style Manga books are also of the latter type, even when the text is written in Western languages using the horizontal writing mode.  Users who read books in the latter type would expect that the 'forward' button provide the next page, although it is to the _left_ of the current page. If this requirement is not satisfied, content providers would have to reverse the page sequence.  (This is exactly what they do now.)

**Use case:** Reading systems need to switch 'next-page' and 'previous-page' operations depending on the page progression direction.

**Use case:** Reading systems with two-page-spread view need to show a page on right or left side first depending on the page progression direction.

**Note:** As the Manga case shows, the page progression direction should be independent of any other layout settings including the writing mode and column progression direction.


## Two-page-spread ##

**Requirement EGLS\_PPD2:** It should be possible for content providers to specify which side in the two-page-spread view should be used for a specific image or the beginning of a chapter.

**Rationale:** Some large screen devices can display two pages at the same time thus providing the two-page-spread view.  Books originally designed for two-page-spread (e.g. Manga, Picture book) should be displayed as intended.  In particular, two images intended to form a single spread should be displayed at the same time.

**Note:** If a chapter is intended to start from the right side page in the Left-To-Right page progression direction, the reading system might make the left side empty.


# Vertical Writing #

## Two Styles of Vertical Writing ##

**Requirement EGLS\_VW1:** It should be possible for content providers to specify the
"Top to Bottom - Right to Left" writing mode and the "Top to Bottom - Left to Right" writing mode.

**Rationale:** Japan and Taiwan heavily use "Top to Bottom - Right to
Left" vertical writing, while mainland China and Korea occasionally
use it.  The Inner Mongolia autonomous region of China uses "Top to
Bottom - Left to Right" vertical writing.

**Example:** [Fig.18](http://www.w3.org/TR/jlreq/#fig1_13-en) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/) shows an example of vertical writing in Japanese.

**Example:** [Mongolian text with Arabic numerals, Latin alphabet and Chinese characters.](http://en.wikipedia.org/wiki/File:Mongolian_text_crop.jpg)

**Note:** Reading systems are not required to support "Top to Bottom - Right to Left" and "Top to Bottom - Left to Right" writing modes.

## Principal Writing Mode ##

**Requirement EGLS\_VW2:** It should be possible for the content provider to specify the principal writing mode of an OPS content document.  The principal writing mode applies to main text in this OPS content document unless explicitly specified otherwise.  For example, when the principal writing mode is "Top to Bottom - Right to Left", the writing mode of main text is also "Top to Bottom - Left to Right".

**Rationale:** [2.2.3 Elements of Page Formats](http://www.w3.org/TR/jlreq/#en-subheading1_1_3) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/) introduces "principal text direction" as a basic element of a page format.

## Column Progression ##

**Requirement EGLS\_VW3:**  The principal writing mode "Top to Bottom - Right to Left" and  "Top to Bottom - Left to Right" should imply that columns are arranged from top to bottom.

**Rationale:** According to
[2.3.2 Major Differences between Vertical Writing Mode and Horizontal Writing Mode](http://www.w3.org/TR/jlreq/#en-subheading1_3_2) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/), when the principal writing mode is "Top to Bottom - Right to Left", columns are arranged from top to bottom.  We guess that the same thing applies to the principal writing mode "Top to Bottom - Left to Right".
See [Fig 20:Direction of arrangement of characters in vertical writing mode](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig1_15-en).

## Writing Mode of Captions and Table Entries ##

**Requirement EGLS\_VW4:**  Captions, table entries, running heads, and page numbers should be in the writing mode "Left to Right - Top to Bottom" even when the principal writing mode is "Top to Bottom - Right to Left" or  "Top to Bottom - Left to Right".

**Rationale:** Note 4 in
[2.3.1 Directional Factors in Japanese Composition](http://www.w3.org/TR/jlreq/#en-subheading1_3_1) in [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/) shows that even when the principal writing mode is
"Top to Bottom - Right to
Left", [running head](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#running-head), [page numbers](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#page-number), [captions](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#caption),
and [table](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#table)
entries are typically in writing mode.  We guess that the same thing applies to the principal writing mode "Top to Bottom - Left to Right".

**Example:** See [Fig.19: Example of horizontal writing mode in parts of vertically set books](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig1_14-en).

**Note:** This requirement might be too ambitious for EPUB 3.0,  but we should not adopt a solution that will hamper this requirement for future versions of EPUB.  Note that the Styling and Layout sub-group has a requirement [SNL\_R2.2 Fixed (repeatable) content](http://code.google.com/p/epub-revision/wiki/StylingAndLayout#SNL_R2.2_Fixed_(repeatable)_content) for running headers and page numbers.

## Providing Reasonable Fallbacks to Horizontal Writing ##

**Background:** Some reading systems will not support the "Top to Bottom - Right to Left" or "Top to Bottom - Left to Right" writing modes.  Even when content providers specify these writing modes, such reading systems have no chice but to use fallback to "Left to Right - Top to Bottom".

**Requirement EGLS\_VW5:** Fallback from "Top to Bottom - Right to Left" to "Left to Right - Top to Bottom" should lead to readable layouts.

**Rationale:** If fallback to "Left to Right - Top to Bottom" leads to unreadable layouts, content providers are likely to hesitate the use of "Top to Bottom - Right to Left" and "Top to Bottom - Left to Right" since they do not want to lose business chances.

**Note:** The term "readable layouts" is not clear.  But some layouts are obviously unreadable.  For example, loss of indentation for quoted pargraphs will lead to unreadable layouts.

## Providing Optimal Layouts for more than one Principal Writing Mode ##

**Background:** Some users prefer the "Top to Bottom - Right to Left" writing mode, while others prefer the "Left to Right - Top to Bottom" writing mode.  Several existing (non-EPUB) e-book readers in Japan already allow users to choose their favorite principal writing modes.

**Requirement EGLS\_VW6:** It should be possible for content providers to prepare contents optimal for more than one principal writing mode.  In particular, it should be possible to adjust HTML5 content documents and CSS stylesheets depending on the writing mode in effect.  Examples of adjusting HTML5 content documents are:

  * Different marks are required for different writing modes, as described in [Differences in Vertical and Horizontal Composition in Use of Punctuation Marks](http://www.w3.org/TR/jlreq/#en-subheading2_1_1) in [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).
  * Some number should be represented differently in different writing modes.  For example, in the Japanese language, 1000 should be represented by "千" in the "Top to Bottom - Right to Left" writing mode, while it should be represented by "1000" in the "Left to Right - Top to Bottom" writing mode.

**Rationale:**  If this requirement is not satisfied, EPUB will be considered as a full-fledged step backward.

**Note:** This requirement does not mean that providing optimal contents should be easy.  It may require very careful
authoring by content providers.

**Note:** There are several mechanisms for addressing this requirement.  First, CSS already provides alternate stylesheets.
Second, we could introduce principal-writing-mode-aware switches to OPF, although we would have to duplicate the entire content.
Third, we could introduce such switches to both HTML5 documents and CSS stylesheets.

## Announcing non-optimality ##

**Requirement EGLS\_VW7:** For each content, it should be possible for the content provider to specify for which principal writing mode the content is non-optimal.

**Rationale:** Content providers sometimes create contents optimal to only one principal writing mode.  Unless they clearly indicate non-optimality for the other principal writing motes, users will choose different writing modes and get unreadable layouts.

# Mixed Text #
## One by One ##

**Requirement EGLS\_MT1:** It should be possible for content providers to specify "one by one in inline direction"
setting style for a sequence of Latin letters or European numerals in the
writing mode "Top to Bottom - Right to Left".  That is, each Latin letter or
European numeral should be set one by one (i.e., no rotation) in inline direction with Japanese characters.

**Rationale:** This style is described in **a** in [3.2.3 Mixed Text Composition in Vertical Writing Mode](http://www.w3.org/TR/2009/NOTE-jlreq-20090604#en-subheading2_2_3) of the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

**Example:** [Fig.94: Example of Latin letters in normal orientation](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig_2_2_50-en)

**Note:** What is required for the "Top to Bottom - Left to Right" vertical writing style?

## Rotation ##

**Requirement EGLS\_MT2:** It should be possible for content providers to specify "90 degrees clockwise rotation"
setting style for a sequence of Latin letters or European numerals in
the writing mode  "Top to Bottom - Right to Left".  That is, this sequence of Latin letters or a European numerals should be first arranged from left to right, and the whole string should be then rotated 90 degrees clockwise.

**Rationale:** This style is described in **b** in [3.2.3 Mixed Text Composition in Vertical Writing Mode](http://www.w3.org/TR/2009/NOTE-jlreq-20090604#en-subheading2_2_3) of the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

**Example:** [Fig.95 Example of Latin letters rotated 90 degrees clockwise](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_2_6-en)

**Note:** What is required for the "Top to Bottom - Left to Right" vertical writing style?

## Tate-chu-yoko ##

**Requirement EGLS\_MT3:** It should be possible for content providers to specify "tate-chu-yoko" setting style for
a sequence of Latin letters or European numerals in  the writing mode
writing mode "Top to Bottom - Right to Left".  That is, this sequence of Latin letters or a European
numerals should be arranged from left to right, and the whole string
should be then aligned to the center of the vertical line.

**Rationale:** This style is described in **b** in [3.2.3 Mixed Text Composition in Vertical Writing Mode](http://www.w3.org/TR/2009/NOTE-jlreq-20090604#en-subheading2_2_3) of the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

**Example:** [Fig.96 Example of European numerals in tate-chu-yoko (horizontal-in-vertical setting)](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_2_7-en) and
[Fig.101 Example of tate-chu-yoko (horizontal-in-vertical text setting)](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_2_9-en).

## Selection of the Three Setting Styles ##

**Requirement EGLS\_MT4:** It should be possible for reading systems to choose one of the "one by one in inline direction", "90 degrees clockwise rotation", and "tate-chu-yoko" setting styles depending on the text content, the specification (see EGLS\_MT1 thru 3) by the content provider, and the user preferences.

**Rationale:**  Although some content providers prefer fine control, others would like to rely on automatic control without spending time on fine control.  Moreover, some users would like to take control by specifying user preferences rather than being controlled by content providers.

# Line Breaking Rules #
## Line-start and Line-end Prohibition Rules ##

**Requirement EGLS\_LBR1-1:** Reading systems should implement the line-start and line-end prohibition rules, which prohibit specific characters as the first and last character of a line, respectively.

**Rationale:** EGLS\_LBR1-1 comes from [3.1.7 Characters Not Starting a Line](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_1_7) and
[3.1.8 Characters Not Ending a Line](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_1_8) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

**Note:** One could argue that EGLS\_LBR1-1 does not have to be written in the EPUB specification, because (1) it is merely a recommended behavior and (2) no information has to be incorporated as part of EPUB documents.

**Requirement EGLS\_LBR1-2:** It should be possible for content providers to specify which character is prohibited as the first and last character.

**Rationale:** Publishers have in-house rules.  Both OOXML and ODF (via config-item) meet EGLS\_LBR1-2.

**Note:** When content providers do not explicitly specify prohibited characters, reading systems should follow lists of prohibited characters shown in layout requirements documents (e.g., [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/)).  Such lists are shown in [3.1.7 Characters Not Starting a Line](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_1_7) and
[3.1.8 Characters Not Ending a Line](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_1_8) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).  These lists are based on character classes in [Appendix A](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#character-classes-en) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

## Unbreakable Character Sequences ##

**Requirement EGLS\_LBR2-1:** Reading systems should not introduce line breaks within specific character sequences. In other words, such sequences should be handled as one unit.

**Rationale:** This rule comes from [3.1.10 Unbreakable Character Sequences](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_1_10) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

**Note:** Just like EGLS\_LBR1-1, one could argue that EGLS\_LBR2-1 does not have to be written in the EPUB specification.

**Requirement EGLS\_LBR2-2:** It should be possible for content providers to specify which sequence of characters is unbreakable by line break.

**Rationale:** Publishers have in-house rules.

**Note:** When content providers do not explicitly specify unbreakable character sequences, reading systems should follow lists of unbreakable character sequences shown in layout requirements documents (e.g., [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/)).

## Hanging Punctuations ##

**Requirement EGLS\_LBR3-1:** Reading systems should implement the line adjustment by hanging punctuation rule, which avoids commas or full stops at the line start character by taking them back to the end of the previous line beyond the specified line length.

**Rationale:**  "Line adjustment by hanging punctuation" is shown in the bullet **c** in the first itemized list in [2.5.1 Examples of Items Jutting Out of the Kihon-hanmen](http://www.w3.org/TR/jlreq/#en-subheading1_5_1) and 8.1 c) in the explanatory report of JIS X 4051.  However, arguments against line adjustment by hanging punctuation are also shown in Note 1 in [3.8.2 Reduction and Addition of Inter-Character Space](http://www.w3.org/TR/jlreq/#en-subheading2_8_2).  Neither [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/) nor JIS X 4051 recommends line adjustment by hanging punctuation.

**Note:** Just like EGLS\_LBR1-1, one could argue that EGLS\_LBR3-1 does not have to be written in the EPUB specification.

**Requirement EGLS\_LBR3-2:** It should be possible for content providers to specify which character is allowed as a [hunging punctuation](http://www.w3.org/TR/jlreq/#line-adjustment-by-hanging-punctuation).

**Rationale:** Publishers have in-house rules.

## Non-separating Characters ##

**Requirement EGLS\_LBR4-1:** Reading systems should not introduce space within specific character sequences.

**Rationale:** This requirement comes from
[3.1.11 Character Sequences which Do Not Allow Space Insertion as Part of Line Adjustment Processing](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_1_11) as part of line adjustment processing.

**Note:** Just like EGLS\_LBR1-1, one could argue that LBR4-1 does not have to be written in the EPUB specification.

**Requirement EGLS\_LBR4-2:** It should be possible for content providers to specify which sequence of characters does not allow space insertion.

**Rationale:** Publishers have in-house rules.

**Note:** There are many ways to satisfy EGLS\_LBR2-2 and EGLS\_LBR4-2.
Inline markup is a possibility.  Other possibilities include 1) a
single list of characters for both, 2) one list for EGLS\_LBR2-2 and
another for EGLS\_LBR2-4, and 3) one list for EGLS\_LBR2-2 and
description of characters to be added or deleted for EGLS\_LBR2-4.


# Ruby and Emphasis Dots #

The definition of "Ruby" in JIS Z 8125:2004, "Graphic arts ― Glossary ― Digital printing" (Japan Standards Association)  is shown below:

> Supplementary small characters indicating pronunciation, meaning, etc. for the character or the block of characters they annotate.

The character or the block of characters annotated by ruby text is called _base characters_.   Ruby and base characters are depicted by [Fig.105 Ruby and base characters](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_1-en).  Further information about ruby is shown in [3.3.1 Usage of Ruby](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_3_1) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

## Mono-Ruby ##

**Requirement EGLS\_RE1:** It should be possible for content providers to specify mono-ruby (Attaching hiragana or katakana characters to indicate the reading of a single base ideographic character).  It should also be possible for content providers to specify fallback information so that implementations can rely on fallback, typically by inserting ruby text (together with parentheses) after the base.

**Rationale:** See the bullet "i" in the second bullet in the itemized list
with in "a. PURPOSE" in [Usage of Ruby](http://www.w3.org/TR/jlreq/#en-subheading2_3_1).

  * In the writing mode "Top to Bottom - Right to Left", ruby text is typically attached to the right of the base characters.  Meanwhile, in the writing mode "Left to Right - Top to Bottom", it is immediately above the base characters.
  * The character size of ruby text is intended to be, in principle, the half size of the base characters ([Fig.34: Inserting ruby or other items between lines](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig_ad1_5-en)).
  * The presence or absence of ruby is not expected to alter the distance between two adjacent lines.  In other words, ruby texts should fit in line gaps.

**Example:** See [Fig.106 Example of ruby annotation per Kanji Character](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_2-en).


## Jukugo-ruby ##

**Requirement EGLS\_RE2:** It should be possible for content providers to specify Jukugo-ruby (Attaching hiragana or katakana characters to indicate the reading of a compound word (jukugo), which is represented by a sequence of ideographic characters) as well as fallback information.  Line breaks within the compound word are intended to be _dallowed_.

**Rationale:** See the bullet "ii" in the second bullet in the itemized list
with in "a. PURPOSE" in [Usage of Ruby](http://www.w3.org/TR/jlreq/#en-subheading2_3_1).

**Example:** [Fig.108 Example of jukugo-ruby method](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_4-en).

**Note:** A mono-ruby sequence, each of which is a base character having mono-ruby, should not be confused with Jukugo-ruby.  See [Fig.107 Example of mono-ruby method. Ruby letters are attached to each base kanji character in a compound word](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_3-en).

## Group-ruby ##

**Requirement EGLS\_RE3:** It should be possible for content providers to specify Group-ruby (Attaching hiragana or katakana characters to indicate the meaning of a word, which is represented by a sequence of ideographic, hiragana, or katakana characters) as well as fallback information.  Line breaks within this word are intended to be _disallowed_.

**Rationale:** See "b. PURPOSE" in [Usage of Ruby](http://www.w3.org/TR/jlreq/#en-subheading2_3_1).

**Example:** See [Fig.111 Examples of ruby for compound kanji words to indicate corresponding words in katakana](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_6_2-en).

## Bopomofo Ruby (Zhuyin Fuhao) ##

**Requirement EGLS\_RE4:**  It should be possible for content providers to attach Bopomofo ruby (Zhuyin Fuhao) to a single CJK ideographic character.  The ruby text is one of the following strings:
  * One phonetic symbol with stress accent
  * One phonetic symbol with light accent
  * Two phonetic symbols with stress accent
  * Two phonetic symbol with light accent
  * Three phonetic symbols with stress accent
  * Three phonetic symbol with light accent

**Note:** See "12.3  Bopomofo" in [12 East Asian Scripts](http://www.unicode.org/versions/Unicode5.2.0/ch12.pdf) in Unicode 5.2.0, and [Bopomofo](http://en.wikipedia.org/wiki/Bopomofo) in Wikipedia.

## Ruby Positioning ##

**Requirement EGLS\_RE5-1:** In the case of Japanese ruby, the ruby text
is to the top of the ruby base when the writing mode is "Left to Right
- Top to Bottom", and is to the right when the writing mode is "Top to
Bottom - Right to Left".

**Requirement EGLS\_RE5-2:** In the case of Bopomofo ruby, the ruby text
is to the top or right (default) of the ruby base when the writing mode is "Left
to Right - Top to Bottom", and is to the right when the writing mode
is "Top to Bottom - Right to Left".  The stress Accent should be
always to the upper-right of the last phonetic symbol.  The
light accent should be to the top of the phonetic symbol(s), when the
ruby text is to the right of the ruby base, and should be to the left
when the ruby text is to the top of the ruby base.

**Example:** http://www.asahi-net.or.jp/~eb2m-mrt/EGLS_TW_eng/00003.pdf
http://www.asahi-net.or.jp/~eb2m-mrt/EGLS_TW_eng/00004.pdf
http://www.asahi-net.or.jp/~eb2m-mrt/EGLS_TW_eng/00005.pdf

**Note:** One could argue that neither EGLS\_RE-5\_1 nor EGLS\_RE-5\_2 have
to be written in the EPUB specification, because (1) they are merely
recommended behaviours and (2) no information has to be incorporated as
part of EPUB documents.

## Multiple Ruby Text (Japanese) ##

**Requirement EGLS\_RE6:** It should be possible for content providers to specify two kinds of ruby, one to each side of the ruby base: one for readings and the other for meanings.

**Note:** Further information of such multiple ruby text is available at [3.3.4 Choice of Sides for Ruby with respect to Base Characters](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_3_4) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

**Example:** See [Fig.117: An example of ruby attached to both sides of the base characters](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_12-en).

## Handling Ruby According on User preferences or Displays Properties ##

**Requirement EGLS\_RE7:**  Reading systems should be allowed to handle ruby in many ways according to user preferences or displays properties.  They may display ruby in a traditional manner, simply suppress ruby, use pop-up text for displaying ruby,
provide fallback by displaying ruby base, an open parenthesis, ruby text, and close parenthesis in sequence, or use ruby for TTS (text to speech).

**Rationale:**  The best way for handling ruby depends on user preferences or displays properties.

**Note:**  One could argue that EGLS\_RE\_7 does not have to be written in the EPUB specification, because (1) it is merely a recommended behavior and (2) no information has to be incorporated as part of EPUB documents.

## Emphasis Dots ##

**Requirement EGLS\_RE8:** It should be possible for content providers to attach emphasis dots to text runs.  Emphasis dots (also known as bouten or side dots) are symbols placed alongside text runs for emphasis.

  * Emphasis dots are attached to the right of the base characters in the writing mode "Top to Bottom - Right to Left", or above them in the writing mode "Left to Right - Top to Bottom".  The center of emphasis dots should be aligned with that of the base characters.
  * The character size of emphasis dots is intended to be, in principle, the half size of the base characters (see [Fig.34: Inserting ruby or other items between lines](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig_ad1_5-en)).
  * The presence or absence of emphasis dots is not expected to alter the distance between two adjacent lines.  In other words, emphasis dots should fit in line gaps.
  * At least two characters (SESAME DOT U+FE45 and BULLET U+2022) should be available as emphasis dots.  The following is a list of characters typically used as emphasis dots.
    1. BULLET (U+2022)
    1. SESAME DOT (U+FE45)
    1. WHITE SESAME DOT (U+FE46)
    1. BLACK CIRCLE (U+25CF)
    1. WHITE CIRCLE (U+25CB)
    1. BLACK UP-POINTING TRIANGLE (U+25B2)
    1. WHITE UP-POINTING TRIANGLE (U+25B3)
    1. BULLESEYE (U+25CE)
    1. FISHEYE (U+25C9)

**Example:** Emphasis dots are depicted by
[Fig.142 Composition of emphasis dots](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_37-en)

**Note:** Further information is available at [3.3.9 Composition of Emphasis Dots](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_3_9) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

**Note:** Koreans and Chinese have slightly different styles of emphasis dots.

# Characters or Glyphs #
## Versions of Unicode or ISO/IEC 10646 ##

**Requirement EGLS\_CG1:** It should be possible for content providers to use code values
in Unicode 6.0.

**Rationale:** Emoji characters and variation selectors of Unicode 6.0
are needed.  Unicode 6.0 is expected to be completed before the final publication
of EPUB 3.0.

**Note:** EGLS\_CG1 does not mean that EPUB implementations should satisfy
all requirements present in Unicode 6.0.

## Prohibiting Private-use Characters ##

**Requirement EGLS\_CG2:** The use of private-use characters should be prohibited.

**Rationale:** Private-use characters hamper interoperability in open environment, as
witnessed by the developers of Unicode and ISO/IEC 10646.

**Note:** See "16.5  Private-Use Characters" in [Clause 16](http://www.unicode.org/versions/Unicode5.2.0/ch16.pdf) of the Unicode Standard.

## In-line Graphics ##

**Requirement EGLS\_CG3:** It should be possible for content providers to embed graphics in text with the intention that the graphics should be aligned, positioned, and sized well with the surrounding text even when the user or reading system selects any writing mode (e.g., "Top to Bottom - Right to Left"
as well as "Left to Right - Top to Bottom") and any font.

**Rationale:**  People need something beyond characters or character variations commonly available in the present computing environment, which is typically based on Unicode or ISO/IEC 10646.

## Font Embedding ##

**Requirement EGLS\_CG4:** It should be possible for content providers to embed
fonts such as SVG fonts and WOFF fonts as part of EPUB documents.

**Rationale:** Fonts for some characters or character variants might not be always available in any reading system.

**Note:** One could argue that EPUB 2.0 already satisfies this requirement, but one could also argue otherwise.

## Reference ##

**See:** [The sampling result of KANJI Characters](http://epub-revision.googlecode.com/files/20100826_usr_def_char_or_glyph.pdf)

# Others #

## Phonetics in Metadata ##

**Requirement EGLS\_O1:** For each piece of metadata, it should be possible to specify both a kanji string (xml:lang="ja-jp") and a katakana string (xml:lang="ja-kana-jp").

**Rationale:** In the Japanese language, one string is not good enough to represent an author name, for example. Each piece of metadata requires a string pair: kanji and katakana.

## Language Inheritance ##

**Requirement EGLS\_O2:** It should be possible for content providers to specify which natural language is used in one place in an EPUB document rather than repeatedly specifying the same information in many places in an OPF package and OPS content documents in it.

**Rationale:** At present, content providers are forced to specify the same language information in many places.

**Note:** HTML5 already allows language information specified in ancestor elements to be inherited by descendant elements.  OCF does not allow such inheritance.  The natural language indicated in an OCF package does not apply to OPS content documents in it.  Additionaly, since OPF allows to have multiple 

&lt;dc:language&gt;

 elements, a primal language needs to be specified to build the fallback system..

## Normalization ##

**Requirement EGLS\_O3:** It should be possible to create an EPUB document without applying Unicode Normalization C thoroughly.

**Rationale:**  Unicode normalization (even NFC) sometimes cause fatal results to Japanese, Chinese, Taiwanese and Korean users, as agreed in the EGLS Sapporo meeting.  More information about the problems are shown
in Wikipedia [(Japanese)](http://ja.wikipedia.org/wiki/CJK%E4%BA%92%E6%8F%9B%E6%BC%A2%E5%AD%97) and [(Korean)](http://ko.wikipedia.org/wiki/%ED%95%9C%EC%A4%91%EC%9D%BC_%ED%98%B8%ED%99%98%EC%9A%A9_%ED%95%9C%EC%9E%90).

**Note:**  A long-term solution to this problem is to use variation selectors of Unicode rather than avoiding Unicode Normalization C.  See [ISO/IEC JTC1/SC2 WG2 N3525](http://www.google.co.jp/url?q=http://www.dkuug.dk/jtc1/sc2/wg2/docs/n3525.pdf&sa=U&ei=u6VwTPPZApGavAP4luWiDg&ved=0CB4QFjAC&sig2=JR61RqVXb1T5G_9Dmt6a6w&usg=AFQjCNHMzUF1bPqWEKGbgOUI8-KMM8zmCg).



&lt;hr &gt;



# Relevant requirements from other groups #
| [Navigation](Navigation.md) | [NAV\_R05\_Enhance\_global\_language\_support\_in\_labels_(A) NAV\_R05 i18n support in labels]_| _Navigation groups needs to know which attributes/inline elements are needed. Compare [Metadata R14](Metadata#META_R14_Internationalization_(A).md)_ |
|:----------------------------|:---------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------|
| [Metadata](Metadata.md) | [Metadata R14 Internationalization](Metadata#META_R14_Internationalization_(A).md) | _Metadata groups needs to know which attributes/inline elements are needed; minimal i18n markup in metadata property values/XML literals. Compare [NAV\_R05\_Enhance\_global\_language\_support\_in\_labels_(A) NAV\_R05]|

# The rest of this page is for historical reasons only. #
# Leftover from the IDPF EPUB Maintenance WG #

  * Bad potential interaction between required Unicode normalization and Japanese language text
> > (http://www.daisy.org/epub/issues/bad-potential-interaction-between-required-unicode-normalization-and-japanese-language-text)

  * Support for page progression independent of script writing-direction
> > (http://www.daisy.org/epub/issues/support-page-progression-independent-script-writing-direction)
  * EPUB needs support for vertical directionality in writing
> > (http://www.daisy.org/epub/issues/epub-needs-support-vertical-directionality-writing)

# MURATA #

Requirements here are based on ["Requirements for Japanese Text Layout" (W3C Note)"](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

## Vertical Writing ##
### EGLS\_MM\_01 Vertical Writing ###
**Requirement: EPUB 2.1 should support two styles of vertical writing:
"Top to Bottom - Right to Left" and "Top to Bottom - Left to Right"**.

Rationale: Japan and Taiwan heavily use "Top to Bottom - Right to
Left" vertical writing, while mainland China and Korea occasionally
use it.  The Inner Mongolia autonomous region of China uses "Top to
Bottom - Left to Right" vertical writing.

Example: [Fig.18](http://www.w3.org/TR/jlreq/#fig1_13-en) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/) shows an example of vertical writing in Japanese.

Example: [Mongolian text with Arabic numerals, Latin alphabet and Chinese characters.](http://en.wikipedia.org/wiki/File:Mongolian_text_crop.jpg)

### EGLS\_MM\_02 Principal Text Direction ###

**Requirement:  It should be possible to specify "Top to Bottom - Right to Left" or "Top to Bottom - Left to Right" as the principal text
direction of an OPS content document.  If the principal text direction is "Top to Bottom - Right to Left" of "Top to Bottom - Left to Right" , main
text in this OPS content document should be in "Top to Bottom - Left to Right" or "Top to Bottom - Left to Right" text direction, respectively.**

Rationale: [2.2.3 Elements of Page Formats](http://www.w3.org/TR/jlreq/#en-subheading1_1_3) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/) introduces "principal text direction" as a basic element of a page format.

MURATA: Should the principal text direction of each OPS file be specified within the OPS file or at the OPF level?

### EGLS\_MM\_03 Column progression and Page progression ###


**Requirement:  The principal text direction "Top to Bottom - Right to Left" should imply that columns are arranged from top to bottom and page progression is from right to left.**

Rationale: According to
[2.3.2 Major Differences between Vertical Writing Mode and Horizontal Writing Mode](http://www.w3.org/TR/jlreq/#en-subheading1_3_2) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/), when the principal text direction is vertical, page progression is from right to left.
See [Fig 21:Progression of pages for a vertically set books](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig1_16-en).
Moreover, columns are arranged from top to bottom.
See [Fig 20:Direction of arrangement of characters in vertical writing mode](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig1_15-en).

Note: What is required for the "Top to Bottom - Left to Right" vertical writing style?

MURATA: This is slight different from [#EGLS\_TK\_03\_Binding\_direction](#EGLS_TK_03_Binding_direction.md), which allows the principal text directio and the "binding direction" to be different.

### EGLS\_MM\_04 Writing mode of captions and table entries ###
**Requirement:  Captions, table entries, running heads, and page numbers should be in the writing mode "Left to Right - Top to Bottom" even when the principal text direction is "Top to Bottom - Right to Left".**

Rationale: Note 4 in
[2.3.1 Directional Factors in Japanese Composition](http://www.w3.org/TR/jlreq/#en-subheading1_3_1) in [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/) shows that even when the principal text direction is
"Top to Bottom - Right to
Left", [running head](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#running-head), [page numbers](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#page-number), [captions](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#caption),
and [table](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#table)
entries are typically in writing mode.

Example: See [Fig.19: Example of horizontal writing mode in parts of vertically set books](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig1_14-en).

Note: What is required for the "Top to Bottom - Left to Right" vertical writing style?

Voyager: The proposed requirement seems to exceed level of the minimum requirement. Despite the requirement of "Captions, table entries, running heads, and page numbers should be in the writing mode "Left to Right - Top to Bottom" even when the principal text direction is "Top to Bottom - Right to Left", running heads can be displayed vertically in case of a printed book layouts. Running heads and page numbers can rely on a display function of reader applications.

In addition, where and how can contents of running heads and page numbers be referred from? There are always pages dealt separately from others not to display running heads temporarily. Where does the reference of page numbers come from? How  can you deal with page numbers if you do not want to display them temporarily? Furthermore, how about the case of photos placed in offset pages?

If the proposed requirement shall stay in, solutions to the above cases shall be somehow specified.

MURATA: I agree that this might be too ambitious for EPUB 2.1.  But I would like to keep this requirement in the list, since we should not adopt a solution that continue to hamper this requirement even for future versions of EPUB.  Note that the Styling and Layout sub-group has a requirement [SNL\_R2.2 Fixed (repeatable) content](http://code.google.com/p/epub-revision/wiki/StylingAndLayout#SNL_R2.2_Fixed_(repeatable)_content) for running headers and page numbers.

### EGLS\_MM\_05 Switching principal text directions ###

**Requirement: It should be possible to render a document of the principal text direction "Top to Bottom - Right to Left" using the principal text direction "Left to Right - Top to Bottom", and vice versa.**

Rationale:  Several existing ebook readers in Japan already allow such switching.  Moreover, if fallback to "Left to Right - Top to Bottom" does not work, content providers are likely to hesitate the use of "Top to Bottom - Right to Left" since they do not want to lose business chances.

Note: Some contents are tailored to one particular principal text direction, and are not amenable to directionality switching.  Meanwhile, other contents are amenable to such switching.

Note: One could argue that rendering of a document of the principal text direction  "Left to Right - Top to Bottom" using the principal text direction "Top to Bottom - Right to Left" is less important.

Note: What is required for the "Top to Bottom - Left to Right" vertical writing style?

### EGLS\_MM\_06 Stylesheets for more than one principal text direction ###
**Requirement: It should be possible to provide stylesheets for both "Left to Right - Top to Bottom" and "Top to Bottom - Right to Left" principal text directions.**

Rationale: Directionality switching will lead to clumsy results if this requirement is not satisfied.

Note: This requirement does not necessarily mean that the same stylesheet can be used for both directions. Providing one stylesheet for each principal text direction is an option.

Note: What is required for the "Top to Bottom - Left to Right" vertical writing style?

## Japanese and Western Mixed Text Composition ##
### EGLS\_MM\_07 Mixed Text: One by one ###

**Requirement: It should be possible to specify "one by one in inline direction"
setting style for a sequence of Latin letters or European numerals in the
writing mode "Top to Bottom - Right to Left".  That is, each Latin letter or
European numeral should be set one by one (i.e., no rotation) in inline direction with Japanese characters.**

Rationale: This style is described in **a** in [3.2.3 Mixed Text Composition in Vertical Writing Mode](http://www.w3.org/TR/2009/NOTE-jlreq-20090604#en-subheading2_2_3) of the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

Example: [Fig.94: Example of Latin letters in normal orientation](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig_2_2_50-en)

Note: What is required for the "Top to Bottom - Left to Right" vertical writing style?

### EGLS\_MM\_08 Mixed Text: rotation ###

**Requirement: It should be possible to specify "90 degrees clockwise rotation"
setting style for a sequence of Latin letters or European numerals in
the writing mode  "Top to Bottom - Right to Left".  That is, this sequence of Latin letters or a European numerals should be first arranged from left to right, and the whole string should be then rotated 90 degrees clockwise.**

Rationale: This style is described in **b** in [3.2.3 Mixed Text Composition in Vertical Writing Mode](http://www.w3.org/TR/2009/NOTE-jlreq-20090604#en-subheading2_2_3) of the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

Example: [Fig.95 Example of Latin letters rotated 90 degrees clockwise](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_2_6-en)

Note: What is required for the "Top to Bottom - Left to Right" vertical writing style?

### EGLS\_MM\_09 Mixed Text: Tate-chu-yoko ###
**Requirement: It should be possible to specify "tate-chu-yoko" setting style for
a sequence of Latin letters or European numerals in  the writing mode
writing mode "Top to Bottom - Right to Left".  That is, this sequence of Latin letters or a European
numerals should be arranged from left to right, and the whole string
should be then aligned to the center of the vertical line.**

Rationale: This style is described in **b** in [3.2.3 Mixed Text Composition in Vertical Writing Mode](http://www.w3.org/TR/2009/NOTE-jlreq-20090604#en-subheading2_2_3) of the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

Example: [Fig.96 Example of European numerals in tate-chu-yoko (horizontal-in-vertical setting)](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_2_7-en) and
[Fig.101 Example of tate-chu-yoko (horizontal-in-vertical text setting)](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_2_9-en).

## Line Breaking Rules ##
### EGLS\_MM\_10 Characters Not Starting a Line ###
**Requirement: A line should not begin with the characters shown below:**

  * closing brackets (cl-02),
  * hyphens (cl-03),
  * dividing punctuation marks (cl-04),
  * middle dots (cl-05),
  * full stops (cl-06),
  * commas (cl-07),
  * iteration marks (cl-09),
  * a prolonged sound mark (cl-10),
  * small kana (cl-11), and
  * warichu closing brackets (cl-29)

Rationale: This rule comes from [3.1.7 Characters Not Starting a Line](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_1_7) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).  It is based
on character classes in [Appendix A](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#character-classes-en) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

**Note:** Some printed publications adopt a less strict rule, which allows iteration marks, prolonged sound marks, and small kana. Even KATAKANA MIDDLE DOT and dividing punctuation marks (cl-04) are sometimes allowed, for example in newspaper.

**Note:** [#EGLS\_TK\_06\_Line-start\_prohibition\_rules](#EGLS_TK_06_Line-start_prohibition_rules.md) is more advanced than this requirement, since it allows content authors to specify which character is disallowed.

### EGLS\_MM\_11 Characters Not Ending a Line ###
**Requirement: A line should not end with the characters shown below:**

  * opening brackets (cl-01), and
  * warichu opening brackets (cl-28)

Rationale: This rule comes from [3.1.8 Characters Not Ending a Line](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_1_8) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).  It is based
on character classes in [Appendix A](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#character-classes-en) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).


Note: [#EGLS\_TK\_07\_Line-end\_prohibition\_rules](#EGLS_TK_07_Line-end_prohibition_rules.md) is more advanced than this requirement, since it allows content authors to specify which character is disallowed.
### EGLS\_MM\_12 Unbreakable Character Sequences ###
**Requirement: A line should not be broken within the following character sequences. In other words, such sequences should be handled as one unit.**

  * sequences of EM DASH characters,
  * sequences of HORIZONTAL ELLIPSIS characters,
  * sequences of TWO DOT LEADER characters,
  * sequences of European numerals,
  * prefixed abbreviations (cl-12) followed by arabic or ideographic numeral characters,
  * postfixed abbreviations (cl-13) preceded by European numeral or ideographic numeral characters, and
  * group-ruby (see Clause 4)

Rationale: This rule comes from [3.1.10 Unbreakable Character Sequences](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_1_10) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).


Note: [#EGLS\_TK\_10\_Non-breaking\_characters](#EGLS_TK_10_Non-breaking_characters.md) is more advanced than this requirement, since it allows content authors to specify which character sequence should not be broken.

## Ruby and Emphasis Dots ##

### EGLS\_MM\_13 Mono-Ruby ###

The definition of "Ruby" in JIS Z 8125:2004, "Graphic arts ― Glossary ― Digital printing" (Japan Standards Association)  is shown below:


> Supplementary small characters indicating pronunciation, meaning, etc. for the character or the block of characters they annotate.

The character or the block of characters annotated by ruby text is called _base characters_.   Ruby and base characters are depicted by [Fig.105 Ruby and base characters](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_1-en).  Further information about ruby is shown in [3.3.1 Usage of Ruby](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_3_1) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).


**Requirement: It should be possible to specify mono-ruby (Attaching hiragana or katakana characters to indicate the reading of a single base ideographic character).  It should also be possible to specify fallback information so that implementations can rely on fallback, typically by inserting ruby text (together with parentheses) after the base.**

  * In the writing mode "Top to Bottom - Right to Left", ruby text is typically attached to the right of the base characters.  Meanwhile, in the writing mode "Left to Right - Top to Bottom", it is immediately above the base characters.
  * The character size of ruby text is intended to be, in principle, the half size of the base characters ([Fig.34: Inserting ruby or other items between lines](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig_ad1_5-en)).
  * The presence or absence of ruby is not expected to alter the distance between two adjacent lines.  In other words, ruby texts should fit in line gaps.

Example: See [Fig.106 Example of ruby annotation per Kanji Character](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_2-en).


### EGLS\_MM\_14 Jukugo-ruby ###
**Requirement: It should be possible to specify Jukugo-ruby (Attaching hiragana or katakana characters to indicate the reading of a compound word (jukugo), which is represented by a sequence of ideographic characters) as well as fallback information.  Line breaks within the compound word are intended to be _dallowed_.**

Example: [Fig.108 Example of jukugo-ruby method](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_4-en).

Note: A mono-ruby sequence, each of which is a base character having mono-ruby, should not be confused with Jukugo-ruby.  See [Fig.107 Example of mono-ruby method. Ruby letters are attached to each base kanji character in a compound word](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_3-en).


### EGLS\_MM\_15 Group-ruby ###
**Requirement: It should be possible to specify Group-ruby (Attaching hiragana or katakana characters to indicate the meaning of a word, which is represented by a sequence of ideographic, hiragana, or katakana characters) as well as fallback information.  Line breaks within this word are intended to be _disallowed_.**

Example: See [Fig.111 Examples of ruby for compound kanji words to indicate corresponding words in katakana](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_6_2-en).

### EGLS\_MM\_16 multiple ruby text ###

**Requirement: It should be possible to specify two kinds of ruby, one to either side of the base characters, one for readings and the other for meanings.**

Note: Further information of such multiple ruby text is available at [3.3.4 Choice of Sides for Ruby with respect to Base Characters](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_3_4) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

Example: See [Fig.117: An example of ruby attached to both sides of the base characters](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_12-en).

### EGLS\_MM\_17 Emphasis dots ###
**Requirement: It should be possible to attach emphasis dots to text runs.
Emphasis dots (also known as bouten or side dots) are symbols placed alongside a run of kanji or kana characters to emphasize the text.**

  * Emphasis dots are attached to the right of the base characters in the writing mode "Top to Bottom - Right to Left", or above them in the writing mode "Top to Bottom - Left to Right".  The center of emphasis dots is aligned with that of the base characters.
  * The character size of emphasis dots is intended to be, in principle, the half size of the base characters (see [Fig.34: Inserting ruby or other items between lines](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig_ad1_5-en)).
  * The presence or absence of emphasis dots is not expected to alter the distance between two adjacent lines.  In other words, emphasis dots should fit in line gaps.
  * At least two characters (SESAME DOT U+FE45 and BULLET U+2022) should be available as emphasis dots.  The following is a list of characters typically used as emphasis dots.
    1. BULLET (U+2022)
    1. SESAME DOT (U+FE45)
    1. WHITE SESAME DOT (U+FE46)
    1. BLACK CIRCLE (U+25CF)
    1. WHITE CIRCLE (U+25CB)
    1. BLACK UP-POINTING TRIANGLE (U+25B2)
    1. WHITE UP-POINTING TRIANGLE (U+25B3)
    1. BULLESEYE (U+25CE)
    1. FISHEYE (U+25C9)

Example: Emphasis dots are depicted by
[Fig.142 Composition of emphasis dots](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#fig2_3_37-en)

Note: Further information is available at [3.3.9 Composition of Emphasis Dots](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_3_9) in the [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/).

## Others ##
### EGLS\_MM\_18 Phonetics in OPF metadata ###

**Requirement: For each piece of metadata, it should be possible to specify both a kanji string (`xml:lang="ja-jp"`) and a katakana string (`xml:lang="ja-kana-jp"`).**

Rationale:  In the Japanese language, one string is not good enough to represent an author name, for example.  Each piece of such metadata requires a string pair: kanji and katakana.


# Joshua Tallent #
## Hebrew Support ##
### EGLS\_JT\_1 Hebrew character support ###

**Requirement: Reading systems should allow hebrew text to display, even if requiring an embedded font**

Rationale: Adobe Digital Editions is notoriously broken in displaying Hebrew text, even when a font is embedded. It only shows a lot of this: ????????. Support for Unicode is supposed to be standard.

MURATA:  I do not think that we have to incorporate a new mechanism to EPUB for correctly displaying Hebrew text.  In other words, this is a problem of implementations of reading systems.  We might want to create guideline documents to implementations (as shown in
[#Scope](#Scope.md)).

### EGLS\_JT\_2 Bi-directional text ###
**Requirement: Bi-directional text must be supported -- both RTL within LTR, and LTR within RTL**

Rationale: Hebrew texts commonly require the ability to change direction of the text either to allow islands of Hebrew within Latin text or vice versa. This is usually handled pretty well in Webkit, but not necessarily in other reading systems.

MURATA:  Again, I guess that a new mechanism in EPUB is not needed.  This issue is real, but it is an implementation issue.  We might want to create guideline documents for implementors (as shown in [#Scope](#Scope.md)).


### EGLS\_JT\_3 Diacritical mark placement ###
**Requirement: Diacritical marks must be properly placed on the base letter**

Rationale: Hebrew vowels and punctuation are inserted above and below base letters. Like the Ruby requirement above, there is a need for reading systems to allow these diacritics to display properly. Some of this is handled by the font used, but there are normalization and display issues that, from what I have heard, and handled by the reading system or its base OS. For example, in Windows the Uniscribe DLL handles this character placement, helping the font display the text properly.

MURATA:  Again, I guess that a new mechanism in EPUB is not needed.  This issue is real, but it is an implementation issue.  We might want to create guideline documents to implementations (as shown in [#Scope](#Scope.md)).

# Karen Broome #
# Tommy Lee #
# Catherine Zekri #
# Mei-Li Chen #
See http://epub-revision.googlecode.com/files/EGLS_TW_eng.ppt and http://epub-revision.googlecode.com/files/EGLS_Requirement_from_Taiwan.doc
## EGLS\_TW\_1: Let EPUB 2.1 OPS support CSS3 subset --> Text Layout Module ##
In Taiwan, vertical writing has been widely used in classical Chinese books, novels, storybooks and school textbooks. CSS3 writing mode (tb-rl) may be the most possible solution.

Example: http://www.asahi-net.or.jp/~eb2m-mrt/EGLS_TW_eng/00002.pdf

MURATA: The CSS3 text layout module is not a requirement but a solution.   Is the intended requirement already covered by [#EGLS\_MM\_01\_Vertical\_Writing](#EGLS_MM_01_Vertical_Writing.md)?

## EGLS\_TW\_2: way to display Traditional Chinese -->Mix Mode ##
When the Horizontal display mode has changed to the Vertical mode, the reading system follows the rules below:
  * Not to rotate single Alphabet/Number/Chinese Character
  * Not to rotate Punctuation Marks
  * to rotate English Words and Continuous Numbers to 90-degree
    1. More than Two Consequent Letters
    1. More than Two Consequent Numbers

Example: http://www.asahi-net.or.jp/~eb2m-mrt/EGLS_TW_eng/00002.pdf

MURATA: In this requirement, setting styles are automatically chosen from the content.  However, [#EGLS\_MM\_07\_Mixed\_Text:\_One\_by\_one](#EGLS_MM_07_Mixed_Text:_One_by_one.md) and [#EGLS\_MM\_08\_Mixed\_Text:\_rotation](#EGLS_MM_08_Mixed_Text:_rotation.md) requie that content authors explicitly choose setting styles.

## EGLS\_TW\_3: Let EPUB 2.1 OPS support CSS3 subset --> Bopomofo RUBY ##
Those six following categories need RUBY to support Zhuyin Fuhao(Bopomofo) :
  * One phonetic symbol with stress accent
  * One phonetic symbol with light accent
  * Two phonetic symbols with stress accent
  * Two phonetic symbol with light accent
  * Three phonetic symbols with stress accent
  * Three phonetic symbol with light accent

Example: http://www.asahi-net.or.jp/~eb2m-mrt/EGLS_TW_eng/00003.pdf

In the CSS3 draft, bopomofo RUBY may support those six categories above.
```
	ruby.bopomofo { writing-mode: tb-rl }
```
## EGLS\_TW\_4: to Mark Stress Accent (but Light Accent) at Upside of Zhuyin Fuhao phonetic symbols ##

Example: http://www.asahi-net.or.jp/~eb2m-mrt/EGLS_TW_eng/00004.pdf

## EGLS\_TW\_5: In Horizontal Layout Mode, Readers can choose Zhuyin Fuhao shown at Right Side or Top Side (to Set Zhuyin Fuhao shown at Right Side as Default) ##

Example: http://www.asahi-net.or.jp/~eb2m-mrt/EGLS_TW_eng/00005.pdf

## EGLS\_TW\_6: Complete Continuity of Content has Highest Priority ##
  * Small size screen (or low resolution) reading device may not display whole ruby markup correctly.
  * Readers may not need the ruby, but concern the continuity of content.
  * Students could choose to have RUBY displayed while learning Zhuyin Fuhao.
  * Readers could choose to have RUBY displayed via hidden ruby or pop-up screen.

Example: http://www.asahi-net.or.jp/~eb2m-mrt/EGLS_TW_eng/00006.pdf

# Cho Ching Lu #
# Si Wei Wang #
# Takeshi Kanai #
## Character set/Glyph enhancement ##
**These are not requirements to define a displayable character set.**

### EGLS\_TK\_01 Unicode version ###
**Requirement: Unicode 6.0.0 (not released yet) should be supported in epub formats. We need Unicode IVS and newly added emoji symbol codes (not those glyphs), at least.**

Voyager: Is it adequate to specify the support of Unicode6.0 which is not released yet?
Takeshi: As long as I know, it is planned for release in September 2010, so it meets the schedule.

### EGLS\_TK\_02 SVG font ###
**Requirement: SVG font should be available as one of font formats for embedded fonts.**

MURATA:  The use of SVG font is not a requirement but is a solution.  Moreover,
[#EGLS\_CHANG\_R1](#EGLS_CHANG_R1.md), [#EGLS\_CHANG\_R2](#EGLS_CHANG_R2.md), [#EGLS\_CHANG\_R3](#EGLS_CHANG_R3.md), and [#EGLS\_CHANG\_R4](#EGLS_CHANG_R4.md) are relevent requirements, which are extracted from [End User Defined Characters Display](http://epub-revision.googlecode.com/files/Requirement%20on%20EPUB%20for%20End%20User%20Defined%20Characters%20Support.htm).  I think that these requirements should be merged.

Takeshi: Murata-san, you are right, it was not a requirement, but purpose of the original reuqirement is slightly different from the suggested requirements. This requirement should be **ePub must support more font formats**.

## Page Layout ##
### EGLS\_TK\_03 Binding direction ###
**Requirement: The binding direction should be selectable regardless of content layout. Reading System's UI should dynamicaly change reading direction.**

MURATA: Use expressions in [Requirements for Japanese Text Layout](http://www.w3.org/TR/jlreq/), such as ["bound on the right-hand side"](http://www.w3.org/TR/jlreq/#bound-on-the-right-hand-side) or "binding side" wherever possible.
Takeshi: It should be selectable by contents creators, not users, just in case.

MURATA: I attended a F2F meeting of the W3C JLTF.  They think that the term "binding direction" is misleading.  They prefer "binding side".  Another possibility, which comes from CSS, is "page progression direction".


## Japanese Text Layout ##
### EGLS\_TK\_04 Ruby ###
**Requirement: http://www.w3.org/TR/ruby/**

MURATA: This XHTML module is not a requirement but a solution.   Is this already covered by [#EGLS\_MM\_13\_Mono-Ruby](#EGLS_MM_13_Mono-Ruby.md), [#EGLS\_MM\_14\_Jukugo-ruby](#EGLS_MM_14_Jukugo-ruby.md), [#EGLS\_MM\_15\_Group-ruby](#EGLS_MM_15_Group-ruby.md), and [#EGLS\_MM\_16\_multiple\_ruby\_text](#EGLS_MM_16_multiple_ruby_text.md)?
Takeshi: Yes.

### EGLS\_TK\_05 Vertical text layout ###
**Requirement: CSS3 Text Layout:writing-mode**

MURATA:  Again, the CSS property "writing-mode" is not a requirement but a solution.  Is this covered by [#EGLS\_MM\_01\_Vertical\_Writing](#EGLS_MM_01_Vertical_Writing.md)?
Takeshi: Correct.

### EGLS\_TK\_06 Line-start prohibition rules ###
**Requirement: No line should start with one of characters defined by contents creator. The rule must be implemented and the characters should be adjustable.**

MURATA: I would propose "It should be possible for content authors to specify which character is disallowed as the [start character of a line](http://www.w3.org/TR/jlreq/#en-subheading2_1_7)."
Takeshi: Agree.

### EGLS\_TK\_07 Line-end prohibition rules ###
**Requirement: No line should end with one of characters defined by contents creator. The rule must be implemented and the characters should be adjustable.**

MURATA:  Again, I would propose  "It should be possible for content authors to specify which character is disallowed as the [end character of a line](http://www.w3.org/TR/jlreq/#en-subheading2_1_8)."
Takeshi: Agree.


### EGLS\_TK\_08 Hanging punctuation ###
**Requirement: CSS3 Text:hanging-punctuation**

MURATA:  This is not a requirement but a solution.  Please reformulate this requirement
using the terminology of [Requirements for Japanese Text Layout](http://www.w3.org/TR/jlreq/).
Takeshi: It will be **Requirement: "Line adjustment by hanging punctuation" property setting must be supported in the format and Reading System.**

MURATA: Arguments against line adjustment by hanging punctuation are shown in Note 1 in [3.8.2 Reduction and Addition of Inter-Character Space](http://www.w3.org/TR/jlreq/#en-subheading2_8_2).  Neither [W3C JLREQ](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/) nor JIS X 4051 recommends line adjustment by hanging punctuation.

### EGLS\_TK\_09 Hanging punctuation rule setting ###
**Requirement: Contents creator can set hanging punctuations**

MURATA: I would propose "It should be possible for content authors to specify which character is allowed as a [hunging punctuation](http://www.w3.org/TR/jlreq/#line-adjustment-by-hanging-punctuation).  See the bullet **c** in the first itemized list in [2.5.1 Examples of Items Jutting Out of the Kihon-hanmen](http://www.w3.org/TR/jlreq/#en-subheading1_5_1).
Takeshi: Great.


### EGLS\_TK\_10 Non-breaking characters ###
**Requirement: Contents creator can adjust non-breaking characters.**

MURATA:  I would propose "It should be possible for content authors to specify which sequence of characters is [unbreakable](http://www.w3.org/TR/jlreq/#en-subheading2_1_10) by line breaks.
Takeshi: Agree.

### EGLS\_TK\_11 Non-separating chracters ###
**Requirement: Contents creator can adjust non-separating characters.**

MURATA: I would propose "It should be possible for content authors to specify
[which character sequence does allow space insertion as part of line adjustment processing](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_1_11)."
Takeshi: Agree.

### EGLS\_TK\_12 Emphasis dots ###
**Requirement: CSS3 Text: text-emphasis**

MURATA: This is not a requirement but a solution.  Is the intended requirement already covered by [#EGLS\_MM\_17\_Emphasis\_dots](#EGLS_MM_17_Emphasis_dots.md)?
Takeshi: Yes.

### EGLS\_TK\_13 "Tate-chu-yoko" ###
**Requirement: Inline block should change its layout depending on writing-mode property and an inline horizontal text block is going to be displayed within a vertical line.**

MURATA:  Is this covered by [#EGLS\_MM\_09\_Mixed\_Text:\_Tate-chu-yoko](#EGLS_MM_09_Mixed_Text:_Tate-chu-yoko.md)?
Takeshi: Yes.

## General ##
### EGLS\_TK\_14 Language inheritance ###
**Requirement: OPF must specify a primal language and it should inherit to OPS language setting.**

Rationale: Multilingual Reading system needs one primal language information to determine which font set should be applied for displaying metadata/contents as a default, especially for CJK languages.

Reading system can not rely on language settings in XHTML files.
In fact, most of ePub titles do not contain `xml:lang` or `lang` in each XHTML file.

Additionaly, since OPF allows to have multiple `<dc:language>`, a primal language needs to be specified to build the fallback system.


# Kyoji Tahara #
# Shu Tanabe #
# Brady Duga #
# Yu Ming Chang #
# Lin Mei Wei #
# Peter Lin #
# Voyager #
## EGLS\_Voyager\_01 Horizontal and Vertical writing/ Binding Direction ##

Requirement: EPUB 2.1 should support specifying writing modes and binding directions separately. The support should be considered to the following cases:

<p><strong>Four writing modes:</strong> </p><p>1) horizontal writing "left to right - top to bottom": lr-tb  (U.S., Europe and others) </p><p>2) vertical writing "top to bottom - right to left": tb-rl (Japan, Taiwan and others) </p><p>3) horizontal writing "right to left - top to bottom": rl-tb (Arabic and others) </p><p>4) vertical writing "top to bottom - left to right": tb-lr (Inner Mongolia and others) </p><p><strong>Two binding directions:</strong> </p><p>1) left </p><p>2) right </p><p><strong>Rational:</strong> In US/Europe, binding left for lr-tb, and in Japan/Taiwan, binding right for tb-rl. In the meantime, considering global language support for multiple languages, combinations of writing mode and binding direction for other languages, binding direction shall be specified independently to any writing mode. This way, EPUB can support broader utility.<br>
<br>
Murata: Are intended requirements covered by <a href='#EGLS_MM_01_Vertical_Writing.md'>#EGLS_MM_01_Vertical_Writing</a>, <a href='#EGLS_MM_02_Principal_Text_Direction.md'>#EGLS_MM_02_Principal_Text_Direction</a>, <a href='#EGLS_MM_03_Column_progression_and_Page_progression.md'>#EGLS_MM_03_Column_progression_and_Page_progression</a>, <a href='#EGLS_MM_04_Writing_mode_of_captions_and_table_entries.md'>#EGLS_MM_04_Writing_mode_of_captions_and_table_entries</a>,<br>
<a href='#EGLS_MM_05_Switching_principal_text_directions.md'>#EGLS_MM_05_Switching_principal_text_directions</a>, <a href='#EGLS_MM_06_Stylesheets_for_more_than_one_principal_text_direction.md'>#EGLS_MM_06_Stylesheets_for_more_than_one_principal_text_direction</a>,  and <a href='#EGLS_TK_03_Binding_direction.md'>#EGLS_TK_03_Binding_direction</a>?  Two issues not mentioned by the other requirements are folio (recto and verso) and user interface commands.<br>
<br>
Voyager: <a href='#EGLS_Voyager_01.md'>Horizontal and Vertical writing/ Binding Direction</a> are intended to be more versatile than the MM and TK requirements proposed as listed. The very issue is EGLS for multiple languages. Thus, lr-tb、tb-rl、rl-tb、tb-lr shall be required. In addition, <a href='#EGLS_MM_02.md'>Principal Text Directions</a> intended to specify the vertical and horizontal directions in the fixed manner. The directions shall be specified individually to the writing mode and the binding.<br>
<br>
<br>
MURATA: I agree that EGLS should address global requirements.  I also agree that requirements MM<code>_*</code> and TK<code>_*</code> cover only some of the global requirements.  However, I also think that this requirement from Voyager is too sketchy.  For example, I do not believe that <a href='#EGLS_MM_05_Switching_principal_text_directions.md'>#EGLS_MM_05_Switching_principal_text_directions</a> applies to Arabic or Hebrew text.  What is needed is to globalize each of the MM<code>_*</code> and TK<code>_*</code> requirements.<br>
<br>
MURATA: The W3C JLTF thinks that the term "binding directionality" is misleading.<br>
<br>
<h2>EGLS_Voyager_02 Ruby, Tate-chu-yoko</h2>
Requirement: EPUB 2.1 should support ruby by complying with W3C specifications, instead of relying on extended module. Tate-chu-yoko in Japanese, writing mode horizontal within vertical writing mode shall be supported by standard xhtml element in EPUB 2.1.<br>
<br>
<b>Rational: Tate-chu-yoko can be displayed by CSS but it can be complicated.</b>

MURATA: Is the requirement covered by <a href='#EGSL_MM_09_Mixed_Text:_Tate-chu-yoko.md'>#EGSL_MM_09_Mixed_Text:_Tate-chu-yoko</a>?  The use (or non-use) of CSS3 is a solution issue.<br>
<br>
Voyager: tate-chu-yoko could be used even more than ruby in case of mixed multiple language texts, thus it shall be of importance equivalent to ruby or more. We actually meant it not to rely on CSS3, rather it to be supported as a standard xhtml element of EPUB2.1.<br>
<br>
MURATA: Your wording strongly suggests that CSS3 should not be used.  We might agree not to use CSS3, but that discussion should be eliminated from this requirement document.<br>
<br>
<br>
<h1>CHANG Yu-Ming</h1>
See <a href='http://epub-revision.googlecode.com/files/Requirement%20on%20EPUB%20for%20End%20User%20Defined%20Characters%20Support.htm'>http://epub-revision.googlecode.com/files/Requirement%20on%20EPUB%20for%20End%20User%20Defined%20Characters%20Support.htm</a> for details.<br>
<h2>EGLS_CHANG_R1</h2>
For any character<br>
which is not defined in Unicode standard, or which is defined in Unicode<br>
standard but its code point is outside of Unicode BMP can be used in the<br>
context of any one EPUB document via EUDC support.<br>
<br>
<h2>EGLS_CHANG_R2</h2>
For an EPUB documents which<br>
contains EUDC, all resource files to support the display of EUDC can be<br>
embedded inside EPUB file.<br>
<br>
<h2>EGLS_CHANG_R3</h2>
It would be better to<br>
provide a mechanism to assign a corresponding resource to support EUDC display<br>
for each font using in an EPUB document.<br>
<br>
<h2>EGLS_CHANG_R4</h2>
It would be better to<br>
embed mapping information for all the EUDC using inside an EPUB document. When<br>
embeds mapping information inside an EPUB documents, for EUDC that are interpreted<br>
by Unicode standard but beyond BMP, mapping information should contain corresponding<br>
code point such as U+20000 for each character; for EUDC that are not interpreted<br>
by Unicode standard, mapping information should contain useful reference coding<br>
scheme, such as TF-2121.used in Taiwan’s CNS11643 standard.<br>
<br>
<h1>Peter Sorotokin</h1>

<h2>EGLS_PS_R1</h2>

The most widely used algorithm for line breaking rules in UAX#14 (Unicode Line Breaking Algorithm). It is impractical for an implementation that is targeted to work in multi-lingual requirement to add a separate algorithm for each language, especially as a single paragraph can contain parts in many languages. Line breaking rules must be described as tailorings to the standard Unicode algorithm (see section 8 in UAX#14) and neither as an ad-hoc set of rules, nor as a language-specific algorithm.<br>
<br>
Reference: <a href='http://unicode.org/reports/tr14/#Customization'>http://unicode.org/reports/tr14/#Customization</a>

Takeshi: EGLS_TK_01 points to related technologies too. If the rule is described by the Pair Table (see section 7 in UAX#14 TR), it will not be impractical, correct?<br>
<br>
Reference: <a href='http://www.unicode.org/reports/tr14/tr14-25.html#PairBasedImplementation'>http://www.unicode.org/reports/tr14/tr14-25.html#PairBasedImplementation</a>

Murata:  Is this a requirement for reading systems?  Or, is this a request that the EPUB 2.1 should be based on UAX#14?  I do not think reading systems should be required to use UAX#14.<br>
<br>
Murata:  In Sapporo, it was agreed that this is not a requirement but rather informative information for implementors.