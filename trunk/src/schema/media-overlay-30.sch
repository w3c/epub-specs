<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
          
    <ns uri="http://www.idpf.org/2011/epub" prefix="epub"/>
    <ns uri="http://www.w3.org/ns/SMIL" prefix="s"/>
          
    <include href="./mod/id-unique.sch"/>     
    
    <pattern id="profile">        
        <rule context="*[@epub:type]">
            <assert test="ancestor-or-self::s:smil[@profile]"
                >The profile attribute must be specified on the root element when the epub:type attribute is used.</assert>
        </rule>            
    </pattern>
    
</schema>