
#  Repo subdirectory for the EPUB Annotation vocabulary

## URL structure for the final vocabulary and context

(Tried to be as close to the oa setup as possible!)

- Official vocabulary: https://www.w3.org/ns/ea#
- Official JSON-LD context: https://www.w3.org/ns/epub-anno.jsonld (which imports http://www.w3.org/ns/anno.jsonld)

To be done to get this right (in this order)

1. Publish to a safe place the generated vocabulary files (i.e., index.ttl, index.jsonld, index.html). There are two possibilities, depending on the WG decision:
   1. Leave it in place on the repo, in which case the URLs will be https://w3c.github.io/epub-specs/epub34/annotations-vocab/index.{html,ttl,jsonld} (exact repository place t.b.d.). Or
   2. Officially publish the HTML file as a note, and store the ttl and jsonld in /TR. The URLs will be https://www.w3.org/TR/epub-ann-vocab/ for HTML, and https://www.w3.org/TR/epub-ann-vocab/index.{ttl,jsonld}, as well as the context file (vocabulary.context.jsonld)

2. Set up, through the W3C redirection for https://www.w3.org/ns/ea.{html,ttl} and the context file URL https://www.w3.org/ns/epub-anno.jsonld to the "real" files. Depending on the choices made above
   1. Use the [w3c-github proxy service](https://www.w3.org/admin/webrewrites/list) to do the job (if things stay on github); or
   2. Add the following rules to https://www.w3.org/.htaccess:

    ```
    RewriteRule ^ea.jsonld$ https://www.w3.org/TR/epub-ann-vocab/index.jsonld [P]
    RewriteRule ^ea.json$ https://www.w3.org/TR/epub-ann-vocab/index.jsonld [P]
    RewriteRule ^ea.ttl$ https://www.w3.org/TR/epub-ann-vocab/index.ttl [P]
    RewriteRule ^ea.html$ hhttps://www.w3.org/TR/epub-ann-vocab/ [P]
    RewriteRule ^epub_anno.jsonld$ https://www.w3.org/TR/epub-ann-vocab/index.context.jsonld [P]
    ```

1. Add a redirection .var file to https://www.w3.org/ns/ea.var:

    ```
    URI: ea

    URI: ea.html
    Content-Type: text/html

    URI: ea.ttl
    Content-Type: text/turtle; qs=0.6

    URI: ea.jsonld
    Content-Type: application/ld+json; qs=0.5

    URI: ea.json
    Content-Type: application/json; qs=0.4
    ```

My current preference is to publish this as a note. The current setup of the files and the vocabulary information in the yml file reflects that.
