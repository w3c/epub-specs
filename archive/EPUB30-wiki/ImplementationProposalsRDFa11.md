# Note #

This proposal is now obsolete. Please see ImplementationProposalsMetadata for the current proposal.

# Overview #
This page contains implementation proposals for various subgroups, all proposals centered around the notion of using [RDFa 1.1](http://www.w3.org/TR/rdfa-core/) for expressing various kinds of metadata.

The core notion is that the RDFa attributes collection can be used in OPS, OPF and NCX (and perhaps even in OCF), thus providing a consistent metadata expression mechanism.



## Common properties ##
The proposals on this page all have the following general properties in common:

### Utilize an RDFa profile for the establishment of a set of well-known vocabularies ###
One of the simplification mechanisms added to RDFa 1.1 is the concept of [profiles](http://www.w3.org/TR/rdfa-core/#s_profiles). An RDFa 1.1 Profile is a machine- and human-readable document, external to the EPUB document itself (typically available online at some defined URI), that defines collections of terms and/or prefix mappings.

**The proposal is to in EPUB3 define _one canonical RDFa profile_** at a URI defined by the specification, that all EPUB3 publications must reference (implicitly or explicitly) and adhere to. Through this
  * we establish a limited set of vocabularies that are "well-known"; thereby increasing the chances that Reading Systems and Authoring Tools add support for the terms in these vocabularies
  * we reserve terms and prefixes globally, thus obviating the need for inline prefix declaration in many cases. (This includes defining which vocabulary is to be used without any prefix at all; the "default" vocabulary. The vocabulary can also define "terms" which is another method of achieving prefixlessness.) The canonical profile reduces the need for repetitive content in EPUBs, reduces risk for syntax errors, and simplifies processing in common XML APIs, allowing for example plain XPath expressions to be used when getting nodes.

In time (EPUB 3.1, 4.0 etc), this profile can be amended to. New vocabularies can be added, and included vocabularies can be deprecated (but for forwards compatibility purposes, the prefixes once assigned can never be reused for another vocabulary).

Note that since the profile is static (per each EPUB spec version), reading systems will not have to access it online; its contents can be absorbed at compile time.


Example: the canonical EPUB RDFa profile document living at some URI at idpf.org:

```
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head> 
    <title>EPUB RDFa profile: well-known vocabularies and prefixes</title> 
  </head> 
  <body xmlns:rdfa="http://www.w3.org/ns/rdfa#"> 
    <p typeof="">The default vocabulary is the EPUB core terms vocabulary located at <span property="rdfa:vocabulary">http://idpf.org/vocab/core/</span>.</p> 
    <p typeof="">The "<span property="rdfa:prefix">dcterms</span>" prefix must be used for the <span property="rdfa:uri">http://purl.org/dc/terms/</span>" vocabulary.</p> 
    <p typeof="">The "<span property="rdfa:prefix">prism</span>" prefix must be used for the <span property="rdfa:uri">http://example.org/prism/terms/</span>" vocabulary.</p>	
    <p typeof="">The "<span property="rdfa:prefix">cc</span>" prefix must be used for the <span property="rdfa:uri">http://creativecommons.org/ns#</span>" vocabulary.</p>	
  </body> 
</html>
```

_This provides a mechanism to address the Metadata group's requirements [R02](Metadata#META_R02_Potential_to_incorporate_metadata_using_a_variety_of_me.md), [R05](Metadata#META_R05_Enable_identification_and_inclusion_of_external_models.md), [R09](Metadata#META_R09:_Accommodate_PRISM_Metadata_for_Serials_Publications_an.md)_

### Allow vocabularies beyond those in the canonical profile as a means for extensibility ###

While the canonical profile defines the set of well-known vocabularies and the prefixes to use when using terms from these vocabularies, extensibility is also supported. **The proposal is to allow extending the terms allowed in OPS, OPF and NCX on an instance-by-instance basis by allowing prefix-vocabulary associations locally in the document**. (The attribute to use for this purpose is the RDFa [prefix](http://www.w3.org/TR/rdfa-core/#s_syntax) attribute.)

Note that it would be a document conformance constraint that prefixes declared locally can not be the same as prefixes declared in the canonical profile; prefixes defined in the profile document are reserved and fixed globally.

From a processing behavior standpoint, Reading Systems would be explicitly required to ignore terms they don't recognize ("behave as if the term wasn't there").

_This partially addresses the charter requirement [Insufficient mechanism for adding industry specific extensions](http://www.idpf.org/idpf_groups/IDPF-EPUB-WG-Charter-5-24-2010_Approved.html#pr_12) and Metadata [R02](Metadata#META_R02_Potential_to_incorporate_metadata_using_a_variety_of_me.md)_


### EPUB Reading Systems need not be fully conforming RDFa processors ###
**The proposal is to not make it an EPUB reading system conformance requirement to be a fully [conformant RDFa 1.1 processor](http://www.w3.org/TR/rdfa-core/#processorconf)**. Much like the use of RDFa in ODF, we make use only of a subset of the RDFa 1.1 functionality, and the day-to-day Reading System usage does not include RDF graph generation and all that stuff.

_Note: it may be beneficial to require the inverse: that documents be syntactically fully conformant to RDFa 1.1 so that RDFa 1.1 processors may be used to extract metadata. For OPS, all we need to achieve this is to require one occurence of the RDFa profile attribute; not much extra noise. However, in the case of OPF, if we end up keeping the legacy dc:title etc elements, then the output from a generic RDFa processor would not be complete anyway. So in terms of metadata harvesting, the benefits would be limited._


---


## RDFa 1.1 as inline metadata in OPS ##
**The proposal is to add a subset of the RDFa 1.1 Core attributes to the common attributes of the OPS document type.**

This correlates to the existing [XHTML+RDFa specification](http://www.w3.org/TR/rdfa-syntax/) and the ongoing work on [HTML5+RDFa](http://dev.w3.org/html5/rdfa). Note however that EPUB's canonical profile mechanism as per above diverges from these two specs.

_This addresses [Metadata R12](Metadata#META_R12_Inline_Medatata_(C).md) and [TextContent TG06](TextContent#TG.06_Inline_Metadata_(A).md)_

Examples: refer to http://www.w3.org/TR/rdfa-core/#examples


---


## RDFa 1.1 as extensible metadata in OPF ##
While OPF contains a number of metadata schemes that are hardcoded as elements, OPF also allows additional arbitrary metadata within the metadata element, or inside the deprecated x-metadata element.

**The proposal is to replace the current OPF meta element with a new meta element that takes a subset of the RDFa attributes collection.**

As per our design guidelines, 3.0 Reading Systems would still be required to support the old `<meta name content />` for backwards compatibility purposes.

> Example, simple metadata (_assuming that the `dcterms` and `prism` prefixes have been bound in the canonical profile document (see above)_).
```
  <meta property="dcterms:abstract" content="Foo and bar" />
  <meta property="prism:issueIdentifier" content="baz" />
```

> Example, how to use RDFa attributes to identify cover images using the RDFa `rel` attribute on the `item` element:

> (_The below assumes that the canonical profile has bound non-prefixed terms to a vocabulary that defines the "cover-image" term; we will likely want an "EPUB Core terms" vocabulary that defines stuff like this, see the profile document example above_)

```
 <manifest>
   <item id="img_cover" rel="cover-image" href="Cover.jpg" media-type="image/jpeg"/>
 </manifest>
```

... and if replacement text is needed:
```
 <metadata>
   <meta about="#img_cover" property="replacement-text" >Text optionally with inline markup</meta>
 </metadata>
```

Note how the addition of the RDFa `about` and `rel` attributes allows OPF to express metadata not only about the publication as a whole, but about external resources (`rel`) and fragments (`about`). The above solution is not customized particularly to cover images, but can applied to any current and future needs of similar kinds.

_The cover image example above addresses [Metadata R07](Metadata#META_R07_Cover_Image_(D).md)_


---


### Improved internationalization support ###
By moving from the classic HTML `<meta name content />` we achieve better support for i18n by letting the meta element optionally take content.

**The proposal is to let the new OPF meta element allow _either_ the content attribute, or child content, to allow i18n-related (dir, xml:lang?) attributes on the meta element, and to allow i18n-related XHTML markup (ruby, bdo, span?) in the content model of the meta element.**

> (The below examples assume that the `dcterms` prefix has been bound to http://purl.org/dc/terms/)

> Example:

```
<meta property="dcterms:abstract" content="Foo and bar" />
```

> and

```
 <meta property="dcterms:abstract">Foo and bar</meta>
```

> provide identical data.

> Example utilizing the i18n features:
```
     <meta property="dcterms:mediator" xml:lang="ja"> 
       <ruby>
  	  <rb>斎藤信男</rb>
  	   <rt>さいとうのぶお</rt>
	</ruby>
     </meta> 
```

_This addresses [Metadata R14](Metadata#META_R14_Internationalization_(A).md)_


---


## RDFa 1.1 in NCX ##
**The proposal is to add a subset of the RDFa attributes collection to the NCX navTarget, navPoint, navList and pageList elements**

Details TBD; this could also be done by adding an optional `metadata` element to to the above elements, and using a clone of "the new OPF meta element" inside it.

_This addresses [Navigation R4\_01](Navigation#NAV_R04_1_Describe_nature/semantic_of_the_destination_(E).md) and [Navigation R4\_02](Navigation#NAV_R04_2_Allow_distinguishing_links_along_other_axes_than_that.md)_



---


## RDFa 1.1 as value population mechanism for @role ##
**The proposal is to use the RDFa profile and extension mechanism also for the role attribute**

This means that values for the `role` attribute are populated in the same way as values for the RDFa `property`	 attribute etc. In the case of @role, the OPS schema **may** express restrictions on an element-by-element basis.

(See [TextContent TE.01](TextContent#TE.01_Allow_for_inflection_of_domain-specific_semantics_on_top_o.md).)


---


## Example of using RDFa with the existing OPF vocabulary ##

Following is an example of how we might use the RDFa methodology proposed above in conjunction with the existing OPF vocabulary with minor modifications. I've tried to provide an example of a minimalist real world OPF file to demonstrate how the various existing constructs would be presented in OPF 3.

An attempt has been made to preserve backwards compatibility so that an EPUB 2 reading system would be able to successfully at least minimally display the OPF 3 file.


**Following is the OPF 2 file that I started with:**

```
<!-- An OPF 2 file -->
<?xml version="1.0" encoding="UTF-8"?>
<package xmlns="http://www.idpf.org/2007/opf" unique-identifier="Package-ID" version="2.0">
  <metadata xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:opf="http://www.idpf.org/2007/opf">

    <dc:title>Through the Looking Glass</dc:title>
    <dc:identifier id="Package-ID" opf:scheme="ISBN">0393048470</dc:identifier>
    <dc:language>en</dc:language>
    <dc:creator opf:role="aut" opf:file-as="Carroll, Lewis">Lewis Carroll</dc:creator>
    <dc:subject>Fantasy</dc:subject>
    <dc:publisher>E-books Unlimited, Inc.</dc:publisher>
    <dc:date opf:event="copyright">2010</dc:date>
    <dc:date opf:event="publication">1893-09</dc:date>
    <meta name="x-ETI-undlinks" content="on"/>

  </metadata>

  <manifest>
    <item id="ID1234" href="images/ttlg_cover.png" media-type="image/png"/>
    <item id="ID1235" href="front.html" media-type="application/xhtml+xml"/>
    <item id="ID1236" href="chapter01.html" media-type="application/xhtml+xml"/>
    <item id="ID1237" href="chapter02.html" media-type="application/xhtml+xml"/>
    <item id="ID9999" href="toc.ncx" media-type="application/x-dtbncx+xml"/>
  </manifest>

  <spine toc="ID9999">
    <itemref idref="ID1235"/>
    <itemref idref="ID1236"/>
    <itemref idref="ID1237"/>
  </spine>

</package>
```

**This is a possible OPF 3 representing the same data:**

```
<!-- A possible OPF 3 version of the same file -->
<!-- This assumes the profile described above -->
<!-- This approach facilitates addressing META_R02 and META_R12 -->
<?xml version="1.0" encoding="UTF-8"?>
<package xmlns="http://www.idpf.org/2007/opf" unique-identifier="Package-ID" version="2.0">
  <metadata xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:opf="http://www.idpf.org/2007/opf"
            profile="http://www.idpf.org/2010/opf/profile"
            prefix="onix: http://http://www.editeur.org/onix/3.0/terms/">

    <!-- A document that wishes to provide both 2.0 and 3.0 support could use --> 
    <!-- the property attribute on the dc element. -->
    <dc:title property="dcterms:title">Through the Looking Glass</dc:title>
    <dc:identifier id="Package-ID" opf:scheme="ISBN">0393048470</dc:identifier>
    <dc:language>en</dc:language>

    <!-- Chaining can't be used to qualify items like the creator so -->
    <!-- instead we have to qualify the creator using the somewhat   -->
    <!-- cumbersome reference shown below. -->
    <meta id="creator" property="dcterms:creator" content="Lewis Carroll"/>
    <!-- role and file-as are assumed to be part of the default vocabulary  -->
    <!-- defined in the profile. The file-as property addresses requirement -->
    <!-- META_R04.                                                          -->
    <meta about="#creator" property="role" content="aut"/>
    <meta about="#creator" property="file-as" content="Carroll, Lewis"/>

    <!-- Data can be supplied either using the content attribute or as the element value -->
    <meta property="dcterms:subject" content="Fantasy"/>
    <!-- The ability to provide metadata as an element value enables -->
    <!-- internationalization where complex contructs like Ruby are  -->
    <!-- required. This addresses requirement META_R14.              -->
    <meta property="dcterms:publisher">E-books Unlimited, Inc.</meta>
    
    <!-- In some cases we could handle qualifiers by using more specific terms -->
    <meta property="dcterms:dateCopyrighted">2010</meta>

    <!-- This assumes that PublishingDate has been defined in the onix vocabulary -->
    <meta property="onix:PublishingDate">1893-09</meta>

    <!-- A proprietary property -->
    <meta name="x-ETI-undlinks" content="on"/>
    
  </metadata>

  <manifest>
    <!-- The following cover image-image relationship addresses requirement META_R07. -->
    <item id="ID1234" rel="cover-image" href="images/ttlg_cover.png" media-type="image/png"/>
    <item id="ID1235" href="front.html" media-type="application/xhtml+xml"/>
    <item id="ID1236" href="chapter01.html" media-type="application/xhtml+xml"/>
    <item id="ID1237" href="chapter02.html" media-type="application/xhtml+xml"/>
    <item id="ID9999" href="toc.ncx" media-type="application/x-dtbncx+xml"/>
  </manifest>

  <spine toc="ID9999">
    <itemref idref="ID1235"/>
    <itemref idref="ID1236"/>
    <itemref idref="ID1237"/>
  </spine>

</package>
```

**The above example illuminates a number of issues that we should consider:**

  1. What is the best way to handle backwards compatibility? Is it okay that EPUB 2 reading systems will not have access to the full rich data that EPUB 3 reading systems encode or should we require all metadata items supported by EPUB 2 to be encoded in EPUB 2 format?
  1. Should we use OPF as the base vocabulary or should we switch to XHTML to provide a better human readable form?
  1. Would it be better to use an element other than meta now that we are allowing the element value to be used? Does using the existing meta element in new ways destroy on enhance compatibility?
  1. What version should we use for the package file? Would going to 3.0 cause 2.0 processors to fail?

## RDFa in XHTML ##

This examples was provided by Jonathon Goodwin, who also has produced a document [1](1.md) that provides additional information pertaining to this example, as well as thoughtful perspective on metadata in 3.0.

[1](1.md) https://docs.google.com/document/edit?id=1zZ_2vUb08ed-JsSZyBIHqjnM6-HcMmCkCGNPbRNLxSE&hl=en

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<!-- Namespace prefix definitions (later referenced by RDFa properties) -->
<html xmlns="http://www.w3.org/1999/xhtml"
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:epub="http://www.idpf.org/epub/terms/">
<head>
<meta http-equiv="Content-Type" content="application/xhtml+xml charset=utf-8"/>
<link rel="stylesheet" href="template.css" type="text/css"/>
<title>Through the Looking Glass</title>
</head>

<body>

<!-- Info about this e-book: 
  - @about uniquely identifies what thing we are providing metadata about to rdfa.
  - @typeof specifies the epub-defined class for what type of Work this is
  -->
<div about="#ttlg" typeof="epub:Book">
  <!-- RDFa uses @property when the value is the rendered text -->
  <!-- The @class attributes reference CSS styles so this page will render attractively -->
  <h1><span class="book-title" property="dcterms:title">Through the Looking-Glass</span>, 
  <span class="book-subtitle" property="epub:subtitle">and What Alice Found There</span></h1>
  <!-- This identifier entry uses a fictitious @href address, demonstrating how an authority 
  like ISBN can create a unique URI for each book registered and numbered by them.
  Multiple URI identifiers can be listed, such as ASIN, iTunes id, etc.  -->
  <!-- RDFa uses @rel rather than @property when the metadata value is given by @href -->
  <p class="book-id" rel="dcterms:identifier" href="http://isbn.org/isbn10/0393048470">
    ISBN-10: 0393048470
  (<span property="dcterms:format" content="application/epub+zip">EPUB</span>)
  </p>
  <!-- Use of @content ensures this metadata element is not rendered -->
  <!-- Also, dcterms references ISO-603-3 3-letter values, where "eng" replaces "en" -->
  <span property="dcterms:language" content="eng" />
  <!-- Here we define the book is part of a series, described later below -->
  <span rel="dcterms:isPartOf" href="#aliceseries"/>
  <!-- For creators, we refer to separately defined metadata for people below -->
  <p>by <a class="book-creator" rel="epub:author" href="#carroll">Lewis Carroll</a></p>
  <p>illustrated by <a class="book-creator" rel="epub:illustrator" href="#tenniel">John Tenniel</a></p>
  <!-- This structure is needed to correctly reference images in RDFa -->
  <span rel="epub:coverImg" href="images/ttlg_cover.png">
    <img class="cover-img" src="images/ttlg_cover.png" alt="TTLG Book Cover" />
  </span>
  <!-- Using <span>s, key information in this paragraph can be marked up with links or metadata,
  such as the dates, titles, names of characters, as is shown for the Jabberwocky poem.
  The referenced chapter file would embed metadata about the Jabberwocky poem, such as:
     <div about "#jabberwocky" typeof="epub:Poem">
  <span rel="dcterms:isPartOf" href="#ttlg-01"/>
  <span rel="dcterms:description" href="http://en.wikipedia.org/wiki/Jabberwocky"/>
  <span property="dcterms:title">Jabberwocky</span> -->
  <p property="dcterms:description">
    This 1871 sequel to Alice's Adventures in Wonderland (1865) 
continues the story of young Alice 
as she progresses through the chess-flavored land
she discovers on the other side of a living room mirror. Along the way, she encounters
many bizarre, but memorable, characters, such as the Red and White Queens (and Kings), 
Humpty Dumpty, Tweedledum and TweedleDee, and the White Knight. She is also subjected
    to strange poetry (most notably 
<a href="ttlg-01.xhtml#jabberwocky">Jabberwocky</a>). </p>
  <!-- an example of using the library of congress subject heading for Fantasy -->
  <span rel="dcterms:subject" href="http://purl.org/dc/terms/LCSH/#sj2001010209">Fantasy</span>
 
  <p>Chapters:</p>
  <!-- RDFa chaining ensures this relationship applies to all chapters found in the list -->
  <ul rel="dcterm:hasPart">
  <!-- Additional metadata specifying the title/subtitle of the chapter can be provided here
    (using span) or else found embedded in the ttlg-01 html file -->
  <li>I. <a class="chap-title" typeof="epub:Chapter" href="ttlg-01.xhtml">Looking-Glass House</a></li>
  <li>etc.</li>
  </ul>
  
  <p>To learn more, visit:</p>
  <!-- description may be too vague a term for a web site/page describing this book ... -->
  <ul rel="dcterms:description">
    <li><a href="http://en.wikipedia.org/wiki/Through_the_Looking-Glass">
  Through the Looking-Glass (Wikipedia)</a></li>
    <li><a href="http://www.alice-in-wonderland.net">
  Lenny's Alice in Wonderland site</a></li>
  </ul>
  
  <p property="dcterms:rights">
    &copy;<span property="dcterms:dateCopyrighted">2010</span> 
<span rel="dcterms:publisher" href="www.ebooksunlimited.com">E-books Unlimited, Inc.</span>
All Rights Reserved.
  </p>
</div>

<!-- This entry defines the Alice in Wonderland series (it will not render on the page) -->
<div about="#aliceseries" typeof="epub:Series">
  <!-- Using content means RDFa sees the title, but it is not rendered to a human reader -->
  <span property="dcterms:title" content="Alice in Wonderland (series)"/>
  <!-- The order matters for listed parts -->
  <span rel="dcterms:hasPart" href="#aaiw"/>
  <span rel="dcterms:hasPart" href="#ttlg"/>
  <!-- specify other properties of the series here -->
</div>

<div about="#aaiw" typeof="epub:Book">
  <span property="dcterms:title" content="Alice's Adventures in Wonderland"/>
  <!-- etc. -->
</div>

<!-- Info about Lewis Carroll. Could be in a separate file, if desired, or even
  could reference the person's official web site where the metadata resides -->
<div about="#carroll" typeof="foaf:Person">
  <h2 class="name" property="foaf:name">Lewis Carroll</h2>
  <span property="epub:fileAs" content="Carroll, Lewis"/>
  <!-- a nice old-time photograph of the author -->
  <span rel="foaf:img" href="images/carroll.jpg">
    <img src="images/carroll.jpg" alt="Picture of Lewis Carroll"/>
  </span>
  <!-- Charles probably would have enjoyed blogging .... -->
  <p>His blog: <a rel="foaf:weblog" href="http://www.blogcentral.com/CharlesDodgson/">
     Curiosities Of A Polymath</a></p>
  <p>Lewis was first inspired to created his Alice stories while boating with 
    <a rel="foaf:knows" href="#alice">Alice Liddell</a> and her sisters.</p>
  
  <!-- Instead of just text, these entries could be links enabling the reader 
  to acquire these books within the same ecosystem this ebook is offered by -->
  <p>Works:</p>
  <ul>
  <li><span rel="foaf:made" href="#aliceseries">Alice in Wonderland (series)</span>
    <ul>
<li><span rel="foaf:made" href="#aaiw">Alice's Adventures in Wonderland</span></li>
<li><span rel="foaf:made" href="#ttlg">Through the Looking-Glass</span></li>
</ul>
  </li>
  <li>The Hunting of the Snark</li>
  <li>etc.</li>
  </ul>
  
  <p>Fansites:</p>
  <ul>
  <li><a rel="foaf:homepage" href="http://en.wikipedia.org/wiki/Lewis_Carroll">Lewis Carroll (Wikipedia)</a></li>
  <li>etc.</li>
  </ul>
  
  <p>You can follow Mr. Carroll on 
      <span rel="foaf:holdsAccount">
        <span typeof="foaf:OnlineAccount">
          <a rel="foaf:accountServiceHomepage" href="http://twitter.com/">Twitter</a>
          @<span property="foaf:accountName">lewiscarroll</span>
        </span>
      </span>
  </p>
</div>

<!-- Info about John Tenniel, the illustrator -->
<div about="#tenniel" typeof="foaf:Person">
  <h2 class="name">
    <span property="foaf:title">Sir</span>
    <span property="foaf:name">John Tenniel</span>
  </h2>
  <!-- etc. -->
</div>

<!-- Why not also provide info about Alice Liddell too? -->
<div about="#alice" typeof="foaf:Person">
  <h2 class="name" property="foaf:name">Alice Pleasance Liddell</h2>
  <!-- etc. -->
</div>
</body>
</html>
```

## Telcon 10-12 Dicsussion Notes ##

  1. RDFa 1.1 will be legal in OPF/OPS allowed files, both package and chapter level
    1. OPF itself, metadata.xml, xhtml/html content - NCX if needed?
  1. Package-descriptive metadata stays in the OPF file, or extended into metadata.xml, to maintain compatibility
    1. For minimal required set, keep DC Elements as in 2.0 and extend with properties
    1. Recommend dc:terms for anything beyond minimal required, extend with same properties
    1. Require dc:terms for any new functional metadata, e.g. annotations, EGLS
    1. For some properties, recommend values derived from source such as ONIX, MARC, LoC, etc.
    1. Do not embed external vocab `<elements/>` or whole/partial records into OPF, use only as the above mentioned values.
  1. Content-descriptive metadata goes where appropriate in content files, more-or-less as used for web
    1. Could be any RDFa 1.1 vocab, FOAF, PRISM, dc:terms etc.
    1. no guarantee UA will understand it
  1. PRISM is a unique case, and I'm not up on the specifics. I think we need Dianne Kennedy to fill in any gaps we have, or provide some examples, or just re-assure us that a generic allowance for RDFa 1.1 will meet the inline PRISM needs. To put it another way, do we need to spec PRISM usage in any way?
  1. Profiles: Since we intend to define our properties in profiles that can ship, how do we scope what is profiled?
    1. just 'invented here'
    1. a + some subset of publication-centric vocabs, e.g. PRISM
    1. a + b + any number of _common_ vocabs, e.g. FOAF, Good Relations -_I think this is impractical, but there for consideration_