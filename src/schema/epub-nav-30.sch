<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">    
    
    <ns uri="http://www.w3.org/1999/xhtml" prefix="html" />
    <ns uri="http://www.idpf.org/2011/epub" prefix="epub" />
    
    <pattern id="toc">
        <rule context="html:body">            
            <assert test="count(.//html:nav[@epub:type='toc']) = 1"
                >Exactly one 'toc' nav element must be present</assert>
        </rule>        
    </pattern>
    
    <pattern id="page-list">
        <rule context="html:body">
            <assert test="count(./html:nav[@epub:type='page-list']) &lt; 2"
                >Multiple occurences of the 'page-list' nav element</assert>
        </rule>
    </pattern>
    
    <pattern id="landmarks">
        <rule context="html:body">
            <assert test="count(./html:nav[@epub:type='landmarks']) &lt; 2"
                >Multiple occurences of the 'landmarks' nav element</assert>
        </rule>
        <rule context="html:nav[@epub:type='landmarks']//html:ol//html:a">
            <assert test="@epub:type"
                >Missing epub:type attribute on anchor inside 'landmarks' nav element</assert>
        </rule>
    </pattern>
    
    <pattern id="link-labels">
        <rule context="html:nav//html:ol//html:a">
            <assert test="string-length(normalize-space(string(.))) > 0"
                >Anchors within nav elements must contain text</assert>
        </rule>        
    </pattern>
    
    <pattern id="req-heading">        
        <rule context="html:nav[not(@epub:type = 'toc') and not (@epub:type = 'page-list') and not (@epub:type = 'landmarks')]">
            <let name="fc" value="local-name(./*[1])" />
            <assert test="(starts-with($fc,'h') and string-length($fc) = 2) or ($fc = 'hgroup')"
                >nav elements other than 'toc', 'page-list' and 'landmarks' must contain a heading as the first child</assert>
        </rule>                
    </pattern>
        
    <pattern id="heading-content">
        <rule context="html:h1|html:h2|html:h3|html:h4|html:h5|html:h6|html:hgroup">
            <assert test="string-length(normalize-space(string(.))) > 0"
                >Heading elements must contain text</assert>
        </rule>        
    </pattern>
        
</schema>

