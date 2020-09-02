# Changes to supported CSS properties between EPUB 2.0.1 and EPUB 3 #



## Introduction ##

The following sections should describe the CSS property changes between EPUB 2.0.1 and EPUB 3.  It is possible that this sort of change description should be included in the informational "Changes" document of the specification.  The below is believed accurate as of mid-May 2011 – additions, corrections and amplifications are welcome!

## Additions due to CSS 2.1 ##
|'speech' media type ('aural' deprecated)|
|:---------------------------------------|
|@media rules (beyond 'speech' and 'all')   `[`EPUB 3 uses CSS3 CR Media Queries`]`|
|@import `[`EPUB 3 uses CSS3 CR Media Queries`]`|
|display: inline-block|
|position:|
|z-index:|
|max-width: none|
|vertical-align: `<`percentage`>`|
|vertical-align: `<`length`>`|
|overflow:|
|clip:|
|visibility:|
|content:|
|quotes:|
|counter-reset:|
|counter-increment:|
|list-style-image:|
|color: orange|
|background-image:|
|background-repeat:|
|background-attachment:|
|background-position:|
|background:|
|font-family: cursive, fantasy|
|font-weight: bolder, lighter|
|text-decoration: overline, blink|
|letter-spacing:|
|word-spacing:|
|text-transform:|
|white-space: pre-wrap, pre-line|
|border-collapse:|
|border-spacing:|
|empty-cells:|
|cursor:|
|outline-width:|
|outline-style:|
|outline-color:|
|outline:|

## Removals due to CSS 2.1 ##
|'aural' media type ('speech' introduced instead)|
|:-----------------------------------------------|
|display: run-in|
|max-width: auto (likely just an error in 2.0.1)|
|list-style-type: upper-greek|
|caption-side: left, right|

## Removals in favor of HTML markup ##
|direction:|
|:---------|
|unicode-bidi:|

## Additions from CSS 3.0 Speech ##
(apply to the new CSS2.1 'speech' media type)
|-epub-cue|
|:--------|
|-epub-pause|
|-epub-rest|
|-epub-speak|
|-epub-speak-as|
|-epub-voice-family|

## Additions from CSS Text Level 3 ##
|-epub-hyphens|
|:------------|
|-epub-line-break|
|-epub-text-align-last|
|-epub-text-emphasis|
|-epub-text-emphasis-color|
|-epub-text-emphasis-style|
|-epub-word-break|
|text-transform: -epub-fullwidth, -epub-fullsize-kana|

## Additions from CSS Writing Modes Module Level 3 ##
|-epub-writing-mode:|
|:------------------|
|-epub-text-oreientation:|
|-epub-text-combine:|
|caption-side: before, after|

## Additions from CSS3 Multi Column ##
|column-width:|
|:------------|
|column-count:|
|columns:|
|column-gap:|
|column-rule-color:|
|column-rule-style:|
|column-rule-width:|
|column-rule:|
|break-before:|
|break-after:|
|break-inside:|
|column-fill:|

## Additions ##
|CSS3 CR Namespace Module|
|:-----------------------|
|CSS3 CR Media Queries|
|-epub-ruby-position:|

## Changes ##
In EPUB 3 @font-face is from CSS Font Level 3 (rather than CSS2), required descriptor support:
|font-family|
|:----------|
|font-style|
|font-weight|
|src|
|unicode-range|