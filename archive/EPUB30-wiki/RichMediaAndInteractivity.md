# Rich Media, Ads, and Interactivity Sub-group Page #



## Requirements Review Status ##

Requirements have been reviewed by: Peter Sorotokin; George Kerscher;  Marisa DeMeglio; Daniel Weck; add-your-name-here (First / Last Name)

## Mission ##

The subgroup is addressing problem 1 in the charter: http://www.idpf.org/idpf_groups/IDPF-EPUB-WG-Charter-4-27-2010.html

## Sub-group participation ##

See at the bottom of this page

## Deadlines ##

  * Collect requirements: July 23rd, 2010

## Requirements ##

### Rich Media ###

#### RM-1. (A) Video and Audio embedding ####

Ability to embed video and audio in the document content declaratively (i.e. without a bunch of javascript around it). Declarative part is important because particular player interface might be fairly different on different devices, e.g. video may have to be played in full-screen or on a separate color screen in dual-screen devices.

TODO: text captions / subtitles, (extended) audio descriptions ? See RM-7

#### RM-2. (A) Video and Audio formats ####

We need to come up with some language on what formats should be targeted for interoperability.

#### RM-3. (A) Package A/V with the document ####

Ability to include audio & video within the ePub.  Some content could be considered 'critical' for the ePub experience, and should be included in the ePub.

#### RM-4. (A) Stream A/V from a server ####

Ability to stream audio & video from an external server.  Some content could be considered optional, and can be streamed from an online server. In some cases, it may also be impractical to include longer clips with epub itself.

#### RM-5. (C) Cache online media content ####

For content that is available online, there is a need to have metadata to define if content can be cached on the device (providing the device has the storage capability).  A use case I can imagine is that the device, when detecting that WIFI is present, may offer the user to download all cacheable content, so they can consume it when the wifi is not present.

#### RM-6. (B) Searchable meta data for media content ####

Ability to include searchable meta data for media content, to aid search.

#### RM-7. (C) Accessible version ####

Ability to provide accessible version (i.e. transcripts of media for deaf users).  Related to the search requirement above.

Text captions, subtitles, (extended) audio descriptions, etc...
HTML5 markup provides a "track" mechanism to associate alternate content to media objects. See the requirements compiled by the Media Subgroup of the HTML5 Accessibility Task Force:

http://www.w3.org/WAI/PF/HTML/wiki/index.php?title=Media_Accessibility_Requirements

#### RM-8. (D) Media rights ####

Consideration / recommendations around how to post / share media content from ePub.  This may be the wrong subgroup for this discussion, but I do think it is something to be aware of.

#### RM-9. (B) Standalone audio/video ####

Ability to include discrete audio clips: play once in dedicated player, e.g. when play button is clicked

#### RM-11. (B) Background audio ####

Ability to include looping audio clips (i.e background music for chapter/ book)

#### RM-12. (D) Playlists ####

Ability to include playlists (background music album for book).

#### RM-13. (C) Parallel audio clips ####

Ability to include multiple parallel audio clips, where only one is selected for playback at a time. For instance, there may be audio in both English & French.  This is particularly useful for people learning languages.

#### RM-14. (A) Triggers ####

Ability to define when audio/video should start playing, e.g. (1) on loading book/chapter/page (2) upon the asset becoming 'visible' on the screen.

#### RM-15. (D) Abridged audio ####

For synchronised audio, ability to define text that is NOT in the audio.  This is useful for abridged audio, whereby paragraphs or pages are not included in audio. **Editor's note: I am unclear on this, needs to be clarified**

#### RM-16. (A) Fallbacks based on capabilities ####

Ability to define media fallback for consumption.  For instance, if the device has a wifi connection and capabilities, stream HD video from server.  Otherwise, stream medium-res video from server.  Otherwise, load low-res video from ePub.  Otherwise, display image with caption.

#### RM-17. (C) Audio timescale ####

Reading systems should have the ability to speed up or slow down the audio playback without distorting the pitch.  50% (slow) to 200% (fast) is the recommended range.

### Synchronized audio ###

This list of requirements came from what used to be a single requirement ("RM-10. Ability to include synchronized audio clips".).

#### RM-18. (A) Define synchronization points ####

Ability to align audio with its text document equivalent. This is done
via synchronization points, each being pre-defined as a clip of audio
together with a chunk of text or an image. The audio is a spoken
version of the text or image description.

#### RM-19. (A) Synchronized playback ####

Ability for synchronized playback to follow the natural reading order
and also be repositioned when the user navigates (via TOC, bookmarks,
or other methods).


#### RM-20. (B) Text scroll/highlight ####

Ability for the the text to scroll and follow the audio playback, with
an option to highlight the text corresponding to the currently-playing
audio.

#### RM-21. (B) Transparent overlay ####

(RM-21 is more of a design/implementation
strategy than a user requirement)

Ability for the the synchronized audio feature to exist as a
transparent overlay so that it does not impact a text-only reading
system.  Annotation requirements ANNOT\_R9 (Synchronized audio
annotates the text) and ANNOT\_TW\_R2 (Portable Annotation) are related
requirements that support a non-intrusive audio sync approach.

#### RM-22. (C) Using audio selectively ####

Ability to apply synchronized audio to select portions (islands) or to
the document in its entirety.

#### RM-24. (D) Runtime audio options ####

Ability to reflect user preference in the audio playback (e.g. turn
off page number announcements, follow footnotes automatically).

#### RM-25. (C) Multiple granularities ####

Ability for a single publication to contain different synchronization
granularities (e.g. word, sentence, and paragraph-level).



### Interactivity ###

#### I-1. (A) Ability to add **interactive** media to ePub. ####

Interactive media is understood here as something where presentation (visual, but not necessarily visual) changes based on user input and/or network communication.

Example use cases:
  * A coloring book page allowing the user to "pick up" a "crayon" of some color and draw in a some area
    * Changes should persist (i.e., paging away and returning should not necessarily reset the state of any interactive content)
  * Control an astronomy simulation of the solar system
    * Change time scale, change gravitation constant, change mass of planets, ...
    * Physics simulations are popular interactive media elements
  * Mathematica-style graphing based on user input
  * Quizzes for textbooks
    * Submit results to instructors
  * Cooking/recipe books
    * Scale recipes to different numbers of people
    * Built-in timer/alerts to allow use of recipe itself as real-time cooking guide
_comment: Accessibility of the interactive content is essential.  We can talk about mechanisms to accomplish this, but the overall accessibility requirement must be emphasised here._

#### I-2. (C) Access to persistent storage ####

Some limited amount of client-side storage is needed in many applications (similar to cookies in HTML4 browsers or HTML5 persistent storage)

#### I-3. (B) Ability to share data to communicate between interactive parts of a single publication or across multiple publications from the same origin ####

Examples:
  * a set of quizzes in multiple chapters that displays cumulative score
  * pushing button one one side of the page causes changes on thge other side of the page
  * Selecting a mode or setting at the start of the publication persists through all pages -- e.g. sound on or off, difficulty level, etc.  (Difficulty, or amount of scaffolding, could be very important in allowing textbooks to serve both on-level and struggling students, for example).


#### I-4. (A) Retain valuable existing features of EPUB ####

Existing format capabilities which are critical to maintain at least on the chapter content level:
  * ability to persistently bookmark every spot in the publication
  * ability to deterministically paginate a publication
  * ability to annotate any spot in the publication
  * ability to transform existing publication in some way, e.g.
    * touch-up in an editor (e.g. fix typos)
    * run through stylesheet optimizer
    * run through font embedder/subsetter
    * ability to display in the browser in some non-trivial way (I'll share a demo on this)
  * searchability
  * ability to build an index in an EPUB file
  * ability to locally layout and render a publication on a non-desktop-class Reading System (e.g. mobile phone, iPad, Android tablet, purpose-built-Reader, EInk-based Reader)

#### I-5. (B) Separation of data and code ####

It should be possible to clearly separate data which is being used to create an interactive presentation and the code which is used to implement it. Code may evolve independently of data (platforms change, security updates, code improvements) and some of the data formats may be promoted to the first class citizens in future EPUB versions (so the need for supporting code may be eliminated). Raw data is also more accessible in some cases. For instance, if an animated chess game is shown on a page, it would be good if it is possible to package application which draws and moves chess pieces on the board seprately from the transcript of the game (which the app would load and use to drive the presentation). If we decide in future that chess transcripts is something that EPUB should handle natively (hypothetically ;-), we will have a good foundation for content creation and backward compatibility.

#### I-6. (B) Programmatic content changes ####

As a consequence of user interaction with interactive content, or for other reasons, the content of a publication may need to change dynamically.

Examples:

  * personalization of information (replacing a placeholder name with a user's name, or a generic character's name with a chosen one)

  * if an animated chess game widget is embedded on a page, it would be good if it is possible to package application which draws and moves chess pieces on the board separately from the transcript of the game which can be rendered by the Reading System appropriately for the device. But in this case (unlike the example in I-5 above, which presumably refers to a previously played game) the content for the transcript would need to be generated dynamically.

  * Rendering content in alternate languages
  * Rendering content in alternate scripts (where the language supports multiple scripts, e.g. Cyrillic or Latin)
  * Changing semantically-marked up units, from metric to imperial
  * Changing text content based on current geolocation, as in a travel guide

It is recognized that this requirement may be in conflict with I-4, but other publication delivery systems have balanced these competing requirements successfully. For example, PDF is viewed as a reliably annotatable format, yet scripts traveling with PDF documents can modify the document content in such a way as to "break" annotations, and Adobe's XFA forms technology has historically disabled the ability to create annotations on pages displaying form elements. And, since existing publications may be programmatically transformed other than via scripting within a Reading System (as per examples in I-4 of touch-up, stylesheet optimizer, etc.), whatever solution we come up with for bookmarking and annotations must have a model for what to do when there are transformations to chapter content.

#### I-7. (B) Dynamic Content Emphasis ####

Certain content of a publication may need to be emphasized based on dynamic conditions. For example, highlighted and perhaps scrolled into view.

Use case examples:

  * Synchronizing text with spoken audio [NOTE: overlaps, perhaps subsumes, RM-20]
  * Emphasizing the target of a bookmark/annotation.
  * Emphasizing search results
  * If an animated chess game widget is embedded on a page along with a transcript, it might want to highlight the move in the transcript corresponding to the current board position.

Note that while text is the primary target for such emphasis, under some circumstance it may be appropriate to emphasize non-textual content (e.g. an image, or graphics within SVG).

[NOTE: could be viewed as a subset of I-6 above (Programmatic content changes) but since a declarative solution may be possible, separating this out for now]

#### I-8. (B) Interactivity Requirement for Teaching and Learning ####
  * Support following type of question
    * Multiple choice
    * Fill in the blanks, tables, or space within picture/paragraph
    * matching objects through drawing lines, drag and drop picture/text, etc.)
    * error finding/correction in language learning - insert, replace, delete any word within the sentense/paragraph
    * stroke sequence for writing Chinese character.  The correctness of stroke sequence is important in writing Chinese character.  When the student write the chinese character, the stroke sequence is recorded.  Teacher is able to "replay" the students' stroke sequence to check the sequence is correct or not.
    * adding puntuation in sentence
    * color filling, kids can fill colour according to the text/audio
  * Support following kinds of traditional examination/test
    * Dictation or listening test, user can listen to an audio track and then write down the words or answer question.
    * oral examination.  After reading the oral question, student can record his/her speech and then submit.
  * Support storing the student answer locally or remotely in server
  * Allow student to answer the questions once or repeatly (for revision)
  * Possible to provide instant answer feedback to student

#### I-9. (B) Ability to save save states and initialize on opening publication ####
This is perhaps an outcome of I-2, I-6, and I-7, but it's worth emphasizing with some examples:
  * a Crossword Puzzle book, where you'd want to save the work you've done so far when you close the book
  * a Coloring Book, where you'd like to save your artwork
  * saving your personal recipe notes in a cookbook
  * a Textbook maintaining the answers to quizzes you've taken throughout -- particularly the WRONG answers, so you can review areas of difficulty.
  * More ambitious, perhaps -- a math text that tracked your ability level and regenerated example problems based on "known" strengths and weaknesses of the individual student.

#### I-10. (C) Ability to communicate with and utilize potential reading device features ####
As devices have more features, and as publications are consumed on devices like iPhones and Android Phones, it is important to enable some interface between a publication and potentially available hardware.  Examples:
  * Microphone
  * Camera
  * Touchscreen
  * Accelerometer
  * GPS
Possible uses:
  * Audio/video annotation/personalization of publication
  * Location aware guidebooks

#### I-11. (C) Declarative image (or other content) flipper (or scroller) ####

This came up on the Text Content call and it cuts into both interactivity and layout. In many cases there is a need to present some relatively lengthy content without wasting too much space. This can be done in many ways (e.g. flipping or scrolling through images with captions or more complex blocks of contents). This seems to be so common and potentially device dependent (e.g. you may want to do fancy transition on a device with the fast screen and simple flip on a slower device), that it should be done declaratively and not with the script.

### Ads ###

#### AD-1. (C) Handle full-screen ads ####

Ability to specify collection of full-screen ads that could be inserted in the page flow as reader flips through the content. This is hard to achieve by simply manipulating the content because page breaking position depends on the display and environment characteristics

#### AD-2. (C) Ability to utilize unused page space for ads ####

In many publications, some blank space is occuring at the end of the chapter (e.g. if last page does not contain enough content to fill the whole page). It would be useful to define type of the (optional) content which is presented only when there is enough leftover space for it.

---


#### AD-3. (C) Link Ad Materials to a Block of Content ####

_Rationale: For serials, Ad materials including PDFs, videos, etc. are often linked to blocks of editorial content_

_Use Case: Content providers wish to deliver serial publications, medical, technical and scientific journals, scholarly publications, educational materials, technical documentation, illustrated books, catalogs, newspapers and other rich content to the eReader channel with with Ad Materials linked to related editorial conent.  For example editorial content in an article might be linked to a media block (as deined by PRISM) containing Advertising PDFs or videos._

**Requirement: Provide a Mechcanism to Link Ad Materials to Related Editorial Content**

#### AD-4. (D) Provide environment characteristics to ad server for dynamic ads. ####
_Rationale: Geolocation, context of surrounding content (AD-3), personal information (this information can provide for very targeted ads and thus free or cheaper content),etc. provided to ad server, however the ability for the user to opt out of providing PI has to be provided. The level of dynamism here will depend on online/offline scenarios._

#### AD-5. (C) Content may allow ad placement (if author desires) ####
_Rationale: Just as soft drinks, autos are placed in movies to create brand recognition/demand. We should allow for a mechanism to dynamcially insert ads into content based upon info from AD-4._

#### AD-6 (E) Ability to track ad views for offline scenarios ####
_Rationale: Based on users desire to reveal PI, send ad viewing info back to server when connecting after being offline._

#### AD-7 (C) Color Management - general issue, however I will stick it in ads. ####
_Rationale: Color space management needs consideration all the way around, it is especially important in the space of ads to ensure brand recognition._


### Taiwanese requirements ###

**Editor's note:** I am pasting these from email, even though there is some overlap; added some questions.

#### TR-1 (B) Reading Program for Multiple Dialects ####

There are nine main dialects in Taiwan; Mandarin, Taiwanese and Hakka are the most widely used. We recommend that Reading Program should be supported for different dialects within the same language system.

**Question:** it is not quite clear what supporting a dialect really mean. There is a way to specify a dialect using dc:language element in OPF or xml:lang attribute in OPS (see http://www.w3.org/International/articles/language-tags/), e.g. xml:lang="hak" for Hakka. What else is required?

_**Answer**: The purpose of TR-1 is to establish a standardized label or characteristic of pronunciation, so that readers can have different choices. Although there is an existing standard for dialect characteristic defined by W3C, the needs of multiple pronunciation can not be met no matter either xml: lang = "hak" or xml: lang = "zh-tw". Well, the fact is that most dialects in Taiwan may have the same character, meaning, and grammar, the only difference is its pronunciation. This also happens among local dialects in mainland China, such as Cantonese, Shanghai dialect, Fuzhou dialect and etc. It is a similar case that we pronounce English either by KK Phonetic or DJ Phonetic._

_There are some parts overlapped between TR-1 and RM-13, so we suppose that the scope of TR-1 should be extended to application of TTS. With notice marks, TTS engine will be informed what phonetic symbol should be used to make a pronunciation. In Taiwan, TR-1 is focused on the e-learning applications, such as poetry, the classics of Chinese Ancient Confucianism and etc._

#### TR-2 (B) Text content and photo should be packed and labeled separately. ####

Comic books are very popular in Taiwan, Japan and Hong Kong. Currently, text content is inserted with the photo of comic books. But this makes text content blurred while readers zoom in or zoom out.

Therefore, we strongly suggest that text content and photo should be packed and labeled separately. By doing this, the readers could see text contents inserted into the photo through rendering engine.

**Question:** this is quite possible using SVG and can be authored using off-the-shelf tools such as Adobe Illustrator. This also helps accessibility (e.g. when user can see the picture, but have trouble reading labels). What else is required?

_**Answer:** The purpose of TR-2 is to create specific marks for a photo with text content inserted. Takes an example as follow, there is a comic with one image, two dialog boxes and text content inside each one._

```
<comic>
    <img>pic-1.jpg</img>
<dialog-box type=”bubble” position=…>Good Morning</dialog-box>
<dialog-box type=”bubble” position=…>I’m Fine, thank you</dialog-box>
</comic>
```

_The dialog-box means that SVG should be used implicitly in rendering text content and auto-break according to the box’s sharp and size._

#### TR-3 (B) Separated text content could be pronounced synchronously. ####

When text content and photo have been placed separately, it is assumed that text content could be pronounced synchronously.

To take children’s fairy tale books with photo for example, the pronunciations of dialogue between/among each character should be heard synchronously.

**Note:** We have a section of requirements entitled "Synchronized audio". This requirement appears to just overlap that section.

_**Answer:** After reviewing the RM-18 to RM-25, we agree that nees for TR-3 has been covered  in the section of “Synchronization audio”. But the pre-condition is that TR-2 must be accepted so that the conversation content could be defined in literal meaning. We emphasize again that we follow TTS in term of needs for synchronized Audio in Taiwan_

#### TR-4 (C) Able to define the pronunciation in sequence (or in order) of the text contents inserted into photos ####

There may be some associated text contents existing in a single photo. Such as children’s fairy tale books with photo, the synchronous pronunciation in sequence could be clearly defined when more than two characters have conversation.

**Question:** how is it different from TR-3?

_**Answer:** TR-4 and TR-3 are relevant but upon different needs. In comic books and fairy tales books, position of dialogue always follows where are characters. But text content follows the fixed rules to determine its order. However, the dialogue must be positioned on a whole page by coordinates. By doing this, it also leads an information loss of dialogue sequence. Therefore, TR-4 aims to add identification notice at dialogue sequence in order to have a better recognition for synchronous pronunciation._

#### TR-5 (D) Synchronized audio should be able to adjust the speed and pitch ####

For certain visually impaired, faster reading speed leads more information available. Besides, everyone has his/her preference of using specific pitch in order to strengthen speech recognition. Therefore, we strongly recommend having the speed and pitch of synchronized audio listed as part of e-book standard.

**Note:** this appears to be a possible feature for a Reading System, not a requirement for the file format.

_**Answer:** In synchronized pronunciation of audio books, it is used to pre-record audio tracks. According to different parameters, TTS engine can imitate a variety of voice. Its advantage is to save costs of production and reduce space of e-book. Therefore, TR-5 aims to bring those elements to synthesize pronunciation, such as speed and tone, into the new EPUB standards for next generation._

**Note:** Since the aural style sheets defined in CSS2 contain the selectable adjustment of the speed and pitch for the aural output, the request of TR-5 will not be an issue if the text-to-speech (TTS) engine on the reading system supports the adjustment of speed and pitch accordingly.. With the speed and pitch being dynamically adjusted, the aural presentation of digital content could be much richer and vivid. However, it is noticeable that in the draft of CSS2.1, the aural style sheets have been moved into an optional section, Appendix-A. It would be concerned that whether the EPUB 2.1/3.0 will follow this change.

#### TR-6 (B) Add animation skill into standard, to have animation existed with text together on the same page ####

In the past, the photos in books are mostly static. Because nowadays the lightweight animation skill has developed maturely, we strongly recommend adding the animation skill into standards of e-book in order to make the presentation of pages more attractive.

#### TR-7 (B) Require an optional layer of "phonetic transcription" ####

The revised EPUB should be capable of providing an optional layer of “phonetic transcription”. Phonetic symbols sometimes appear in writing accompanied with text in East Asia. In Taiwan, the Chinese character accompanied by corresponding phonetic transcription (Bopomofo) is commonly used for language learners. For example, as shown in http://www.song.tw/Images/uni570b.bmp, the right-hand-side symbols specify the pronunciations of the Chinese characters. Moreover, in Japan, Kanji (characters borrowed from Chinese) is usually annotated by phonetic symbol such like hiragana and katakana. Furthermore, the education requirement is requested in I-8, and we believe the additional phonetic transcription layer will meet the need of language learning, especially for pronunciation and speaking.

MURATA: The [Ruby and Emphasis Dots](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Ruby_and_Emphasis_Dots) section in the EGLS requirement lists show relevant requirements, and the [3.3.1 Usage of Ruby](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_3_1) section in the W3C JLREQ shows a number of ruby examples.  Ruby is not always for providing phonetic transcriptions.  In the top-level itemized list in [3.3.1 Usage of Ruby](http://www.w3.org/TR/2009/NOTE-jlreq-20090604/#en-subheading2_3_1), **a** is for pronunciation but **b** and **c** are for semantics. I have seen "強敵" (tough enemy) having "とも" (friend) as ruby text.  This combination means "rival".

#### TR-8 (B) Ability to specify repeat segments and repeat times for audio playback ####

Since the interactively learning support is requested by I-8, we suggest the specification of audio playback should be more versatile. In connection with the requests of RM-19 and RM-22, the ability to specify repeat segments and repeat times for audio playback are suggested here. It would be helpful for language learners to listen to pronunciation demonstration more than once. Also, it is desirable for advertisement to repeat the telephone number after a short message. Moreover it’s applicable when some of the sentences would like to be repeated when reciting poems or lyrics.

#### TR-9 (B) Require speech-enabled interactivity ####

Since the speech is understood as the natural way of the human interactions, the speech-enabled interactivity shall be supported by EPUB. In addition, the demands listed on I-8, such like the error finding and the evaluation of oral examination could also be benefited by using the speech technology. To support such functionalities, the collection of vocabularies and their pronunciations involved in the interactivity should be specified according to the created content. Therefore the following facility should be provided by the OPS:
1. Marking the specific vocabularies, which is going to be processed by the speech technology.
2. Pronunciation annotation, which is denoted by the phonetic symbol accompanied with the specified vocabulary.

### Relevant requirements from other groups ###
| [Annotations](Annotations.md) | [ANNOT\_R8 annotation content types](Annotations#ANNOT_R8_((A,_A,_A,_B))_Annotation_content_can_contain_either/an.md) | |
|:------------------------------|:----------------------------------------------------------------------------------------------------------------------|:|
| [Annotations](Annotations.md) | [ANNOT\_R9 synchronized audio](Annotations#ANNOT_R9_((B,_D,_E))_Synchronized_audio_annotates_the_text.md) |  |


## Participants ##

| **Name** |  **Organization** | **Time Zone** | **Preferred con call time** |
|:---------|:------------------|:--------------|:----------------------------|
| Peter Sorotokin (coordinator) |  Adobe |  UTC/GMT -7 | ? |
| Garth Conboy |  eBook Technologies, Inc.  | UTC/GMT +/-? | ? |
| Ric Wright |  Adobe  | UTC/GMT -7 | ? |
| King Wai Chow |  ASTRI (Hong Kong Applied Science and Technology Research Institute)  | UTC/GMT +8 | 02:00-10:00, 13:00-16:00, 22:00-23:00UTC  |
| Brady Duga |  eBook Technologies, Inc.  | UTC/GMT +/-? | ? |
| Steve Kotrch |  Simon & Schuster  | UTC/GMT +/-? | ? |
| Dianne Kennedy |  IDEAlliance + IPA  | UTC/GMT +/-? | ? |
| Liza Daly |  Threepress Consulting Inc.  | UTC/GMT -4 | ? |
| Takeshi Kanai |  Sony Electronics, Inc.  | UTC/GMT +/-? | ? |
| Daniel Weck |  DAISY Consortium  | UTC/GMT (London) | ? |
| Eric Freese | Aptara | UTC/GMT -5 | ? |
| Karen Broome | Sony Electronics | UTC/GMT +/-? | ? |
| Alexis Wiles | OverDrive| UTC/GMT -4 | Tues or Thurs between 9AM-6PM UTC/GMT -4 |
| Michael Artin | Barnes & Noble | UTC/GMT -4 (New York) | ? |
| Roger Webster | Barnes & Noble | UTC/GMT -7 | ? |
| Richard Heiberger | HarperCollins Publishers | UTC/GMT +/-? | ? |
| Lucy Albanese (lucy.albanese@harpercollins.com) | HarperCollins Publishers | UTC/GMT +/-? | ? |
| Rhys Cazenove | Enhanced Editions | UTC/GMT | ? |
| Marisa DeMeglio | DAISY Consortium | UTC/GMT -8 | 17:00-00:00 UTC M-F |
| Kenny Johar | Vision Australia | UTC/GMT +/-? | ? |
| Liisa McCloy-Kelley | Random House, Inc | UTC/GMT +/-? | ? |
| Si-Wei Wang (siweiwang.sword@gmail.com) |  Institute of Information Industry  | UTC/GMT +8 | ? |
| Jiang-Chun Chen (jtchen0901@gmail.com) |  Industrial Technology Research Institute  | UTC/GMT +8 | 09:00-23:00 UTC M-F  |
| Matt Haas | Pearson Education North America | UTC/GMT -4 | ? |
| Dave Cramer | Hachette Book Group | UTC/GMT -4 | ? |
| Shu Tanabe | Toppan Printing Co.,Ltd | UTC/GMT +/- ? | ? |
| Kyoji Tahara | Toppan Printing Co.,Ltd | UTC/GMT +/- ? | ? |
| full name | organization | time zone | preferred time |