name: EPUB Type to ARIA Role Authoring
description: Issue related to the EPUB Type to ARIA Role Authoring Guide Working Group Note
labels: Spec-EPUBTypeToAria
body: 
  - type: markdown
    attributes:
     value: "## Issue on the [EPUB Type to ARIA Role Authoring Guide](https://www.w3.org/TR/epub-aria-authoring/) WG Note"
  - type: markdown
    attributes:
     value: __Before opening an issue__, please check that it has not already been resolved in the latest [editor's draft](https://w3c.github.io/epub-specs/wg-notes/epub-aria-authoring/)
  - type: input
    id: section
    attributes:
      label: Section
      description: Please provide a link to the relevant section of the specification
    validations:
      required: false 
  - type: textarea
    id: problem
    attributes:
      label: Describe the problem
      description: What is not working? What would you like to see improved? For bug reports, cite the relevant text from the specification.
    validations:
      required: true
  - type: textarea
    id: fix
    attributes:
      label: Describe the fix or new feature you propose
    validations:
      required: false
