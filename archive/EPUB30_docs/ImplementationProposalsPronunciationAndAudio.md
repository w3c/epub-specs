# Introduction #
Primarily we describe the solutions for TR5, TR7 and TR8. Solutions about TR3 and TR9 are actually highly correlated with others, therefore we just shortly explain our ideas and keep watching.

Actually, TR5, TR8 and TR9 are also similar to [ImplementationProposalTextAudioSync](http://code.google.com/p/epub-revision/wiki/ImplementationProposalTextAudioSync) and [ImplementationProposalsTTS](http://code.google.com/p/epub-revision/wiki/ImplementationProposalsTTS).

Sorry everything here is just under construction.
Hope we can discuss in more detail later in SF :)

# Details #
## TR5. Synchronized audio should be able to adjust the speed and pitch ##
Facts:
  * In audio book, various read speeds leads a flexible aural presentation

Requirement:
  * Should be able to adjust the speed and pitch for reader with built-in TTS

**Solution 1 to TR5:**
Should adopt `<voice-rate`> and `<voice-pitch`> elements in CSS 3.0 Speech module.

  * `<voice-rate`> : `<percentage`> | x-slow | slow | medium | fast | x-fast | inherit
  * `<voice-pitch`> : `<number`> | `<percentage`> | x-low | low | medium | high | x-high | inherit

Pro :
  * Well-defined elements in CSS 3.0
Con :
  * W3C working draft, Dec. 2004

**Solution 2 to TR5:**
Should adopt `<prosody`> element in SSML.

  * The rate and pitch attribute in `<prosody`> are exactly the same as `<voice-rate`> and `<voice-pitch`> in CSS 3.
  * Example usage :
```
<speak>
  The price of XYZ is <prosody rate="90%">$45</prosody>
</speak>
```

Pro:
  * Well-defined element in SSML
Con :
  * Additional complexity to EPUB


## TR7. Require an optional "phonetic transcription" ##
Facts:
  * Phonetic symbols are widely used to pronounce ideograph In East Asia
  * In Taiwan, Bopomofo is commonly used for language learners
  * In Japan, Kanji is usually annotated by phonetic symbol such like hiragana and katakana

Requirement:
  * Should provides an optional "phonetic transcription“

  * Issues :

> Ruby is a small-sized, supplementary text used to display pronunciation and explanation
  * Example usage
```
<ruby>
<rb>總</rb><rt>ㄗㄨㄥˇ</rt>
<rb>統</rb><rt>ㄊㄨㄥˇ</rt>
</ruby>
```

> two issues are :
  1. Explanation is not pronunciation !
  1. Additional burden to distinguish pronunciation

**Solution 1 to TR7 :**
Must include _lang_ attribute in `<ruby`>.
  * _lang_ attribute : language, script, region and variant extension, such like “bopo”, “hakka”, “kana”, ”hira”, “Zsym” etc., refered to IANA, language subtag registry of BCP47 (RFC5646), 2010-10-12.
  * Example usage :
(for pronunciation)
```
<ruby lang=“zh-Bopo”>
<rb>總</rb><rt>ㄗㄨㄥˇ</rt>
<rb>統</rb><rt>ㄊㄨㄥˇ</rt>
</ruby>
```
(for explanation)

```
<ruby lang=“zxx-Zsym”`>
<rb>編集者</rt><rt>editor</rt>
</ruby>
```

Pro:
  * Well-defined attribute in HTML5.
Con:
  * Informal usage of `<ruby`>

**Solution 2 to TR7 :**
Should adopt `<phoneme`> in PLS.

  * Provide a phonetic pronunciation for the contained text
  * Example usage
```
     <lexicon version="1.0" 
      alphabet="ipa" xml:lang="en-US"`> 
     <lexeme> 
	    <grapheme> tomato </grapheme> 
	    <phoneme> t?mei??ou? </phoneme> 
     </lexeme>
    </lexicon>
```
  * Valid alphabet values :
  * ipa”
  * values in the Pronunciation alphabet registry
  * values defined by vendor by using the form “x-organization”.

Pros :
  * Well-defined specification for pronunciation
  * Usable by speech technology
  * Similar requirement is ranked as (A) in TextContent subgroup,TG.03
Cons :
  * Additional complexity to EPUB
  * Incomplete pronunciation alphabet registry (Trying to link to IANA BCP47)
  * Possible pronunciation ambiguity for Chinese document
  * No inherent word separating character (space) in Chinese document if only lexicon dictionary is provided, like, 她 和(han) 男友 剛剛 和(he)好

**Solution 3 to TR7:**
Adoption of `<phoneme`> from SSML

  * Similar to PLS, but using in-line form
  * Example usage :
```
 <speak> 
	<phoneme alphabet="ipa" ph="t?mei??ou?"> tomato </phoneme> 
 </speak> 
```

Pros:
  * Well-defined specification for pronunciation.
  * Similar requirement is ranked as (A) in TextContent subgroup, TG.04.
  * Additional support to TTS.
  * Also a solution to TR5.

Cons:
  * Additional complexity to EPUB.
  * Pronunciation alphabet registry is still in development (but can be solved by using `<lang`> element in SSML like solution 1 of TR7)

## TR8. Ability to specify repeat segments and repeat times for audio playback ##
Facts:
> To emphasis part of the audio clip:
  * Listen to pronunciation demonstration more than once for language learners
  * Repeat the telephone number after a short message for advertisement
  * Repeat some of the sentences when reciting poems or lyrics

Requirement:
  * Ability to specify repeat segments and repeat times for audio playback (recommend)

  * The interactively learning support is requested by I-8
  * Audio synchronization is widely requested, like [ImplementationProposalTextAudioSync](http://code.google.com/p/epub-revision/wiki/ImplementationProposalTextAudioSync)

**Solutions 1 to TR8 :**
Adoption of `<audio`> from HTML5

  * Example usage :
```
  <audio> 
     <source src=“CallThePhoneNow.wav“ type="audio/wav"/>  
     <source src=“123456.wav" type="audio/wav" />
     <source src=“123456.wav" type="audio/wav" />
  </audio> 
```

Pro:
  * Simple and well-defined in W3C
Con:
  * Redundant if scripting is not provided

**Solutions 2 to TR8 :** Adoption of `<audio`> from SSML

  * Example of audio clip
```
<speak> 
  <audio src=“CallThePhoneNow123456.wav" repeatCount=“1"/>
  <audio src="CallThePhoneNow123456.wav" clipBegin=“2.2s“ clipEnd=“4.3s" repeatCount=“1"/> 
</speak>
```

  * Attributes of `<audio`> : clipBegin clipEnd repeatCount repeatDur

  * Example of text-to-speech
```
<speak> 
  CallThePhoneNow, 1 2 3 4 5 6, 1 2 3 4 5 6
</speak>
```

Pro:
  * Rich functionalities, including TTS support
Con:
  * Additional complexity to EPUB

**Solutions 3 to TR8 :**
Timing and synchronization functions of SMIL 3.0

  * Including clipbegin, clipend, repeatCount, repeatDur
  * Example usage is exactly the same as solution 2 by using SSML

Pro:
  * Purely timing control for audio clip
Con:
  * Additional complexity to EPUB

## TR9. Require speech-enabled interactivity ##
Here we post its solution, though not complete.

Needs:
1. An efficient way to navigate the ebooks
2. The speech is the most natural way of the human interactions

**Solution:**
A new tag `<glossary`> to Mark the important semantic unit
  * Example usage:
> `<glossary`>Harry Potter`</glossary`>

  * Similar requirement is ranked as (A) in TextContent subgroup, TD.6

Pro :
  * Explicitly specify the content to be searched by spoken command
Con :
  * Introduce additional complexity to EPUB

## TR3. Separated text content could be pronounced synchronously ##
we are glad to see that in http://code.google.com/p/epub-revision/wiki/RichMediaAndInteractivity#Synchronized_audio and [ImplementationProposalTextAudioSync](http://code.google.com/p/epub-revision/wiki/ImplementationProposalTextAudioSync) proposed the requirement and solution of text/audio synchronization. We will try to participate it int the testing stage if possible.

# Our comment #
The best solution depends on what kind of requirement.
  * For TR5, CSS 3.0 speech module is ok
  * For TR7, ruby approach works well
  * For TR8, HTML5 and SMIL are good
  * For SSML 1.1, it provides solutions to all three requirements, and comes with additional speech synthesis functionalities