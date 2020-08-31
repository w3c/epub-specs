# Linking using Service Provider OPF entry #

## Problems with URL/URI-based links ##

One problem with URL-based links is that while we have a lot of ideas on the "tail" of the link, there is no consensus on the "prefix" of the link. We considered these alternatives:

### Hardcoded URL to a particular resolver ###

This is certainly doable even in EPUB2 - e.g. link to a target book website in you favorite ebook store.

The problems are that it is not vendor-neutral, and is unlikely to live very long (as sites disappear, content get rearranged, etc.)

### Custom (EPUB) URL scheme ###

Idea is to create URLs with our own scheme, e.g. "epub:FOOBAR"

This is not acceptable to some members and will likely to cause controversy.

### URL pattern ###

The idea is to designate URLs that match certain patterns as conceptual "resolvers", e.g. anything that starts with "http://epub." is actually an EPUB reference.

## OPF Service Provider entry ##

### Syntax ###

The proposal is to declare an entry in the package that would be referenced from other parts of EPUB (like all other package items), but which would not correspond to a particular package _resource_. Instead, it would correspond to a _service provider_, e.g. a link resolver.

For example:

```
<item href="resolver" service-type="http://services.idpf.org/link-resolver"/>
```

Note that the item does not have media-type and instead has service-type (which is a URI to identify the type, not URL). There is no actual file named "resource" included in the package.

This item can be referenced from link's href attribute as usual, but typically with query string:

```
<a href="resolver?uid=FOOBAR">that other book</a>
```

Query string format is determined by the service provider.

Note that this functionality is not is not limited to cross-publication linking, it can be used, for instance to link to internet search providers. It also can be integrated with OpenURL.

One way to think of it is a mechanism to implement "lightweight" custom URL schemes.

### Processing model ###

The simplest way to implement a service provider is to treat it as a configurable URL. For instance, there may be an ebook search engine that exposes search web service at the address http://example.com/link-resolver, which is compatible with service type "http://services.idpf.org/link-resolver". If user selected that service provider, the URL in the example above will be expanded to "http://example.com/link-resolver?uid=FOOBAR". User agent also can implement some request types internally, for instance searching for a publication in the local library.

### Standard service provider types ###

#### Intenet search ####

Note: we may not need it, but it makes a good example.

| Service-type | http://services.idpf.org/search |
|:-------------|:--------------------------------|
| Query format | ?q=term |
| Expected result | HTML file with search results |

Example of a compatible provider would be http://www.google.com/search

#### Simple EPUB link ####

| Service-type | http://services.idpf.org/epub-link |
|:-------------|:-----------------------------------|
| Query format | ?u=uid`[`&t=timestamp`]` |
| Expected result | XHTML+RDFa file with search results |

Expected result should be a human-readable HTML file with search results marked-up with RDFa microformat (probably need someone to straighten up the syntax).

```
<html ...>
...
<body>
...
<ul>
<li typeof="reference">
<span property="dcterms:title>Title</span>
...
<a property="direct-link" href="...">...</a>
</li>
</ul>
...
</body>
</html>
```

#### OpenURL ####

| Service-type | http://services.idpf.org/openurl |
|:-------------|:---------------------------------|
| Query format | defined by OpenURL |
| Expected result | defined by OpenURL |