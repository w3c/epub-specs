## Candidate Recommendation Exit Criteria

The EPUB Working Group intends to exit the Candidate Recommendation stage and submit
the [EPUB 3.4](https://www.w3.org/TR/epub-34/) specification for consideration
as a W3C Proposed Recommendation after documenting implementation of each feature.

For this specification to advance to Proposed Recommendation, it has to be
proven that metadata defined and required in this specification have sufficient usage by the
target communities. This metadata falls into two categories:

1. metadata for expressing information about the publication in the package document; and
2. metadata for expressing preferred rendering of the content

Usage of these properties, as listed in the following tables, means that the organizations regularly
include the metadata in the package document (for publishers) or use them in bookshelves, content
rendering, etc. (for reading system developers).

## Publisher Implementations

### Meta Properties Vocabulary

The following table lists organizations that have stated that they are currently using
the [meta properties](https://www.w3.org/TR/epub-34/#app-meta-property-vocab)
in production.

Meta properties are expressed in the
[`meta` element's `property` attribute](https://www.w3.org/TR/epub-34/#attrdef-meta-property).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-alternate-script">alternate-script</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>American Academy of Pediatrics</li>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>Kaplan North America, LLC</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-authority">authority</a></td>
            <td>
            	<ul>
                    <li>American Academy of Pediatrics</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-belongs-to-collection">belongs-to-collection</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>BookFusion Inc</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-collection-type">collection-type</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
            		<li>Liturgical Press</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-display-seq">display-seq</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>American Academy of Pediatrics</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>Hachette Book Group</li>
                    <li>KADOKAWA</li>
                    <li>Macmillan Learning</li>
                    <li>Moody Publishers</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>Taylor &amp; Francis</li>
                    <li>University of Minnesota Press</li>
                    <li>University of Nebraska Press</li>
                    <li>VitalSource Technologies, LLC</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-file-as">file-as</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>American Academy of Pediatrics</li>
                    <li>Amnet</li>
                    <li>Carson Dellosa Education</li>
                    <li>Chicago Distribution Center</li>
                    <li>Consonance</li>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>Hachette Book Group</li>
                    <li>KADOKAWA</li>
                    <li>Lerner Publishing Group</li>
                    <li>Moody Publishers</li>
            		<li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>University of Minnesota Press</li>
                    <li>University of Nebraska Press</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-group-position">group-position</a></td>
            <td>
            	<ul>
                    <li>BookFusion Inc</li>
            		<li>Liturgical Press</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-identifier-type">identifier-type</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>American Academy of Pediatrics</li>
                    <li>Amnet</li>
                    <li>BroadStreet Publishing Group LLC</li>
                    <li>Carson Dellosa Education</li>
                    <li>Charisma Media</li>
                    <li>Chicago Distribution Center</li>
                    <li>Consonance</li>
            		<li>Hachette Book Group</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Lerner Publishing Group</li>
                    <li>Macmillan Learning</li>
                    <li>new harbinger publications</li>
                    <li>Pearson</li>
                    <li>Taylor &amp; Francis</li>
                    <li>The Quarto Group</li>
                    <li>University of Minnesota Press</li>
                    <li>University of Nebraska Press</li>
                    <li>Westchester Publishing Services</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-meta-auth"><s>meta-auth</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-role">role</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>American Academy of Pediatrics</li>
                    <li>Amnet</li>
                    <li>BroadStreet Publishing Group LLC</li>
                    <li>Carson Dellosa Education</li>
                    <li>Charisma Media</li>
                    <li>Chicago Distribution Center</li>
                    <li>Consonance</li>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>Hachette Book Group</li>
                    <li>Industrial Press, Inc.</li>
                    <li>KADOKAWA</li>
                    <li>Kaplan North America, LLC</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
                    <li>Macmillan Learning</li>
                    <li>Moody Publishers</li>
            		<li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>PRH UK</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Taylor &amp; Francis</li>
                    <li>Teacher Created Materials</li>
                    <li>University of Minnesota Press</li>
                    <li>University of Nebraska Press</li>
                    <li>VitalSource Technologies, LLC</li>
                    <li>Westchester Publishing Services</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-source-of">source-of</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>American Academy of Pediatrics</li>
                    <li>BookFusion Inc</li>
                    <li>Chicago Distribution Center</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Macmillan Learning</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>Taylor &amp; Francis</li>
                    <li>Westchester Publishing Services</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-term">term</a></td>
            <td>
            	<ul>
                    <li>American Academy of Pediatrics</li>
                    <li>Kaplan North America, LLC</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
                    <li>University of Nebraska Press</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-title-type">title-type</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>American Academy of Pediatrics</li>
                    <li>Amnet</li>
                    <li>BroadStreet Publishing Group LLC</li>
                    <li>Charisma Media</li>
                    <li>Consonance</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>Hachette Book Group</li>
                    <li>House of Anansi Press/Groundwood Books</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
                    <li>Macmillan Learning</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>Simon &amp; Schuster</li>
                    <li>The Quarto Group</li>
                    <li>University of Minnesota Press</li>
                    <li>University of Nebraska Press</li>
                    <li>Westchester Publishing Services</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

### Link Vocabulary
#### Link Relationships

The following table lists organizations that have stated that they are currently using
the [link relationships](https://www.w3.org/TR/epub-34/#sec-link-rel)
in production.

Link relationships are expressed in the
[`link` element's `rel` attribute](https://www.w3.org/TR/epub-34/#attrdef-link-rel).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-alternate">alternate</a></td>
            <td>
            	<ul>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-marc21xml-record"><s>marc21xml-record</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-mods-record"><s>mods-record</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-onix-record"><s>onix-record</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-record">record</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
            		<li>Liturgical Press</li>
                    <li>Macmillan Learning</li>
                    <li>Taylor &amp; Francis</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-voicing">voicing</a></td>
            <td>
            	<ul>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>CYPAC/Voice of DAISY 5 version 5.7</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-xml-signature"><s>xml-signature</s></a></td>
            <td>
            	<p>This property deprecated and is no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-xmp-record"><s>xmp-record</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
    </tbody>
</table>

#### Link Properties

The following table lists organizations that have stated that they are currently using
the [link properties](https://www.w3.org/TR/epub-34/#sec-link-properties)
in production.

Link properties are expressed in the
[`link` element's `properties` attribute](https://www.w3.org/TR/epub-34/#attrdef-properties).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-onix">onix</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
                    <li>Macmillan Learning</li>
                    <li>Taylor &amp; Francis</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

### Package Rendering Vocabulary
#### General Properties

The following table lists organizations that have stated that they are currently using
the [general package rendering properties](https://www.w3.org/TR/epub-34/#sec-rendering-general)
in production.

General package rendering properties are expressed both globally in the
[`meta` element's `property` attribute](https://www.w3.org/TR/epub-34/#attrdef-meta-property)
and as overrides in the
[`itemref` element's `properties` attribute](https://www.w3.org/TR/epub-34/#attrdef-properties).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-flow">rendition:flow</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>KADOKAWA</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
            		<li>Pearson</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#flow-auto">rendition:flow-auto</a></td>
            <td>
            	<ul>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#flow-paginated">rendition:flow-paginated</a></td>
            <td>
            	<ul>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>Kaplan North America, LLC</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#flow-scrolled-continuous">rendition:flow-scrolled-continuous</a></td>
            <td>
            	<ul>
                    <li>KADOKAWA</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#flow-scrolled-doc">rendition:flow-scrolled-doc</a></td>
            <td>
            	<ul>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-align-x-center">rendition:align-x-center</a></td>
            <td>
            	<ul>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

#### Fixed-Layout Properties

The following table lists organizations that have stated that they are currently using
the [fixed-layout rendering properties](https://www.w3.org/TR/epub-34/#sec-rendering-fxl)
in production.

Fixed-layout properties are expressed both globally in the
[`meta` element's `property` attribute](https://www.w3.org/TR/epub-34/#attrdef-meta-property)
and as overrides in the
[`itemref` element's `properties` attribute](https://www.w3.org/TR/epub-34/#attrdef-properties).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#layout">rendition:layout</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>Beaufort Books</li>
                    <li>BookFusion Inc</li>
                    <li>Carson Dellosa Education</li>
                    <li>Consonance</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>Hachette Book Group</li>
                    <li>House of Anansi Press/Groundwood Books</li>
                    <li>KADOKAWA</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Lee & Low Books</li>
                    <li>Lerner Publishing Group</li>
            		<li>Liturgical Press</li>
                    <li>Moody Publishers</li>
                    <li>Penguin Random House North America</li>
                    <li>PRH UK</li>
                    <li>Simon &amp; Schuster</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#layout-pre-paginated">rendition:layout-pre-paginated</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>Beaufort Books</li>
                    <li>BookFusion Inc</li>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>Hachette Book Group</li>
                    <li>KADOKAWA</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Moody Publishers</li>
                    <li>Penguin Random House North America</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Teacher Created Materials</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#layout-reflowable">rendition:layout-reflowable</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Beaufort Books</li>
                    <li>BookFusion Inc</li>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#orientation">rendition:orientation</a></td>
            <td>
            	<ul>
                    <li>Amnet</li>
                    <li>Beaufort Books</li>
                    <li>Carson Dellosa Education</li>
                    <li>Consonance</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>Hachette Book Group</li>
                    <li>House of Anansi Press/Groundwood Books</li>
                    <li>KADOKAWA</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Lerner Publishing Group</li>
                    <li>Moody Publishers</li>
                    <li>PRH UK</li>
                    <li>Simon &amp; Schuster</li>
                    <li>VitalSource Technologies, LLC</li>
                    <li>Westchester Publishing Services</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#orientation-auto">rendition:orientation-auto</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>Beaufort Books</li>
                    <li>Carson Dellosa Education</li>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>Hachette Book Group</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Penguin Random House North America</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Teacher Created Materials</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#orientation-landscape">rendition:orientation-landscape</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>Beaufort Books</li>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Penguin Random House North America</li>
                    <li>Simon &amp; Schuster</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#orientation-portrait">rendition:orientation-portrait</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>Beaufort Books</li>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
                    <li>Simon &amp; Schuster</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#spread">rendition:spread</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>Beaufort Books</li>
                    <li>BookFusion Inc</li>
                    <li>Carson Dellosa Education</li>
                    <li>Consonance</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>Hachette Book Group</li>
                    <li>House of Anansi Press/Groundwood Books</li>
                    <li>KADOKAWA</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Lee & Low Books</li>
                    <li>Lerner Publishing Group</li>
                    <li>Moody Publishers</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>PRH UK</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Teacher Created Materials</li>
                    <li>VitalSource Technologies, LLC</li>
                    <li>Westchester Publishing Services</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#spread-auto">rendition:spread-auto</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>Beaufort Books</li>
                    <li>BookFusion Inc</li>
                    <li>Carson Dellosa Education</li>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>Hachette Book Group</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Moody Publishers</li>
                    <li>Penguin Random House North America</li>
                    <li>Simon &amp; Schuster</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#spread-both">rendition:spread-both</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>BookFusion Inc</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Penguin Random House North America</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#spread-landscape">rendition:spread-landscape</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>Beaufort Books</li>
                    <li>BookFusion Inc</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Penguin Random House North America</li>
                    <li>Simon &amp; Schuster</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#spread-none">rendition:spread-none</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Beaufort Books</li>
                    <li>BookFusion Inc</li>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>KADOKAWA</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Moody Publishers</li>
                    <li>Penguin Random House North America</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#spread-portrait"><s>rendition:spread-portrait</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#page-spread-center">rendition:page-spread-center</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>BookFusion Inc</li>
                    <li>Consonance</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>KADOKAWA</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Penguin Random House North America</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#page-spread-left">rendition:page-spread-left</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>BookFusion Inc</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#page-spread-right">rendition:page-spread-right</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>BookFusion Inc</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#viewport"><s>rendition:viewport</s></a></td>
            <td>
            	<p>This property is deprecated and no longer recommended for use in EPUB publications.
            		It is only listed for completeness of reporting.</p>
            </td>
        </tr>
    </tbody>
</table>

### Manifest Properties Vocabulary

The following table lists organizations that have stated that they are currently using
the [manifest properties](https://www.w3.org/TR/epub-34/#app-item-properties-vocab)
in production.

Manifest properties are expressed in the
[`item` element's `properties` attribute](https://www.w3.org/TR/epub-34/#attrdef-properties).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-cover-image">cover-image</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>American Academy of Pediatrics</li>
                    <li>Amnet</li>
                    <li>Beaufort Books</li>
                    <li>BookFusion Inc</li>
                    <li>Carson Dellosa Education</li>
                    <li>Charisma Media</li>
                    <li>Chicago Distribution Center</li>
                    <li>Consonance</li>
                    <li>CYPAC/Voice of DAISY 5 version 5.7</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>Hachette Book Group</li>
                    <li>House of Anansi Press/Groundwood Books</li>
                    <li>Industrial Press, Inc.</li>
                    <li>KADOKAWA</li>
                    <li>Kaplan North America, LLC</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Lee & Low Books</li>
                    <li>Lerner Publishing Group</li>
            		<li>Liturgical Press</li>
                    <li>Macmillan Learning</li>
                    <li>Moody Publishers</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>PRH UK</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Taylor &amp; Francis</li>
                    <li>Teacher Created Materials</li>
                    <li>The Quarto Group</li>
                    <li>University of Minnesota Press</li>
                    <li>University of Nebraska Press</li>
                    <li>VitalSource Technologies, LLC</li>
                    <li>W. W. Norton & Company, Inc. (Educational)</li>
                    <li>Westchester Publishing Services</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-mathml">mathml</a></td>
            <td>
            	<ul>
                    <li>Amnet</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Macmillan Learning</li>
                    <li>Taylor &amp; Francis</li>
                    <li>VitalSource Technologies, LLC</li>
                    <li>Westchester Publishing Services</li>
            		<li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-nav">nav</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>American Academy of Pediatrics</li>
                    <li>Amnet</li>
                    <li>Beaufort Books</li>
                    <li>BookFusion Inc</li>
                    <li>Carson Dellosa Education</li>
                    <li>Charisma Media</li>
                    <li>Chicago Distribution Center</li>
                    <li>Consonance</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>Hachette Book Group</li>
                    <li>House of Anansi Press/Groundwood Books</li>
                    <li>Industrial Press, Inc.</li>
                    <li>KADOKAWA</li>
                    <li>Kaplan North America, LLC</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Lerner Publishing Group</li>
            		<li>Liturgical Press</li>
                    <li>Macmillan Learning</li>
                    <li>Moody Publishers</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
                    <li>PRH UK</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Taylor &amp; Francis</li>
                    <li>Teacher Created Materials</li>
                    <li>The Quarto Group</li>
                    <li>University of Minnesota Press</li>
                    <li>University of Nebraska Press</li>
                    <li>VitalSource Technologies, LLC</li>
                    <li>Westchester Publishing Services</li>
                    <li>W. W. Norton & Company, Inc. (Educational)</li>
                    <li>Wiley</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-remote-resources">remote-resources</a></td>
            <td>
            	<ul>
                    <li>Carson Dellosa Education</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Macmillan Learning</li>
                    <li>VitalSource Technologies, LLC</li>
                    <li>W. W. Norton & Company, Inc. (Educational)</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-scripted">scripted</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>Hachette Book Group</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
                    <li>Macmillan Learning</li>
                    <li>Moody Publishers</li>
                    <li>Penguin Random House North America</li>
                    <li>Taylor &amp; Francis</li>
                    <li>VitalSource Technologies, LLC</li>
                    <li>W. W. Norton & Company, Inc. (Educational)</li>
                    <li>Westchester Publishing Services</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-svg">svg</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>Consonance</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>KADOKAWA</li>
                    <li>Kaplan North America, LLC</li>
                    <li>KnowledgeWorks Global Ltd.</li>
            		<li>Liturgical Press</li>
                    <li>Macmillan Learning</li>
                    <li>Moody Publishers</li>
                    <li>Penguin Random House North America</li>
                    <li>Taylor &amp; Francis</li>
                    <li>VitalSource Technologies, LLC</li>
                    <li>Westchester Publishing Services</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-switch"><s>switch</s></a></td>
            <td>
            	<p>This property indicates that the deprecated switch element is present.
                    It is only listed for completeness of reporting.</p>
            </td>
        </tr>
    </tbody>
</table>

### Spine properties vocabulary

The following table lists organizations that have stated that they are currently using
the [spine properties](https://www.w3.org/TR/epub-34/#app-itemref-properties-vocab)
in production.

Spine properties are expressed in the
[`itemref` element's `properties` attribute](https://www.w3.org/TR/epub-34/#attrdef-properties).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-page-spread-left">page-spread-left</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>BookFusion Inc</li>
                    <li>Consonance</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>KADOKAWA</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Lee & Low Books</li>
                    <li>Lerner Publishing Group</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
                    <li>PRH UK</li>
                    <li>Teacher Created Materials</li>
                    <li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-page-spread-right">page-spread-right</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>BookFusion Inc</li>
                    <li>Consonance</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>KADOKAWA</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Lee & Low Books</li>
                    <li>Lerner Publishing Group</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
                    <li>PRH UK</li>
                    <li>Teacher Created Materials</li>
                    <li>VitalSource Technologies, LLC</li>
             	</ul>
           </td>
        </tr>
    </tbody>
</table>

### Media Overlays Vocabulary

The following table lists organizations that have stated that they are currently using
the [Media Overlays properties](https://www.w3.org/TR/epub-34/#app-overlays-vocab)
in production.

Media Overlays properties are expressed in the
[`meta` element's `property` attribute](https://www.w3.org/TR/epub-34/#attrdef-meta-property).

<table>
    <thead>
        <tr>
            <th>Property</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-active-class">active-class</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>BookFusion Inc</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Kaplan North America, LLC</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Lerner Publishing Group</li>
            		<li>Liturgical Press</li>
                    <li>Penguin Random House North America</li>
                    <li>Teacher Created Materials</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-duration">duration</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>BookFusion Inc</li>
                    <li>EDRLab (Thorium Reader)</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Lerner Publishing Group</li>
                    <li>Penguin Random House North America</li>
                    <li>Teacher Created Materials</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-narrator">narrator</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>Amnet</li>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://www.w3.org/TR/epub-34/#sec-playback-active-class">playback-active-class</a></td>
            <td>
            	<ul>
                    <li>Advantage | ForbesBooks</li>
                    <li>BookFusion Inc</li>
                    <li>EDRLab (Thorium Reader)</li>
                    <li>KnowledgeWorks Global Ltd.</li>
                    <li>Penguin Random House North America</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

## Validation and Authoring Tool Implementations

Where machine-testable assertions are made about the use of this metadata, conformance is checked by EPUBCheck.
In particular, it is able to determine if authors have not set manifest properties correctly.

