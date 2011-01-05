<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">   

    <ns uri="http://www.daisy.org/z3986/2005/ncx/" prefix="ncx" />
    <ns uri="http://www.idpf.org/2011/epub" prefix="epub" />
    
    <pattern id="landmarks">
        <rule context="ncx:ncx">
            <assert test="count(./ncx:navList[@epub:type='landmarks']) &lt; 2"
                >Multiple occurences of the 'landmarks' navList</assert>
        </rule>
        <rule context="ncx:navList[@epub:type='landmarks']/ncx:navTarget">
            <assert test="@epub:type"
                >Missing epub:type attribute on navTarget inside 'landmarks' navList</assert>
        </rule>
    </pattern>
    
    <pattern abstract="true" id="unique-sibling-lang-test">             
        <rule context="*[count(./$select) &gt; 1]/$select">
            <let name="curlang" value="ancestor-or-self::*[@xml:lang][1]/@xml:lang" />            
            <assert test="count(../$select[lang($curlang)]) &lt; 2"
                >Sibling <value-of select="$select"/> elements must use different languages 
                (multiple occurrences of the language '<value-of select="$curlang"/>').</assert>
        </rule>
    </pattern>
    
    <pattern is-a="unique-sibling-lang-test">
        <param name="select" value="ncx:navLabel"/>
    </pattern>
    
    <pattern id="id-unique">
        <let name="id-set" value="//*[@id]"/>        
        <rule context="*[@id]">
            <assert test="count($id-set[@id = current()/@id]) = 1"
                >Duplicate ID '<value-of select="current()/@id"/>'</assert>
        </rule>
    </pattern>
    
</schema>