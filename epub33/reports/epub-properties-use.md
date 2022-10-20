## Candidate Recommendation Exit Criteria

The EPUB Working Group intends to exit the Candidate Recommendation stage and submit
the [EPUB 3.3](https://w3c.github.io/epub-specs/epub33/core/) specification for consideration
as a W3C Proposed Recommendation after documenting implementation of each feature.

For this specification to advance to Proposed Recommendation, it has to be
proven that metadata defined and required in this specification have sufficient usage by the
target communities. This metadata falls into two categories:

1. metadata for expressing information about the publication in the package document; and
2. metadata for expressing preferred rendering of the content

Usage of these properties means that they are regularly included in the package document
metadata for their EPUB publications (as appropriate for each title).

## Publisher Implementations

### Meta Properties Vocabulary

The following table lists publishers who have stated that they are currently using
the [meta properties](https://w3c.github.io/epub-specs/epub33/core/#app-meta-property-vocab)
in production.

Meta properties are expressed in the
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
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-alternate-script">alternate-script</a></td>
            <td>
            	<ul>
            		<li>Liturgical Press</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-authority">authority</a></td>
            <td>
            	<ul>
            		<li>-</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-belongs-to-collection">belongs-to-collection</a></td>
            <td>
            	<ul>
            		<li>Liturgical Press</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-collection-type">collection-type</a></td>
            <td>
            	<ul>
            		<li>Liturgical Press</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-display-seq">display-seq</a></td>
            <td>
            	<ul>
            		<li>Hachette Book Group</li>
                    <li>Macmillan Learning</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-file-as">file-as</a></td>
            <td>
            	<ul>
                    <li>Hachette Book Group</li>
            		<li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-group-position">group-position</a></td>
            <td>
            	<ul>
            		<li>Liturgical Press</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-identifier-type">identifier-type</a></td>
            <td>
            	<ul>
            		<li>Hachette Book Group</li>
                    <li>Macmillan Learning</li>
                    <li>new harbinger publications</li>
                    <li>Pearson</li>
                    <li>The Quarto Group</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-meta-auth"><s>meta-auth</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-role">role</a></td>
            <td>
            	<ul>
                    <li>Hachette Book Group</li>
            		<li>Liturgical Press</li>
                    <li>Macmillan Learning</li>
            		<li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-source-of">source-of</a></td>
            <td>
            	<ul>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Macmillan Learning</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-term">term</a></td>
            <td>
            	<ul>
            		<li>Liturgical Press</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-title-type">title-type</a></td>
            <td>
            	<ul>
            		<li>Hachette Book Group</li>
                    <li>House of Anansi Press/Groundwood Books</li>
            		<li>Liturgical Press</li>
                    <li>Macmillan Learning</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>The Quarto Group</li>
                    <li>Wiley</li>
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
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-acquire">acquire</a></td>
            <td>
            	<ul>
            		<li>-</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-alternate">alternate</a></td>
            <td>
            	<ul>
            		<li>Liturgical Press</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-marc21xml-record"><s>marc21xml-record</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-mods-record"><s>mods-record</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-onix-record"><s>onix-record</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-record">record</a></td>
            <td>
            	<ul>
            		<li>Liturgical Press</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-voicing">voicing</a></td>
            <td>
            	<ul>
            		<li>-</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-xml-signature"><s>xml-signature</s></a></td>
            <td>
            	<p>This property deprecated and is no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-xmp-record"><s>xmp-record</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
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
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-onix">onix</a></td>
            <td>
            	<ul>
            		<li>Liturgical Press</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-xmp">xmp</a></td>
            <td>
            	<ul>
            		<li>-</li>
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
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-flow">rendition:flow</a></td>
            <td>
            	<ul>
            		<li>Liturgical Press</li>
            		<li>Pearson</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#flow-auto">rendition:flow-auto</a></td>
            <td>
            	<ul>
            		<li>-</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#flow-paginated">rendition:flow-paginated</a></td>
            <td>
            	<ul>
            		<li>-</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#flow-scrolled-continuous">rendition:flow-scrolled-continuous</a></td>
            <td>
            	<ul>
            		<li>-</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#flow-scrolled-doc">rendition:flow-scrolled-doc</a></td>
            <td>
            	<ul>
            		<li>-</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-align-x-center">rendition:align-x-center</a></td>
            <td>
            	<ul>
            		<li>-</li>
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
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#layout">rendition:layout</a></td>
            <td>
            	<ul>
            		<li>Hachette Book Group</li>
                    <li>House of Anansi Press/Groundwood Books</li>
                    <li>Lee & Low Books</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#layout-pre-paginated">rendition:layout-pre-paginated</a></td>
            <td>
            	<ul>
                    <li>Hachette Book Group</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#layout-reflowable">rendition:layout-reflowable</a></td>
            <td>
            	<ul>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#orientation">rendition:orientation</a></td>
            <td>
            	<ul>
            		<li>Hachette Book Group</li>
                    <li>House of Anansi Press/Groundwood Books</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#orientation-auto">rendition:orientation-auto</a></td>
            <td>
            	<ul>
                    <li>Hachette Book Group</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#orientation-landscape">rendition:orientation-landscape</a></td>
            <td>
            	<ul>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#orientation-portrait">rendition:orientation-portrait</a></td>
            <td>
            	<ul>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#spread">rendition:spread</a></td>
            <td>
            	<ul>
            		<li>Hachette Book Group</li>
                    <li>House of Anansi Press/Groundwood Books</li>
                    <li>Lee & Low Books</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#spread-auto">rendition:spread-auto</a></td>
            <td>
            	<ul>
                    <li>Hachette Book Group</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#spread-both">rendition:spread-both</a></td>
            <td>
            	<ul>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#spread-landscape">rendition:spread-landscape</a></td>
            <td>
            	<ul>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#spread-none">rendition:spread-none</a></td>
            <td>
            	<ul>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#spread-portrait"><s>rendition:spread-portrait</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#page-spread-center">rendition:page-spread-center</a></td>
            <td>
            	<ul>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#page-spread-left">rendition:page-spread-left</a></td>
            <td>
            	<ul>
            		<li>House of Anansi Press/Groundwood Books</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#page-spread-right">rendition:page-spread-right</a></td>
            <td>
            	<ul>
            		<li>House of Anansi Press/Groundwood Books</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#viewport"><s>rendition:viewport</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
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
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-cover-image">cover-image</a></td>
            <td>
            	<ul>
            		<li>Hachette Book Group</li>
                    <li>House of Anansi Press/Groundwood Books</li>
                    <li>Lee & Low Books</li>
            		<li>Liturgical Press</li>
                    <li>Macmillan Learning</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>The Quarto Group</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-mathml">mathml</a></td>
            <td>
            	<ul>
                    <li>Macmillan Learning</li>
            		<li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-nav">nav</a></td>
            <td>
            	<ul>
            		<li>Hachette Book Group</li>
                    <li>House of Anansi Press/Groundwood Books</li>
            		<li>Liturgical Press</li>
                    <li>Macmillan Learning</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>The Quarto Group</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-remote-resources">remote-resources</a></td>
            <td>
            	<ul>
            		<li>-</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-scripted">scripted</a></td>
            <td>
            	<ul>
                    <li>Hachette Book Group</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-svg">svg</a></td>
            <td>
            	<ul>
            		<li>House of Anansi Press/Groundwood Books</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-switch"><s>switch</s></a></td>
            <td>
            	<p>This property indicates that the deprecated switch element is present.
                    It is only listed for completeness of reporting.</p>
            </td>
        </tr>
    </tbody>
</table>

### Spine properties vocabulary

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
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-page-spread-left">page-spread-left</a></td>
            <td>
            	<ul>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Lee & Low Books</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-page-spread-right">page-spread-right</a></td>
            <td>
            	<ul>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Lee & Low Books</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
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
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-active-class">active-class</a></td>
            <td>
            	<ul>
            		<li>House of Anansi Press/Groundwood Books</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-duration">duration</a></td>
            <td>
            	<ul>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-narrator">narrator</a></td>
            <td>
            	<ul>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/core/#sec-playback-active-class">playback-active-class</a></td>
            <td>
            	<ul>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

## Validation and Authoring Tool Implementations

Where machine-testable assertions are made about the use of this metadata, conformance is checked by EPUBCheck.
In particular, it is able to determine if authors have not set manifest properties correctly.

(TBD what authoring tools support the metadata.)
