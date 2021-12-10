# EPUB Accessibility 1.1 Metadata Usage Report

## Candidate Recommendation Exit Criteria

The EPUB Working Group intends to exit the Candidate Recommendation stage and submit
the EPUB Accessibility 1.1 specification for consideration as a W3C Proposed Recommendation
after documenting implementation of each feature.

For this specification to advance to Proposed Recommendation, it has to be
proven that metadata defined and required in this specification have sufficient usage by the
target communities. This metadata falls into two categories:

1. required and recommended schema.org metadata for describing the accessibility
of publications; and
2. EPUB-defined metadata properties for reporting aspects of conformance

Usage of these properties means that they are regularly included in the Package Document
metadata for their EPUB Publications (as appropriate for each title).

## Publisher Implementations

### Schema.org discovery metadata

The following table provides a list of publishers who have stated that they are currently using
the schema.org discovery metadata properties in production or who are in the process of rolling
out their implementations.

<table>
    <thead>
        <tr>
            <th>Role</th>
            <th>[Publisher]</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th>schema:accessibilityFeature</th>
            <td></td>
        </tr>
        <tr>
            <th>schema:accessibilityHazard</th>
            <td></td>
        </tr>
        <tr>
            <th>schema:accessibilitySummary</th>
            <td></td>
        </tr>
        <tr>
            <th>schema:accessMode</th>
            <td></td>
        </tr>
        <tr>
            <th>schema:accessModeSufficient</th>
            <td></td>
        </tr>
    </tbody>
</table>

### Conformance metadata

The following table provides a list of publishers who have stated that they are currently using
the conformance metadata properties in production or who are in the process of rolling out their
implementations.

<table>
    <thead>
        <tr>
            <th>Role</th>
            <th>[Publisher]</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        	<td>dcterms:conformsTo</td>
        	<td></td>
        </tr>
        <tr>
        	<td>a11y:certifiedBy</td>
        	<td></td>
        </tr>
        <tr>
        	<td>a11y:certifierCredential</td>
        	<td></td>
        </tr>
        <tr>
        	<td>a11y:certifierReport</td>
        	<td></td>
        </tr>
    </tbody>
</table>

## Validation and Authoring Tool Implementations

The Ace by DAISY validator provides machine checking of the EPUB Accessibility specification requirements.
A new version that supports the 1.1 specification will be released in 2022.

The Ace SMART tool assists users with carrying out manual verification of the EPUB Accessibility specification.
A new version that supports the 1.1 specification will also be released in early 2022. The tool additionally
allows authors to generate discovery and certifier metadata for use in their publications.


## Vendor Implementations

The accessibility metadata provided by publishers is used to aid discovery of publications by ...
