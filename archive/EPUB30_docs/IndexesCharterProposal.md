# Charter Proposal - Indexes #



## Status of this proposal ##
This charter proposal has been [accepted by vote of the IDPF membership as of 1/31/2012](http://idpf.org/news/dictionary-indexes-working-groups-formed) and a Working Group formed. Please see the [Indexes Working Group Main Page](http://code.google.com/p/epub-revision/wiki/IndexesMainPage) for current activity on this project. **The final charter document is available at http://idpf.org/charters/2012/indexes/**.

Note that the [Definitions](IndexesCharterProposal#Definitions.md) section contains definitions for terms as used in this document.  The definitions are intended to apply narrowly, within the scope of this document, and should not be construed as applying to the field of indexing in general or to EPUBs as a whole.

## Need for this proposal ##
[Indexes](IndexesCharterProposal#Index.md) are specialized navigational and supplemental information tools that offer readers an interaction with content that is enhanced, more powerful, and more specific than simple search.  Users will expect to have indexes available in the EPUB3 ecosystem and accessible as easily as search. Publishers of EPUB3 content wish to make this data available to users, to allow them to explore book contents beyond what search results reveal.

Readers use indexes in a variety of ways: to quickly locate discussions in content, to discover relevant content that is discussed with differing synonyms, to discover new terminology for concepts, and to see details of topics covered in an eBook. Indexes convey a sense of the depth of topic coverage in an eBook, break down large concepts into important subcategories, and allow exploration of content through granular and user-friendly access points. Indexes provide the added value of human analysis, enabling an interactive conversation between the reader and the book. Indexers are not constrained to use as entries the terms used by the author, or even in some cases only the terms that appear in the entire document: indexers are focused on meanings, not just words. Indexes are also a [pre-coordinate search system](IndexesCharterProposal#Pre-coordinate_system.md), as opposed to search's propensity to being [post-coordinate](IndexesCharterProposal#Post-coordinate_system.md).

Index information and metadata can be used by devices to provide navigation and supplemental search details to the reader. Search can be supplemented and fine-tuned by reading index metadata to provide better results. Index metadata can provide new views into the semantic underpinnings of an eBook.

This proposal describes the scope, required functionality, and timeline to deliver a standard for producing ePUB3 publications that meet the use cases included in this proposal

As a navigation feature, support for indexes relates directly to Item 6 in the EPUB Revision Working Group Charter, regarding enhanced navigation support (see <a href='http://idpf.org/epub/30/wg-charter'>here</a>).

Main wiki page for the Working Group is <a href='https://code.google.com/p/epub-revision/wiki/IndexesMainPage?ts=1322858948&updated=IndexesMainPage'>here</a>.

## Scope ##
### In-scope (Deliverables) ###
The scope of this project is to define a declarative mechanism for the representation of indexes in EPUB Publications. As further detailed in [Use Cases](IndexesCharterProposal#Use_Cases.md),  [Needed Publication Properties](IndexesCharterProposal#Needed_Publication_Properties.md), and [Reading System Behaviors](IndexesCharterProposal#Reading_System_Behaviors.md) below, the delivered mechanism shall have the following top-level functional properties:

  * Allow users to read or browse an index in full chapter-like format
  * Allow users to quickly access index information in a search context
  * Allow users to see index entries associated with a range of text



### Out of Scope ###
Indexers write indexes using a variety of tools, ranging from built-in modules in page layout and XML content management software to dedicated index preparation software. Details of how to implement indexing in those tools are out of scope.

Ordering of main headings and subheadings in the index are part of the creation process and thus out of scope.

Index display format in chapter form (e.g., indenting, spacing, etc.) can vary greatly, depending on the writer and publisher. Suggested presentation formats are out of scope.

Low-level, system-oriented functionality for fast lookup, reverse lookup, and retrieval, typically described in terms of a database-like file, are out of scope.


### Integration Constraints ###
The defined mechanism shall integrate with EPUB 3 as follows:
  * _Graceful fallback_: it must allow EPUB 3 Reading Systems to open and reasonably render Publications containing the mechanism, even if the Reading System has not been updated to explicitly support the mechanism.
  * _Native grammars and extension points_: it must utilize EPUB 3 Content Document grammars to the maximum extent possible, and it must only use extension points defined within EPUB 3 and XHTML 5.
  * _Shallow implementation_: Reading System implementation of the mechanism must not require changes to underlying (browser-based or other) XHTML rendering engines; full implementations must be possible on the Reading System level alone.


## Timeline and Participation ##

Project participation is open to IDPF members and invited experts. _(Note that invited expert status needs to be renewed for each IDPF project.)_

The project charter spans one year in total. Once formed, the working group will decide on feature prioritization and possibly also versioning strategies, after which the milestones below can be dated.

| Draft Charter Proposal to WG for review | December 2, 2011 |
|:----------------------------------------|:-----------------|
| Submission to Membership for Approval | January 6, 2012 |
| WG creation, formal project start | January 23, 2012 |
| WG Face-to-face | Feb timeframe _TBD_ |
| First WG Draft | _TBD_ |
| Second WG Draft | _TBD_ |
| Proposed Specification | _TBD_ |
| Recommended Specification | _TBD_  |
| Maintenance/Tutorials | Through Jan 2013  |

This project is intended to be run concurrently with the project on [dictionaries and glossaries](DictionariesCharterProposal.md), and so shares the charter span with that project.



## Working Group Leads ##
Suggested Leads of this working group are:
  * Michele Combs, American Society for Indexing (Co-Chair)
  * David Ream, American Society for Indexing (Co-Chair)
  * Jan Wright, American Society for Indexing (Co-Chair)


## Use Cases ##

  1. [Chapter-like index](IndexesCharterProposal#Chapter-like_index.md):
    * User navigates to chapter-like index to [browse](IndexesCharterProposal#Browsing.md) topics and find information.
    * User expands or collapses [main headings](IndexesCharterProposal#Main_heading.md)/[subheadings](IndexesCharterProposal#Subheading.md).
    * User selects special symbol, prefix or suffix (for example; asterisks, dagger symbols) to display meaning of symbol.
    * User hovers over index link to display contextual information (e.g., 3-4 words from each side of target location in text)
    * User clicks index links to navigate to the book's content.
    * User clicks [cross reference](IndexesCharterProposal#Cross_reference.md) to navigate to the target heading or to view a list of target headings.
  1. [Pop-up index](IndexesCharterProposal#Pop-up_index.md):
    * User selects a term or phrase and triggers a pop-up view of the index displaying the first matching main heading.
    * User opens index from book's content with nothing selected, displaying top of pop-up index or last-used position in index.
    * User browses for terms or enters search text in pop-up index display. Entering search text triggers [stemming](IndexesCharterProposal#Stemming.md) and [auto-fill](IndexesCharterProposal#Auto-fill.md).
    * User expands or collapses main heading/subheading [levels](IndexesCharterProposal#Level.md).
    * User hovers over index link to display contextual information (e.g., 3-4 words from each side of target location in text)
    * User clicks link in pop-up index display and returns to book content.
  1. [Reverse index](IndexesCharterProposal#Reverse_index.md):
    * User selects a [range](IndexesCharterProposal#Range.md) of text and triggers pop-up list of all in-context index [entries](IndexesCharterProposal#Entry.md) for the range.
    * User selects in-context index entry, and triggers access to selected entry in pop-up index.
  1. [Standalone index](IndexesCharterProposal#Standalone_index.md):
    * User opens a publication that consists of one or more [master indexes](IndexesCharterProposal#Master_index.md) which contain links to other EPUBs.
    * User browses topics and finds information.
    * User expands or collapses [main headings](IndexesCharterProposal#Main_heading.md)/[subheadings](IndexesCharterProposal#Subheading.md).
    * User clicks index links to navigate to other EPUBs.

## Needed Publication Properties ##

_Package metadata_
  * A publication contains one or several indexes as files or as sections, and declares these resources via [package metadata](IndexesCharterProposal#Package_metadata.md).
  * A reverse index contains the same information as the chapter-like index but sorted in [locator](IndexesCharterProposal#Locator.md) order rather than alphabetical order. The presence of a reverse index is declared via package metadata.
  * A publication contains that one or more [standalone indexes](IndexesCharterProposal#Standalone_index.md) and declares these via package metadata.
  * An index contains [group break navigation data](IndexesCharterProposal#Group_break_navigation_data.md), available for use in a floating or persistent navigation feature for the chapter-like index, and declares this resource via package metadata.
  * A publication contains a machine-discoverable index-symbols list ([legend](IndexesCharterProposal#Legend.md)), and declares this resource via package metadata.
  * A publication containing semantic markup to display lists of related main headings for [generic cross references](IndexesCharterProposal#Generic_cross_reference.md) declares this capability via package metadata.

_Index links_
  * Index links can identify single locations, multiple locations, or ranges for lengthy subject coverage in the publication's main content.
  * [Group break navigation data](IndexesCharterProposal#Group_break_navigation_data.md) provide links to symbol, number, or letter group breaks within an index.
  * [Generic cross references](IndexesCharterProposal#Generic_cross_reference.md) can identify and display the related semantically-marked main headings as a list.
  * Index entries contain  [targets](IndexesCharterProposal#Target.md) for the navigational system's links within the index; for instance, [cross references](IndexesCharterProposal#Cross_reference.md) will have targets, as will the group breaks for letter sections.

_Index presentation_
  * [Master indexes](IndexesCharterProposal#Master_index.md) that index multiple volumes will include links to targets in other epubs.
  * Unique characters and numbers that act as group breaks for letter sections in the index are present, and marked in machine-discoverable form.
  * [Headnotes](IndexesCharterProposal#Headnote.md), if present, are marked as such and are presented at the beginning of the chapter-like index.
  * [In-line editor's notes](IndexesCharterProposal#Editor's_note,_inline.md), if present, are displayed in chapter-like and pop-up index.
  * Proper text alignment and indentation is maintained in the chapter-like index.
  * Special formatting of the index’s content (italics, bold, sub-, super-script, fonts, special characters) are preserved in the index’s content.
  * [Decorations](IndexesCharterProposal#Decoration.md), prefixes or suffixes used in the index to annotate locators (daggers, ff, n, nn and so on), if present, are marked up as such and machine-discoverable.
  * A [legend](IndexesCharterProposal#Legend.md) containing definitions or explanations of each decoration, prefix or suffix, if available, defines the description for each symbol.

## Reading System Behaviors ##
_Note: the intent of this project is not to mandate reading system behaviors. The list below only serves the purpose of illustrating Reading System/Index interactions._

_Implied/assumed (existing functionality in EPUB readers that indexes will use)_
  * Reading system will properly display text encoded with special formatting, i.e. bold, italic, subscript, superscript.
  * Reading system must be able to discover whether an EPUB contains one or more indexes.
  * Reading system must be able to discover whether an EPUB consists of one or more standalone indexes.
  * Reading system will properly display text encoded as a link, i.e. as text that can be hovered over or clicked to trigger an action (taking user to target, displaying contextual phrase, etc.)
  * Reading system includes buttons or menu options to access either the chapter-like index or the pop-up directly from the text, without having to visit the table of contents.
  * Reading system allows the reader to select collapsed or expanded views of the index levels (main headings only, main and subheadings, etc.).
  * Reading system determines how targeted location is displayed on the screen after its link has been clicked (top of screen, middle of screen, highlighted term, highlighted range of text, blinking symbol or indicator of location, etc.)
  * Reading system displays a [legend](IndexesCharterProposal#Legend.md) for special symbols used in the index’s locator decorations in a pop-up.


<a />Chapter-like index_* Reading system displays chapter-like index as normal pages.
  * Reading system displays a floating or persistent set of group break navigational links in the chapter-like index to allow navigation to other sections of the index.
  * Reading system displays floating or persistent access to headnotes.
  * Reading system persistently displays applicable parent entry(ies) as user scrolls through lower-level entries, if applicable/necessary._


<a />Pop-up index_* Reading system displays pop-up index as separate window, automatically scrolled to the term selected when it was activated (or defaults to top of index if nothing was selected)
  * Reading system provides search functionality within popup index.
  * Reading system displays floating or persistent access to headnotes.
  * Reading system persistently displays applicable parent entry(ies) as user scrolls through lower-level entries, if applicable/necessary._


<a />Reverse index_* Reading system must be able to uniquely identify multiple index targets in a selected section of text (e.g., a paragraph).
  * Reading system must be able to extend that identification to include index targets whose range encompasses the selected text (e.g. a range that begins prior to the selected text and ends after the selected text)
  * Reading system must be able to locate the main headings in the index associated with each of those anchors.
  * Reading system must be able to display those main headings to the user.
  * Reading system must be able to render each main heading as a live link to the heading's location in the chapter-like index._


_Standalone index_
  * Reading system must be able to link from one EPUB to another, and have a return mechanism.

## References ##

  * Initial proposal to the IDPF: http://dl.dropbox.com/u/2248375/IDPF%20Index%20functionality%20in%20ePub.pdf
  * NISO Guidelines for Indexes and Related Information Retrieval Devices: http://www.niso.org/publications/tr/tr02.pdf
  * ISO Guidelines for the content, organization and presentation of indexes: http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=5446
  * BNA study http://dl.dropbox.com/u/2248375/Using%20BNA%20Indexes%20study.pdf
  * Neil Ching's "An XML Notation for Describing Back-of-the-Book Indexes" http://dl.dropbox.com/u/2248375/Neil%20Ching%20NDX%20notes.doc
  * Society of Indexers Publishing Technology Group: Characteristics of Analytical Indexes http://dl.dropbox.com/u/2248375/SI_Analytical_Index.pdf



## Definitions ##

This section contains definitions for terms as used in this document.  The definitions are intended to apply narrowly, within the scope of this document, and should not be construed as applying to the field of indexing in general or to EPUBs as a whole.

##### Auto-fill #####
> Auto-fill functionality pre-scrolls a pop-up index to main headings in the index matching the letters as they are typed in by the user.
##### Browsing #####
> Reading/skimming index content.
##### Chapter-like index #####
> An index presented in a book's content as a chapter, accessed from the table of contents and from special menus or icons. It can be paged through and browsed as normal content, with hyperlinks back into the book's content, and cross-reference hyperlinks to other areas of the index.
##### Cross reference #####
> Entry in an index that directs the reader from one term to another term. An entry should be hyperlinked to the targeted term. There are three types: [See references](IndexesCharterProposal#See_reference.md), [See also references](IndexesCharterProposal#See_also_reference.md), and [Generic cross references](IndexesCharterProposal#Generic_cross_reference.md) (defined below).
##### Decoration #####
> A prefix, suffix, symbol or special formatting added to locators to indicate special content, such as tables, figures, or primary discussions.
##### Editor's note, inline #####
> Editorial note that is part of an index entry, found inline after the main heading or subheadings.
##### Entry #####
> A unit of an index, consisting of a main heading, zero or more subheadings, and at least one locator or cross reference.
##### Generic cross reference #####
> Cross reference to a category of entries rather than a specific entry.  For example, in a software manual: "Commands. _See names of specific commands_", or in a book on pets: "Dogs. _See names of specific breeds, e.g. golden retriever_".
##### Group break navigation data #####
> A string of hyperlinked letters and/or digits (e.g., A-Z, 0-9) used to easily navigate to another section of the index: for example, clicking P would take the user to the section of the index beginning with P. Other alphabets and character systems would display the appropriate glyphs for any navigation data.
##### Headnote #####
> Explanatory paragraph(s) at the head of the index that describe unique features of the index (e.g., special typography, scope of the index, omitted items, etc.) that the reader needs to know in order to effectively use the index.
##### Index #####
> An intuitively sorted (usually alphabetical) list of entry terms providing a variety of different access points to all significant discussions of subjects, which might be concepts, entities, processes, individuals and organizations within a document, with associated [locators](IndexesCharterProposal#Locator.md) indicating where these discussions are to be found.
##### Legend #####
> A section of content that explains locator [decorations](IndexesCharterProposal#Decoration.md), special symbols, or other typography for the user.
##### Level #####
> Nested depth of subheadings beneath each main heading. A [main heading](IndexesCharterProposal#Main_heading.md) is level 1; a [subheading](IndexesCharterProposal#Subheading.md) is level 2; a sub-subheading is level 3; and so on.  There can be as many levels as the indexer and publisher feel necessary.
##### Locator #####
> Pointer from an entry in the index to a significant treatment of the topic in the text, which may be a page number, section number, etc. In an EPUB the locator should appear as a hyperlink.
##### Main heading #####
> Words, symbols, or phrases based on or selected from the book's content, expressing a concept, idea, or proper name. A main heading may or may not have [subheadings](IndexesCharterProposal#Subheading.md), but must have one or more [locators](IndexesCharterProposal#Locator.md) or a [cross reference](IndexesCharterProposal#Cross_reference.md).
##### Master index #####
> An index that covers more than one publication. A master index can be part of an EPUB with other content or part of a standalone index.
##### Package metadata #####
> Data about the EPUB as a whole.  Please see descriptions at <a href='http://idpf.org/epub/30/spec/epub30-publications.html#sec-package-documents'>package document</a> and <a href='http://idpf.org/epub/30/spec/epub30-publications.html#sec-package-metadata'>package metadata</a>.
##### Pop-up index #####
> Index view activated by user while in the text and displayed in a separate window.
##### Post-coordinate system #####
> System in which the user enters one or more terms which are matched character-by-character in the target text.  Search engines are an example of post-coordinate systems.
##### Pre-coordinate system #####
> System in which co-relations (e.g., broader/narrower relations, semantic connections) between topics have been determined by human analysis, adding an enhanced level of sophistication and specificity.  An index is an example of a pre-coordinate system.
##### Range #####
> A [locator](IndexesCharterProposal#Locator.md) that indicates a span of text, i.e., where coverage of a subject begins and ends.
##### Reverse index #####
> Index view activated when the reader highlights a range of text, which displays in a separate window the index entries associated with the range.
##### See also reference #####
> Cross reference that directs the reader to related, broader, or narrower subjects covered at other main headings.
##### See reference #####
> Cross reference that directs the user from an term not used in the index to the preferred term in the index.
##### Standalone index #####
> A publication that consists only of one or more indexes to other EPUBs or external targets.
##### Stemming #####
> Stemming engines supply root forms of words and incorporate multiple versions (grow, growing, grows, growth) into search, extending the search's results.
##### Subheading #####
> Second-level, third-level, fourth-level, etc. headings subordinate to a [main heading](IndexesCharterProposal#Main_heading.md).
##### Target #####
> Unique id code located in book's content, available for links to use in navigation.