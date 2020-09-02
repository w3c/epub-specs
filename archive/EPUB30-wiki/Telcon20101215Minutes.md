

recording filename is 101215

# Present #
wen-hsuan, Takeshi, DaveGunn, fantasai, danhughes, ChoChin, kingwai, Kyoji, Norm, matthaas, RogerWebster, marisa\_demeglio, BillMcCoy, danielweck, Murata, Brady, ShuTanabe, Ryoji\_Akimoto, Vlad, EricFreese, SteveKotrch, Mei-Li, mgylling, BillKasdorf


# New action items #

From this call:

  * Daniel Weck to simplify wiki page about email good practices
  * James Pritchett to assure that the OCF either disallows strong encryption or that it explicitly mentions zip64 level 1



# Previous action items #


## Email good practices ##

[Wiki page](http://code.google.com/p/epub-revision/wiki/Email_Good_Practices) by danielweck has a lot of info


ACTION: danielweck to simplify wiki page about email good practices



## January meeting ##

Chairs to meet directly after this call to discuss



## Container ##

Issues 55, 56 -- Murata proposes to close these two issues in light of new information


ACTION: James Pritchett to assure that the OCF either disallows strong encryption or that it explicitly mentions zip64 level 1



# Font discussion #

Last Friday, the group met to resolve issues.

Summary:

[Solution Proposal 3](http://code.google.com/p/epub-revision/wiki/FontEmbedding#3)_Strengthen_RS_reqs_and_extend_to_support_WOFF,_inc_mangling) chosen

Mangling/obfuscation support is now required by visual reading systems

If embedded fonts are used, one type must be open type or WOFF

Proposed rephrase: If a font is embedded that is neither open type nor WOFF, the publication must use a fallback (could be a default system font or an open type/WOFF)

some more discussion is required regarding what authoring tools must do

reading systems must support WOFF/open type in order for all this to work

question about what fonts are available on all systems - do we enumerate them?  serif, sans serif, etc

question about how often fallbacks will be used - likely authors will want their first choice, not the fallback, to be the most commonly supported option.

**Summary**: Any font format that is not open type or WOFF must use one of the appropriate fallback mechanisms available in epub, either using CSS or manifest fallbacks

CSS for system fonts, manifest for WOFF/opentype.  Or could use CSS for both and forbid manifest use for font fallbacks.  Advantage to using only one approach.

**decision**: in the case that a font fallback is required: use built-in CSS fallback mechanism for embedded fonts (default system, open type, or WOFF)

SVG fonts: we allow full SVG full minus interactivity.  So, that includes fonts.

There are good use cases for SVG fonts, bound to a sequence of unicode characters. E.g. smiley faces where colon-right paren becomes a yellow happy face

issue: how to accommodate both SVG and open type?

proposal: don't mandate svg font support

**decision**: an svg font can be referenced by CSS.  as reading systems are not required to support svg font, authors should use the css fallback mechanism.

question: must a fallback be provided for when svg fonts are used on html elements? (as in, inline use, not css)

new information:  svg fonts use font family, so you always have the css cascade available, even when used inline


# Editors report #

Draft coming tomorrow, Dec. 16th

Looking for extra editing help in the near future (see Bill M's email)


## January ##

a january public draft seems reasonable

subgroup leads asked to bring up major items, perhaps break-out threads that may be ready for re-integration into EPUB.  Such as - linking, annotations, dictionaries

Linking is potential candidate for the end of january draft.  Some recent decisions have been made (see list) regarding linking schemes.

page templates proposal.  question about the availability of peter's javascript implementation, the code for which is being considered by adobe for release.

decision: more clarity + implementation would be required of the page templates proposal in order to include it in EPUB 3; hoping it will emerge later as an informational document

solutions for CSS modules - not a single solution for defining our relationship with each - Murata has been bringing up issues on the list

our ability to clearly reference properties depends on their maturity level

concern: while this is fine for informative language, how can we write normative text that references moving-target specs?

one answer: we could make our own copies of immature css properties

**decision**: CSS issues are highest priority for january

CSS3 speech CR expected in February, some pending issues are non-trivial, invite EPUB members to join the discussion on these issues

**January priorities**: spec consolidation, CSS relations, linking

Alternate style tags is another issue that needs our attention

Next call: Jan 5th

Happy holidays and new year to everyone