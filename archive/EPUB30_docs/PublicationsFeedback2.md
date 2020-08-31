## 4.4.8 The manifest Element, EPUB3 Publications ##

<blockquote>
The manifest element provides an exhaustive list of the Publication Resources that constitute the EPUB Publication, each represented by an item element.<br>
<br>
First, make clear that the package document is not included in the exhaustive list.<br>
<br>
Second, are resources (jpg, png, video, audio ,etc.) referenced from HTML5 or SVG required to be included?<br>
<br>
Third, consider foreign resources declared in the manifest and referenced from the spine.  Such foreign resources may reference some other resources.  Are there any reasons to enumerate all these resources in the manifest?<br>
</blockquote>

| GARTH: To my read "yes," the manifest must be complete.  I assume by "foreign resource" you mean a non-core media type that has a package level fallback?  If so, and it references an image (for example), that image must also be included in the manifest.  It must be possible to build a complete EPUB/OCF by including everything in the `<manifest>`. |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|


## 4.4.11 The itemref element ##

<blockquote>
Suppose that an itemref element references a JPEG file that is never referenced by the spine, HTML content documents, SVG content documents or any other publication resources.  It this itemref a syntax error?<br>
</blockquote>

| GARTH: I don't see why.  Some Reading Systems (e.g. iBooks) complain about un-manifested items being in the OCF, but I don't see any requirement that everything in the `<manifest>` (and OCF) is really used. |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| KEITH: I don't think iBooks as a **Reading System** cares about this one bit. Additionally, I don't know of a single **Reading System** that has any known problems with this condition, but I may be mistaken. Does anyone have specific counter-examples? Note: Apple does pose some restrictions on content they think is unfit/too risky to accept into their **iBookstore**, but I don't necessarily think those restrictions carry much weight for the EPUB **3** Working Group without being explicitly raised by Apple. |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| GARTH: Clearly not a big deal, and not the target of Murata's remark. But, I think of iBooks as an RS -- from content ingest to device presentation (in the broadest sense).  Regardless, ePubcheck was updated recently to at least warn about un-manifested items in the OCF to aid folks submitting content to Apple. Murata's comment/question was about an itemref referencing an item that **is** in the manifest, but not used by the publication.  I don't see anything technically wrong with that. |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| MARKUS: In addition, note that it is not possible (or at least very complicated) in a static context such as that of epubcheck to determine whether an itemreffed resource is not being used:  dom manipulation. |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| LIZA: I'm confused by the original statement: Suppose that an itemref element references a JPEG file that is never referenced by the spine. Murata, did you mean `<item>` here?  An `<itemref>` element is a `<spine>` child. The EPUB 2.01 language implies that a content document that is in the manifest must also be in the spine: "All OPS Content Documents that are part of the publication (i.e. are listed in the manifest) which are potentially reachable by any reference mechanism allowed in this specification must be included in the spine." http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.4 But I agree that an `<item>` in the manifest that it is in the package but not referenced anywhere is not an error, though it might be a useful warning that the package has a potentially-useless resource (as the unmanifested warning is). |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| MARKUS: FYI, The EPUB3 draft does not say this. It defines the term "top-level content document" for documents that are listed in the spine, and uses the term XHTML Content Document for any document that complies to the constraints of that document type, including child documents such as those referenced from an iframe (which do not appear in spine as they are not the "next" in the logical reading order). I must be misreading the quote you reference from 2.0.1 because it makes no sense to me at the moment (think: iframes and other parent-child relationships between XHTML documents). If we are missing something in the EPUB3 draft here however, do let me know. |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| LIZA: Not at all, I don't think the OPF 2.01 constraint listed here provided any benefit.  It's also not recognized by epubcheck.  I just wanted to point out that this might be the source of confusion around how tightly-coupled the manifest and spine were in EPUB 2. (Iframes weren't allowed in OPS 2.01, so it probably made some sense at the time.) |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| LEE: On this broader question, and completely off the top of my head, the OCF spec allows a metadata file which contains metadata specific to the container and not the encapsulated publication. Different TPM schemes may require additional files to implement them; these files are specific to the container and not the publication. It seems to me that it is expected that in some cases there may be files in the container that not only are not listed in the publication manifest but should /not/ be manifested, as they are only relevant to the container and not the publication. An epubcheck warning is appropriate to identify /possible/ extraneous files, but it is not definitive. |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

<blockquote>
Suppose that an itemref element references an external metadata file. Is this itemref a syntax error?<br>
</blockquote>


| GARTH: Unclear what is meant by "external" -- seems okay to have a "strange" metadata file included and referenced by the `<manifest>` -- though, likely ignored by Reading Systems. |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

<blockquote>
Drop @linear, since it may be in conflict with the navigation element.<br>
</blockquote>

| GARTH: That would be an incompatibility with EPUB 2.0.1 -- this attribute is pretty widely used now.  Possibly could discuss deprecation, but seems late in the game. |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| MARKUS:  for now re @linear. See also: http://code.google.com/p/epub-revision/issues/detail?id=78 |
|:--------------------------------------------------------------------------------------------------|


## 6.2.3 Intrinsic fallback ##

<blockquote>
The whole point of EPUB is the synergy between the web world and the e-book world.  We can use conformant HTML or SVG user agents as<br>
building blocks of EPUB reading systems.  We can use HTML or SVG<br>
editors for EPUB authoring.  We can repurpose HTML web pages and SVG<br>
images as EPUB publications.<br>
<br>
To ensure this synergy, we should not require that elements in an<br>
HTML document be handled differently when the HTML document appears<br>
as part of an EPUB publication.  In particular, we should not allow<br>
the use of manifest-level fallback for HTML elements.<br>
</blockquote>


| GARTH: See (just) below. |
|:-------------------------|

<blockquote>
This section defines a set of exceptions to the general requirements<br>
for manifest-level fallbacks for Foreign Resources. If none of these<br>
exceptions apply to a given Foreign Resource reference, then the<br>
manifest fallback mechanism must be used to supply a Core Media Type<br>
Resource fallback.<br>
<br>
Instead, I propose:<br>
<br>
<blockquote>The manifest fallback mechanism must not be used for elements within<br>
HTML or SVG content documents.  Fallbacks specified in HTML5 and SVG 1.1<br>
are applicable to such elements.<br>
</blockquote></blockquote>

| GARTH: I don't think I agree here.  If an <img> references a image of type "image/x-foozle" the fallback chain should be followed, the alt text being viable if there is no such Package fallback.  Changing this would be a substantive change from 2.0.1 and would need discussion and consensus. </tbody></table>


<h2>6.2.3.1 XHTML Content Documents ##

<blockquote>
object<br>
<br>
<blockquote>For Foreign Resources referenced via HTML5 object elements, Core Media<br>
Type fallback(s) must be provided via that element’s intrinsic<br>
replacement capabilities.</blockquote>

The intention of this sentence is not at all clear.  Which element or attribute specifies which resource as a core media type fallback?  Can object elements resource reference what is not declared in the manifest?<br>
</blockquote>

| GARTH: "No" to the last question.  The `<manifest>` must be complete (with the documented exceptions of streamed video and audio). |
|:-----------------------------------------------------------------------------------------------------------------------------------|

<blockquote>
Furthermore, this constraint should be explicitly specified<br>
in the EPUB3 content document spec rather than in this spec.  Make<br>
this paragraph non-normative and add a reference to that part of the<br>
EPUB3 content document spec.<br>
<br>
<blockquote>Reading Systems must ignore manifest-level fallbacks in resolving<br>
such references. (Note that the bindings element provides a type of<br>
fallback mechanism, but does not ensure that content can be rendered<br>
on all Reading Systems regardless of scripting support).</blockquote>

img<br>
<br>
First, I do not think that this bullet is needed.  Always disallow manifest-level fallback for elements within HTML and SVG and stop there.<br>
</blockquote>


| GARTH: See above. |
|:------------------|

<blockquote>
<blockquote>For Foreign Resources referenced via HTML5 img elements, the text<br>
value of the alt and title attributes provides a legitimate fallback<br>
and should be included.</blockquote>

Is this sentence really required here?  Isn't this advice already described in the HTML5 spec?<br>
<br>
<blockquote>Additional manifest-level fallbacks may be provided.</blockquote>

Delete "Additional manifest-level fallbacks may be provided."<br>
<br>
<blockquote>Reading Systems should process manifest-level fallbacks in resolving<br>
such references.</blockquote>

Replace this para by<br>
<br>
"Reading Systems must ignore manifest-level fallbacks for resolving such references"<br>
</blockquote>

| GARTH: See above. |
|:------------------|

## 6.2.3.2 CSS Style Sheets ##

<blockquote>
Embedded Fonts<br>
<br>
<blockquote>For fonts embedded in Content Documents or EPUB Style Sheets using<br>
the @font-face mechanism, the rules of CSS (CSS3Fonts) must be used<br>
to provide a fallback in case a non-core media type font format is<br>
used. Such fallback must be a Core Media Type embedded font or<br>
generic font reference.</blockquote>

The intention of the para is not clear.  Does this para try to<br>
change the behaviour of CSS font fallback?  If so, don't.<br>
</blockquote>


| GARTH: It does not.  It says that the standard CSS mechanism provides valid fallbacks for fonts. |
|:-------------------------------------------------------------------------------------------------|

<blockquote>
Or, does it<br>
impose an additional restriction on CSS stylesheets?  If so, clearly<br>
specify that restriction in the EPUB3 content document spec.<br>
Specifically, make clear what is required to be specified within CSS<br>
stylesheets.  In this spec, make this para non-normative, and<br>
introduce a reference to that part of the EPUB3 content document spec.<br>
</blockquote>