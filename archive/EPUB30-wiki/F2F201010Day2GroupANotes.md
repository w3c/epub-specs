Group A: TextContent, Metadata, Annotations, Navigation (Coordinator: Markus)

# Inter-publication Linking #

This is strongly required by Annotations and Metadata.

Markus G strongly suggests that we will be sad if we do not have a good inter-publication linking solution that includes a specific target inside the publication.

Will M describes some of the contraints and context surrounding the breakability of links across updates and unwrapping specific link targets to a more generic target.

Keith F suggests that Annotations will care more about the longevity of link targets than Metadata.

John R describes the discussion at the Monday dinner.

EPUB already has a unique identifier that could be used as a part of the top-level linking, but there is no strong requirement that these identifiers are globally unique. If these identifiers were moved toward URIs that might help enforce a stronger global uniqueness requirement.

> http://bisg.org/ISBN/9781234567890

Alternatively, you might describe a more specific link with a number of components:

> http://bisg.org/ISBN/9781234567890/{TOP_LEVEL}/{2ND_LEVEL}/{FILENAME}#{FRAGMENT_ID}

John R suggests that the link author may understand the fragility of the links they're creating. More specific links will always be more fragile.

Long discussion.

Recommendations:

  * Start two new spec development tracks on the same schedule as EPUB3: Annotations and Document Linking (there is a chickening out aspect)

# Annotations #

Will M demos a simple annotation implementation. He selects a range of text on the left and a number of characteristics of the selected text appear on the right:

  * A hash of the text (md5)
  * A copy of the text's content
  * An ID of a nearby element (a `div` and the "distance")
  * An xpath

Then he modifies the text of the document and is still able to use some of the characteristics to find the (now slightly modified) text on the left and he's also able to declare that the targeted content has changed.

He's very interested links that can resolve following changes.

Will M also suggests that the best package for a set of annotations about an EPUB publication might _itself_ be an EPUB. There is probably still a need to be able to have a

Will M is also concerned that a scripted EPUB Annotation document might exploit its security