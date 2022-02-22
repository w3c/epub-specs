# EPUB 3.3 Metadata Usage Report

## Candidate Recommendation Exit Criteria

The EPUB Working Group intends to exit the Candidate Recommendation stage and submit
the [EPUB 3.3](https://w3c.github.io/epub-specs/epub33/core/) specification for consideration
as a W3C Proposed Recommendation after documenting implementation of each feature.

For this specification to advance to Proposed Recommendation, it has to be
proven that metadata defined and required in this specification have sufficient usage by the
target communities. This metadata falls into two categories:

1. metadata for expressing information about the publication in the package document; and
2. metadata for expressing preferred rendering of the content

Usage of these properties means that they are regularly included in the Package Document
metadata for their EPUB Publications (as appropriate for each title).

## Publisher Implementations

### Meta Properties Vocabulary

The following table lists publishers who have stated that they are currently using
the [meta properties](https://w3c.github.io/epub-specs/epub33/core/#app-meta-property-vocab)
in production.

Manifest properties are expressed in the
[`meta` element's `property` attribute](https://w3c.github.io/epub-specs/epub33/core/#attrdef-meta-property).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>[alternate-script](https://w3c.github.io/epub-specs/epub33/core/#sec-alternate-script)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[authority](https://w3c.github.io/epub-specs/epub33/core/#sec-authority)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[belongs-to-collection](https://w3c.github.io/epub-specs/epub33/core/#sec-belongs-to-collection)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[collection-type](https://w3c.github.io/epub-specs/epub33/core/#sec-collection-type)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[display-seq](https://w3c.github.io/epub-specs/epub33/core/#sec-display-seq)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[file-as](https://w3c.github.io/epub-specs/epub33/core/#sec-file-as)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[group-position](https://w3c.github.io/epub-specs/epub33/core/#sec-group-position)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[identifier-type](https://w3c.github.io/epub-specs/epub33/core/#sec-identifier-type)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[<s>meta-auth</s>](https://w3c.github.io/epub-specs/epub33/core/#sec-meta-auth)</td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB Publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td>[role](https://w3c.github.io/epub-specs/epub33/core/#sec-role)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[source-of](https://w3c.github.io/epub-specs/epub33/core/#sec-source-of)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[term](https://w3c.github.io/epub-specs/epub33/core/#sec-term)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[title-type](https://w3c.github.io/epub-specs/epub33/core/#sec-title-type)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

### Link Vocabulary
#### Link Relationships

The following table lists publishers who have stated that they are currently using
the [link relationships](https://w3c.github.io/epub-specs/epub33/core/#sec-link-rel)
in production.

Link relationships are expressed in the
[`link` element's `rel` attribute](https://w3c.github.io/epub-specs/epub33/core/#attrdef-link-rel).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>[acquire](https://w3c.github.io/epub-specs/epub33/core/#sec-acquire)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[alternate](https://w3c.github.io/epub-specs/epub33/core/#sec-alternate)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[<s>marc21xml-record</s>](https://w3c.github.io/epub-specs/epub33/core/#sec-marc21xml-record)</td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB Publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td>[<s>mods-record</s>](https://w3c.github.io/epub-specs/epub33/core/#sec-mods-record)</td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB Publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td>[<s>onix-record</s>](https://w3c.github.io/epub-specs/epub33/core/#sec-onix-record)</td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB Publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td>[record](https://w3c.github.io/epub-specs/epub33/core/#sec-record)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[voicing](https://w3c.github.io/epub-specs/epub33/core/#sec-voicing)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[<s>xml-signature</s>](https://w3c.github.io/epub-specs/epub33/core/#sec-xml-signature)</td>
            <td>
            	<p>This property deprecated and is no longer recommended for use in EPUB Publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td>[<s>xmp-record</s>](https://w3c.github.io/epub-specs/epub33/core/#sec-xmp-record)</td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB Publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
    </tbody>
</table>

#### Link Properties

The following table lists publishers who have stated that they are currently using
the [link properties](https://w3c.github.io/epub-specs/epub33/core/#sec-link-properties)
in production.

Link properties are expressed in the
[`link` element's `properties` attribute](https://w3c.github.io/epub-specs/epub33/core/#attrdef-properties).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>[onix](https://w3c.github.io/epub-specs/epub33/core/#sec-onix)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[xmp](https://w3c.github.io/epub-specs/epub33/core/#sec-xmp)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

### Package Rendering Vocabulary
#### General Properties

The following table lists publishers who have stated that they are currently using
the [general package rendering properties](https://w3c.github.io/epub-specs/epub33/core/#sec-rendering-general)
in production.

General package rendering properties are expressed both globally in the
[`meta` element's `property` attribute](https://w3c.github.io/epub-specs/epub33/core/#attrdef-meta-property)
and as overrides in the
[`itemref` element's `properties` attribute](https://w3c.github.io/epub-specs/epub33/core/#attrdef-properties).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>[rendition:flow](https://w3c.github.io/epub-specs/epub33/core/#sec-flow)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:align-x-center](https://w3c.github.io/epub-specs/epub33/core/#sec-align-x-center)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

#### Fixed-Layout Properties

The following table lists publishers who have stated that they are currently using
the [fixed-layout rendering properties](https://w3c.github.io/epub-specs/epub33/core/#sec-rendering-fxl)
in production.

Fixed-layout properties are expressed both globally in the
[`meta` element's `property` attribute](https://w3c.github.io/epub-specs/epub33/core/#attrdef-meta-property)
and as overrides in the
[`itemref` element's `properties` attribute](https://w3c.github.io/epub-specs/epub33/core/#attrdef-properties).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>[rendition:layout](https://w3c.github.io/epub-specs/epub33/core/#layout)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:layout-pre-paginated](https://w3c.github.io/epub-specs/epub33/core/#layout-pre-paginated)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:layout-reflowable](https://w3c.github.io/epub-specs/epub33/core/#layout-reflowable)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:orientation](https://w3c.github.io/epub-specs/epub33/core/#orientation)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:orientation-auto](https://w3c.github.io/epub-specs/epub33/core/#orientation-auto)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:orientation-landscape](https://w3c.github.io/epub-specs/epub33/core/#orientation-landscape)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:orientation-portrait](https://w3c.github.io/epub-specs/epub33/core/#orientation-portrait)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:spread](https://w3c.github.io/epub-specs/epub33/core/#spread)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:spread-auto](https://w3c.github.io/epub-specs/epub33/core/#spread-auto)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:spread-both](https://w3c.github.io/epub-specs/epub33/core/#spread-both)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:spread-landscape](https://w3c.github.io/epub-specs/epub33/core/#spread-landscape)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:spread-none](https://w3c.github.io/epub-specs/epub33/core/#spread-none)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[<s>rendition:spread-portrait</s>](https://w3c.github.io/epub-specs/epub33/core/#spread-portrait)</td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB Publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td>[rendition:page-spread-center](https://w3c.github.io/epub-specs/epub33/core/#page-spread-center)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:page-spread-left](https://w3c.github.io/epub-specs/epub33/core/#page-spread-left)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[rendition:page-spread-right](https://w3c.github.io/epub-specs/epub33/core/#page-spread-right)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[<s>rendition:viewport</s>](https://w3c.github.io/epub-specs/epub33/core/#viewport)</td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB Publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
    </tbody>
</table>

### Manifest Properties Vocabulary

The following table lists publishers who have stated that they are currently using
the [manifest properties](https://w3c.github.io/epub-specs/epub33/core/#app-item-properties-vocab)
in production.

Manifest properties are expressed in the
[`item` element's `properties` attribute](https://w3c.github.io/epub-specs/epub33/core/#attrdef-properties).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>[cover-image](https://w3c.github.io/epub-specs/epub33/core/#sec-cover-image)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[mathml](https://w3c.github.io/epub-specs/epub33/core/#sec-mathml)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[nav](https://w3c.github.io/epub-specs/epub33/core/#sec-nav)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[remote-resources](https://w3c.github.io/epub-specs/epub33/core/#sec-remote-resources)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[scripted](https://w3c.github.io/epub-specs/epub33/core/#sec-scripted)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[svg](https://w3c.github.io/epub-specs/epub33/core/#sec-svg)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[switch](https://w3c.github.io/epub-specs/epub33/core/#sec-switch)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

### Spine Properties Vocabulary

The following table lists publishers who have stated that they are currently using
the [spine properties](https://w3c.github.io/epub-specs/epub33/core/#app-itemref-properties-vocab)
in production.

Spine properties are expressed in the
[`itemref` element's `properties` attribute](https://w3c.github.io/epub-specs/epub33/core/#attrdef-properties).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>[page-spread-left](https://w3c.github.io/epub-specs/epub33/core/#sec-page-spread-left)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[page-spread-right](https://w3c.github.io/epub-specs/epub33/core/#sec-page-spread-right)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

### Media Overlays Vocabulary

The following table lists publishers who have stated that they are currently using
the [Media Overlays properties](https://w3c.github.io/epub-specs/epub33/core/#app-overlays-vocab)
in production.

Media Overlays properties are expressed in the
[`meta` element's `property` attribute](https://w3c.github.io/epub-specs/epub33/core/#attrdef-meta-property).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>[active-class](https://w3c.github.io/epub-specs/epub33/core/#sec-active-class)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[duration](https://w3c.github.io/epub-specs/epub33/core/#sec-duration)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[narrator](https://w3c.github.io/epub-specs/epub33/core/#sec-narrator)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td>[playback-active-class](https://w3c.github.io/epub-specs/epub33/core/#sec-playback-active-class)</td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

## Validation and Authoring Tool Implementations

Where machine-testable assertions are made about the use of this metadata, conformance is checked by EPUBCheck.
In particular, it is able to determine if authors have not set manifest properties correctly.

(TBD what authoring tools support the metadata.)
