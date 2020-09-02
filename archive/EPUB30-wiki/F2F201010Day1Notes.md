# Decisions #

  * DECISION: first internal draft will maximize references to building block specs (W3C etc.) even if unclear whether they will be normative in EPUB 3
  * DECISION: first public draft (EOY) will reflect a plan for each building block spec (decision or action plan)

# Afternoon Plenary #

## Scripting ##

Defined in ScriptingImplementationProposal. Described by Bill M.

On Scripting, the subgroup recommends ScriptingImplementationProposal, which defines two classes of OPS content resources:

  * Non-scripted OPS3 Content: Processing model is defined in OPS3 (not HTML5)
    * May reference (`iframe`, `object` references as usual, fallbacks required)
    * Probably the **majority** of EPUBs in the wild will use this type.
  * (x?)HTML5 Content with Scripting: Processing model is defined in HTML5
    * If this xHTML5 content is reference from the `spine` it will be implementation-dependent on how this is processed
    * MAY limit OPS3 features.

Each resource `item` MUST specify (perhaps with a default) which of the two classes of OPS content resource is referenced.

Markus wonders about what exactly this implies in terms of the OPS3 Content schema.

What about HTML5? What can we guarantee about how it is processed? We don't specify very much here, because we expect implementors to use an HTML5 rendering engine and we're deliberately not specifying very much.

George wonders whether an EPUB3 document might be made up of heterogenous classes of OPS content resources. Some fallbacks for `object` and `iframe` are as-defined, but scripted content (HTML5) may be able to be legitimately read as Non-scripted OPS3 Content.

Neil S wonders why we have chosen not to do OPS3+Scripting. Bill M suggests that the inclusion of scripting in OPS3 is too big/too moving of a requirement for the spec. Peter S suggests that using the HTML5 processing model should allow more consistent behavior. Garth C suggests that the Non-scripted OPS3 Content might use techniques for scripted island. Keith F suggests that there is ongoing work on "scoped widgets" for defining re-usable, scripted islands inside Non-scripted OPS3 Content, but it needs more time.

Will M wonders how we would react to 90% of EPUB3 documents in 3 years using HTML5 content. Peter S would be fine with there being future consensus. Bill M suggests that the Subgroup did consider this.

Rough consensus reached.


## Text Content ##

Text Content is not as far along with Dictionaries/Glossaries as they had hoped. They have explicitly limited their work to 8 specific topics.

Dave M will discuss a solution for dictionaries but this is not yet ready for a decision.

Neil S will propose a MathML inclusion proposal.

OPS3.0 document type already has consensus.

The three TTS-related proposals (PLS, Voice characteristics, and phonemes) are relatively trivial and will be reviewed without plenary time. Brady wonders about the implications of CSS 2.1 aural stylesheet-support and the new requirement for Voice characteristics.

Semantic inflection from a `role` attribute (perhaps in our own namespace). This needs discussion with W3C. It is related to the Metadata subgroup's work. This is not Plenary material at this time.

### MathML ###

Defined in ImplementationProposalsMathML. Presented by Neil S.

MathML 3 will be a W3C Recommendation this week. The recommendation is to restrict the larger specification in three ways:

  * Limit where "content" MathML may appear in content (the "presentational" version needs to be included)
  * Fallbacks using images
  * Fallbacks and alt text

MathML has been a part of IE and Firefox for a while and is usable. Opera has a subset implemented. Webkit is working actively on it but it isn't yet usable (perhaps a "year").

Decisions for the Working Group:

  * Will MathML rendering be a requirement for a conforming Reading System? There is basic support for requiring Conforming EPUB3 Reading Systems to render presentational MathML 3.0. Bill M would like be able to re-evaluate the MUST later.

Makoto believes that Reading Systems should be given wide leeway on what exactly "support" means. Much discussion.

Rough consenus reached for: Conforming EPUB3 Reading Systems MUST "support" presentational MathML 3.0.

### Dictionaries and Glossaries ###

Defined in DictionariesGlossaries. Presented by Dave M & Dan H.

Dave M was concerned that TEI and other existing dictionary markup standards were too large and foreign. Dave M suggests the Apple Dictionary Services Markup.

**This Proposal is not ready for acceptance.**

The markup and indexing of the markup is relatively straightforward. It is the basis of the Mac OS and iBooks dictionary implementations. We may need to

Apple will grant a royalty-free Apple Dictionary Services Markup. Modifications would be submitted back to Apple for "approval."

Peter S wonders about using OPS-type exclusively instead.

Keith F wonders whether this would be a top-level document type (yes, probably) or just an `item`.

Dan H clarifies that there are four types of lexical references: glossaries (reduced dictionaries), dictionaries (parts of speech, nouns, vers, usage), translation dictionaries (equivalent terms in multiple languages, perhaps with some typical dictionary features), thesauri (equivalencies, specifically synonyms and antonyms).

Dan H believes that the competing dictionary markup languages are **way** too extensive for what we need in EPUB3 (from the requirements perspective). The Apple Dictionary Services Markup is much more minimal.

Dan H clarifies that they need more feedback.

Markus G suggests that the dictionary format we desire is presentation-centric but includes basic support for indexing.

Keith F clarifies that this is basically an Apple-defined HTML "microformat" that is implementable and is concordant with our needs.

Working Group seems happy with this work and hopes it continues.