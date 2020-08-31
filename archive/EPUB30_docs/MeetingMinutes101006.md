Chair: Markus Gylling

Scribe: Marisa DeMeglio

Recording filename: 101006

# Attendees #
Si-Wei, wen-hsuan, wenhsuan, DaveGunn, gc, fantasai, karenbroome, ChoChin, DanHughes, Kyoji, Norm, jiang-chun, kennyluck, matthaas, James\_Pritchett, BillMcCoy, marisa\_demeglio, KingWai, peter, danielweck, Murata, NeilS, ShuTanabe, Ryoji\_Akimoto, SteveKotrch, Mei-Li, mgylling, wmanis

# Prev Action Item Review #
Many wg members are at a conference in Frankfurt; no action item updates given.

# F2F #
F2F organization: many subgroups need to have discussions with members from other subgroups.  Therefore, splitting up is not optimal.  Suggest the following: two meeting groups made up of many subgroups.  Each meeting group has a coordinator who ensures that the meeting group sessions are done in a planned manner (can split up or stay a group).  They present the findings.

Two groups:

  1. EGLS, Styling, Rich media.  Brady to coordinate.
  1. Text content, annotations, metadata, navigation. Markus to coordinate.

Suggestion: subgroups in the morning, plenary in the afternoon.  Entire group can review issues and implementation proposals.

The last day is a half day.  Expect most of it to be a full group plenary.  Getting drafts out and adjusting scope are topics for the last day.


# Subgroup status reports #

## Annotations ##
Coming to F2F with implementations for several different proposed mechanisms.

Comments welcome on the current wiki page

Overlap with other groups re: document identification

Want to discuss range of use cases

## EGLS ##
(from Murata on IRC)

We had very nice good meeting

EGLS requests that this document  be published as part of the EPUB family of specifications: http://fantasai.inkedblade.net/style/specs/altss-tags/

W3C is developing two specs.  They are expected to become CRs early next year.
  * http://dev.w3.org/csswg/css3-text-layout/
  * http://dev.w3.org/csswg/css3-text/

EGLS relies on these specs heavily

We will provide recommendations soon.


## Metadata ##
Looking at RDFa

Comments welcome on wiki proposal

Outstanding i18n issue (related to metadata, package file, and ncx).  Plain text is all that's allowed for human-readable text (labels etc).  However, certain languages require more.

(from Murata on IRC):
We discussed about that.  We rather request two elements: One is for ideographics.  The other is for Hiragana or Bopomofo ruby

## Navigation ##
NCX to be cleaned up during this revision but no major revisions are expected

Relax NG schema to be created

## Text Content ##
Two open threads:
  1. dictionaries: use cases available at the top of the [dictionaries/glossaries wiki page](DictionariesGlossaries.md).  these use cases are intended to guide us in the design. input welcome on the use cases
  1. OPF grammar: wiki page started, "HTML5 Subsetting"

## Styling/Layout ##
some additional requirements coming

## Rich Media ##
Implementation proposals started, contributions and refinements welcome

Question: are we specifying codecs beyond what HTML5 says?<br />
Answer: HTML5 does not define a set of formats.  It's a difficult problem, not addressed yet, but proposals welcome.

Any clarifications from last week's "Night Mode" discussion?
No agreement was reached, good topic for the F2F.

## Scripting ##
Looking for best compromise solution

Two issues that came up during side discussions
  1. we don't know everything that interactivity and scripting will be used for
  1. HTML5 scripting is under-specified and not yet finalized

It would be challenging to subset HTML5 scripting -- no concept of modularity in script processing

A big problem: scripting in a flow document may likely conflict with pagination features in reading systems

Proposal: allow two different types of content
  1. OPS, which is probably going to be a small subset of HTML5.  processed according to expectations for existing reading systems.
  1. HTML5 content, processed by a browser UA

Recommend to restrict HTML5 use for maximum compatibility with other reading systems, but since it's HTML5, the APIs are then available.

Still being discussed, at what level do we contain scripting (in an iframe?)

Expectation: where scripting appears, pagination may be disabled

fallback mechanisms in place

Implications for conformance testing

benefits: keeps OPS declarative, also lets us be ok with HTML5's unfinished-ness

downside: content authors could get lazy and start using HTML5 everywhere, even for content that could be represented by OPS

downside: either-or choice of getting scripting or new OPS features (that are not necessarily in HTML5)

Question from Will Manis: will there be restrictions on what the scripting engine can do to that content?<br />
Answer: we can make high-level recommendations but not enough is known about script use cases to make individual restrictions

Up for consideration: looking at design patterns such as MVC

Consider statements about document stability: DOM modifications must not interfere with annotation, accessibility (examples of features which rely upon a stable document structure)

Why it is fruitless to try to restrict scripting: reading systems that support scripting will be using browsers, whose script processing rules we can't control

Question: in HTML5 mode, are the extensions allowed?<br />
Answer: reading-system dependent

Concerns about bifurcation of OPS, could inadvertently create two versions

Next steps: discuss on list, create examples