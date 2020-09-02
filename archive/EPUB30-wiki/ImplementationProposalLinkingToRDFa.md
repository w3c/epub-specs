# Implementation Proposal for Linking: links to RDFa-encoded reference data #

## Encoding References ##

References are encoded in HTML to be human readable and complaint to appropriate standards for human-readable citations (e.g. MLA). Simultaneously reference data is marked-up using RDFa to be machine-processable.

```
<html xmlns:ref="http://www.idpf.org/rdf/reference#" 
xmlns:dc="http://purl.org/dc/terms/" ...>
...
<p typeof="ref:reference" id="ref20">[20]
<span property="dc:identifier" style="display:none">urn:isbn:9780849395840</span>
<span property="dc:creator">Kreider, Jan F.</span>, ed.
<span property="dc:title">Handbook of Heating, Ventilation, and Air Conditioning</span>. 
<span property="ref:city>Boca Raton</span>: 
<span property="dc:publisher">CRC</span>, 
<span property="dc:created">1993</span>.
</p>
...
</html>
```

## Linking ##

Links to an EPUB document (or potentially any other type of publication) are simply hyperlinks to an HTML/XHTML document with fragment identifier which points to an HTML element that represents a reference. Using example above:

```
<a href="#ref20">...</a>
```

or

```
<a href="references.xhtml#ref20">...</a>
```

## Processing ##

No particular processing is required. Reading systems MAY provide an option to resolve RDFa data in the reference into actual publications using local document database or online access (e.g. OPDS feeds). Reading systems also MAY allow an option to resolve links to references into actual publications.
