

# Introduction #

This page shows possible options for adopting or not adopting CSS3, which
is still under development.  None of the features required for
EGLS have reached the candidate recommendation status.

# Options #

## Solution A: Wait for CSS3 ##

We wait until CSS3 is finished. Don't adopt unfinished CSS3 features.

**Pros:**

  1. Highly standards compliant
  1. Very little effort for our WG
  1. Does not require re-bloating our spec with styling info
  1. Rigorous testing and implementation requirements at W3C should produce a stable spec

**Cons:**

  1. Extremely fluid timeframe which does not align with our schedule
  1. Critical features may not be ready before next global extinction event
  1. Suicide for EPUB

## Solution B: Introduce experimental CSS3 properties with our own prefix ##

We adopt CSS3 properties in working drafts (i.e., not-yet candidate recommendations) with a prefix (e.g. -idpf-writing-mode, -idpf-text-emphasis).

**Pros:**

  1. Aligns our spec with possible final CSS3 specs
  1. Limited bloat for our spec (we could reference drafts and list the requirement for the -idpf prefix)

**Cons:**

  1. Moving target may cause problems as we move forward. For instance, if we update the spec in 2 years, but writing-mode has changed in the CSS 3 draft in ways we want to incorporate how do we identify which -idpf-writing-mode we should support?
  1. Not interoperable with other tools and CSS User Agents
  1. May require an additional level vendor prefix for our draft implementations. E.g. would we need -webkit-idpf-writing-mode?
  1. Many of the early drafts are likely to change, so "Pro #1" seems an unlikely benefit

## Solution C: Introduce EPUB specific properties ##

We invent our own properties without waiting for CSS3.

**Pros:**

  1. Full control of specific features
  1. We control the timeline and can make sure critical features are added ASAP

**Cons:**

  1. Potential conflict with CSS 3 features when they become available, especially in cases where there is overlap in functionality
  1. Existing tools will not understand our extensions
  1. We have had limited success in getting this used in the past (see oeb-page-head/foot)
  1. Requires bloating our spec with more style information

## Solution D: Introduce non-CSS style information ##

We use style specification other than CSS3.

### D1: Non-CSS stylesheet languages ###
Use other stylesheet languages such as XSL-FO or our own.

### D2: Style information in OPF packages ###
Add style info (especially, horizontal/vertical text direction) in OPF package document.
  * Add 'text-direction' and 'page-progression-direction' attributes in OPF

**Pros:**
  1. We control OPF, so we can add features here that will not conflict with other specs
  1. Once again, we control the features and timeline, so these can be added ASAP
  1. Allows for centralized, package level styling so Reading Systems can easily check for required features (e.g. vertical text)

**Cons:**
  1. Not very granular, so an entire book would have to be in vertical text, with no horizontal text even in page headings. Or a book would either have to use hyphenation or not, you would not be able to style `<p>` with hyphenation, but `<h1>` without.
  1. Pro #1 may not be true, as there can still be conflicts with the CSS cascade, especially when new CSS3 modules are finally adopted and added.
  1. Spec bloat

### D3: EPUB specific HTML classes ###
Introduce EPUB specific HTML class names and define their styles rather than using CSS3 properties.
  * Define class names for emphasis marks

**Pros:**
  1. Can be implemented internally using vendor specific CSS without exposing that publicly
  1. Again, our features, our timeline
  1. Granular - specific elements can be styled
  1. Plays well with existing CSS (additional styling can be added to the pre-defined classes)
  1. Once CSS3 modules become final, specific class names can be phased out by replacing them with default style sheets

**Cons:**
  1. Pollution of class names with our specifics
  1. Spec bloat
  1. Vague in that only boolean properties can be implemented (no values)
  1. Inheritance may be confusing when mixed with CSS

## Solution E: Introduce IDPF private at-rule ##

At rule can provide a scope for IDPF-specific CSS extensions without breaking compatibility with the "common" CSS (which is guaranteed to ignore unknown at-rules) and without needlessly repeating prefixes:

```
@idpf {

body { writing-mode: vertical; margin: 2px; }

}
```

In this example we can always assign our own meaning to writing-mode, even if CSS ends up defining it differently in the end.

**Pros:**
  1. Easy to implement, even in JavaScript
  1. Total flexibility: our timeline, our definition

**Cons:**
  1. Regular CSS properties and extended properties are not easy to mix.
  1. Inheritance may be hard to define
  1. Cannot use style attribute (which is deprecated, though)