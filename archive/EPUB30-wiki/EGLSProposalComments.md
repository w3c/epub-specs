# Proposed modifications to EGLS subgroup recommendation #

This document contains comments to http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WG.html

Main problem: there is no consensus in the overall WG about relationship to CSS3. The discussion in the WG is captured [CSS3Relations](CSS3Relations.md). EGLS recommendation must be formulated without second-guessing the direction on CSS3.

MURATA: Agree to develop such consensus in the WG meeting. What we are doing is not second-guessing.  Some of the EGLS members worked with an important member of the CSS WG for one month together in Japan.

## Recommendation A ##

Introduce an OPF-namespaced metadata element that indicates preferred document page progression direction (left-to-right or right-to-left) and writing mode (vertical or horizontal).

Rationale: spine defines ebook structure, not presentational/medadata aspects. This information belongs to metadata.

MURATA:  I can agree with this personally.  More discussions are needed about the interactions between the writing mode and OPS-package-level information about the page progression direction.

## Recommendation B ##

Incorporate the following properties from _CSS Writing Modes Module Level 3_ (http://dev.w3.org/csswg/css3-text-layout/ ):
  * writing-mode (exclude horizontal-bt value)
  * text-orientation (perhaps subsetted)
  * text-combine (only none and upright values)

Exact method of importing CSS3 properties is TBD for overall spec.

Give only general definitions for these properties, excluding any language from the current draft that has any chance to change later. If we want to align with this CSS3 module, content creators need to design documents defensively accepting that details of the implementation may change.

Research if using "display: inline-block; writing-mode: horizontal-tb" is a sufficient replacement to "text-combine: upright" (see EGLS\_MT3 Solution A); drop text-combine property if it is.

MURATA:  Disagree.    If we reference to _CSS Writing Modes Module Level 3_ in our draft and encourage implementations and feedbacks, this module will become mature by the publication of EPUB3.  All of the mechanisms in CSS3 writing modes are needed for EGLS requirements, and implementers are actively implementing them.  Subsetting at this stage is merely a recipe for troubles.

## Recommendation C ##

Incorporate the following properties from _CSS Text Level 3_ (http://www.w3.org/TR/css3-text/ ):
  * line-break (perhaps subsetted)
  * text-justify (perhaps subsetted)
  * hanging-punctuation (at risk?)
  * text-emphasis

MURATA:  Disagree.    If we reference to _CSS Text Level 3_ in our draft and encourage implementations and feedbacks, this module will become mature by the publication of EPUB3.  Moreover, each feature in it is needed for some natural language.  Subsetting at this stage is merely a recipe for troubles.  If _CSS Text Level 3_ does not become reasonably mature by January, we might want to do subsetting at that stage.  Not now.

## Recommendation D ##

Handle ruby-position property the same way as all other imported CSS3 properties (exact method TBD, pending [CSS3Relations](CSS3Relations.md) resolution).

MURATA: Disagree.  CSS3 Ruby is much less mature than any other CSS3 modules recommended by EGLS, and is unlikely to become mature in the near future.  Nevertheless we need ruby-position for distinguishing bopomofo ruby and Japanese/Chinese ruby.  Autodetection based on code values does not work since hiragana can occasionally be used as part of bopomofo ruby.  Thus, idpf-ruby-position makes a lot of sense.

## Recommendation J ##

Explicitly list properties that need to be imported from _CSS Multi-column Layout Module_ (http://www.w3.org/TR/css3-multicol/ )

MURATA:  Disagree.  Use _CSS Multi-column Layout Module_  as a whole.  If we reference to it in our draft and encourage implementations and feedbacks, this module will become mature by the publication of EPUB3.