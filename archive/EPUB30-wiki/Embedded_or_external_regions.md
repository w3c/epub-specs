# This wiki show pros and cons of embedded and external regions.

# Definition #

  * **Top-level publication resource**: Publication resources (see [the definition](http://idpf.org/epub/30/spec/epub30-publications.html#sec-terminology)) referenced directly from some itemref element in the spine element.

  * **Embedded regions**: Region representations embedded within top-level publication resources

Note: Suppose a JPEG file that is directly referenced by an `itemref` element.  This JPEG file is a top-level publication resource.  It cannot have embedded regions.

  * **External regions**: Region representations detached from top-level publication resources

  * **Regions as Fragment Identifiers**:  Region representations as IRI fragment identifiers such as media fragments (W3C) and SVG fragment identifiers


# Option 1: External regions #

We assume that only a few elements of SVG are allowed as part of external region representations. A description of the needed wrappers (rectangle, circle, polygone, ellipse) has been given [here](https://groups.google.com/forum/?fromgroups=#!topic/epub-working-group/i7TIG3m1V7Q) together with a RNC schema.

The usage of relative dimensions is also clarified in the above document. Jim wrote :
SVG allows for both a fixed and a scalable coordinate space.  For a scalable coordinate space leaving the width and height attributes at the default 100%, and the perserveAspectRatio with any option but ‘none’, such as the default ‘xMidyMid’, will cause the viewBox to be scaled to the containing document.
If we went this route we would want to consider:
  * Restructuring the ROI to have an SVG element per ‘page’.
  * Limiting the SVG elements to be just the ‘Basic Shapes’ (minus line) > This is what has been done by specifying wrappers for rectangle, circle, polygone, ellipse.
  * Provide guidance that viewBox should match dimensions of one of the renditions

### Linking with external regions ###
Each external ROI would be identified by its roi:id identifier. The latest proposal was to use a foreign attribute to attach such an ID to each region, as in
```svg

<svg width="100%" height="100%" preserveAspectRatio="none"
version="1.1" xmlns="http://www.w3.org/2000/svg"
viewBox="0 0 1200 1553">
<rect x="250" y="300" width="900" height="300" roi:id="panel1"/>


Unknown end tag for &lt;/svg&gt;


```

The navigation document used to create the navigation sequences between those regions would make reference to these roi:id, like in

```
 <nav epub:type="guided" hidden="">
   <ol>
     <li><a href="page1.jpg">roi.xml#panel1</a></li>
     <li><a href="page1.jpg">roi.xml#panel2</a></li>
   </ol>
</nav>
```

## Pros ##

  * Applicable to any type of top-level publication resources or fragments of such resources
  * Positions and dimensions of resources are relative to the size of displayed resources (or fragments)
  * Navigation and rendition mapping based on external regions can be implemented without requiring full SVG processors.
  * Multiple ROIs for a single publication resource is easy.

## Cons ##
  * Even if we use SVG elements and attributes wherever possible, there is a risk of reinventing wheels and poor synergy with the Web.



# Option 2: Embedded regions #

See [SVG-based regions for Manga](https://docs.google.com/document/d/1WQ2lX-zVfJKFVimb7AZauDwJnqSzlv_0rbBq1jA8HFA/edit).

Note: We have to make sure inter-rendition mapping and intra-rendition navigation can take advantage of embedded regions.

### Linking with external regions ###
The same mechanism as the one used with external regions can be used to link to an interbal region
Each internal ROI would be identified by its roi:id identifier. The latest proposal was to use a foreign attribute to attach such an ID to each region, as in (sampleCode01 from [SVG-based regions for Manga](https://docs.google.com/document/d/1WQ2lX-zVfJKFVimb7AZauDwJnqSzlv_0rbBq1jA8HFA/edit))
```
           <svg xmlns="http://www.w3.org/2000/svg" version="1.1"
               xmlns:xlink="http://www.w3.org/1999/xlink" width="100%" height="100%" viewBox="0 0 680 960">
               <image width="680" height="960" xlink:href="../image/i001.jpg" />
               
               <!-- Panel -->
               <a xlink:href="#1" target="_top">
                   <polygon points="418,0 679,0 679,323 453,340" fill="none" stroke="none" roi:id="panel1"/>
               </a>
               <a xlink:href="#2" target="_top">
                   <polygon points="39,0 414,0 448,341 39,370" fill="none" stroke="none" roi:id="panel2"/>
               </a>
               <a xlink:href="#3" target="_top">
                   <polygon points="679,566 38,566 38,385 679,337" fill="none" stroke="none" roi:id="panel3"/>
               </a>
               <a xlink:href="#4" target="_top">
                   <polygon points="679,580 382,580 380,959 679,959" fill="none" stroke="none" roi:id="panel4"/>
               </a>
               <a xlink:href="#5" target="_top">
                   <polygon points="198,580 377,580 375,959 196,957" fill="none" stroke="none" roi:id="panel5"/>
               </a>
               <a xlink:href="#6" target="_top">
                   <polygon points="190,959 192,580 38,580 38,959" fill="none" stroke="none" roi:id="panel6"/>
               </a>
           </svg>
```

NEED TO FINISH BY SHOWING WHAT IT GIVES IN NAVIGATION DOC

## Pros ##

  * Applicable to SVG content documents and also applicable to HTML content documents  (via image maps or embedded SVG)
  * Positions and dimensions of resources are relative to the size of displayed resources (or fragments)

## Cons ##
  * Not applicable to bare images as top-level publication resources.
  * Handling absolutely any SVG is arguably difficult.
    * Bill McCoy wrote:
> > ... it would seem good to  have some specific hypotheses or even better some data to back up the arguments.
  * SVG implementations are getting less sketchy, but are still not completely widespread -- for Android WebViews, Honeycomb+ is needed, which still leaves out about 60% of devices.
  * Can navigation and rendition mapping based on internal regions be implemented without requiring full SVG processors?
  * Is it easy for the RS to infer the correct geometry of a region, which might be a polygon that is defined inside a nested hierarchy of transforms (&lt;g> tags) ?
  * Only a single set of regions for a single publication resource.
  * How do we specify metadata?

# Option 3: Regions as Fragment Identifiers #
First, [Media Fragments](http://www.w3.org/TR/media-frags/) of W3C provides a
generic solution intended for all image/**, video/** and audio/**media types.  For example,**

```
  foo.jpeg#xywh=percent:25,25,50,50
```

indicates a 50%x50% region at x=25% and y=25%.



Second, SVG has its own definition of fragment identifiers.
For example,
```
    #svgView(viewBox(0,200,1000,1000)))
```

SVG fragment identifiers are functionally equivalent to view elements of SVG (aka embedded regions).

## Pros ##
  * Based on W3C recommendations
  * Very consistent with the Web


## Cons ##
  * Restricted to rectangular regions
  * Not applicable to fixed layout HTML?
  * No metadata

# Option 4: Both external and embedded regions #

Bill McCoy wrote:


> I think the worst standard is
> one that defines two different ways to do something because some
> people really want to to implement only way A and others to implement
> only way B, and instead of pushing to reach a real consensus about how
> to do it both A & B are defined, but then there end up two
> non-intopererable implementations. I'm not suggesting that's what's
> happening here but if the proposal is to do two different ways it
> would nice if it was clear that everyone is really expecting to
> implement both ways in reading systems.I think the worst standard is
> one that defines two different ways to do something because some
> people really want to to implement only way A and others to implement
> only way B, and instead of pushing to reach a real consensus about how
> to do it both A & B are defined, but then there end up two
> non-intopererable implementations. I'm not suggesting that's what's
> happening here but if the proposal is to do two different ways it
> would nice if it was clear that everyone is really expecting to
> implement both ways in reading systems.


Hadrien wrote:

> People happy to work strictly with SVG would like to adopt internal regions (identified in  the SVG), while the group who's also interested in working with fixed layout documents and multiple renditions would like to have external regions (described with a separate ROI map).
> At this point there's no real interoperability between those two because we've barely  defined the metadata associated to these regions, and how we can link to either an internal or external regions.