<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
    <!-- TODO
        meta element values, property dependant
        @profile, @prefix, and prefix resolution in meta/@property
        meta@about target restriction
    -->
    
    <ns uri="http://www.idpf.org/2007/opf" prefix="opf"/>
    <ns uri="http://purl.org/dc/elements/1.1/" prefix="dc"/>
            
    <pattern id="opf.uid">
        <rule context="opf:package[@unique-identifier]">
            <let name="uid" value="./@unique-identifier" />
            <assert test="/opf:package/opf:metadata/dc:identifier[@id = $uid]"
                >package element unique-identifier attribute does not resolve to a dc:identifier element (given reference was '<value-of select="$uid"/>')</assert>
        </rule>    
    </pattern>
    
    <pattern id="opf.itemref">        
        <rule context="opf:spine/opf:itemref[@idref]">    
            <let name="ref" value="./@idref" />            
            <let name="item" value="//opf:manifest/opf:item[@id = $ref]"/>
            <let name="item-media-type" value="$item/@media-type" />                                   
            <assert test="$item"
                >itemref element idref attribute does not resolve to a manifest item element</assert>            
            <assert test="$item-media-type = 'application/xhtml+xml' or $item-media-type = 'image/svg+xml'"
                >spine items must be XHTML or SVG (given value was '<value-of select="$item-media-type"/>')</assert>
            
        </rule>    
    </pattern>
    
    <pattern id="opf.fallback.ref"> 
        <rule context="opf:item[@fallback]">
            <let name="ref" value="./@fallback" />
            <let name="item" value="/opf:package/opf:manifest/opf:item[@id = $ref]"/>
            <assert test="$item and $item/@id != ./@id"
                >manifest item element fallback attribute must resolve to another manifest item (given reference was '<value-of select="$ref"/>')</assert>
        </rule>            
    </pattern>
        
    <pattern id="opf.media.overlay"> 
        <rule context="opf:item[@media-overlay]">
            <let name="ref" value="./@media-overlay" />
            <let name="item" value="//opf:manifest/opf:item[@id = $ref]" />
            <let name="item-media-type" value="$item/@media-type" />
            <assert test="$item-media-type = 'application/smil+xml'"
                >media overlay items must be of the 'application/smil+xml' type (given type was '<value-of select="$item-media-type"/>')</assert>
        </rule>            
    </pattern>
          
    <pattern id="opf.bindings.handler"> 
        <rule context="opf:bindings/opf:mediaType">
            <let name="ref" value="./@handler" />
            <let name="item" value="//opf:manifest/opf:item[@id = $ref]" />
            <let name="item-media-type" value="$item/@media-type" />
            <assert test="$item-media-type = 'application/xhtml+xml'"
                >manifest items referenced from the handler attribute of a bindings mediaType element must be of the 'application/xhtml+xml' type (given type was '<value-of select="$item-media-type"/>')</assert>
        </rule>            
    </pattern>
          
    <pattern id="opf.toc.ncx"> 
        <rule context="opf:spine[@toc]">
            <let name="ref" value="./@toc" />            
            <let name="item" value="/opf:package/opf:manifest/opf:item[@id = $ref]"/>
            <let name="item-media-type" value="$item/@media-type" />
            <assert test="$item-media-type = 'application/x-dtbncx+xml'"
                >spine element toc attribute must reference the NCX manifest item (referenced media type was '<value-of select="$item-media-type"/>')</assert>
        </rule>            
    </pattern>    
        
    <pattern id="opf.dc.override" abstract="true"> 
        <rule context="$dc">            
            <let name="ref" value="./@opf:override" />            
            <let name="meta" value="/opf:package/opf:metadata/opf:meta[@id = $ref]"/>
            <assert test="$meta/@property = '$prop'"
                >opf:override attribute on a <name /> element must resolve to a meta element with the equivalent dcterms property (given property was <value-of select="$meta/@property"/>)</assert>
        </rule>            
    </pattern>
    
    <pattern id="opf.dc.identifier.override" is-a="opf.dc.override">
        <param name="prop" value="dcterms:identifier"/>
        <param name="dc" value="/opf:package/opf:metadata/dc:identifier[@opf:override]"/>           
    </pattern>
    
    <pattern id="opf.dc.title.override" is-a="opf.dc.override">
        <param name="prop" value="dcterms:title"/>
        <param name="dc" value="/opf:package/opf:metadata/dc:title[@opf:override]"/>           
    </pattern>
    
    <pattern id="opf.dc.language.override" is-a="opf.dc.override">
        <param name="prop" value="dcterms:language"/>
        <param name="dc" value="/opf:package/opf:metadata/dc:language[@opf:override]"/>           
    </pattern>
         
    <include href="./mod/id-unique.sch"/>     
             
</schema>