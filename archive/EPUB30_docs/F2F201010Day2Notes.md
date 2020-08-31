# Decisions #

  * Detach from the EPUB3 specification development both Annotations and Cross Document Linking.
  * Begin process for developing new specifications for both Annotations and Cross Document Linking.
  * Specification development for the CSS Page Template spec will be independent of EPUB3

# Morning Plenary #

## Metadata and OPS Role ##

Defined in ImplementationProposalsMetadata and ImplemenationProposalRoleOpsType. Described by Bill K and Markus G.

Markus G clarifies that a decision on RDFa 1.1 and microdata has been defered.

Markus G summarizes the changes outisde of OPF:

  * OPS gains an optional `ops:type` (or `role`, TBD) attribute globally for all elements
  * NCX gains an optional `ops:type` (or `role`, TBD) attribute on navMapglobally for all elements

This `ops:type` (or `role`) inherits semantics from DocBook `role` or TEI `type`. See ImplemenationProposalRoleOpsType for more detail. The values inside the attribute are CURIEs. This is what adds PRISM and book-specific semantics ([TextContent#General\_book\_semantics](TextContent#General_book_semantics.md)).

Markus G suggests that we encourage authors to follow a loose association between specific `ops:type` attribute values and OPS elements.

Rough consensus reached.

## Metadata and OPF ##

Defined in ImplementationProposalsMetadata. Described by Bill K and Markus G.

Markus G summarizes the changes for OPF, which are clarified and listed here: [ImplementationProposalsMetadata#Proposals\_Summary](ImplementationProposalsMetadata#Proposals_Summary.md)

Keith F wonders about whether the `link` element's attributes should be harmonized with the HTML5 `link` element.

Keith F wonders whether the additions of the `rel` and `property` attributes to `item`s are "worth it" or whether they should just be "normal" `meta` properties. Peter S strongly encourages a single solution for referencing a cover image (among other things).

Peter S is uncomfortable deprecating (Content Conformance-wise) the DC elements outside of the required 3 (title, identifier, creator).

Rough consensus reached on ImplementationProposalsMetadata. The first draft will only use `meta` and `property`. `rel` will be dropped. DC elements will not be deprecated.

This should conclude the initial changes to OPF.

# Afternoon Plenary #

## Text Audio Syncing ##

Defined in ImplementationProposalTextAudioSync.

Marissa D adds that she may want to add a switch based on the language of the SMIL.

Markus G asks whether this is required for Reading System Conformance. It isn't.

Markus G wonders with Bill M whether this should be a separate document.

Rough consensus reached.

## Multimedia Triggers ##

Defined in ImplementationProposalTriggers. Described by Peter S.

This is not a complete replacement for HTML5 multimedia controls but does provide a usable, if incomplete, solution. Reading Systems need a declarative way to start and stop multimedia in Non-scripted OPS3 Content. This allows a set of buttons wired to start/top a unit of multimedia (potentially SMIL too?).

We're not sure if this is significantly improved from the audio/video elements' attributes defined in HTML5.

Adobe has already developed a similar type solution based on declarative markup for magazine interaction.

Garth C and Peter S assert that content creators find the `controls` ugly.

Daniel W is concerned the the set of `actions` is too limited (it does not include a play-starting-at).

This is **exclusively** limited to Non-scripted OPS3 Content.

There is some concern about the absence of volume up/down and some other controls. Open tickets.

Rough consensus reached.

## Embedding Rich Media ##

Defined in ImplementationProposalRichMediaEmbedding. Described by Peter S.

Peter S and Markus G believe that the HTML5 WG will work toward more accessibile multimedia (`track`, among others) in HTML5. We will need to review it when it lands.

This includes references to external content.

Rough consensus reached.

## Audio and Video Formats ##

Rough consensus reached to add a MUST support MP3 audio if you support audio.

## Annotations ##

Will M proposes one of **3** annotations proposals.

Both Annotations and Metadata have a strong requirement for linking to another document. In addition, those links need to include some detailed location inside the document's content.

  * Detach from the EPUB3 specification development both Annotations and Cross Document Linking.
  * Begin process for developing new specifications for both Annotations and Cross Document Linking.


```
<annotations xmlns="http://idpf.org/2011/annotation">
  <annotation id="uuid1">...</annotation>
  <annotation id="uuid2">...</annotation>
</annotation>  
```

Not faithfully captured:

```
<annotations xmlns="http://idpf.org/2011/annotation">
  <annotation id="uuid1">
    <annotationAuthor>
      <name>John Doe</name>
      <identity>...</identity>
      <profile>...</profile>
    </annotationAuthor>
    <created>2010-10-17</created>
    <modified>2010-10-18</modified>
    <annotationTargets>
      <documentIndentifier>...</documentIdentifier>
      <additionalDocumentIndentifier>
        <title>Huckleberry Finn</title>
        <author>Mark Twain</author>
        <publicationDate>1885</publicationDate>
      </additionalDocumentIdentifier>
      <location>
        <xpath>...</xpath>
        <elementOffset>
          <char>432</char>
          <!-- or -->
          <time>[relative time]</time>
          <!-- or -->
          <spatial>x,y[,z]</spatial>
        </elementOffset>
        <id>#....</id>
        <uniqueString>Twas brillig, and the slithy toves...</uniqueString>
      <location>

      <renderingInfo>
        <private/>
        <public>
          <hilight>yellow</hilight>
        </public>
      </renderingInfo>
    </annotationTargets>
    <annotationContent>
      <annotationString xml:lang="en-US">My text balloon</annotationString>
      <!-- or  -->
      <range>
      </range>
    </annotationContent>
  </annotation>
  <annotation id="uuid2">...</annotation>
</annotation>  
```

Peter S notes that Adobe has developed an independent, less complex proposal.

Dave M suggests that there is a higher requirement for defining Cross Document Linking because there are more dependencies on it.

Rough consensus reached.

## CSS Page Templates ##

Defined in [CSSPageTemplates](CSSPageTemplates.md). Described by Brady D.

Brady D recommends developing a separate specification for CSS Page Template:

  * EPUB3 specification development the CSS Page Template spec

Rough consensus reached.

## Calc ##

Defined in [SolutionSNL\_R1\_2](SolutionSNL_R1_2.md). Described by Brady D.

Throw this at CSS Page Templates.

Rough consensus reached.

## Media Queries ##

Defined in [SolutionSNLR1\_1](SolutionSNLR1_1.md). Described by Brady D.

Rough consensus reached.

## Hyphenation ##

Defined in [SolutionSNLR3\_3](SolutionSNLR3_3.md). Described by Brady D.

This property may be partially implied/required by EGLS.

Rough consensus reached.

## Embedded Fonts ##

Defined in RequireEmbeddedFontSupport. Described by Brady D.

Keith F does not understand the requirement that Conforming Reading Systems MUST support WOFF and OpenType embedded fonts.

Big fight.

Makoto notes that there are EGLS requirements that may strongly encourage. Makoto notes that SVG fonts may also be required.

## Zoomable ##

Defined in [SolutionSNLR3\_11](SolutionSNLR3_11.md). Described by Brady D.

Rough consensus reached.

## SVG in the Spine ##

Defined in [SolutionSNL\_R4\_1](SolutionSNL_R4_1.md). Described by Brady D.

George K is concerned about accessibility.

Change: "The first 'rootfile' element that has a media-type of 'application/oebps-package+xml' MUST be considered to be the default representation of the publication"

Rough consensus reached.

## NCX and Navigation ##

Simplify the NCX, primarily by removing items that were optional in 2.0.1:

  * Define as RELAX NG.
  * Make head optional
  * Remove `audio`

Group moves to revivify `pageList`.

Group moves to add a MUST requirement for NCX, following http://www.idpf.org/doc_library/epub/OPF_2.0.1_draft.htm#Section2.4.1.2.

Markus G notes that the spec will have to be extremely careful about the examples in version EPUB3 because of problems with the comprehension of EPUB 2.

Rough consensus reached.

## Referencing CSS3 ##

Goals:

  * Understand the state of CSS3 Modules
  * Understand the techniques we might use for normatively referencing or including them
  * Prepare any possible items to bring ot the W3C Technical Plenary / Advisory Committee Meetings 1-5 November 2010

CSS status codes:

  * Working Draft
  * Last Call
  * Canidate Recommendation: Call for implementations (Testing phase)
  * Proposed Recommendation: Every feature has to have at least two implementations and a complete test suite for the same before making it here
  * Recommendation

Many specs go to CR twice.

Specs interesting to EPUB3

  * Media Queries Level 3: CR (very stable)
  * CSS Multi-column Layout: CR (pretty stable, first CR, no test suite, overflow of the `multicolumn` element is probably underspecified, pagination won't be handled/well-define here)
  * CSS Fonts: WD (Starting to stablize on feature set; LC early 2011?; Garth notes our own fall)
  * CSS Ruby: CR (first CR, unstable. Probably will return to WD; unclear how big the changes will be; REC: Do not reference the spec itself but inherit the `ruby-position` property using a vendor prefix)
  * CSS Text Level 3: WD (unstable but scope is fairly set; hopefully CR in early 2011?; needs more international feedback)
  * CSS Writing Modes: WD (brainstorming, with good feedback coming from Dave Hyatt, who is implementing; hopefully good discussion at TPAC; very unclear at this point)

Peter S is concerned in general with the idea of referencing CR specs.

Elika Etemad recommends inheriting properties (in the CSS Ruby case) using a vendor prefix for now.

Implementations that provide test suite results ("Implementation Results") to the W3C must be "publicly available."

Makoto wonders about providing some tests (not a complete suite, perhaps) on writing mode.

Many of the CSS specs are stuck because of a lack of a test suite.

Consensus **seems** to be there for using Media Queries Level 3 and inheriting CSS Ruby.

CSS Writing Modes is the most critical for the success of EPUB3. It is the most un-ready. Much discussion.

Elika asserts that, for Multi-column (exclusing some of the carveouts described above), bugs in implementations will be as significant to EPUB3 documents as specification changes.

Elika asserts that, for Writing Modes after first CR, bugs in implementations will be as significant to EPUB3 documents as specification changes.

Peter S believes that the EPUB3 specification must include warnings to authors about the lack of stability of certain CSS specifications/properties. Elika says that all CSS-styled documents are inherently fluid and partially unstable.

Peter S thinks the spec should include normative language like "Authors must not depend on any specific behavior..."

Will M clarifies that design longevity and content longevity are different things.


Elika encourages developers to submit tests, implementation reports, and to join the mailing lists and contributes.