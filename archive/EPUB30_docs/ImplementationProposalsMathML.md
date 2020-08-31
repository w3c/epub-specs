# MathML in EPUB #

EPUB adopts all of MathML 3 with the restrictions listed below. These restrictions limit the MathML to presentation MathML except inside of a semantics element. They also provide guidelines on how fall back images and alternative text should be given. Because this proposal restricts MathML, all XHTML 5 MathML renderers should be able to render MathML as specified by OPS.

Implementation Note: browser implementations of MathML exist for Firefox, IE, WebKit (still immature, but actively being developed), Opera (via CSS, a restricted subset of MathML). In addition, there exists an open source JavaScript implementation, so any JavaScript capable reading system can also implement MathML.

## Summary ##
  1. Support for MathML is a required by OPS reading systems
  1. [Content MathML](#Content_MathML.md) SHALL only allowed inside of `semantics`/`annotation-xml`
  1. [Legal `annotation` and `annotation-xml`](#Legal_Annotation_Types.md) attributes and content are restricted in the following ways:
    1. The value for the content dictionary (`cd`) SHALL be [`"mathmlkeys"`](http://www.openmath.org/cd/mathmlkeys.xhtml)
    1. The values for `name` SHALL be `"alternate-representation"` or `"contentequiv"`
    1. The values for `encoding` for `annotation-xml` SHOULD be `"MathML-Content"`/`"application/mathml-content+xml"` or `"application/xhtml+xml"` (OPS/XHTML)
    1. When OPS content is specified, the content SHALL be valid OPS content and have the same flow model (block or inline) as the parent MathML
    1. The OPS content SHALL NOT contain MathML
  1. [Fallback images](#Fallback_Images.md) SHOULD be provided on the `math` element or on `annotation`. Preference order for fallback is:
    1. `annotation` -- when an image type is provided, the image type SHALL be one of the core image content types of OPF
    1. `math` (`altimg`)
  1. [Alternative text](#Alternative_Text.md) SHOULD be provided on either the `math` element or in `annotation-xml`. Preference order for fallback is:
    1. `annotation-xml`
    1. `math` (`alttext`)
  1. [Deprecated elements and attributes](#Use_of_Deprecated_Features.md) SHALL NOT be used



## Content MathML ##
All content MathML elements SHALL be inside of an `annotation-xml` element.  The  `annotation-xml` element SHALL be the second child of a `semantics` element whose first child is presentation MathML.  The `annotation-xml` element SHALL set the `encoding` attribute to `"MathML-Content"` or to `"application/mathml-content+xml"`. These two values are equivalent. The value of the `name` attribute SHALL be `"contentequiv"`.


As an example, the user of content markup will look like:
```
<math>
  <semantics>
    ... presentation markup ...
    <annotation-xml name="contentequiv" encoding="application/mathml-content+xml">
      ... content markup ...
    </annotation-xml>
  </semantics>
</math>
```

### Rationale ###
Content MathML is discussed in Chapter 4 of the MathML Specification. It provides a means of specifying the semantics of the expression without saying how those semantics should be displayed.  MathML envisioned that an XSL style sheet that transforms the content MathML into presentation MathML would accompany so that it could be rendered as intended.  An alternative method allowed in MathML is called parallel markup where both the presentation and content markup are given inside of a semantics element. Because XSL is not a part of EPUB, parallel markup should be used when content MathML is used.

MathML allows either presentation or content MathML to occur as the first element of a semantics element. To ease the burden on reading systems, this specification requires that the first child of a semantics element be presentation MathML and the second be an `annotation-xml` element containing content MathML when content MathML is used inside of a semantics element.


## Legal Annotation Types ##

The `annotation-xml` element in MathML allows arbitrary XML markup to be included into MathML. Legal content allowed in the `annotation-xml` element in EPUB SHALL be:
  * content MathML (this is discussed above)
  * other legal EPUB elements

The `annotation-xml` and `annotation` elements have a number of defined attributes. EPUB restricts these to the following values:
  1. `cd` SHALL be
    1. `"http://www.openmath.org/cd/mathmlkeys.xhtml"` (default value, so its value MAY be omitted)
  1. `name` SHALL be either
    1. `"alternate-representation"` (default value, so its value MAY be omitted)
    1. `"contentequiv"`
  1. The value of the `encoding` attribute for `annotation-xml` SHOULD be
    1. `"MathML-Content"` or its equivalent `"application/mathml-content+xml"`
    1. `"application/xhtml+xml"` for OPS/XHTML content
  1. The value of the `encoding` for `annotation` attribute MAY be any legal OPS encoding value


When OPS content is specified by the `encoding` value of `annotation-xml`, the content SHALL be valid OPS content and have the same flow model (block or inline) as the parent MathML.  The OPS content SHALL NOT contain MathML. Other encodings for `annotation-xml` MAY be given.

_Issue:  perhaps a special value for OPS content instead of `"application/xhtml+xml"` should be used so that it is clear what is intended._

Additional `annotation` and `annotation-xml` elements MAY be used subject to the restrictions mentioned below, but Reading Systems are free to ignore them unless otherwise indicated.

_Issue: it would probably be easier for a validator if we flat out prohibit other values, but that might prevent passing info around that could (for example) help plotting of the expression by providing domain and ranges for the plot_

### Rationale ###
The restrictions on `cd` and `name` effectively allow Reading Systems to avoid having to know anything about what their values means except for validation. Similarly, Reading Systems are required to only know about two encodings:  content MathML and OPS/XHTML.  They may ignore other encodings.

Because an alternative representation may be used in place of the MathML, the flow model of that alternative representation should match the flow model of the containing MathML. This is the reason for the matching flow-model rule.


## Fallback Images ##

_Issue:  should this be a "should" or "shall"?  If reading systems are based on a browser or support Javascript, then supporting MathML should not be an issue and "should" or even "may" might be appropriate._


MathML content SHOULD contain an alternative image representation. The image SHALL be given using either the `altimg` attribute of the `math` element or the `annotation` element.
The image content type SHALL be one of the types allowed for the OPS img element.  If `annotation` is used, the enclosing `semantics` element SHALL be the direct child of the `math` element.

OPS defines three new attributes for the `annotation` element to specify additional properties for the image:  'width', 'height', and 'valign'.  These have identical meanings to the corresponding attributes of the `math` element ('altimg-width', 'altimg-height', and 'altimg-valign').

The `altimg-width`/`width` and `altimg-height`/`height` attributes SHOULD also be given to specify a size for the image. For inline math content, the vertical alignment of the image SHOULD be given via the `altimg-valign`/`valign` attribute so that the baseline of the image aligns with the baseline of the text.

If a Reading System is not capable of displaying MathML, then the Reading System SHALL use an image for displaying the math if an image is provided.
In this case, when both versions are present, `annotation` SHALL be used by a Reading System. If multiple `annotation` elements are present, the Reading System MAY choose which ever `annotation` element it feels is most appropriate. Such as decision MAY be based on size, foreground/background color, etc.

An example of including an image fallback is:

```
<math display="inline" altimg="images/image034.png" altimg-valign="-0.2ex">
  <semantics>
     ... presentation mathml ...
     <annotation encoding="image/png" src="images/image034.png"/>
     <annotation encoding="image/png" src="hires-images/image034.png"
                 ops:width="7.1em" ops:height="7.3ex" ops:valign="-0.2ex"/>
  </semantics>
</math>
```

### Rationale ###
Some reading systems may not be able to render MathML. Providing a fall back image along with size and alignment information allows them to include a reasonable, but inferior, fallback.
Images are inferior to native renderings because they do not resize to match the text nor do they change to match foreground and background colors.  This results in an inferior reading experience. Both of these capabilities are important issues for accessibility.

Allowing image types on the `annotation` element allows for multiple images to be provided. This might be used for images that vary by their size/resolution. Multiple images might also be provided with differing foreground and backgrounds to match common themes used by Reading Systems.


## Alternative Text ##

An alternative textual description for math expressions SHALL be provided in the `math` element.  A simple textual description MAY be given using the `alttext` attribute of the `math` element.  Alternatively, richer descriptions MAY be given using the `annotation-xml` element as described below.  When both versions are present, the `annotation-xml` SHALL be used by a Reading System. If multiple `annotation-xml` elements are present, the Reading System MAY choose which ever `annotation-xml` element it feels is most appropriate.

_Issue:  how do we indicate that a particular `annotation-xml` element is alt text?_

If `annotation-xml` is used
  * the enclosing `semantics` element SHALL be the direct child of the `math` element
  * the `name` and `encoding` attributes SHALL be `"alternate-representation"` (default value) and `"application/xhtml+xml"` respectively

If a reading system is not capable of generating speech from MathML, it SHALL use alt text if it is provided. If there are multiple `annotation-xml` elements that specify alt text, a reading system MAY choose whichever alt text it feels is most appropriate.

Example (_`annotation-xml` is used by a Reading System_)

_Issue: this example would be better if the annotation made use of CSS to add pauses and a forced pronunciation of 'a' (long 'a' sound).  Should this be done as `<span style="..."> ... </span>`?_

```
<math display="block" alttext="fraction a plus 1 divided by 2 end fraction">
   <semantics>
     <mfrac> ... </mfrac>
     <annotation-xml encoding="application/xhtml+xml">
       <p xmlns="http://www.w3.org/1999/xhtml">fraction a plus 1 divided by 2 end fraction</p>
     </annotation-xml>
   </semantics>
</math>
```

### Rationale ###
MathML was designed so that the math is very accessible.  It can be converted to speech or braille (for a refreshable braille display) and that speech can be highlighted as it is spoken. However, not all conforming reading systems are able to make the math accessible. Hence, for accessibility, it is important to provide a fall back textual description of the math expression.

People with different disabilities have different needs for alternative text. Some text may be targeted at people who are blind, others at people with learning disabilities, and others as simply an audio rendition for when a visual display is not present. Reading systems may allow users to specify their preferences and a reading system that generates speech from MathML can generate speech targeted at a user's need.  Multiple alternative text representations can be given to target different user's needs, but providing a system of specifying who the speech is targeted at is left to another version of the spec.

## Use of Deprecated Features ##

No deprecated elements or attributes in MathML 3 SHALL be used in an EPUB document.

_Issue:  MathML 3 no longer uses XML:id and xlink:href as these have fallen out of favor.  I think that these were used in the DAISY part of OPS -- need to check_