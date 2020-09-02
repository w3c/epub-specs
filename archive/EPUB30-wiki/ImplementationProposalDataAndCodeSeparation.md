# Introduction #

In many cases an interactive presentation can be thought of some sort of a "widget" that presents some data type. For instance a chess game may be recorded using standard chess move notation and presented as an animation. A slideshow can be recorded as a list of images and played inside a special widget. Widgets many be developed, tested and shared between EPUB authors, who can use them without need to code.

Inline widget portion of this proposal addresses issue I-3 and provides interoperable scripting for paginated views.

# Changes required to spec #

  * Add new bindings section in OPF file and mediaType element.
  * Modify the description of the object element processing

# Details #

The idea is to bind custom media types is bound with a particular implementation file. An implementation is instantiated using standard object tag from either scriptable or non-scriptable XHTML file. The object tag must directly (through data attribute) reference a resource with a custom media type:

```
<object data="game.chess" type="application/vnd.acme.chess-game">
  <!-- fallback for no scripting case -->
</object>
```

In paginated contexts object instances may overflow (if styled without possibility of small display surface in mind), but should not, in general, be duplicated across pages. If they are duplicated, it should be done in a way that reuses the same widget instance in both cases.

Binding of a media type to an implementation file is defined in OPF file using a new mediaType element (placed in a new section, "bindings"):

```
<bindings>
  <mediaType media-type="application/vnd.acme.chess-game" handler="impl-resource-id"/>
</bindings>
```

Note: mediaType element could also potentially be used to supply other information about custom media type, such as schema, etc.

impl-resource-id is an id of the implementation resource. Implementation should be given as an application/xhtml+xml file with embedded scripting that is instanciated as if it were directly referenced from the object tag, but with URL parameters (which go after '?' in a URL):
  * src - URL to the resource that is being displayed
  * type - resource media type

Non-ASCII and non-URL-safe characters (e.g. '=') should be escaped in the usual manner (UTF-8 encoding and using %XX escapes).

Object parameters, if any, (from param children of object tag) are also given as URL parameters.

## Sample ##

I have uploaded a sample in the download section named codeDataSeparation.epub