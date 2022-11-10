## Candidate Recommendation Exit Criteria

The EPUB Working Group intends to exit the Candidate Recommendation stage and submit
the [EPUB Accessibility 1.1](https://w3c.github.io/epub-specs/epub33/a11y/) specification for
consideration as a W3C Proposed Recommendation after documenting implementation of each feature.

For this specification to advance to Proposed Recommendation, it has to be
proven that metadata defined and required in this specification have sufficient usage by the
target communities. This metadata falls into two categories:

1. required and recommended schema.org metadata for describing the accessibility
of publications; and
2. EPUB-defined metadata properties for reporting aspects of conformance

Usage of these properties means that they are regularly included in the package document
metadata for their EPUB publications (as appropriate for each title).

## Publisher Implementations

### Schema.org discovery metadata

The following table provides a list of publishers who have stated that they are currently using
the [schema.org discovery metadata properties](https://w3c.github.io/epub-specs/epub33/a11y/#sec-disc-package)
in production or who are in the process of rolling out their implementations.

Discovery properties are expressed in the
[`meta` element's `property` attribute](https://w3c.github.io/epub-specs/epub33/core/#attrdef-meta-property).

<table>
    <thead>
        <tr>
            <th>Role</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#confreq-schema-accessibilityFeature">schema:accessibilityFeature</a></td>
            <td>
            	<ul>
            		<li>Acorn Press</li>
                    <li>alto Éditeur d'étonnant</li>
            		<li>Annick Press</li>
            		<li>Au Press</li>
            		<li>Book*hug Press</li>
                    <li>Brick Books</li>
                    <li>Brush Education Inc.</li>
                    <li>Dog Training Press</li>
            		<li>ECW Press</li>
            		<li>Éditions Bourton d'or Acadie</li>
                    <li>Flanker Press</li>
                    <li>Formac Lorimer</li>
            		<li>Goose Lane Editions</li>
            		<li>Guilford Press</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Hurtubise</li>
            		<li>Invisible Publishing</li>
            		<li>Jones and Bartlett Learning</li>
            		<li>Kogan Page</li>
                    <li>Linda Leith Publishing</li>
            		<li>Macmillan Learning</li>
                    <li>md</li>
                    <li>Nimbus Publishing</li>
            		<li>Playwrights Canada</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
            		<li>Radiant Press</li>
            		<li>Saint Jean</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Taylor &amp; Francis</li>
            		<li>Tidewater Press</li>
                    <li>UBC Press</li>
            		<li>University of Michigan Press</li>
            		<li>Wiley</li>
            		<li>Wilfred Laurier University Press</li>
                    <li>XYZ</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#confreq-schema-accessibilityHazard">schema:accessibilityHazard</a></td>
            <td>
            	<ul>
            		<li>Acorn Press</li>
                    <li>alto Éditeur d'étonnant</li>
            		<li>Annick Press</li>
            		<li>Au Press</li>
            		<li>Book*hug Press</li>
                    <li>Brick Books</li>
                    <li>Brush Education Inc.</li>
                    <li>Dog Training Press</li>
            		<li>ECW Press</li>
            		<li>Éditions Bourton d'or Acadie</li>
                    <li>Flanker Press</li>
                    <li>Formac Lorimer</li>
            		<li>Goose Lane Editions</li>
            		<li>Guilford Press</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Hurtubise</li>
            		<li>Invisible Publishing</li>
            		<li>Jones and Bartlett Learning</li>
            		<li>Kogan Page</li>
                    <li>Linda Leith Publishing</li>
            		<li>Macmillan Learning</li>
                    <li>md</li>
                    <li>Nimbus Publishing</li>
            		<li>Playwrights Canada</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
            		<li>Radiant Press</li>
            		<li>Saint Jean</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Taylor &amp; Francis</li>
            		<li>Tidewater Press</li>
                    <li>UBC Press</li>
            		<li>University of Michigan Press</li>
            		<li>Wiley</li>
            		<li>Wilfred Laurier University Press</li>
                    <li>XYZ</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#confreq-schema-accessibilitySummary">schema:accessibilitySummary</a></td>
            <td>
            	<ul>
            		<li>Acorn Press</li>
                    <li>alto Éditeur d'étonnant</li>
            		<li>Annick Press</li>
            		<li>Au Press</li>
            		<li>Book*hug Press</li>
                    <li>Brick Books</li>
                    <li>Brush Education Inc.</li>
                    <li>Dog Training Press</li>
            		<li>ECW Press</li>
            		<li>Éditions Bourton d'or Acadie</li>
                    <li>Flanker Press</li>
                    <li>Formac Lorimer</li>
            		<li>Goose Lane Editions</li>
            		<li>Guilford Press</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Hurtubise</li>
            		<li>Invisible Publishing</li>
            		<li>Jones and Bartlett Learning</li>
            		<li>Kogan Page</li>
                    <li>Linda Leith Publishing</li>
            		<li>Macmillan Learning</li>
                    <li>md</li>
                    <li>Nimbus Publishing</li>
            		<li>Playwrights Canada</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
            		<li>Radiant Press</li>
            		<li>Saint Jean</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Taylor &amp; Francis</li>
            		<li>Tidewater Press</li>
                    <li>UBC Press</li>
            		<li>University of Michigan Press</li>
            		<li>Wiley</li>
            		<li>Wilfred Laurier University Press</li>
                    <li>XYZ</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#confreq-schema-accessMode">schema:accessMode</a></td>
            <td>
            	<ul>
            		<li>Acorn Press</li>
                    <li>alto Éditeur d'étonnant</li>
            		<li>Annick Press</li>
            		<li>Au Press</li>
            		<li>Book*hug Press</li>
                    <li>Brick Books</li>
                    <li>Brush Education Inc.</li>
                    <li>Dog Training Press</li>
            		<li>ECW Press</li>
            		<li>Éditions Bourton d'or Acadie</li>
                    <li>Flanker Press</li>
                    <li>Formac Lorimer</li>
            		<li>Goose Lane Editions</li>
            		<li>Guilford Press</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Hurtubise</li>
            		<li>Invisible Publishing</li>
            		<li>Jones and Bartlett Learning</li>
            		<li>Kogan Page</li>
                    <li>Linda Leith Publishing</li>
            		<li>Macmillan Learning</li>
                    <li>md</li>
                    <li>Nimbus Publishing</li>
            		<li>Playwrights Canada</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
            		<li>Radiant Press</li>
            		<li>Saint Jean</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Taylor &amp; Francis</li>
            		<li>Tidewater Press</li>
                    <li>UBC Press</li>
            		<li>University of Michigan Press</li>
            		<li>Wiley</li>
            		<li>Wilfred Laurier University Press</li>
                    <li>XYZ</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#confreq-schema-accessModeSufficient">schema:accessModeSufficient</a></td>
            <td>
            	<ul>
            		<li>Acorn Press</li>
                    <li>alto Éditeur d'étonnant</li>
            		<li>Annick Press</li>
            		<li>Au Press</li>
            		<li>Book*hug Press</li>
                    <li>Brick Books</li>
                    <li>Brush Education Inc.</li>
                    <li>Dog Training Press</li>
            		<li>ECW Press</li>
            		<li>Éditions Bourton d'or Acadie</li>
                    <li>Flanker Press</li>
                    <li>Formac Lorimer</li>
            		<li>Goose Lane Editions</li>
            		<li>Guilford Press</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Hurtubise</li>
            		<li>Invisible Publishing</li>
            		<li>Jones and Bartlett Learning</li>
            		<li>Kogan Page</li>
                    <li>Linda Leith Publishing</li>
            		<li>Macmillan Learning</li>
                    <li>md</li>
                    <li>Nimbus Publishing</li>
            		<li>Playwrights Canada</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
            		<li>Radiant Press</li>
            		<li>Saint Jean</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Taylor &amp; Francis</li>
            		<li>Tidewater Press</li>
                    <li>UBC Press</li>
            		<li>University of Michigan Press</li>
            		<li>Wiley</li>
            		<li>Wilfred Laurier University Press</li>
                    <li>XYZ</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

### Conformance metadata

The following table provides a list of publishers who have stated that they are currently using
the [conformance reporting metadata properties](https://w3c.github.io/epub-specs/epub33/a11y/#sec-conf-reporting)
in production or who are in the process of rolling out their implementations.

Conformance properties are expressed in the
[`meta` element's `property` attribute](https://w3c.github.io/epub-specs/epub33/core/#attrdef-meta-property)
and in the
[`link` element's `rel` attribute](https://w3c.github.io/epub-specs/epub33/core/#attrdef-link-rel).

<table>
    <thead>
        <tr>
            <th>Role</th>
            <th>Used By</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        	<td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#dcterms-conformsTo">dcterms:conformsTo</a></td>
            <td>
            	<ul>
            		<li>Acorn Press</li>
                    <li>alto Éditeur d'étonnant</li>
            		<li>Annick Press</li>
            		<li>Au Press</li>
            		<li>Book*hug Press</li>
                    <li>Brick Books</li>
                    <li>Brush Education Inc.</li>
                    <li>Dog Training Press</li>
            		<li>ECW Press</li>
            		<li>Éditions Bourton d'or Acadie</li>
                    <li>Flanker Press</li>
                    <li>Formac Lorimer</li>
            		<li>Goose Lane Editions</li>
            		<li>Guilford Press</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Hurtubise</li>
            		<li>Invisible Publishing</li>
            		<li>Jones and Bartlett Learning</li>
            		<li>Kogan Page</li>
                    <li>Linda Leith Publishing</li>
            		<li>Macmillan Learning</li>
                    <li>md</li>
                    <li>Nimbus Publishing</li>
            		<li>Playwrights Canada</li>
                    <li>Pearson</li>
                    <li>Penguin Random House North America</li>
            		<li>Radiant Press</li>
            		<li>Saint Jean</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Taylor &amp; Francis</li>
            		<li>Tidewater Press</li>
                    <li>UBC Press</li>
            		<li>University of Michigan Press</li>
            		<li>Wiley</li>
            		<li>Wilfred Laurier University Press</li>
                    <li>XYZ</li>
            	</ul>
            </td>
        </tr>
        <tr>
        	<td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#a11y-certifiedBy">a11y:certifiedBy</a></td>
            <td>
            	<ul>
            		<li>Acorn Press</li>
                    <li>alto Éditeur d'étonnant</li>
            		<li>Annick Press</li>
            		<li>Au Press</li>
            		<li>Book*hug Press</li>
                    <li>Brick Books</li>
                    <li>Brush Education Inc.</li>
                    <li>Dog Training Press</li>
            		<li>ECW Press</li>
            		<li>Éditions Bourton d'or Acadie</li>
                    <li>Flanker Press</li>
                    <li>Formac Lorimer</li>
            		<li>Goose Lane Editions</li>
            		<li>Guilford Press</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Hurtubise</li>
            		<li>Invisible Publishing</li>
            		<li>Jones and Bartlett Learning</li>
            		<li>Kogan Page</li>
                    <li>Linda Leith Publishing</li>
            		<li>Macmillan Learning</li>
                    <li>md</li>
                    <li>Nimbus Publishing</li>
            		<li>Playwrights Canada</li>
                    <li>Pearson</li>
            		<li>Radiant Press</li>
            		<li>Saint Jean</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Taylor &amp; Francis</li>
            		<li>Tidewater Press</li>
                    <li>UBC Press</li>
            		<li>University of Michigan Press</li>
            		<li>Wiley</li>
            		<li>Wilfred Laurier University Press</li>
                    <li>XYZ</li>
            	</ul>
            </td>
        </tr>
        <tr>
        	<td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#a11y-certifierCredential">a11y:certifierCredential</a></td>
            <td>
            	<ul>
            		<li>Acorn Press</li>
                    <li>alto Éditeur d'étonnant</li>
            		<li>Annick Press</li>
            		<li>Au Press</li>
            		<li>Book*hug Press</li>
                    <li>Brick Books</li>
                    <li>Brush Education Inc.</li>
                    <li>Dog Training Press</li>
            		<li>ECW Press</li>
            		<li>Éditions Bourton d'or Acadie</li>
                    <li>Flanker Press</li>
                    <li>Formac Lorimer</li>
            		<li>Goose Lane Editions</li>
            		<li>Guilford Press</li>
            		<li>House of Anansi Press/Groundwood Books</li>
                    <li>Hurtubise</li>
            		<li>Invisible Publishing</li>
            		<li>Jones and Bartlett Learning</li>
            		<li>Kogan Page</li>
                    <li>Linda Leith Publishing</li>
            		<li>Macmillan Learning</li>
                    <li>md</li>
                    <li>Nimbus Publishing</li>
            		<li>Playwrights Canada</li>
                    <li>Pearson</li>
            		<li>Radiant Press</li>
            		<li>Saint Jean</li>
                    <li>Simon &amp; Schuster</li>
                    <li>Taylor &amp; Francis</li>
            		<li>Tidewater Press</li>
                    <li>UBC Press</li>
            		<li>University of Michigan Press</li>
            		<li>Wiley</li>
            		<li>Wilfred Laurier University Press</li>
                    <li>XYZ</li>
            	</ul>
            </td>
        </tr>
        <tr>
        	<td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#a11y-certifierReport">a11y:certifierReport</a></td>
            <td>
            	<ul>
            		<li>VitalSource Technologies, LLC</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

## Validation and Authoring Tool Implementations

The [Ace by DAISY](https://daisy.github.io/ace/) validator provides machine checking of the EPUB Accessibility
specification requirements. A version that supports the 1.1 specification was released in July 2022.

The [Ace SMART](https://smart.daisy.org) tool assists users with carrying out manual verification of the EPUB
Accessibility specification. A version that supports the 1.1 specification was also released in July 2022.
The tool additionally allows authors to generate discovery and certifier metadata for use in their publications.


## Vendor Implementations

The following is a list of vendors who have stated that they are currently including
the [schema.org discovery metadata properties](https://w3c.github.io/epub-specs/epub33/a11y/#sec-disc-package) for the publishers they serve. For publishers who have received third-party certification, they also include the [conformance reporting metadata properties](https://w3c.github.io/epub-specs/epub33/a11y/#sec-conf-reporting) on their behalf.

- Amnet
- Apex
- Canadian Electronic Library
- Codemantra
- Lumina Datamatics
- Newgen
- S4Carlisle
- Westchester Publishing

## Bookstore Implementations

The following is a list of Bookstore's who display the [schema.org discovery metadata properties](https://w3c.github.io/epub-specs/epub33/a11y/#sec-disc-package)
and the [conformance reporting metadata properties](https://w3c.github.io/epub-specs/epub33/a11y/#sec-conf-reporting) when present, or who are in the process of rolling out their implementations for every EPUB in their collection.

- [RedShelf](https://redshelf.com)
- [VitalSource](https://www.vitalsource.com)


## Catalog Feed

The following is a list of Vendors who provide the [schema.org discovery metadata properties](https://w3c.github.io/epub-specs/epub33/a11y/#sec-disc-package) and the [conformance reporting metadata properties](https://w3c.github.io/epub-specs/epub33/a11y/#sec-conf-reporting) in their catalog feed to partners when present, or who are in the process of rolling out their implementations for every EPUB in their collection.

- [VitalSource](https://www.vitalsource.com)
