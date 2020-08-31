# When #

Conference call from 1300-1400 UTC on 2 Nov 2010

# Who #

  * Keith Fahlgren
  * Will Manis
  * Daniel Weck
  * Graham Bell

## Regrets ##

  * Bill Kasdorf

# What #

Discussion of how scheduling is ... unfortunate. Will probably need to return to 2100UTC next week following the switch of both Daylight Savings and Summer Time.

## Principles ##

### Failure ###

Will M discusses the fact that these links should be designed to **explictly support** failure. If we do indeed have consensus that we should be designing links that may fail, what implications will that have on our design principles?

Daniel W wonders to what granularity the designing-for-failure links might offer. Especially in the multimedia space, fuzzy links may not be realistic. Perhaps the other information is embedded in the surrounding metadata rather than in the URI itself?

Will M believes that if there is a robust linking syntax and an alternative **everyone** will choose the robust one.

Daniel W raises the issue of references to a specific time offset (or range) within continuous media or a range. On top of that, we might want to highlight a particular part of the video (a frame),

Will M asks if we need to be more specific about whether the initial goal of this specification is to only point to a specific fragment of content rather than a range of content.

Daniel W agrees that links to specific points.

### Authority ###

Keith F and Will M start to discuss the idea that the specification should explicitly recognize that there will be no central authority for resolving links. This is a major departure from other identifier work in the past, but reflects the inherently distributed nature of the modern web and ebook ecosystem.

Graham B adds that the actual data from the wild about the way that identifier standards are used in ebooks suggests that things like ISBNs in EPUBs might not be unique. Additionally, they may not actually resolve to exactly the sort of document we expect. ISBNs are not necessarily widely-used in non-commercial or non-book contexts, both of which we want to support in EPUB3.

## Requirements ##

Will M brings up the issue of human-readability in the links. We may have to include identifiers like GUIDs, but we might also include some human readable text like "Mark Twain".

## Document Identifiers ##

Graham B outlines three cases of links that will require failure:

  * "I haven't got the book on my iPad"
  * "The book isn't in the iBookstore"
  * "The book I want to refer to isn't an ebook at all"


Graham B notes that individual retailers of ebooks are not strongly requiring unique identifiers for each ecosystem, so we lose the properties of uniqueness from ISBN that exists in the physical book world. What might be required is an "expression (or release) identifier", between a work and a manifestation (I think).

Keith F believes that the specification can be created in a manner that helps encourage the creation of identifiers that are more meaningful in the future.

Will M agrees that the specification could take years before having an impact, and that we should be pragmatic and realistic about the extent to which this specification might impact the larger retailers.

### EPUB Unique ID ###

Will M believes that the software world offers a good set of data on how to design a version **numbering** scheme.

Graham B wonders when we want these identifiers to break. This is actually a parallel to the recommendations made about when changes to content get new ISBNs.

Keith F asks how much we actually want to describe about how to create these Unique IDs. Should the specification actually outline a particular scheme that might be used to create identifiers that are both specific enough to create strong links but regular enough to be fuzzily matched? Will M believes it should.

Will M suggests that link consumers may also be presented with numbering schemes that are inscrutable, so it isn't as if only the new, idealized scheme should be supported.

What are the commonly used national and international numbering schemes used in publishing?

  * DOI (pretty limited domain, but where-to-get rather than what-you-get)
  * ISTC (pretty new, good for work but bad for product)
  * ISBN (pretty global, but not always used, but as good as it gets)
  * HTTP URLs

### Release or Expression Identifier ###

Graham B explains:

There is currently no international standard for this work.

The Work (ISTC) includes a very, high-level notion of the content.

The ISBN specifies a particular paper version, or audio-book version, or ebook.

The Release ID sits in the middle. It specifies all of the ebook versions but not all of the paper versions.

This has been discussed and proposed with publishers in the US and UK to very low excitment, so it doesn't exist today. That said, there is an identifier at a similar (conceptual) level in the music industry (GRID).

## Fragment Identifiers ##

Not discussed.
