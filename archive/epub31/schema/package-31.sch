<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

    <ns uri="http://www.idpf.org/2007/opf" prefix="opf"/>
    <ns uri="http://purl.org/dc/elements/1.1/" prefix="dc"/>

    <pattern id="opf.uid">
        <rule context="opf:package[@unique-identifier]">
            <let name="uid" value="./@unique-identifier"/>
            <assert test="/opf:package/opf:metadata/dc:identifier[@id = $uid]">package element unique-identifier attribute
                does not resolve to a dc:identifier element (given reference was '<value-of select="$uid"/>')</assert>
        </rule>
    </pattern>

    <pattern id="opf.dc.properties">
        <rule context="opf:package[@prefix]">
            <report test="contains(@prefix, 'http://purl.org/dc/elements/1.1/')">A prefix for the Dublin Core /elements/1.1/
                namespace is not allowed on the package element</report>
        </rule>
    </pattern>

    <pattern id="opf.dcterms.modified">
        <rule context="opf:metadata[not(ancestor::opf:collection)]">
            <assert test="count(opf:meta[@property = 'dcterms:modified' and not(@refines)]) = 1">package dcterms:modified
                meta element must occur exactly once</assert>
        </rule>
    </pattern>

    <pattern id="opf.dcterms.modified.syntax">
        <rule context="opf:meta[@property = 'dcterms:modified'][not(ancestor::opf:collection)]">
            <assert
                test="matches(normalize-space(.), '^([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2})Z$')"
                >dcterms:modified illegal syntax (expecting: 'CCYY-MM-DDThh:mm:ssZ')</assert>
        </rule>
    </pattern>

    <pattern id="opf.itemref">
        <rule context="opf:spine/opf:itemref[@idref]">
            <let name="ref" value="./@idref"/>
            <let name="item" value="//opf:manifest/opf:item[@id = $ref]"/>
            <let name="item-media-type" value="$item/@media-type"/>
            <assert test="$item">itemref element idref attribute does not resolve to a manifest item element</assert>
        </rule>
    </pattern>

    <pattern id="opf.fallback.ref">
        <rule context="opf:item[@fallback]">
            <let name="ref" value="./@fallback"/>
            <let name="item" value="/opf:package/opf:manifest/opf:item[@id = $ref]"/>
            <assert test="$item and $item/@id != ./@id">manifest item element fallback attribute must resolve to another
                manifest item (given reference was '<value-of select="$ref"/>')</assert>
        </rule>
    </pattern>

    <pattern id="opf.media.overlay">
        <rule context="opf:item[@media-overlay]">
            <let name="ref" value="./@media-overlay"/>
            <let name="item" value="//opf:manifest/opf:item[@id = $ref]"/>
            <let name="item-media-type" value="$item/@media-type"/>
            <assert test="$item-media-type = 'application/smil+xml'">media overlay items must be of the
                'application/smil+xml' type (given type was '<value-of select="$item-media-type"/>')</assert>
        </rule>
    </pattern>

    <pattern id="opf.media.overlay.metadata.global">
        <rule context="opf:manifest[opf:item[@media-overlay]]">
            <assert test="//opf:meta[@property = 'media:duration']">global media:duration meta element not set</assert>
        </rule>
    </pattern>

    <pattern id="opf.media.overlay.metadata.global.duration">
        <rule context="opf:metadata/opf:meta[@property = 'media:duration']">
            <assert
                test="matches(normalize-space(.), '^([0-9]+:)?[0-5][0-9]:[0-5][0-9](\.[0-9]+)?$') or matches(normalize-space(.), '^[0-9]+(\.[0-9]+)?(h|min|s|ms)?$')"
                > The value of the media:duration property must be a valid SMIL clock value. </assert>
        </rule>
    </pattern>

    <pattern id="opf.media.overlay.metadata.item">
        <rule context="opf:manifest/opf:item[@media-type = 'application/smil+xml']">
            <assert test="@duration">Manifest items for Media Overlay documents require a duration attribute.</assert>
        </rule>
    </pattern>

    <pattern id="opf.nav.prop">
        <rule context="opf:manifest">
            <let name="item"
                value="
                    //opf:manifest/opf:item[@properties and (some $token in tokenize(@properties, ' ')
                        satisfies (normalize-space($token) eq 'nav'))]"/>
            <assert test="count($item) = 1">Exactly one manifest item must declare the 'nav' property (number of 'nav' items:
                    <value-of select="count($item)"/>).</assert>
        </rule>
    </pattern>

    <pattern id="opf.nav.type">
        <rule
            context="
                opf:manifest/opf:item[@properties and (some $token in tokenize(@properties, ' ')
                    satisfies (normalize-space($token) eq 'nav'))]">
            <assert test="@media-type = 'application/xhtml+xml'">The manifest item representing the Navigation Document must
                be of the 'application/xhtml+xml' type (given type was '<value-of select="@media-type"/>')</assert>
        </rule>
    </pattern>

    <pattern id="opf.cover-image">
        <rule context="opf:manifest">
            <let name="item"
                value="
                    //opf:manifest/opf:item[@properties and (some $token in tokenize(@properties, ' ')
                        satisfies (normalize-space($token) eq 'cover-image'))]"/>
            <assert test="count($item) &lt; 2">Multiple occurrences of the 'cover-image' property (number of 'cover-image'
                items: <value-of select="count($item)"/>).</assert>
        </rule>
    </pattern>

    <pattern id="opf.refines">
        <rule context="//opf:metadata/opf:meta">
            <report test="@refines">ALERT: Use of the refines attribute is deprecated.</report>
        </rule>
    </pattern>

    <pattern id="opf.ncx.toc">
        <rule context="opf:spine">
            <report test="@toc">ALERT: Use of the toc attribute is deprecated.</report>
        </rule>
    </pattern>

    <pattern id="opf.rendition.viewport">
        <rule context="//opf:metadata/opf:meta">
            <report test="@property = 'rendition:viewport'">ALERT: Use of the rendition:viewport property is deprecated</report>
        </rule>
    </pattern>

    <pattern id="opf.meta.rendition.spread.portrait">
        <rule context="//opf:metadata/opf:meta[@property = 'rendition:spread']">
            <report test="normalize-space(.) = 'portrait'">ALERT: Use of the value 'portrait' with the rendition:spread property is
                deprecated.</report>
        </rule>
    </pattern>

    <pattern id="opf.itemref.rendition.spread.portrait">
        <rule context="opf:spine/opf:itemref">
            <report test="@properties and (some $token in tokenize(@properties, ' ')
                satisfies (normalize-space($token) eq 'rendition:spread-portrait'))">
                ALERT: Use of the property 'rendition:spread-portrait' on itemref elements is deprecated.</report>
        </rule>
    </pattern>

    <include href="./mod/id-unique.sch"/>

</schema>
