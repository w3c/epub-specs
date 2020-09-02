# Introduction #

This is a placeholder page for advanced adaptive layout work.

On July 20 IDPF held WorkshopOnAdvancedAdaptiveLayout . Several Workshop attendees and others have volunteered to participate in an ad hoc group to draft a proposed IDPF Working Group charter for work in this area. This page is intended to hold work-in-progress towards the proposed charter.


# Ad Hoc Group Members #

(please add yourself to volunteer to work on charter drafting. and email Markus -dot- Gylling -at- gmail.com with your email address)

  * Markus Gylling (DAISY Consortium) - Coordinator
  * Peter Sorotokin (Adobe)
  * Brady Duga (Google)
  * Garth Conboy (Google)
  * Ron Severdia (Metrodigi)
  * Roger Webster (B&N)

# Draft Charter #

## Goals ##

  * nable CSS Regions/Exclusions/Floats to be used within EPUB content prior to reaching W3C Candidate Recommendation status without requiring per-Reading-System prefixes.
  * Enable declarative expression of complex page masters and page master selection built on CSS Regions (including reusable content, expressions, …)
  * Enable styling to be applied to region content???
  * Enable declarative interactivity (CSS Animations/Transitions)
  * Other priorities??

## Constraints ##
  * All capabilities to be added only as optional CSS constructs – no mandatory EPUB extensions, nothing that causes EPUB containing it to be invalid wrt EPUB 3.0 and fallback should be automatic and graceful
  * All capabilities to be implementable on modern browsers (esp. Webkit on IOS) via JavaScript “shim”
  * Minimize deviation from W3C specifications & maximize opportunity for any added constructs to evolve into W3C specifications in the future

## Timeline ##
  * WG Draft by Oct 1, 2011
  * Proposed Specification by Feb 2012
  * Rec Specification by July 2012