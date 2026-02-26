---
title: Security and privacy self review for EPUB 3.4
author: Publishing Maintenance Working Group
date: 2026-02-25
---

# EPUB 3.4 Security and Privacy Self-Review 

- **Date:** 2026-02-26
- **Author:** Publishing Maintenance Working Group

This is a security and privacy self-review for EPUB 3.4, based on the [W3C Security and Privacy Questionnaire](https://github.com/w3c/security-questionnaire/).

## What is EPUB 3.4?

EPUB 3.4 is a file format for digital books. It packages HTML, CSS, images, and other web content into a single `.epub` file that users read with reading apps (called "reading systems").

### Key specifications:
- [EPUB 3.4](https://w3c.github.io/epub-specs/epub34/authoring/) - The file format
- [EPUB 3.4 Reading Systems](https://w3c.github.io/epub-specs/epub34/rs/) - How apps should handle EPUB files
- [EPUB Accessibility 1.2](https://w3c.github.io/epub-specs/epub34/a11y/) - Accessibility requirements

### Non-normative documents 

Those companion documents are informative, they provide guidance related to implementing the EPUB 3 specifications as well as define experimental features.

* [EPUB 3.4 Overview](https://w3c.github.io/epub-specs/epub34/overview/), a non-normative overview of EPUB 3.4
* [EPUB Accessibility Techniques 1.2](https://www.w3.org/TR/epub-a11y-tech-12/): provides guidance on how to meet the EPUB Accessibility.
* [EPUB Accessibility - EU Accessibility Act Mapping](https://www.w3.org/TR/epub-a11y-eaa-mapping/): aims to demonstrate that the technical requirements of the European Accessibility Act related to ebooks are met by the EPUB standard.
* [The EPUB Accessibility exemption property](https://www.w3.org/TR/epub-a11y-exemption/): the exemption property is used to indicate that an EPUB publication that does not meet accessibility conformance requirements has an exemption under the applicable jurisdiction's laws.
* [EPUB Accessibility - Fixed Layout Challenges and Best Practices](https://www.w3.org/TR/epub-fxl-a11y/): provides guidance on how to make fixed-layout EPUB publications accessible.
* [EPUB Multiple-Rendition Publications 1.1 ](https://www.w3.org/TR/epub-multi-rend-11/): defines the creation and rendering of EPUB publications consisting of more than one Rendition.
* [EPUB 3 Structural Semantics Vocabulary 1.1](https://www.w3.org/TR/epub-ssv-11/): defines a set of properties relating to the description of structural semantics of written works.
* [EPUB 3 Text-to-Speech Enhancements 1.0](https://www.w3.org/TR/epub-tts-10/): describes authoring features and reading system support for improving the voicing of EPUB 3 publications.
* [EPUB Type to ARIA Role Authoring Guide 1.1](https://www.w3.org/TR/epub-aria-authoring-11/): provides guidance for publishers looking to move from the use of the EPUB 3 epub:type attribute to ARIA roles for accessibility.

## Questions and Answers

### 01. What information does features in your specification expose, and for what purposes?

The EPUB format itself defines the book structure and metadata; any collection of user data results from reading‑app design choices, not from requirements in the EPUB specification.

**EPUB format exposes (about the book):**  
- Book metadata (title, author, identifiers like ISBN) to let apps display and organize books in a library.  
- Links to resources (mostly files inside the EPUB, sometimes remote media like streaming audio/video) so the content can be rendered correctly.  
- Standard Web content (HTML, CSS, images, optional scripts) so reading apps can layout, style, and present the publication.

**Reading apps may collect (about you, if they choose to):**  
- Your reading position and bookmarks, so you can resume where you left off.  
- Your reading preferences (font size, themes, layout options), to personalize the reading experience.  
- Your reading time and progress, to show completion status and history.  
- Analytics and usage data, for business reporting, personalization, or publisher insights.

### 02. Do features in your specification expose the minimum amount of information necessary to implement the intended functionality?

Yes. EPUB only specifies what's needed to display a book:
- Book structure and content
- Packaging format
- Navigation data

EPUB doesn't define bookmarks, cloud sync, or analytics. Those are app features.

### 03. Do any of the features in your specification expose personal or personally identifiable information (PII), or information derived from either?

There are no built-in personal data fields. However:
- Books could include personalized content (e.g. student names in textbooks or purchase information in filigrees).
- DRM systems may link books to user accounts.
- Book titles alone can reveal sensitive information about readers.

The specification itself neither requires nor forbids such practices; it is agnostic, but acknowledges that EPUB is commonly deployed in ecosystems that process PII. 

### 04. How do the features in your specification deal with sensitive information?

EPUB doesn't have special privacy features. However:
- Many book topics are sensitive (medical, political, religious)
- Just knowing *what* someone reads can be highly private
- EPUB includes encryption for content protection, but this doesn't protect reading behavior

Reading systems therefore need policy and UX beyond what EPUB defines to avoid opaque surveillance of reading behavior tied to user identities. 

### 05. Does data exposed by your specification carry related but distinct information that may not be obvious to users?

Yes. Combining data can reveal:
- User interests, beliefs, health concerns
- Identity through device/network fingerprints
- Personal attributes from book choices

EPUB doesn't create these risks directly, but the ecosystem around it does.

### 06. Do the features in your specification introduce state that persists across browsing sessions?

EPUB 3.4 itself does not define any persistent state:

- There are no format‑level requirements to remember reading position, preferences, or annotations. 
- Any persistence is an implementation detail of the reading system (e.g., local databases, Web storage, or cloud sync), which may rely on the publication’s origin. 

The Reading Systems spec recommends giving each publication a unique origin, which implies origin‑scoped storage that *can* persist across sessions, but this storage is a Web Platform concern, not defined by EPUB core. 

### 07. Do the features in your specification expose information about the underlying platform to origins?

No. EPUB doesn't define any system information APIs. Scripts in books can only access what the reading app allows through standard web APIs.

Many reading systems disable scripting entirely or provide only a constrained subset, further limiting such exposure. 

### 08. Does this specification allow an origin to send data to the underlying platform?

No EPUB-specific capability. Any data transfer happens through normal web mechanisms that the reading app might enable.

### 9. Do features in this specification enable access to device sensors?

Only indirectly:
- Fixed-layout books respond to screen orientation (portrait/landscape)
- No new sensor APIs beyond what browsers already provide

Sensor risks are the same as HTML/CSS/JS in a constrained WebView, not an EPUB‑specific extension. 

### 10. Do features in this specification enable new script execution/loading mechanisms?

No:

- EPUB allows scripting but defers entirely to the HTML model for script execution and loading. 
- The Reading Systems spec recommends a *unique origin per publication*, which constrains scripts by origin and limits cross‑publication script interaction. 

EPUB 3.4 does not add new loaders, bytecode formats, or JS execution models beyond existing Web technologies. 

### 11. Do features in this specification allow an origin to access other devices?

EPUB 3.4 does not:

- Define APIs to access external devices (printers, USB, Bluetooth, local network devices). 
- Specify multi‑device sync; that remains a reading‑system feature (e.g., syncing reading position across a user’s phone and tablet) and is not described in the spec. 

Any inter‑device communication is therefore out of scope for the EPUB format and falls under reading‑system architecture and broader Web or native APIs. 

### 12. Do features in this specification allow an origin some measure of control over a user agent's native UI? 

No. Book content cannot:
- Control the reading app's menus or buttons
- Enter fullscreen mode
- Modify the app's navigation
- Hide the app's controls

### 13. What temporary identifiers do the features in this specification create or expose to the web?

The EPUB 3.4 format itself defines only publication‑level identifiers:

- A required package‑level identifier (dc:identifier, referenced by unique‑identifier) identifies the publication, not the user. 
- Reading Systems spec continues to recommend assigning each EPUB publication instance a unique origin, which in practice acts as an origin‑scoped identifier for Web storage and cookies. 

The spec does not define user, session, or tracking identifiers; those arise from reading‑system implementation choices and generic Web storage mechanisms. 

### 14. How does this specification distinguish between behavior in first-party and third-party contexts?

EPUB uses the web's origin model. Books may embed ads or external content, but isolation details are up to reading apps and browser security.

### 15. Does EPUB support private/incognito mode?

EPUB doesn't define this. Whether a reading app offers private reading mode is up to the app.

### 16. Does EPUB have security and privacy sections?

Yes. Both the core spec and Reading Systems spec include security and privacy sections that can be found in the latest Editor’s Drafts:  
- EPUB 3.4 Core: https://w3c.github.io/epub-specs/epub34/authoring/#sec-security-privacy
- EPUB Reading Systems 3.4: https://w3c.github.io/epub-specs/epub34/rs/#sec-security-privacy 

### 17. Do features in your specification enable origins to downgrade default security protections?

No. EPUB doesn't provide ways to:
- Bypass HTTPS
- Relax same-origin policy
- Weaken security controls

Reading systems are encouraged to strengthen isolation.

### 18.  What happens when a document that uses your feature is kept alive in BFCache (instead of getting destroyed) after navigation, and potentially gets reused on future navigations back to the document?

EPUB doesn't specify this. If a reading app supports browser-style caching, standard web rules apply.

### 19. What happens when a document that uses your feature gets disconnected?

EPUB defers to the app and platform:
- No special cleanup requirements
- Apps manage reading position and storage
- Standard web document lifecycle applies

### 20. Does your spec define when and how new kinds of errors should be raised?

No, EPUB 3.4 does not define new kinds of error: 

- EPUB 3.4 uses standard W3C/RFC conformance keywords ("MUST", "MUST NOT", etc.) to identify authoring violations that reading systems treat as errors (e.g., invalid ZIP containers, missing manifest attributes). 
- Reading systems must handle some cases explicitly, like processing malformed packages or fallbacks, but without prescribed error-raising syntax or UI. 
- Validation relies on external tools like EPUBCheck; runtime errors surface via reading system logs or dev tools, not format-defined events. 

### 21. Does your feature allow sites to learn about the user's use of assistive technology?

No. EPUB doesn't expose whether screen readers or other assistive tech are active. Books can be made accessible, but can't detect who's using what technology.

### 22. What should this questionnaire have asked?

- Should EPUB and Reading Systems specs together constrain or at least *document* collection, retention, and sharing of reading analytics so that users can understand and control surveillance of their reading behavior?
- How can EPUB 3.4 better align with the Web privacy model (e.g., clearer guidance on origins, third‑party resources, and tracking) while recognizing that most reading systems are not general‑purpose browsers? 


## Key Privacy Takeaways

EPUB 3.4 itself is privacy-neutral. Privacy outcomes depend heavily on how reading apps and retail platforms implement and deploy EPUB content.

### What EPUB Format Controls (Low Risk)
- Book metadata and structure
- Content packaging
- Isolated storage per book

### What Reading Apps Control (Higher Privacy Risk)
- Reading position tracking
- Cloud synchronization
- Analytics and telemetry
- Network access
- User profiling

### What Ecosystem Does (Highest Privacy Risk)
- DRM binding to accounts
- Purchase history tracking
- Reading behavior analysis
- Cross-device tracking