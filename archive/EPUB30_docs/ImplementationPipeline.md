

## Status of submitted implementation proposals ##
| **Subgroup** | **ID** | **Summary** | **Status** | **Notes** | **Targeted for draft #** |  **Spec draft available** |
|:-------------|:-------|:------------|:-----------|:----------|:-------------------------|:--------------------------|
| **TextContent** |  |  |  |  |  |  |
|  | [DTBook](TextContent#Remove_DTBook_as_content_type.md) | remove dtbook | Accepted |  | 1 | trunk |
|  | [OPS3.0](http://code.google.com/p/epub-revision/source/browse/trunk/src/schema/ops30.rnc)  | Create [OPS3.0 document type](HTML5Subsetting#OPS_2.0.1_subtracted_from_HTML5.md) | Accepted |  | 1 | trunk |
|  | [DictionariesGlossaries](DictionariesGlossaries.md) | dictionary based on Apple Dictionaries | Defer; detach from EPUB3 schedule; not fully cooked yet. [Early proposal on wiki](ImplementationProposalDictionaries.md) | WG review for 10/27 telcon | NONE |  |
|                       | [PLS](ImplementationProposalsTTS#Make_PLS_a_core_content_type.md) | PLS as OPF core media type (for speech output RS's)  | Accepted |  | 1  | trunk |
|                       | [Voice characteristics](http://code.google.com/p/epub-revision/wiki/ImplementationProposalsTTS?ts=1287430262&updated=ImplementationProposalsTTS#Support_subset_of_CSS_2.1_voice_characteristic_properties) | Support subset of CSS2.1 Speech voice characteristics properties | Accepted |  | 1 | trunk |
|                       | [phonemes](ImplementationProposalsTTS#Support_CSS3_speech_phonemes.md) | Support CSS3 Speech phonemes property | Accepted |  | 1 | trunk |
|                       | [MathML](ImplementationProposalsMathML.md) | simplification of MathML | Accepted |  | 1 | trunk |
| [EGLS](EGLS.md) | Linked to an external page containing recommendations, but the same is downloadable.  See [Enhanced Global Language Support(EGLS) in EPUB](http://epub-revision.googlecode.com/files/rec2WGRev.html) |  |  |  |  |  |
|  |  [Rec A](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WGRev.html#RecA) | [Page Progression Direction](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Page_progression_direction) | Ready | Page-progression-direction in `<spine>` for UI use; writing-mode for page layout | 1 | trunk |
|  |  [Rec B1](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WGRev.html#RecB1) | [Two\_Styles\_of\_Vertical\_Writing](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Two_Styles_of_Vertical_Writing), [Principal\_Writing\_Mode](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Principal_Writing_Mode), [Writing\_Mode\_of\_Captions\_and\_Table\_Entries](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Writing_Mode_of_Captions_and_Table_Entries) | Ready|  | 1 | trunk |
|  |  [Rec B2](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WGRev.html#RecB2) | [Reasonable\_Fallback\_to\_Horizontal\_Writing](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Providing_Reasonable_Fallbacks_to_Horizontal_Writing), [Plural\_Principal\_Writing\_Mode](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Providing_Optimal_Layouts_for_more_than_one_Principal_Writing_Mo), [Announcing\_non-optimality](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Announcing_non-optimality)  | Ready|  |  1| trunk |
|  |  [Rec C](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WGRev.html#RecC) |[One\_by\_One](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#One_by_One), [Rotation](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Rotation), [Tate-chu-yoko](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Tate-chu-yoko), [Line-start\_and\_Line-end\_Prohibition\_Rules](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Line-start_and_Line-end_Prohibition_Rules), [Emphasis\_Dots](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Emphasis_Dots)  | Ready | May subset depending on status | 1 | trunk |
|  |  [Rec D1](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WGRev.html#RecD1), [Rec D3](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WGRev.html#RecD3) | [Mono-Ruby](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Mono-Ruby), [Group-ruby](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Group-ruby), [Bopomofo\_Ruby\_(Zhuyin\_Fuhao)](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Bopomofo_Ruby_(Zhuyin_Fuhao))  | Ready |  | 1 | trunk |
|  |  [Rec D4](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WGRev.html#RecD4) |[Ruby\_Positioning](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Ruby_Positioning)  | Ready |  | 1 | trunk |
|  |  [Rec E](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WGRev.html#RecE) | [Normalization](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Normalization) | Ready | Remove normalization section from spec|  1 | trunk |
|  |  [Rec F](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WGRev.html#RecF) | [Prohibiting\_Private-use\_Characters](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Prohibiting_Private-use_Characters) | Ready | Private-use code points strongly discouraged; if used anyway, embedded font with glyph must be provided |  1 | trunk |
|  |  [Rec G](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WGRev.html#RecG)  | [Phonetics\_in\_Metadata](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Phonetics_in_Metadata)  | Ready | Personal rewrite: Clearly state that the xml:lang attribute of a meta element in OPF 3.0 specifies a language variant of the metadata in scope.  As an example, mention the use of ja-kana-jp, zh-bopo, zh-Latn-pinyin as value of xml:lang for denoting the pronunciation of the metadata. |  |  |
|  |  [Rec H](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WGRev.html#RecH) | [Language\_Inheritance](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Language_Inheritance) | Ready | Personal rewrite: Use the package element dcterms:language in OPF 3.0 as the default language of all the enclosed OPS documents. |  |  |
|  |  [Rec I](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WGRev.html#RecI) | [Font\_Embedding](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Font_Embedding) | Ready |  | 1 | trunk |
|  |  [Rec J](http://www.asahi-net.or.jp/~eb2m-mrt/epub/rec2WGRev.html#RecJ) | [Column\_Progression](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Column_Progression) | Ready |  |  1 | trunk |
|  | Introduce some attributes in OPF for choosing right or left for any `<spine>` item. | [Two-page spread](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Two-page-spread) | Conceptually accepted | Pending specific metadata proposal |  |  |
|  | Personal proposal: Introduce some versioning mechanism for identifying the latest version of an EPUB document such that Reading Systems could identify when an update might be desired. |  | Conceptually accepted | Pending specific proposal |  |  |
| **StylingLayout** |  |  |  |  |  |  |
|  | [Calc](http://code.google.com/p/epub-revision/wiki/SolutionSNL_R1_2)| Dynamic Property Value Calculation | Defer; subsumed by  CSS Page Templates (below) | subgroup recommends not implementing CSS calc (DEFER); EPUB-specific syntax part of separate  CSS paged media proposal | NONE |  |
|  | [Media Queries](http://code.google.com/p/epub-revision/wiki/SolutionSNLR1_1)| Adopt Media Queries from CSS/HTML | Ready |  | 1| trunk  |
|  | [CSS Page Templates](http://code.google.com/p/epub-revision/wiki/CSSPageTemplates)| CSS Page Templates | Detach from EPUB3; Overlap timeline; Likely Informational Document | NOTE: WG consensus to separate from rest of EPUB 3.0 (on an overlapping schedule, not defer) | separate |  |
|  | [Hyphenation](http://code.google.com/p/epub-revision/wiki/SolutionSNLR3_3)| Adopt CSS3 Hyphenation from Text module| Ready |  | 1 | trunk |
|  | [Columns](http://code.google.com/p/epub-revision/wiki/SolutionSNLR3_1)| Adopt CSS Column Support | Ready |  | 1 |  trunk |
|  | [Require Embedded Font Support](http://code.google.com/p/epub-revision/wiki/RequireEmbeddedFontSupport)| Make embedded font support a Reading System conformance requirement | RS must support embedded fonts; list of required font format(s) that RS's must support TBD |  | 1 | trunk |
|  | [Zoomable Role Attribute Value](http://code.google.com/p/epub-revision/wiki/SolutionSNLR3_11)| Add 'zoomable' value to ops:type attribute | Ready |  | 1 |  |
|  | [Allow SVG in spine](http://code.google.com/p/epub-revision/wiki/SolutionSNL_R4_1)| Allow SVG to be referenced directly in OPF spine | Ready |  | 1 | trunk |
|  | [Default to first oebps-package+xml found in contrainer.xml](http://code.google.com/p/epub-revision/wiki/SolutionSNL_R4_1)|  | Ready |  | 1 | trunk |
| **RichMedia** |  |  |  |  |  |  |
|  | [ScriptingImplementationProposal](http://code.google.com/p/epub-revision/wiki/ScriptingImplementationProposal)| EPUB 3 will define that scripted content should be processed via the HTML5 processing model | Ready |  | 1 | trunk |
|  | [TextAudioSync](http://code.google.com/p/epub-revision/wiki/ImplementationProposalTextAudioSync)| Text-Audio Sync via SMIL subset | Accepted | Pending final revision by DAISY folks, will be ready when they declare it as such | N/A |  |
|  | [ImplementationProposalTriggers](http://code.google.com/p/epub-revision/wiki/ImplementationProposalTriggers)| Declarative triggers for events esp. video & audio | Ready |  | 1 | trunk |
|  | [ImplementationProposalRichMediaEmbedding ](http://code.google.com/p/epub-revision/wiki/ImplementationProposalRichMediaEmbedding)| Rich Media Embedding (audio and video elements in OPS 3) | Ready | NOTE: accessibility (format referenced by "track" element still under investigation by subgroup) | 1 | trunk |
|  | [Repeat segments/times for audio](http://code.google.com/p/epub-revision/wiki/ImplementationProposalsPronunciationAndAudio#TR8._Ability_to_specify_repeat_segments_and_repeat_times_for_aud)| Repeat segments times for audio | Defer | NOTE: rich-media subgroup consensus is to defer (other parts of PronunciationAndAudio belong in text-content subgroup)| NONE |  |
|  | [ImplementationProposalDataAndCodeSeparation](ImplementationProposalDataAndCodeSeparation.md) | Code/Data Separation | Ready |  | 1 | trunk |
| **Metadata** |  |  |  |  |  |  |
|                       | [role/ops:type](ImplemenationProposalRoleOpsType.md) | add @role equivalent for semantic inflection | Ready |  | N/A  |  |
|                       | [OPF Metadata Enhancements](ImplementationProposalsMetadata.md) | E.g. dcterms: | Ready |  | N/A  |  |
| **Annotations** |  |  |  |  |  |  |
|                       | [ImplementationProposalAnnotations](ImplementationProposalAnnotations.md) | Support annotations and their exchange | Detach annotations to separate track; create detached interpublication linking group, prioritize the latter |  | N/A | N/A |
| **Navigation** |  |  |  |  |  |  |
|                       | [ImplementationProposalsNCX](ImplementationProposalsNCX.md) | NCX with minimal changes | Accepted |  | N/A | N/A |

## Requirements postponed beyond EPUB 3 ##
| **Subgroup** | **Requirement** | **Rationale** |
|:-------------|:----------------|:--------------|
| **TextContent** |  |  |
| [EGLS](EGLS.md) | [Hanging Punctuations](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Hanging_Punctuations) |  |
|  | [Unbreakable Character Sequences](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Unbreakable_Character_Sequences) |  |
|  | [Non-separating Characters](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Non-separating_Characters) |  |
|  | [Jukugo ruby](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Jukugo-ruby) |  |
|  | [Multiple Ruby Text (Japanese)](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#Multiple_Ruby_Text_(Japanese)) |  |
|  | [In-line Graphics](http://code.google.com/p/epub-revision/wiki/EGLS_requirement_list#In-line_Graphics) |  |
| **StylingLayout** |  |  |
| **RichMedia** | [text/audio sync with multiple granularities](http://code.google.com/p/epub-revision/wiki/RichMediaAndInteractivity#RM-25._(C)_Multiple_granularities)|  |
| **Metadata** |  |  |
|                       | META\_R11 Navigation to pages in various print editions |  |
| **Annotations** |  |  |
| [Navigation](Navigation.md) |  |  |
|  |[NAV\_R01](http://code.google.com/p/epub-revision/wiki/Navigation#NAV_R01_Maximize_terseness_(E)) |  |
|  |[NAV\_R02](http://code.google.com/p/epub-revision/wiki/Navigation#NAV_R02_Lazy/Partial_loading_of_navMap_(E)) |  |
|  |[NAV\_R04\_2](http://code.google.com/p/epub-revision/wiki/Navigation#NAV_R04_2_Allow_distinguishing_links_along_other_axes_than_that) |  |
|  |[NAV\_10](http://code.google.com/p/epub-revision/wiki/Navigation#NAV_10_Navigation_in_Video_and_timed-based_media_(B)) |  |
|  |[NAV\_11](http://code.google.com/p/epub-revision/wiki/Navigation#NAV_11_Make_OPF_Optional) |  |
|  |[NAV\_R05](http://code.google.com/p/epub-revision/wiki/Navigation#NAV_R05_Enhance_global_language_support_in_labels_(A)) |  |