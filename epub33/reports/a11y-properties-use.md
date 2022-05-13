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
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#confreq-schema-accessibilityHazard">schema:accessibilityHazard</a></td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#confreq-schema-accessibilitySummary">schema:accessibilitySummary</a></td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#confreq-schema-accessMode">schema:accessMode</a></td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
            <td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#confreq-schema-accessModeSufficient">schema:accessModeSufficient</a></td>
            <td>
            	<ul>
            		<li>TBD</li>
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
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
        	<td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#a11y-certifiedBy">a11y:certifiedBy</a></td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
        	<td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#a11y-certifierCredential">a11y:certifierCredential</a></td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
        <tr>
        	<td><a href="https://w3c.github.io/epub-specs/epub33/a11y/#a11y-certifierReport">a11y:certifierReport</a></td>
            <td>
            	<ul>
            		<li>TBD</li>
            	</ul>
            </td>
        </tr>
    </tbody>
</table>

## Validation and Authoring Tool Implementations

The [Ace by DAISY](https://daisy.github.io/ace/) validator provides machine checking of the EPUB Accessibility
specification requirements. A new version that supports the 1.1 specification will be released in 2022.

The [Ace SMART](https://smart.daisy.org) tool assists users with carrying out manual verification of the EPUB
Accessibility specification. A new version that supports the 1.1 specification will also be released in early 2022.
The tool additionally allows authors to generate discovery and certifier metadata for use in their publications.


## Vendor Implementations

The accessibility metadata provided by publishers is used to aid discovery of publications by ...
