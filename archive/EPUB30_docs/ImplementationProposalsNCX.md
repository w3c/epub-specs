# NCX Navigation Proposed Revision #

In order to simplify the NCX, the proposal is to write a new schema for the NCX, removing DAISY constructs that are not relevant to EPUB.  Changes would include:

  * Make `head` optional (or remove altogether)
  * Remove `smilCustomTest`
  * Remove `docTitle` and `docAuthor` elements
  * Remove `audio` element
  * Remove `playOrder` attribute
  * Add `ops:type` attribute to `navList` to distinguish the kinds of targets contained in each list (possibly make this required?)
  * Possibly add `ops:type` attribute to navTarget (and navPoint?) to distinguish the nature of navigation targets/points
  * Implement "Reading System implementors should be aware that in a forthcoming major revision of the EPUB specification, it likely will become a compliance criteria for Reading Systems to support the NCX navMap, pageList and navList as described above." from OPF 2.0.1

## Note ##

The removed items are largely taken from the [NCX Exceptions in Usage for Publications](http://www.idpf.org/doc_library/epub/OPF_2.0.1_draft.htm#Section2.4.2) section of the 2.0.1 spec.  Since support for these constructs was not required before, these changes should cause no compatibility problems.