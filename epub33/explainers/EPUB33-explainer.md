# EPUB 3.3 Explainer

**Written**: 2021-02-22, **Updated**: 2021-10-19 

## Authors:

 * Dave Cramer (Invited Expert)
 
## Participate

 * [Issue Tracker](https://github.com/w3c/epub-specs/issues)
 * [Mailing List](https://lists.w3.org/Archives/Public/public-epub-wg/)
 
## Table of Contents

TK
 
## Introduction

**EPUB 3.3** is a packaging mechanism for web content, designed for electronic books. EPUB's roots go back to 1999, with the OEB 1.0 specification from the Open Ebook Forum (which evolved into the IDPF) In 2007, a packaging format was introduced and OEB became EPUB 2.0. In 2011, EPUB 3.0 added support for XHTML5. Changes since then have been minor. The IDPF was absorbed into W3C in 2017, and responsibility for the maintenance of EPUB fell to the EPUB 3 Community Group, which released EPUB 3.2 in 2019 as a community group note. EPUB is twenty-one years old, but has never gone through the W3C Recommendation track, until now. 

EPUB 3.3 includes the following specifications:

* [EPUB 3.3 Overview](https://w3c.github.io/epub-specs/epub33/overview/), a non-normative overview of EPUB 3.3
* [EPUB 3.3 Core](https://w3c.github.io/epub-specs/epub33/core/), the specification of the file format
* [EPUB 3.3 Reading Systems](https://w3c.github.io/epub-specs/epub33/rs/), the specification for user agents, known as EPUB Reading Systems. 
* [EPUB Accessibility 1.1](https://w3c.github.io/epub-specs/epub33/a11y/)
* [EPUB Accessibility Techniques 1.1](https://w3c.github.io/epub-specs/epub33/a11y-tech/)

## Goals

* to create a universal standard for the creation, distribution, and consumption of digital books

* to serve as an interchange format between publishers, distributors, and retailers. 

* to create a self-contained package of content that does not depend on a network connection

* to define a linear sequence of HTML files with a preferred order

* to provide for publication-level metadata

* to allow for the syncronization of textual and audio content

* to provide a standard format for digital books for *all* readers, including those who use assistive technologies.

* to work closely with the creators of an [EPUB Validation Tool](https://github.com/w3c/epubcheck), so that the entire ecosystem can agree on the file format.

## Non-goals

* Reaching feature parity with the web platform. Support for HTML forms is not required. Scripting is quite limited. 

* Detailed error handling. EPUB largely tries to avoid detailed descriptions of how to present malformed content to users. 

* Defining the user interface or user experience in detail. We don't ask that every book look exactly the same in every reading system.

* Creating DRM for ebooks. The EPUB 3 Working Group acknowledges that DRM is widely used, and that it is in fact necessary to support use cases of societal importance such as library lending of ebooks. EPUB can be used with DRM, but DRM is itself out of scope for the working group. 



## Considered Alternatives

EPUB or its predecessor formats have been in the marketplace for more than two decades. Many alternatives have fallen by the wayside, in spite of various theoretical advantages. The demand for EPUB has proven itself to be strong and long-lasting. 

* **PDF** PDF files are self-contained and can support extremely complex designs. But the user experience is poor, as the format does not naturally adapt to varying screen sizes, user font preferences, etc.

* **The Web** Until very recently, web pages didn't work very well without a network connection. It's hard to define a linear reading order across a web site. It's hard to define metadata at a site level rather than a page level. The web is largely funded by advertising, and people who read ebooks have largely preferred paying directly for content. 

* **Older ebook formats** Numerous other ebook formats have been created, but have largely fallen out of use. The text-only Palm PDB format was both design-limited and hard to produce. Sony's BBeB XML format was extraordinarily complex. Several companies used proprietary packaging mechanisms for OEB (Microsoft LIT, Mobi) but they did not spread outside those companies. 


## Stakeholder Feedback

Amazon supports and ingests EPUB 3 files, then transforms them into proprietary formats.

Apple supports, ingests, distributes, and sells EPUB 3 files.

Barnes & Noble supports, ingests, distributes, and sells EPUB 3 files.

Google supports, ingests, distributes, and sells EPUB 3 files.

Kobo supports, ingests, distributes, and sells EPUB 3 files.

EPUB 3 is produced by nearly every trade and educational publisher in the world, including Editis, Hachette Livre, HarperCollins, Haufe, Kadowakwa, Kodansha, Macmillan, Pearson, Penguin Random House, Shueisha, and Wiley. 

## Acknowledgements

EPUB owes an eternal debt of gratitude to Garth Conboy.

Many thanks for valuable feedback and advice from:

* Ivan Herman

* Wendy Reid

* Tzviya Siegman






