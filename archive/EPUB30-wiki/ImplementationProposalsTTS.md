This page contains implementation proposals relating to enhancing TTS support in EPUB3.



## Introductory notes ##

Note: W3C has recently launched a [Speech Incubator Group (XG)](http://www.w3.org/2005/Incubator/htmlspeech/charter), whose scope includes text-to-speech enhancements. It is expected that recommendations from this XG will have positive impact on TTS support in the Web/HTML stack in the longer term.

From this perspective, the proposals below do not intend to provide a complete coverage of possible declarative TTS enhancements, but rather provide a minimalistic baseline, which in the meanwhile will still be sufficient to solve [the most prominent end user problems](F2F201006LightningTalks#Problems.md) with relation to TTS consumption.

Refer to [F2F201006LightningTalks#Speech\_Synthesizer\_support](F2F201006LightningTalks#Speech_Synthesizer_support.md) for an overview of the problem scope.

## Make PLS a core content type ##
This implementation proposal addresses [TG.03](TextContent#TG.03_Support_association_of_pronunciation_lexica_(A).md).

_F2F note: "core" content type is wrong term, as this proposal does not say that PLS has to be supported by reading systems. The intent is to allow PLS to be linked from manifest without requiring a fallback to be provided_

  1. Make [PLS 1.0](http://www.w3.org/TR/pronunciation-lexicon/) a OPF core content type, using [the mimetype `application/pls+xml` and the filename suffix `.pls`](http://www.w3.org/TR/pronunciation-lexicon/#AppB).
  1. When a PLS document is included in an EPUB, it is listed in the package manifest using the mime type given above as identifier.
  1. If multiple PLS documents are listed in the manifest, they **must** be unique with regards to language (as given by the required `@xml:lang` on the `pls:lexicon` root element). _Rationale: to minimize reading system burden, only zero or one PLS documents per language can be included in an EPUB. Merging of multiple source lexica, and handling of any conflicts that might arise there, is better done at authoring time._
  1. The provided PLS lexicon applies to the _entire_ EPUB (all OPS documents, metadata content in OPF, labels in NCX).
  1. Reading system conformance:
    1. Reading Systems that offer TTS capabilities **should** support PLS
  1. Content conformance:
    1. any provided PLS document **must** be valid to [the RelaxNG schema for PLS](http://www.w3.org/TR/pronunciation-lexicon/#AppA)
    1. as per above, any provided PLS document must be unique with regards to language within the scope of the given publication.
    1. while PLS itself is open-ended with regards to alphabets used, EPUB restricts this and makes **IPA the only allowed pronunciation alphabet**. (Note: IPA is known to be hand-authoring-unfriendly. It is expected that automated transforms would be used to convert the input alphabet (be that x-SAMPA or whatever) to IPA before distribution. _This item may change if it is proven that another alphabet is more commonly supported by major TTS engines._)

### Notes ###
  * The intended consumers of the PLS data are reading systems with built-in speech capabilities, and access technology (AT) such as screen readers used in conjunction with reading systems. These two agents in their turn pass the data on to a TTS engine.
  * Especially in DRMed contexts, not all RS expose needed DOMs to the outside world, so its not guaranteed that AT will even be aware that a PLS exists for the given EPUB. We cannot solve this problem without resorting to RS APIs.


## Support subset of CSS 2.1 voice characteristic properties ##
This implementation proposal addresses [TR-5](RichMediaAndInteractivity#TR-5_(D)_Synchronized_audio_should_be_able_to_adjust_the_speed_a.md) as implemented by internal TTS rendition of text.

  1. Add support for the [speech-rate, voice-family, and pitch properties](http://www.w3.org/TR/CSS2/aural.html#voice-char-props) of the [Aural style sheets appendix](http://www.w3.org/TR/CSS2/aural.html) of CSS 2.1.
  1. Content conformance:
    1. The `speech-rate`, `voice-family`, and `pitch` properties **must** only occur inside a @media rule with the value `speech`
    1. The values of these attributes are as specified in [CSS 2.1](http://www.w3.org/TR/CSS2/aural.html#voice-char-props)
  1. Reading System Conformance:
    1. Reading Systems that offer TTS capabilities **should** support the CSS `speech-rate`, `voice-family`, and `pitch` properties

Example:

The OPS content:
```
  <p>He flipped out.  <span class="excitedMan">"Are you out of your mind?"</span> he exploded.</p>
  <p>She tried to calm him down.  <span class="calmWoman">"Relax!"</span></p>
```

and the corresponding CSS:

```
 @media speech {
    span.excitedMan { voice-family: male; speech-rate: faster; pitch: high }
    span.calmWoman { voice-family: female; speech-rate: slow }
 }
```

## Support CSS3 speech phonemes ##
This implementation proposal addresses the homograph disambiguation aspect of [TG.04](TextContent#TG.04_Support_inline-level_pronunciation_expressions_(B).md) and is also feasible for [TR-1](RichMediaAndInteractivity#TR-1_(B)_Reading_Program_for_Multiple_Dialects.md) and [TR7](http://code.google.com/p/epub-revision/wiki/ImplementationProposalsPronunciationAndAudio#TR7._Require_an_optional_"phonetic_transcription").

_Note as this is a CSS3 WD, this property will be included using the same mechanism adopted by EGLS and StylingLayout, in this case, likely by vendor prefixing._

  1. Add support for the [phonemes](http://www.w3.org/TR/css3-speech/#phonemes) property of [CSS3 Speech Module](http://www.w3.org/TR/css3-speech/) (note: WD December 2004)
  1. Let this property appear in the general CSS cascade of OPS (no separate CSS stylesheets for speech media)
  1. Content conformance (CSS):
    1. The `phonemes` property **must** only occur inside a @media rule with the value `speech`
    1. The value of the phonemes declaration **must** be a space separated list of phonemes, mapping to IPA  (rationale: refer to PLS above)
    1. The _phonetic-alphabet_ at-rule **may** occur in the CSS and if so before any occurrence of a phonemes property
    1. The implied (if omitted) and only allowed value (if given) of @phonetic-alphabet is `ipa`
  1. Reading System Conformance:
    1. Reading Systems that offer TTS capabilities **should** support the CSS `phonemes` property

Example:

The OPS content
```
  <p>Can you <span id="r1">read</span> this book to me?</p>
  <p>I've already <span id="r2">read</span> it three times!</p>
```

and the corresponding CSS

```
 @media speech {
   @phonetic-alphabet "ipa";
   #r1 { phonemes: "r i \02D0 d" }
   #r2 { phonemes: "r e d" }
 }
```

If inline @style is retained in OPS, the following would also be valid:
```
  <p>I've already <span style=" @media speech { phonemes: 'r e d' } ">read</span> it three times!</p>
```