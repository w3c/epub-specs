<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    
    <!-- TODO fix variable references not working in abstract assert/report strings -->
    <!-- TODO check if anything need to be added from embedded SVG11 -->                    
    <!-- TODO h @max and @min -->
            
    <ns uri="http://www.w3.org/1999/xhtml" prefix="h"/>
    <ns uri="http://www.idpf.org/2011/epub" prefix="epub"/>
    <ns uri="http://www.w3.org/1998/Math/MathML" prefix="math"/>
    <ns uri="http://www.w3.org/2001/10/synthesis" prefix="ssml"/>
    <ns uri="http://www.w3.org/2001/xml-events" prefix="ev"/>
        
    <let name="id-set" value="//*[@id]"/>
    
    <pattern id="ancestor-area-map" is-a="required-ancestor">        
        <param name="descendant" value="h:area"/>
        <param name="ancestor" value="h:map"/>        
    </pattern>

    <pattern id="ancestor-imgismap-ahref" is-a="required-ancestor">        
        <param name="descendant" value="h:img[@ismap]"/>
        <param name="ancestor" value="h:a[@href]"/>        
    </pattern>
    
    <pattern id="descendant-a-interactive" is-a="no-interactive-content-descendants">        
        <param name="ancestor" value="h:a"/>       
    </pattern>
    
    <pattern id="descendant-button-interactive" is-a="no-interactive-content-descendants">        
        <param name="ancestor" value="h:button"/>       
    </pattern>
    
    <pattern id="descendant-audio-audio" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:audio"/>
        <param name="descendant" value="h:audio"/>        
    </pattern>
    
    <pattern id="descendant-audio-video" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:audio"/>
        <param name="descendant" value="h:video"/>        
    </pattern>
    
    <pattern id="descendant-video-video" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:video"/>
        <param name="descendant" value="h:video"/>        
    </pattern>
    
    <pattern id="descendant-video-audio" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:video"/>
        <param name="descendant" value="h:audio"/>        
    </pattern>
    
    <pattern id="descendant-address-address" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:address"/>
        <param name="descendant" value="h:address"/>        
    </pattern>
    
    <pattern id="descendant-address-header" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:address"/>
        <param name="descendant" value="h:header"/>        
    </pattern>
    
    <pattern id="descendant-address-footer" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:address"/>
        <param name="descendant" value="h:footer"/>        
    </pattern>

    <pattern id="descendant-form-form" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:form"/>
        <param name="descendant" value="h:form"/>        
    </pattern>

    <pattern id="descendant-progress-progress" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:progress"/>
        <param name="descendant" value="h:progress"/>        
    </pattern>

    <pattern id="descendant-meter-meter" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:meter"/>
        <param name="descendant" value="h:meter"/>        
    </pattern>

    <pattern id="descendant-dfn-dfn" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:dfn"/>
        <param name="descendant" value="h:dfn"/>        
    </pattern>

    <pattern id="descendant-time-time" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:time"/>
        <param name="descendant" value="h:time"/>        
    </pattern>

    <pattern id="descendant-caption-table" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:caption"/>
        <param name="descendant" value="h:table"/>        
    </pattern>
    
    <pattern id="descendant-header-header" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:header"/>
        <param name="descendant" value="h:header"/>        
    </pattern>
    
    <pattern id="descendant-header-footer" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:header"/>
        <param name="descendant" value="h:footer"/>        
    </pattern>
    
    <pattern id="descendant-footer-footer" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:footer"/>
        <param name="descendant" value="h:footer"/>        
    </pattern>
    
    <pattern id="descendant-footer-header" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:footer"/>
        <param name="descendant" value="h:header"/>        
    </pattern>
    
    <pattern id="descendant-label-label" is-a="disallowed-descendants">        
        <param name="ancestor" value="h:label"/>
        <param name="descendant" value="h:label"/>        
    </pattern>
        
    <pattern id="bdo-dir" is-a="required-attr">
        <param name="elem" value="h:bdo"/>
        <param name="attr" value="dir"/>
    </pattern>

    <pattern id="idref-aria-describedby" is-a="idref-any">
        <param name="element" value="*"/>
        <param name="idref-attr-name" value="aria-describedby"/>
    </pattern>

    <pattern id="idref-aria-flowto" is-a="idref-any">
        <param name="element" value="*"/>
        <param name="idref-attr-name" value="aria-flowto"/>
    </pattern>

    <pattern id="idref-aria-labelledby" is-a="idref-any">
        <param name="element" value="*"/>
        <param name="idref-attr-name" value="aria-labelledby"/>
    </pattern>

    <pattern id="idref-aria-owns" is-a="idref-any">
        <param name="element" value="*"/>
        <param name="idref-attr-name" value="aria-owns"/>
    </pattern>

    <pattern id="idref-aria-controls" is-a="idref-any">
        <param name="element" value="*"/>
        <param name="idref-attr-name" value="aria-controls"/>
    </pattern>
    
    <pattern id="idref-mathml-xref" is-a="idref-any">
        <param name="element" value="math:*"/>
        <param name="idref-attr-name" value="xref"/>
    </pattern>

    <pattern id="idref-mathml-indenttarget" is-a="idref-any">
        <param name="element" value="math:*"/>
        <param name="idref-attr-name" value="indenttarget"/>
    </pattern>

    <pattern id="idref-contextmenu" is-a="idref-named">
        <param name="element" value="h:*"/>
        <param name="idref-attr-name" value="contextmenu"/>
        <param name="target-name" value="h:menu"/>
    </pattern>
    
    <pattern id="idref-input-list" is-a="idref-named">
        <param name="element" value="h:input"/>
        <param name="idref-attr-name" value="list"/>
        <param name="target-name" value="h:datalist"/>
    </pattern>
    
    <pattern id="idref-forms-form" is-a="idref-named">
        <param name="element" value="h:*"/>
        <param name="idref-attr-name" value="form"/>
        <param name="target-name" value="h:form"/>
    </pattern>

    <pattern id="idref-aria-activedescendant">
        <rule context="*[@aria-activedescendant]">
            <assert test="descendant::*[@id = current()/@aria-activedescendant]"
                >The aria-activedescendant attribute must refer to a descendant element.</assert>
        </rule>
    </pattern>

    <pattern id="idref-label-for">        
        <rule context="h:label[@for]">
            <assert
                test="some $elem in $id-set satisfies $elem/@id eq current()/@for and 
                   (local-name($elem) eq 'button' 
                or (local-name($elem) eq 'input' and not($elem/@type='hidden'))
                 or local-name($elem) eq 'keygen' 
                 or local-name($elem) eq 'meter'
                 or local-name($elem) eq 'output' 
                 or local-name($elem) eq 'progress' 
                 or local-name($elem) eq 'select' 
                 or local-name($elem) eq 'textarea')"
                >The for attribute does not refer to an allowed target element (expecting: button|keygen|meter|output|progress|select|textarea|input[not(@type='hidden')]).</assert>
        </rule>
    </pattern>
    
    <pattern id="idrefs-output-for">        
        <rule context="h:output[@for]">
            <assert test="every $idref in tokenize(@for, '\s+') satisfies (some $elem in $id-set satisfies $elem/@id eq $idref)"
                >The for attribute must refer to elements in the same document.</assert>
        </rule>
    </pattern>
    
    <pattern id="idrefs-headers">        
        <rule context="h:*[@headers]">    
            <let name="table" value="ancestor::h:table"/>
            <assert test="every $idref in tokenize(@headers, '\s+') satisfies (some $elem in $table//h:th satisfies ($elem/@id eq $idref))"
                >The headers attribute must refer to th elements in the same table.</assert>            
        </rule>
    </pattern> 
    
    <pattern id="idref-trigger-observer" is-a="idref-any">
        <param name="element" value="epub:trigger"/>
        <param name="idref-attr-name" value="ev:observer"/>
    </pattern>
    
    <pattern id="idref-trigger-ref" is-a="idref-any">
        <param name="element" value="epub:trigger"/>
        <param name="idref-attr-name" value="ref"/>
    </pattern>
    
    <pattern id="map" >
        <rule context='h:map[@name]'>   
            <let name="name-set" value="//h:map[@name]"/>
            <assert test="count($name-set[@name = current()/@name]) = 1">Duplicate map name '<value-of
                select="current()/@name"/>'</assert>
        </rule>
        <rule context='h:map[@id and @name]'>
            <assert test='@id = @name'
                >The id attribute on the map element must have the same value as the name attribute.</assert>
        </rule>        
    </pattern>
    
    <pattern id='lang-xmllang'>
        <rule context='h:*[@lang and @xml:lang]'>
            <assert test="lower-case(@xml:lang) = lower-case(@lang)"
                >The lang and xml:lang attributes must have the same value</assert>                
        </rule>
    </pattern>
    
    <pattern id="id-unique">
        <rule context="*[@id]">
            <assert test="count($id-set[@id = current()/@id]) = 1">Duplicate ID '<value-of
                select="current()/@id"/>'</assert>
        </rule>
    </pattern>
    
    <pattern id="select-multiple">
        <rule context="h:select[not(@multiple)]">
            <report test='count(descendant::h:option[@selected]) > 1'
                >A select element whose multiple attribute is not specified must not have more than one descendant option element with its selected attribute set.</report>
        </rule>
    </pattern> 
    
    <pattern id="track">                
        <rule context="h:track">
            <report test="@label = ''"
                >The track element label attribute value must not be the empty string.</report>
            <report test="@default and preceding-sibling::h:track[@default]"
                >There must not be more than one track child of a media element element with the default attribute specified.</report>            
        </rule>
    </pattern>
    
    <pattern id="ssml">        
        <rule context="*[@ssml:ph]">
            <report test="ancestor::*[@ssml:ph]"
                >The ssml:ph attribute must not be specified on a descendant of an element that also carries this attribute.</report>
        </rule>            
    </pattern>
    
    <pattern id="profile">        
        <rule context="*[@epub:type]">
            <assert test="ancestor-or-self::h:html[@profile]"
                >The profile attribute must be specified on the root element when the epub:type attribute is used.</assert>
        </rule>            
    </pattern>
        
    <pattern abstract="true" id="idref-any">
        <rule context="$element[@$idref-attr-name]">
            <assert test="some $elem in $id-set satisfies $elem/@id eq current()/@$idref-attr-name"
                >The <name path="@$idref-attr-name"/> attribute must refer to an element in the same document (the ID '<value-of 
                    select="current()/@$idref-attr-name"/>' does not exist).</assert>
        </rule>
    </pattern>

    <pattern abstract="true" id="idref-named">
        <rule context="$element[@$idref-attr-name]">
            <assert test="//$target-name[@id = current()/@$idref-attr-name]">The <name
                    path="@$idref-attr-name"/> attribute does not refer to an allowed target element (expecting: <value-of 
                        select="$target-name"/>).</assert>
        </rule>
    </pattern>

    <pattern abstract="true" id="required-attr">
        <rule context="$elem">
            <assert test="@$attr"
                >The <name/> element must have a <value-of select="$attr"/> attribute.</assert>            
        </rule>
    </pattern>

    <pattern abstract="true" id="disallowed-descendants">
        <rule context="$descendant">
            <report test="ancestor::$ancestor"
                >The <name/> element must not appear inside <value-of select="$ancestor"/> elements.</report>            
        </rule>
    </pattern>
    
    <pattern abstract="true" id="required-ancestor">
        <rule context='$descendant'>
            <assert test='ancestor::$ancestor'
                >The <value-of select="$descendant"/> element must have an ancestor <value-of select="$ancestor"/> element.</assert>
        </rule>
    </pattern>
    
    <pattern abstract="true" id="no-interactive-content-descendants">
        <rule context="h:a|h:audio[@controls]|h:button|h:details|h:embed|h:iframe|h:img[@usemap]|h:input[not(@type='hidden')]
            |h:keygen|h:label|h:menu[@type='toolbar']|h:object[@usemap]|h:select|h:textarea|h:video[@controls]">
            <report test="ancestor::$ancestor"
                >The <name/> element must not appear inside <value-of select="$ancestor"/> elements.</report>            
        </rule>
    </pattern>
    
</schema>
