

This implementation proposal addresses
  * [TE.01](TextContent#TE.01_Allow_for_inflection_of_domain-specific_semantics_on_top_o.md), details:
    * [book semantics](TextContent#General_book_semantics.md)
    * [article semantics (pim)](TextContent#Magazine/Article_semantics.md)
    * [attribute-axis enhancements in OPS dictionary grammar](DictionariesGlossaries.md)
    * [attribute-axis enhancements in inline glossaries](DictionariesGlossaries.md)
  * [TE.01\_1](TextContent#TE.01_1_Assure_lexical_predictability_when_addressing_TE.01_(A).md)
  * [role in text+audio sync proposal](ImplementationProposalTextAudioSync#The_role_attribute.md)
  * [NAV\_R04](Navigation#NAV_R04_Add_a_mechanism_for_machine-readable_metadata_in_NCX_(E).md)

## Introduction ##
This proposal was originally (and as discussed in TextContent group) based on the notion of reusing the ARIA role attribute in OPS3, NCX and audio overlay, and extending its allowed values beyond those enumerated in the ARIA spec.

However, this approach is, at least at the moment, made difficult because of the following reason:
  * There is currently (as of 2010-10) [an ongoing discussion](http://www.w3.org/Bugs/Public/show_bug.cgi?id=10914) on who actually "owns" the definition of @role in the HTML5 spec. The outcome of this discussion is difficult to predict. The ownership outcome in its turn, will have an impact on whether our reuse of @role will be practically benign, or have adverse effects. The main possible adverse effect is that populating @role with other values than the ones "given" (in HTML5 and/or ARIA) will lead to unpredictable behaviors in processors and assistive technology that expect only the "given" values.

Therefore, to steer clear from these potential problems, and to avoid skewing other specifications to suit our intended usage, this proposal is based on _creating a new attribute in the OPS namespace_. Depending on the final outcome of the W3C ownership discussion, and discussions with W3C PF re unpredictable behaviors in AT, this proposal _may_ be subject to a late-binding-namespace-change procedure (where the attribute in our namespace would be reverted to be the ARIA role attribute).

## Proposal ##
### OPS ###
  * Create an attribute `ops:type`. Contribute this attribute to the global attributes class of the OPS grammar. Let the attribute be optional.
  * Let the definition of this attribute express the same usage intent as [@type in TEI](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/ref-att.typed.html) and [@role in Docbook](http://www.docbook.org/tdg/en/html/ch05.html#ex.changerole).
  * Let the value population mechanism of `ops:type` be the same as the value population mechanism of the `property` attribute on the [package file `meta` element](ImplementationProposalsMetadata.md). This means that the value of `ops:type` is a space separated list (1-n) of what RDFa calls CURIEs (lexically QNames). (Note: in most if not all of so far specified use cases, only 1 token will be needed, but like in ARIA, it is proposed that we allow for multiple tokens.)
  * To facilitate implementation, ensure increased predictability by requiring that vocabularies that define values for `ops:type` specify where the value is intended to be used. This specification can range from "globally applicable" to "meaningful on a particular element only". (The ops:schema **may** enforce these usage context specifications, but that step is optional in this proposal.)
  * to support extensibility, allow the `prefix` and/or `profile` attribute on the OPS root element (which one to use follows final decisions made on the matter in the Metadata group)
  * Add specification prose that specifies that if a processor encounters a value in `ops:type` that it does not recognize, or if it encounters a value whose associated behaviors predict the behaviors of the carrying element, it must ignore that value; continuing the processing as if the value was not present.
  * Build a vocabulary that initially contains the items in [Book Semantics](TextContent#General_book_semantics.md). This vocabulary need not be normatively referenced from the OPS specification. However, at least informative spec references should be provided to this vocabulary, and the PRISM "pim" vocabulary.

### Text+Audio Sync ###
  * allow the `ops:type` attribute also on `par` and `seq` elements in the audio sync overlay. Specify that the attribute when used here is to act as a local proxy for the semantic of the OPS destination (i.e. the resource identified by the child `text` element `src` attribute). Let the attribute be optional, but specify destination semantics for which the attribute is strongly recommended to be present (aka, the typical skippable elements of DAISY).

### NCX ###
  * allow the `ops:type` attribute also on `navList` and `navPoint` elements in NCX. Specify that the attribute when used here is to act as a local proxy for the semantic of the OPS destination(s) (i.e. the resource identified by the child `content` element(s) `src` attribute). Let the attribute be optional.

## Examples ##
Prism metadata:

_...where the prism prefix is bound to the prism vocabulary either in an external profile, or in the prefix attribute on the OPS root element. Decision on this is still pending._

```
  <article>
    <h2>...</h2>
    <p ops:type="prism:teaser">...</p>
    <p ops:type="prism:byline">...</p>
  </article>
```

Basic book semantics metadata:

_...where the book vocabulary has been defined to be the default OPS vocabulary in either in an external profile, or in the prefix attribute on the OPS root element . Decision on this is still pending._

```
  <section>
     <h2>...</h2>
     <p>.... <a ops:type="noteref" href="#n1">1</a> ... </p>
     ...
     <aside id="n1" ops:type="note">...</aside>
  </section>
```

(Note: the WD [W3C PF Role Attribute](http://www.w3.org/WAI/PF/role-attribute/) is much like this proposal, but is unfortunately not referenced from HTML5 or ARIA 1.)