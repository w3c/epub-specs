# Introduction #

In preparation to the [IDPF EPUB Workshop for Fixed Layout in Taipei on 2011-10-25](TaipeiFixedLayoutWorkshop.md), a list of motivations for fixed layout is presented. It is hoped that this list allow IDPF to understand existing mechanisms or upcoming proposals for fixed layout and compare different mechanisms or proposals.


Feedbacks to this taxonomy are very welcome.  Additions or modifications are also very welcome, but please contact the facilitator, MURATA Makoto (eb2m-mrt atmark asahi-net.or.jp), in advance.

# What is fixed layout? #

EPUB publications are rendered as a sequence of pages.  Fixed layout
is a constrast to "reflow".

  * Fixed layout: Page breaks may occur in pre-determined locations only
  * Reflow: Page break locations are automatically chosen by reading systems

# Motivations #

  1. content/design is inherently paginated, i.e. **is** a sequence of final-form pages
    * Manga or comic
    * Picture books
    * Magazines
    * Cookbooks
    * Business presentations
    * High-quality brochure
  1. content/design requires richness of presentation that can't be delivered in reflowable EPUB
  1. explicit intention to optimize for a particular device (e.g. iPad)
  1. economically infeasible to do anything other than replicate print / leverage PDF production workflows
We think that, over time, EPUB's increasing layout capabilities (inc. AAL) will diminish #2 (publishers are already learning to go beyond paper-centric information designs), device proliferation will diminish #3, and better tools (e.g. w/ native AAL support) will diminish #4.

# Existing formats for fixed layout #

## PDF ##

## CBZ/CBR ##
"a series of image files, typically PNG (lossless compression) or JPEG (lossy compression) files, stored as a single archive file"
[Comic book archive](http://en.wikipedia.org/wiki/Comic_book_archive).   CBZ/CBR is very widely supported.

  * Pros
    1. Very simple.
  * Cons
    1. No text and thus little accessibility
    1. Metadata is missing.