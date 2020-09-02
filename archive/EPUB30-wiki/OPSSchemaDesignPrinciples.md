

# Composition #
  * Utilize a file-level modular approach for the schema content, but not necessarily the very fine-grained modularity used by XHTML11MOD etc. The purposes of file-level modularity are:
    * ease of reading/authoring (no supersized monolith schema)
    * ease of composition: reduce need for driver-level manipulation
    * encourage reuse in future contexts
_MURATA: What we need is a different type of mudularity: well-cooked HTML5, halfly-cooked HTML5, and embryonic HTML5.  Does the HTML WG provide such classification?_
  * Utilize a set of global named element and attribute classes, in the element case mapping to the [kinds of content](http://dev.w3.org/html5/spec/Overview.html#kinds-of-content) of the HTML5 language. To facilitate future changes and extensibility, maximize the usage of these classes (always used except in documented cases)
  * Use drivers to compose the concrete document model by selective imports, overrides and class contributions additional to those in the modules themselves
  * Let the schema modules assume a default document model, e.g. the model that results from constructing a driver that contains only imports and no overrides/added class contributions. Let this model correspond as closely as possible to the HTML5 specification model. _Note: this practically means: an element or attribute contributes itself to the global named class that it by default belongs to; the driver need not do this_
  * At the atomic define level, break out element content models and attribute models to individual defines to facilitate external contributions by minimizing the need for overrides. _Downside is that this will expand the size of the schema considerably_

# Extension points #
  * Extensibility is supported via contributions to the global named classes mentioned above, and through access to atomic defines where needed (akin to salami slice).
> _MURATA: I think that we should rely on NVDL for extensions. Customization  are difficult maintain and understand._

# Pattern-based constraints #
  * Use ISO Schematron for expressing pattern-based constraints
    * ?? embed the assertions in the RNG files (in contextually relevant locations) ??
    * OR ?? Use separate ISO schematron schema(s) ??
  * Or use simple XPath expressions and prose.

# Datatypes #
  * As all known RelaxNG implementations supports the XSD 1.0 datatypes, utilize these where appropriate (which, granted, doesn't happen very often)
  * ?? Use a dedicated datatype library based on [pluggable datatypes](http://www.thaiopensource.com/relaxng/pluggable-datatypes.html) ?? _Could reuse/build upon the one used by [validator.nu](http://hsivonen.iki.fi/html5-datatypes/)_
_MURATA: Not to miss the deadline for EPUB3, I would propose to stick to XSD Part 2 and merely provide readable aliases._
  * Do not use the xsd:ID and xsd:IDREF(S) datatypes.  If uniqueness of identifiers has to be checked, write a simple XPath expression and state that each of the located elements or attributes is required to have a unique value.  Do something similar to references to identifiers.  Note that this solution avoids the [datatypes conflict problem](http://blog.jclark.com/2009/01/relax-ng-and-xmlid.html) _* Place all datatype definitions (inc those for for ID and IDREF) in a separate datatypes proxy module that all users must reference, so that the implementation can easily be swapped by modification in one single location (the proxy)._ This helps us both to vary the solution to the ID/IDREF problem easily, as well as turn pluggable datatype library support on/off. Note: helps, but doesnt completely solve the problem, as this proxy wouldn't be used by imported third party fragment schemas unless extensively redefined MURATA: I don't think that this is needed.

# DTD Compatibility #
Do not use the any feature from [RELAX NG DTD Compatibility](http://www.relaxng.org/compatibility-20011203.html) apart from, possibly, _a:documentation_. with the caveat that imported third party schemas may be using these features in a way that is extremely cumbersome to redefine.

# Documentation #
  * Use simple inline [a:documentation](http://www.relaxng.org/compatibility-20011203.html#IDAC1YR)

# Syntax #
As all existing EPUB RelaxNG schemas use the XML syntax, stick with that for consistency. Use Trang to provide an informative RNC version post-hoc. This also provides for the ability to use markup in documentation.

# Example #
A small toy example of schema design roughly as per above exists in [a sandbox](http://code.google.com/p/zednext/source/browse/#svn/sandbox/ZedDist/src/schema)

James Clark's classic [Modularization of XHTML in RELAX NG](http://www.thaiopensource.com/relaxng/xhtml/) also utilizes a majority of the princples outlined above.