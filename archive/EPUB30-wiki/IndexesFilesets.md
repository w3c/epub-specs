[Back to Indexes Main Page](IndexesMainPage.md)



# Problem description #

_Note: This page is a follow-up to a discussion held within the Index WG, but most of its concepts apply directly to Dictionaries too. Both Index and Dicitonary WGs will probably want to collaborate on this issue and adopt a unique solution_

Some indexes are expected to be very large documents and may be split across several XHTML Content Documents. Additionally, a Publication may contain one or several indexes, possibly in addition to other content. The spec needs to describe the way to **identify a cohesive set of file as an index** and to **differentiate all the indexes** of the Publication. This will notably allow reading systems to render indexes as complete and cohesive units, independently of the regular Content Documents rendering mechanisms.

## Package Document vs Navigation Document ##

The identification of the index file set can be done in either the [Package Document](http://idpf.org/epub/30/spec/epub30-publications.html#sec-package-documents) or the [Navigation Document](http://idpf.org/epub/30/spec/epub30-contentdocs.html#sec-xhtml-nav) of the publication.

On the one hand, relying on the Navigation Document allows to kill two birds with a stone, as it would cover both the file set identification and the navigation requirements. On the other hand, the package document is the primary source of information about the publication's file set and other structural metadata and is the natural place to describe indexes' file sets. See the next sections for more thoughts on pros and cons.


# Approach 1: Using Package Document metadata #

Package Documents have built-in support for describing metadata expressions to enhance the meaning of publication resources, via the [`meta` element](http://idpf.org/epub/30/spec/epub30-publications.html#sec-meta-elem) combined with its `refine` attribute.

This mechanism can be used to describe that some resources are part of an index and furthermore associate a common label to the files representing the same index:

```
<package … prefix="epub: http://idpf.org/epub-components">
    …
    <metadata>
        …
        <meta property="epub:index" refines="#indexA1">index A</meta>
        <meta property="epub:index" refines="#indexA2">index A</meta>
        <meta property="epub:index" refines="#indexA3">index A</meta>
        <meta property="epub:index" refines="#indexB1">index B</meta>
        <meta property="epub:index" refines="#indexB2">index B</meta>
        <meta property="epub:index" refines="#indexB3">index B</meta>
        …
    </metadata>
    <manifest>
        …
        <item id="indexA1" href="indexA1.xhtml" media-type="application/xhtml+xml">
        <item id="indexA2" href="indexA2.xhtml" media-type="application/xhtml+xml">
        <item id="indexA3" href="indexA3.xhtml" media-type="application/xhtml+xml">
        …
        <item id="indexB1" href="indexB1.xhtml" media-type="application/xhtml+xml">
        <item id="indexB2" href="indexB2.xhtml" media-type="application/xhtml+xml">
        <item id="indexB3" href="indexB3.xhtml" media-type="application/xhtml+xml">
    </manifest>
    …
</package>
```

Note: Reading Systems should ignore all meta elements whose property attributes define expressions they do not recognize. A Reading System must not fail when encountering unknown expressions.

Pros:
  * built-in functionality
  * file set metadata stay in the package document
Cons:
  * verbose: requires one `meta` element for each involved resource

# Approach 2: Extension attribute on Package Document's manifest items #

Rather than relying on the metadata section, the grouping could be added directly on the [`item` elements](http://idpf.org/epub/30/spec/epub30-publications.html#sec-item-elem) describing file resources. The element already has a `properties` attribute that can be used to add additional semantics to resources. However the values come from a defined enumeration and thus could not be used to differentiate two separate indexes. The solution would be to define a new attribute that would hold the name of the index:

```
<package … prefix="epub: http://idpf.org/epub-components">
    …
    <manifest>
        …
        <item id="indexA1" href="indexA1.xhtml" media-type="application/xhtml+xml" properties="index" groupId="indexA">
        <item id="indexA2" href="indexA2.xhtml" media-type="application/xhtml+xml" properties="index" groupId="indexA">
        <item id="indexA3" href="indexA3.xhtml" media-type="application/xhtml+xml" properties="index" groupId="indexA">
        …
        <item id="indexB1" href="indexB1.xhtml" media-type="application/xhtml+xml" properties="index" groupId="indexB">
        <item id="indexB2" href="indexB2.xhtml" media-type="application/xhtml+xml" properties="index" groupId="indexB">
        <item id="indexB3" href="indexB3.xhtml" media-type="application/xhtml+xml" properties="index" groupId="indexB">
    </manifest>
    …
</package>
```

Pros:
  * file set metadata stay in the package document
  * less verbose
Cons:
  * requires the introduction of a new attribute, this may not be possible/desirable

_Note_: tagging index resources as having the property "index" is also relevant in approach 1 above.

# Approach 3: Extension element on the Package Document #

This approach introduces a new `components` section in Package Documents that can be used to identify file groups. Each `comp` element can be seen as the dedicated "spine" of a component.

```

    <package … prefix="epub: http://idpf.org/epub-components">
        …
        <manifest>
            …
            <item id="indexA1" href="indexA1.xhtml" media-type="application/xhtml+xml" properties="index">
            <item id="indexA2" href="indexA2.xhtml" media-type="application/xhtml+xml" properties="index">
            <item id="indexA3" href="indexA3.xhtml" media-type="application/xhtml+xml" properties="index">
            …
            <item id="indexB1" href="indexB1.xhtml" media-type="application/xhtml+xml" properties="index">
            <item id="indexB2" href="indexB2.xhtml" media-type="application/xhtml+xml" properties="index">
            <item id="indexB3" href="indexB3.xhtml" media-type="application/xhtml+xml" properties="index">
        </manifest>
        …
        <components>
            <comp type="index" id="indexA">
                <itemref refid="#indexA1"/>
                <itemref refid="#indexA2"/>
                <itemref refid="#indexA3"/>
            </comp>
            <comp type="index" id="indexB">
                <itemref refid="#indexB1"/>
                <itemref refid="#indexB2"/>
                <itemref refid="#indexB3"/>
            </comp>
        <components>
    </package>
    
```

Pros:
  * file set metadata stay in the package document
  * groups are explicit
  * does not "pollute" the `item` elements with a custom attribute
Cons:
  * introducing a whole new top-level element is more heavyweight than using an extension attribute on `item`s.

# Approach 4: Using the Navigation Document #

In this approach, the Navigation Document is used to describe the index file sets. Indexes can be descried in a [http://idpf.org/epub/30/spec/epub30-contentdocs.html#sec-xhtml-nav-def-types-other `nav` element](custom.md) with a special `epub:type` coming from the index vocabulary ; it would be required to list each file with composing the index with `a` elements.

```
<nav epub:type="idx:index">
    <h2>Index</h2>
    <ol>
        <li><a href="index1.xhtml">Headnotes</a></li>
        <li><a href="index2.xhtml">A-J</a></li>
        <li><a href="index3.xhtml">K-Z</a></li>
    </ol>
</nav>
```

Or for multiple indexes:

```
<nav epub:type="idx:indexes">
    <h2>Indexes</h2>
    <ol>
        <li><span>Index A</span>
            <ol>
                <li><a href="indexA1.xhtml">Headnotes</a></li>
                <li><a href="indexA2.xhtml">A-J</a></li>
                <li><a href="indexA3.xhtml">K-Z</a></li>
            </ol>            
        </li>
        <li><span>Index B</span>
            <ol>
                <li><a href="indexB1.xhtml">Headnotes</a></li>
                <li><a href="indexB2.xhtml">A-J</a></li>
                <li><a href="indexB3.xhtml">K-Z</a></li>
            </ol>            
        </li>
    </ol>
</nav>
```

Pros:
  * native EPUB 3 (except for the custom vocabulary)
  * kills two birds (navigation + metadata)

Cons:
  * may required a nav doc schema extension
  * requires detailed prose to enforce the specifics of indexes nav elements
  * the way the index are chunked in multiple files may not always match the way or granularity you want to navigate to different sections in the index.


**Consensus**: Navigation Documents are really made for human consumption. File-level machine-readable metadata belong to Package Documents. A navigation approach is certainly required, but not for machine-readable identification of physical files.