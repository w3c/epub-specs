# Introduction #

Add ideas for metadata items you wish to be considered by the IDPF for possible future inclusion in standards.


## after-matter ##

_A way to distinguish between "the main body" of book content and "after-matter."_ The driving force behind this for B&N is the need to have something in an ePub that helps publishers communicate to a Reading System a place, in some types of books (e.g., novels), where “the interesting content ends.”

I realize this is a rather fuzzy notion; the basic idea is to afford an opportunity to know when someone has reached the end of “the story” but has not yet reached the “end of the book.” Knowing this as a spine item allows us to compute the last page.

Without being too “novel-specific,” I suggest a new manifest **item** property, called **“last-content-item”** (feel free to suggest a more appropriate name). It’s in the same semantic category (in my opinion) as **cover-image**, hence the suggested placement in item. In the specific case I imagine here, this would be applied at most once to the spine item corresponding to the “last chapter of the story.”

Additional notes from the e-mail thread:

The goal is to identify “the last place in the book the reader is almost certainly going to be at some point in their consumption of the material.” As a commercial interest, it’s at this point that we want to be able to make offers of related content and other promotions that (at least to the marketing folks) make the most sense in the context of “the end of the interesting content.”

This works reasonably well for non-fiction: it would be the last page of content prior to appendixes, an index, glossaries, etc.

It would be optional, and it would be up to publishers (and entities like B&N, working with publishers/authors) to decide if, and where, such a marker would go. Ignoring it would be a perfectly valid action for a reading system.

I suggest this in part because there’s enough demand for it that we’re almost certainly going to do something. In ePub 2, we will probably go the route of the meta tag and pick a name & content pair that make sense. For ePub 3 and beyond, a “blessed” and standard way of doing this would be preferable.

| note from markus: note that the default vocabulary for contentdocs contains [the backmatter property](http://www.idpf.org/epub/vocab/structure/#backmatter). The intent here has been to achieve the desired effect by including a reference to backmatter in the landmarks nav. The same of course applies to finding the spot where the "interesting content starts" -- hence the vocab contains front- and bodymatter terms as well. Note that using the landmarks nav yields more precision than a package item property as it (the landmarks approach) allows fragment-level identification as well. |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| Note from Roger: I still worry that a heuristic based on "where the back matter begins" is error-prone. If we assume that every item of body-matter is correctly tagged, we could (in theory) pick the last of those, right? We could also use epub:type and a new vocabulary entry for specific items of interest, though I'd still prefer a package-level attribute. |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## publication type ##

Different publication types call for different application chrome and UI gestures (e.g. manga, magazines). Need to be able to distinguish them. Perhaps some of dcterms could be used for this, but some examples would help.

## reflow method ##

There are two primary reflow methods.

One method is to change the default value of font-size property. This way text and all elements explicitly sized in em units are resized and the rest of elements (including fixed-size text - needed in some cases) stay the same. This allows for very flexible document styling, but it requires certain discipline in the document authoring.

The other reflow method is to zoom document in and simultaneously decrease the logical viewport size to compensate. This works for all documents, even if all fonts are specified using fixed units (e.g. pt). It is less flexible, but also easier to verify and does not require as much discipline at authoring time.

Both methods have some merits, but it would be nice to know if the document is designed to work with the first one or not. It can be guessed by analyzing font sizes assigned on top-level elements, but it is not very reliable.