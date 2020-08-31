

# HTML5 Subset for Inclusion in EPUB3 #

## Introduction ##
The subset of the then-current HTML5 to be included in EPUB3 (more specifically, OPS 3.0) will be impacted by a number of factors:
  * To what extent are we "building up" from OPS 2.0.1
  * To what extent are we "building down" from HTML5
  * What state of completion/stability are various features/elements of HTML5
  * What namespace will be be living in (our "late binding" decision)
  * Implementation burden
  * To what extent modularization of the XML serialization of HTML5 (a la XHTML 1.1) makes sense
  * A proposed principle: to solve our problems OPS 3.0 needs to be an extended subset of the XML serialization of HTML5, with the minimum changes needed to meet our goals. _Question: "extended subset" is a term with multiple interpretations:_
    * _Is it a "minimal subset of HTML5" that includes all OPS 2.0.1 functionality, plus additions from HTML5 that are needed to address the new/unique requirements of the EPUB3 effort?_
    * _Is it all of HTML5 with perhaps "very squishy" bits removed and maybe a few other removals that for some reason that we don't want?_

_FWIW, I (Garth) am somewhat more comfortable with the first of the two above sub-bullets._

## XHTML 1.1 Subset (modules) in OPS 2.0.1 ##
|Module|Example|OPS 2.0.1|Comments|
|:-----|:------|:--------|:-------|
|Structure|body, head|Yes|  |
|Text|p, h1, span, div|Yes|  |
|Hypertext|a |Yes|  |
|List|dl, ol, li|Yes|  |
|Applet|applet, param|No|  |
|Presentation|big, i, sup|Yes|  |
|Edit|del, ins|Yes|  |
|Bi-di|bdo|Yes|  |
|Basic forms|form, input|No|  |
|Forms|button, textarea|No|Includes basic forms|
|Basic tables|table, td, tr|Yes|  |
|Tables|col, colgroup|Yes|Includes basic tables|
|Image|img|Yes|  |
|Client-side image map|map, area|Yes|  |
|Server-side image map|ismap attr|No|  |
|Object|object, param|Yes|  |
|Frames|frameset, frame|No|  |
|Target|target attr|No|  |
|Iframe|iframe|No|  |
|Intrinsic events|onfocus attr|No|  |
|Meta-information|meta|Yes|  |
|Scripting|script|No|  |
|Style sheets|style|Yes|  |
|Style attribute|style attr|Yes|  |
|Link|link|Yes|  |
|Base|base|Yes|  |
|Legacy|center, font|No|  |
|Ruby|ruby, rb, rt|No|  |

## "Modules" in OPS 2.0.1 not in XHTML ##
|Module|Example|OPS 2.0.1|Comments|
|:-----|:------|:--------|:-------|
|Switch|ops:switch|Yes|  |




## OPS 2.0.1 subtracted from HTML5 ##

This table lists elements/attributes in HTML5 that were not in OPS 2.0.1.

Note that the table discusses atomic HTML5 vocabulary entries only; whether or not OPS3 will provide multiple grammars (strict|loose|script-less|interactive-less) using the vocabulary is a separate issue.

Note also that ops-specific _vocabulary extensions_ are not discussed here.

For an introductory overview of news in HTML5, see [HTML5 differences from HTML4](http://dev.w3.org/html5/html4-differences/)

_**The two rightmost columns are simply an initial straw-man, for deliberation and discussion!**_

|_Context_ |_Element/Attribute_ |_Comments_ | _RS support required for **non-scripted/interactive** OPS 3.0_ | _RS support required for **scripted/interactive** OPS 3.0_ |
|:---------|:-------------------|:----------|:---------------------------------------------------------------|:-----------------------------------------------------------|
|**Root** |  |  |  |  |
|  | [html/@manifest](http://dev.w3.org/html5/spec/Overview.html#attr-html-manifest) |  | Yes, but likely ignored | Yes, but likely ignored  |
|**Sections** |  |  |  |  |
|  |[section](http://www.w3.org/TR/html5/semantics.html#the-section-element) |  | Yes | Yes |
|  |[article](http://www.w3.org/TR/html5/semantics.html#the-article-element) |  | Yes | Yes |
|  |[aside](http://www.w3.org/TR/html5/semantics.html#the-aside-element) |  | Yes | Yes |
|  |[hgroup](http://www.w3.org/TR/html5/semantics.html#the-hgroup-element) |  | Yes | Yes |
|  |[header](http://www.w3.org/TR/html5/semantics.html#the-header-element) |  | Yes; does not conflict with "display: oeb-page-head", in fact could be used inside OPS header | Yes; does not conflict with "display: oeb-page-head", in fact could be used inside OPS header |
|  |[footer](http://www.w3.org/TR/html5/semantics.html#the-footer-element) |  | Yes; does not conflict with "display: oeb-page-foot", different semantics | Yes; does not conflict with "display: oeb-page-foot", different semantics |
|  |[nav](http://www.w3.org/TR/html5/semantics.html#the-nav-element) | may conflict with NCX (functional overlap) | Yes, include tutorial note | Yes, include tutorial note |
|**Blocks** |  |  |  |  |
|  |[figure](http://dev.w3.org/html5/spec/Overview.html#the-figure-element) |  | Yes | Yes |
|  |[ol/@reversed](http://dev.w3.org/html5/spec/Overview.html#attr-ol-reversed) |  | Yes | Yes |
|**Phrasing** |  |  |  |  |
|  |[small](http://dev.w3.org/html5/spec/Overview.html#the-small-element) |  | Yes | Yes |
|  |[s](http://dev.w3.org/html5/spec/Overview.html#the-s-element) |  | Yes | Yes |
|  |[time](http://dev.w3.org/html5/spec/Overview.html#the-time-element) |  | Yes | Yes |
|  |[i](http://dev.w3.org/html5/spec/Overview.html#the-i-element) |  | Yes | Yes |
|  |[b](http://dev.w3.org/html5/spec/Overview.html#the-b-element) |  | Yes | Yes |
|  |[mark](http://dev.w3.org/html5/spec/Overview.html#the-mark-element) |  | Yes | Yes |
|  |[ruby](http://dev.w3.org/html5/spec/Overview.html#the-ruby-element) | Was "extended module" in OPS201. Awaiting recommendation from EGLS (simple vs complex ruby, mono/group/jukugo, etc) | Perhaps optional? | Perhaps optional? |
|  |[wbr](http://dev.w3.org/html5/spec/Overview.html#the-wbr-element) | EGLS linebreaking algorithm impact? | Yes | Yes |
|**Script** |  |  |  |  |
|  | [head/script](http://dev.w3.org/html5/spec/Overview.html#script) internal | Awaiting recommendation from interactivity sub-group | No | _??_ |
|  | [head/script](http://dev.w3.org/html5/spec/Overview.html#script) external (@src) | Awaiting recommendation from interactivity sub-group | No | _??_ |
|  | [head/script/@async](http://dev.w3.org/html5/spec/Overview.html#script) | Awaiting recommendation from interactivity sub-group | No | _??_ |
|  | [head/script/@defer](http://dev.w3.org/html5/spec/Overview.html#script) | Awaiting recommendation from interactivity sub-group | No | _??_ |
|  | [body//script](http://dev.w3.org/html5/spec/Overview.html#script) | Awaiting recommendation from interactivity sub-group | No | _??_ |
|  | [event handler attrs](http://dev.w3.org/html5/spec/Overview.html#event-handler-content-attributes) | Awaiting recommendation from interactivity sub-group | No | _??_ |
|**Embedded** |  |  |  |  |
|  |[iframe](http://dev.w3.org/html5/spec/Overview.html#the-iframe-element) (@sandbox, @seamless, @srcdoc) | Awaiting recommendation from interactivity sub-group | Yes, for non-scripted content | _??_ |
|  |[embed](http://dev.w3.org/html5/spec/Overview.html#the-embed-element) | Awaiting recommendation from interactivity sub-group | No | _??_ |
|  |[object](http://dev.w3.org/html5/spec/Overview.html#the-object-element) | Awaiting recommendation from interactivity sub-group | Yes | Yes |
|  |[canvas](http://dev.w3.org/html5/spec/Overview.html#the-canvas-element) | Awaiting recommendation from interactivity sub-group | No | Yes |
|  |[video](http://dev.w3.org/html5/spec/Overview.html#video) | Awaiting recommendation from RichMedia subgroup (see comments below this table) | Yes or May | Yes or May |
|  |[audio](http://dev.w3.org/html5/spec/Overview.html#audio) | Awaiting recommendation from RichMedia subgroup (see comments below this table) | Yes or May | Yes or May |
|  |[map](http://dev.w3.org/html5/spec/Overview.html#the-map-element) | OPS201 excludes server-side maps | Yes; retain OPS 2.0.1 exclusion | Yes; retain OPS 2.0.1 exclusion |
|  |[area](http://dev.w3.org/html5/spec/Overview.html#the-area-element) |  | Yes | Yes |
|**Style** |  |  |  |  |
|  |[\*/@style](http://dev.w3.org/html5/spec/Overview.html#the-style-attribute) | Deprecated in 2.0.1 | Yes | Yes |
|  |[body//style](http://dev.w3.org/html5/spec/Overview.html#the-style-element) | Wider support placement in HTML5 over XHTML | Yes | Yes |
|  |[body//style/@scoped](http://dev.w3.org/html5/spec/Overview.html#attr-style-scoped) |  | Yes | Yes |
|**Forms** |  |  |  |  |
|  |[forms](http://dev.w3.org/html5/spec/Overview.html#forms) | Awaiting recommendation from RichMedia subgroup | Yes, could be useful for formatting even without network connection or scripting | Yes |
|**Interactive** |  |  |  |  |
|  |[details](http://dev.w3.org/html5/spec/Overview.html#the-details-element) |  | Yes, no implied interactivity? | Yes |
|  |[summary](http://dev.w3.org/html5/spec/Overview.html#the-summary-element) |  | Yes | Yes |
|  |[command](http://dev.w3.org/html5/spec/Overview.html#the-command) |  | No | Yes? |
|  |[menu](http://dev.w3.org/html5/spec/Overview.html#menus) |  | No | Yes? |
|**MathML** |  |  |  |  |
|  | [MathML3](http://www.w3.org/TR/MathML3/) | Awaiting [ImplementationProposalsMathML](ImplementationProposalsMathML.md) | Yes or optional, with [restrictions](ImplementationProposalsMathML.md) | Yes or optional, with [restrictions](ImplementationProposalsMathML.md) |
|**SVG**|  |  |  |  |
|  | [svg](http://www.w3.org/TR/html5/the-map-element.html#svg-0) | OPS201 references [SVG11](http://www.w3.org/TR/SVG11/) whereas HTML5 references [Tiny12](http://www.w3.org/TR/SVGTiny12/) (see [Issue 5](http://code.google.com/p/epub-revision/issues/detail?id=5))| Yes, version TBD | Yes, version TBD |
|**Obsolete** |  |  |  |  |
|  | [obsolete](http://dev.w3.org/html5/spec/Overview.html#obsolete) |  | No | No |
|**Attributes** |  |  |  |  |
|  | [@contenteditable](http://dev.w3.org/html5/spec/Overview.html#attr-contenteditable) | Awaiting recommendation from interactivity sub-group | No | Yes? |
|  | [@contextmenu](http://dev.w3.org/html5/spec/Overview.html#attr-contextmenu) | Awaiting recommendation from interactivity sub-group | No | Yes? |
|  | [@data-\*](http://dev.w3.org/html5/spec/Overview.html#custom-data-attribute) | Awaiting recommendation from interactivity sub-group | No | Yes |
|  | [@draggable](http://dev.w3.org/html5/spec/Overview.html#the-draggable-attribute) | Awaiting recommendation from interactivity sub-group | No | Yes? |
|  | [@hidden](http://dev.w3.org/html5/spec/Overview.html#the-hidden-attribute) | Awaiting recommendation from interactivity sub-group | No | Yes? |
|  | [@role](http://dev.w3.org/html5/spec/Overview.html#annotations-for-assistive-technology-products-aria)| Contender for use with [TE.01](TextContent#TE.01_Allow_for_inflection_of_domain-specific_semantics_on_top_o.md). Awaiting recommendation from TextContent subgroup| Yes, possibly willfully violated | Yes |
|  | [@aria-\*](http://dev.w3.org/html5/spec/Overview.html#annotations-for-assistive-technology-products-aria)| Integration needs further input/analysis | Yes? | Yes? |
|  | [@spellcheck](http://dev.w3.org/html5/spec/Overview.html#attr-spellcheck) |  | No | Yes? |

### Comments about HTML5 Video/Audio ###

Note that unlike the W3C version of HTML5, the WhatWG version includes support for video/audio accessibility, in the form of dedicated inline markup (nested inside the video/audio tag) allowing authors to specify supplementary (and out-of-band, i.e. encoded in external files) content "tracks" for text captions/subtitles, audio descriptions, chaptering/navigation layer, etc.

Here is a quote from the official statement in the W3C specification:

"this content is not intended to address accessibility concerns. To make video content accessible to the blind, deaf, and those with other physical or cognitive disabilities, authors are expected to provide alternative media streams and/or to embed accessibility aids (such as caption or subtitle tracks, audio description tracks, or sign-language overlays) into their media streams."

As usual, this is work-in-progress on both the W3C and WhatWG sides, so we should be prepared for changes in the specification, and perhaps even in W3C's strategy regarding video/audio accessibility.

References:

http://www.w3.org/TR/html5/video.html#video

http://www.whatwg.org/specs/web-apps/current-work/multipage/video.html#the-track-element
http://www.whatwg.org/specs/web-apps/current-work/multipage/video.html#timed-tracks