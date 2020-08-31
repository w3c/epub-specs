# Minimum Semantic Expression for Dictionaries #

This page documents the bare minimum semantic expression for EPUB3 dictionaries that was decided on at the Dictionaries F2F on June 3, 2012, with later additions to cover bilingual dictionaries and thesauri.

Terms have the meanings defined in the “Structure and Semantics” section of the Charter.

## Entry ##
Contains at least:
  1. one headword
  1. content
For now, we have decided that entries cannot nest. We will revisit if needed.

## Headword ##
At least one headword is required to be present in an entry. Semantic aspects of the headword:
  1. A **display form** used in rendering part or all of the entry content to a user
  1. One or more **search forms**
  1. Search and display forms _can be_ identical, but our expression mechanism has to allow them to be different.
  1. A phonetic search form in Chinese pinyin or Japanese kana also needs to have a **search results form** associated with it in Han / Kanji ideographic characters.  Another way of thinking of this is as a display form for a particular search form, used only in search results for disambiguation purposes. Though needed by languages with ideographic writing, this semantic property can be useful in other languages for expressing disambiguation information.
  1. By “headword”, we mean all the various types that lexicographers distinguish: alternate, variant, derived (aka run-on and run-in), and multi-word headwords (for instance, phrasal verbs).
  1. We also include _idioms_ under the semantic term "headword". In a practical search sense, idioms can be handled the same as other headword types. However, one publisher may choose to make idioms searchable by using this markup, while another may choose not to do so.

## Inflections ##
  1. Do not have to be present
  1. Are only for use in lookup and retrieval, and are not intended to be rendered to the user.
  1. Should be expressed as headword **search forms**, as described above.
  1. Are distinct from _displayed inflections_, which are select inflected forms displayed to the user in entry content. We concluded that we likely do not need to include displayed inflections in our semantics.

## Sense ##
  1. Acts as a wrapper for definitions, examples, and other content related to a particular meaning.
  1. Optional. If present, must be non-empty.

## Miscellaneous Optional Semantic Properties ##
  1. Pronunciation
  1. Etymology (ie, word origin)
  1. Part of speech (ie, grammatical function of the headword)
  1. Sense number
  1. Definition
  1. Translation
  1. Example
  1. Synonym
  1. Antonym