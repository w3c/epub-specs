# The Barnes & Noble Fixed-layout Format #
## Introduction & Background ##
The Fixed-layout format currently used by B&N for its digital replica magazine content was developed in the summer of 2010 to address the need for a file format that would allow fluid user interactions (page-turns) with magazine content derived from press-ready PDFs, while also allowing the textual content of these magazines to be read easily. Internally, we refer to this format as “DRP” (Digital Replica Plus); we will use this term to describe the format in this document. B&N engineering was mindful of the performance constraints of the Nook Color; DRP is, to a certain degree, a product of those constraints. Please note that when this format was under active development, B&N had not yet announced the Nook Color, and strict secrecy was enforced. Were we to have discussed our interest in this format in a public forum such as IDPF _at all_ last summer would have divulged critical competitive information.

DRP is essentially an ePub: it’s a zip file with the normal ePub structure, including an OPF with a manifest, spine, etc. In essence, a DRP contains two categories of items: images of pages rasterized from the incoming PDF, and the text (and images, if desired) of “articles” contained in the magazine (XHTML). There are a couple of ways in which a DRP deviates from the ePub standard: 1) the format & reading system allow images to be top-level items in the spine, and 2) the addition of a _replica map_ (described in detail later), mapping page images to XHTML content (and vice versa). “ArticleView™” presents the text of an article plus a headline, byline and one or more images in an HTML view. In our implementation, the article view “floats” above the page image, with some of the underlying page image visible along the sides of the article view.

While full-page images _can_ be spine items, the current generation of DRP does not place images as spine items. Instead, the spine items are the _articles_, such that if you open a DRP with a “regular” ePub reader, you will navigate through the articles, not the full-page images of the content. This is intentional so that fallback on standard ePub reading systems would give reasonable results.

The key to DRP’s behavior is the _replica map_. The replica map contains information that indicates which articles are on which pages (page-images) of the content. This mapping is bi-directional, so there are two ways to go through the content: article-by-article and page-by-page, and whichever “view” is used, the pages and the articles stay in sync. In addition, a page with one or more articles will cause a UI element (a button) to appear at the top of the screen which, when pressed, will either open the article viewer (in the case where there is only one article on the current page) or bring up a list of articles (for the case where there is more than one article – or article fragment – on the current page).

The replica map is a simple structure that contains spatial information that is not currently leveraged by any B&N implementations. The spatial information describes rectangles on a page where articles, or parts of articles, reside. The values are in the range of `[0..1]`, where zero is the top/left, and one is bottom/right. That is, `[0, 0, 1, 1]` represents the entire page, while `[0.5, 0.5, 1, 1]` represents the bottom-right quadrant of the page. The notion here is essentially identical to the HTML `<map>` tag, except that the coordinates are expressed as fractions of page width and height, rather than as absolute values (allowing the image to be zoomed and retain the coordinate mapping).

The primary purpose of the article view is to solve the problem of “text too small to read” even when viewing a page at full zoom. A key point is that content as rendered in the DRP viewer is not tailored for a device such as the Nook Color; rather it is created with print output as the primary medium. The article view allows users to select fonts and point sizes as in a typical ePub reader.

## Why not PDF? ##

PDFs, as delivered to B&N, are press-ready. Press-ready PDFs can be huge, and individual pages may take several seconds (sometimes much longer) to render, particularly on a device such as the Nook Color. We required a fluid user experience when swiping from page to page, and reckoned we would not consistently get the required level of performance rendering directly from PDFs. The consequence is that DRP is, in part, a “pre-rendered PDF.”

At present, a DRP can be identified by the presence of the replica map (replicaMap.xml) in the manifest. Clearly, there are other ways to accomplish this. We make note of the “DRP-ness” of the file when it is ingested into our ecosystem and need nothing further to tell us what file type it is, but this is an area for potential enhancement.

## What size should a page image be? ##
Magazines are an interesting case, since new versions are being created all the time. If you pick an image size/resolution that becomes unsuitable as a result of hardware improvements (increased screen resolution, for example), you can “fix” this by emitting larger images in newer publications. This is a bit trickier for _books_, since the content may have a much longer useful life-span than the average magazine content. One aspect to consider is fairly obvious: the larger the images, the larger the file, and the longer the images may take to load. For Nook Color, we generate images that are 1200 pixels wide, with a height equal to whatever value is derived from preserving the aspect ratio of the publication and pinning the width at 1200. The reasoning behind these values should be pretty obvious: 1200 is exactly double the width of the Nook Color screen, and represents the maximum zoom we support for DRP content.

## Things that should be done to DRP… ##
  * Cleaned up such that a DRP will pass ePubCheck/FlightCrew (the only problem right now seems to be trailing white space in the mimetype file!).
  * If the preferred “version” is the page-image sequence, _describing_ the sequence of page images as a valid rendition of the content should be reintroduced (this was the default originally; we changed it to use articles rather than page images for fallback).
  * Choose an existing ePub mechanism to make it clear there are two ways to get through the content, rather than route the file to a special application as we now do.
## The replicaMap.xml File ##
A replicaMap.xml file begins with this markup:

```
<?xml version="1.0" encoding="UTF-8"?>
<ReplicaMap xmlns="http://www.bn.com/schemas/drp">
   <Title>Sound+Vision</Title>
   <Pages>
      <Page>...
```

Each Page element looks something like this (it’s generally pretty self-explanatory):

```
      <Page pageNum="16" file="images/pages/pg-17.jpg"
            thumbFile="images/pages/pg-17-thumb.jpg">
         <Group ePubTarget="article_16-1.xml">
            <Block coord="0.590507, 0.0396, 0.977047, 0.5536"/>
            <Block coord="0.332812, 0.9492, 0.972353, 0.9796"/>
         </Group>
      </Page>
```

There may be multiple “Group” elements per page (one per distinct “article”), and zero or more Block elements per Group element. The Block element defines a rectangle, as described above that contains all or part of a particular article. The “pageNum” attribute is the value to be displayed if any page numbers are shown in the user interface.
Following the `<Pages>` section is the `<Articles>` section, which looks like this:

```
   <Articles>
      <Article id="a-174286635" file="article_10-1.xml">
         <title ref="headline">BIG HEADLINE</title>
         <byline ref="byline"/>
         <Summary>A short summary of the article goes here. Use it wisely.</Summary>
      </Article>
```

Clearly, the term “article” is a bit too magazine-specific. And finally, following the `<Articles>` section is the `<TOC>` section, which looks like this:

```
   <TOC>
      <TocEntry title="Cover">
         <Summary>Cover</Summary>
         <Page pagenum="0"/>
      </TocEntry>
 ...
      <TocEntry title="BIG HEADLINE">
         <Summary>A short summary of the article goes here. Use it wisely.</Summary>
         <Page pagenum="9"/>
         <Article refid="a-174286635"/>
      </TocEntry>
```

The TOC in a DRP contains information beyond the standard `<navItem>` entries in a typical NCX file (page number and summary).

## DRP Behavior ##
This section describes a bit more about the behavior of the B&N applications that “play” DRP content. This behavior is implicit in the pairing of DRP content with a DRP viewer, but other reading systems (and our own, future systems) must be able to determine the desired behavior from the content alone (i.e., metadata).

In a portrait orientation, DRP contents are shown a single page at a time. The full page is shown by default. Double-tapping, or pinching to zoom, are both supported, and the page image can be zoomed to 2x its original size. In a landscape orientation, DRP contents are shown two-up (essentially a two-page magazine spread), with the first page (cover) shown by itself on the right-hand half of the screen (recto). Pages are then paired verso-recto until the end of the content. This pairing is implicit, and is also carried through to the scrubber, which shows page thumbnails.

The DRP reader has enough information in the replica map, coupled with knowledge about the general structure of ePubs, that it does not need to read the OPF file at all.

Page thumbnails are included in the DRP for speed of loading and to reduce memory overhead for the “page scrubber.” Note in the `<Page>` element the attributes “file” and “thumbFile,” which point to the full-size page and the thumbnail for that page, respectively.

## Summary ##
The original design center for the DRP format was “digital replicas of magazines” with extras that make the content more readable. As such, there are artifacts that are sub-optimal for more general usage. Further, the design incorporates tradeoffs made to enable fluid interaction over higher-fidelity and a greater range of zooming content.