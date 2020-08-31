_Note: this page is a discussion area, nothing stated herein is agreed resolutions_



## Issues ##
Here are the issues that have surfaced so far with regards to scripting in EPUB:

### **A** Unrestricted scripting potentially impacts dynamic pagination negatively ###
Reading systems that do dynamic pagination/reflow run into trouble if the DOM can change unpredictably (outside of given, fixed-size rectangles).

### **B** Not all reading systems support scripting ###
... and nor should we require them to in 3.0. This includes reading systems that are not built on top of HTML browser components for example.

### **C** Scripting is potentially harmful for accessibility ###
Refer to http://www.w3.org/TR/WCAG-TECHS/failures.html for some examples.

### **D** Need to have interoperable scripting solution ###
See Design Guidelines: _author content once, consume everywhere, with a predictable user experience_. If device does support scripting, at lest some features must be supported interoperably.

### **E** Scripting potentially impacts publication reliability ###
Scripts from multiple sources may not co-exist gracefully, and differences in User Agent implementation of DOM APIs & JavaScript engines create issues with portability of content that includes scripts. This is a bigger issue for digital books and other publications that require longevity/archivability vs. typical Web pages that are, relatively, ephemeral.

### **F** The HTML5 processing model for scripted content is highly complex, underspecified, and not finalized ###
As HTML in browsers is becoming more a web application deployment platform than a document format, more and more of the HTML5 specification deals with the DOM, other APIs, events, and the overall flow of processing from a programmatic perspective. This processing model is complex and interdependent to the point that the HTML5 spec draft effectively punts on a formal specification, stating that "Various mechanisms can cause author-provided executable code to run in the context of a document. These mechanisms include, but are probably not limited to:...". Some HTML5 features have little manifestation in traditional elements/attributes (e.g. canvas), others have none at all (local DB storage, Web Workers). Attempting to subset HTML5 in any meaningful way would be quite challenging to get right and consume a lot of WG resources in attempting to specify, especially given that OPS is intended to be processed as data (for presentation to users, e.g. pagination) and that OPS has historically never specified any APIs or events. This problem is exacerbated by the expectation that the HTML5 specification will remain at least somewhat in flux through our WG charter period. And this effort would likely be of little effect, if, as expected, a browser engine ends up being used whenever scripting is implemented.

### **G** We don't have clarity on all the use cases for interactivity or scripting ###
Since interactivity is a relatively novel feature for digital books, and web-app best practices are still emerging for the Web as a whole, it is not yet clear what all the uses cases are. There are use cases that involve modification to document-level content, so restricting scripting to a fixed-size rectangle separate from such content is not necessarily practical (see interactivity subgroup wiki page for more details). As well, this lack of clarity means that any attempt to restrict script behaviors might not be accepted.


---


## Solutions ##
### A ###
#### A1 ####

  1. Discern between two types of scripting: _document-level_ and _container-constrained (note document-level also called "chapter level")_.
    * Document-level scripting is defined as:
      * Scripts of type `<script>` that manipulate content at a document-wide level
      * Scripts executing within the context of `<iframe>` or `<object>` , that manipulate content outside their containing rectangle, and/or change the size of their containing rectangle
    * Container-constrained scripting is defined as `<iframe>`, `<object>`, when **not** manipulating content outside their containing rectangle, and/or change the size of their containing rectangle
    * All items that contain document-level scripting should be declared as such in the OPF
  1. Impose restrictions on the types of scripting that can occur at the document level
    * limit script definition  (e.g. only in document `<head>`)
    * limit script execution (e.g. only to certain event handlers like document.ready, and user interaction events on DOM content)
  1. Encourage cross-platform implementations through interfaces/events
    * Define our own named events that reading system authors can hook into that reading systems are _required_ to implement, eg: "epub:ready", "epub:pageturn". (Modern JavaScript engines already support defining custom events.)
    * Reading system developers must provide complete documentation of the list of events they support and the behavior of their applications to those events.
    * Reading systems may define additional events in their own "namespace".
  1. For document-level scripting, have the spec express a requirement that only progressive-enhancement-type scripts be used


---

### B ###
_(Background reading: [EPUB 2.01 prose on script and noscript](http://www.idpf.org/doc_library/epub/OPS_2.0.1_draft.htm#Section2.3.7))_

#### B1 ####
**In the context of document-level scripting**: by requiring the use to be constrained the purposes of progressive enhancement, we say that an EPUB must retain its fundamental informational integrity even when consumed in a reading system with no scripting support.

_Note: the use of progressive-enhancement-only scripting can not be machine-enforced (e.g. EPUBCheck wont be able to tell when this req is violated)._


**In the context of container-constrained scripting**:
  * at least in the case of canvas, fallback content must always be provided, as per the HTML5 spec.
  * @@@ fallback for scripts in iframe? The content of the script element?

_Note [there's a suggestion to make `&lt;noscript&gt;` obsolete but conforming](http://www.w3.org/Bugs/Public/show_bug.cgi?id=10068) in HTML5_



---

### C ###
#### C1 ####
This is a general problem inherited from the web; we do not introduce any special remedial features of our own, but instead rely on solutions from the web space (referencing WCAG guidelines, supporting ARIA markup). See also B1 above.


---

### D ###
#### D1 ####

_container-constrained_ scripting can be defined in interoperable manner and mandated for all systems that support any form of scripting.


---

### E ###
#### E1 ####

Same solution as C - we rely on solutions from the web space. Also, we have a higher degree of predictability based on solution to A.

### F ###
#### F1 ####

Give up on an OPS 3.0 that is other than a strict superset of HTML5, and specify that the processing model is HTML5's (in effect OPS 3.0 becomes a very thin spec). Problem is, this means a browser engine would become implicitly required to processing EPUB3.

#### F2 ####

Define that EPUB3 can contain either OPS 3.0 or HTML5, which is optional for Reading System support, cleanly separating all scripting to occur only in HTML5 and when rendered by a scripted-enabled Reading System, according to HTML5 processing model. See: ScriptingImplementationProposal for more details.

### G ###

Both solutions to F should resolve this concern, since they presume scripted content will be processed as full HTML5.

# Areas of Agreement and Disagreement #

This section restructures the discussion above (and elsewhere), as a list of declarations intended to be introduced (with modification) to the specification(s). It is grouped by the speculated level of consensus, with individual declarations moving up the list with refinements (or being removed completely).

## Topics with consensus ##

  * Reading Systems MAY support scripting (Unconstrained or Constrained).
  * Reading Systems MAY place limitations on the _capabilities_ (in the Caja sense) provided to scripts, such as limiting networking or DOM access.
  * Scripting MAY have a negative impact on accessibility (reference WCAG guidelines & ARIA).
  * Scripting MAY have a negative impact on document longevity.
  * Scripting MAY have a negative impact on interoperability.
  * Scripting MAY have a negative impact on compatibility.
  * Supporting unconstrained and/or constrained scripting might be impossible for some pagination models.
  * Document authors SHOULD prefer declarative markup to scripting whenever practical.

## Topics near consensus ##

  * Content Documents that include constrained scripting MUST include a declaration to that effect in the OPF.
  * Content Documents that include unconstrained scripting MUST include a declaration to that effect in the OPF.
  * Document authors SHOULD use [enhancement techniques](progressive.md) to support the widest range of reading systems when implementing scripted content.
  * Scripts MUST appear in the document `<head>`.
  * Scripts MUST NOT appear outside the document `<head>`.
  * [about fallbacks here](Something.md)
  * JavaScript 1.5 is RECOMMENDED for greatest interoperability and compatibility, but other versions and scripting languages MAY be supported.

## Topics without consensus ##

  * A Reading System that supports Constrained Scripting provides conforming Content Documents an execution environment for properly defined scripts and access to manipulate DOM elements inside an `<iframe>` or `<object>` with a fixed size.
  * A Reading System that supports Unconstrained Scripting provides conforming Content Documents an execution environment for properly defined scripts with fewer restrictions than Constrained Scripting. These Reading System MAY impose significant limitations on the capabilities and access provided to scripts for security, accessibility, or other reasons.

  * We may have to define JavaScript events or other hooks/APIs to try to get toward interop for common problems/solutions (`epub3:ready`, `epub3:pageturn`)
  * Reading Systems SHOULD provide documentation of their support for scripting (including none), scripting languages, events, and capability and other constraints.

## Specification proposal ##

The specification itself would outline all of the concerns and requirements above, then recommend the most interoperable scripting approach as:

  * JavaScript 1.5
  * exclusively in the `<head>`
  * with the OPF `scripting="constrained"` declaration
  * that only modified an `<iframe>` or `<object>`

A more specific proposal is here: ScriptingImplementationProposal