<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">   

    <ns uri="http://www.daisy.org/z3986/2005/ncx/" prefix="ncx" />
    <ns uri="http://www.idpf.org/2011/epub" prefix="epub" />
    
    <pattern id="landmarks">
        <rule context="ncx:ncx">
            <assert test="count(./ncx:navList[@epub:type='landmarks']) &lt; 2"
                >Multiple occurrences of the 'landmarks' navList</assert>
        </rule>
        <rule context="ncx:navList[@epub:type='landmarks']/ncx:navTarget">
            <assert test="@epub:type"
                >Missing epub:type attribute on navTarget inside 'landmarks' navList</assert>
        </rule>
    </pattern>
    
    <pattern id="unique-sibling-lang-test" abstract="false">
        <rule context="*[count(./ncx:navLabel) &gt; 1]/ncx:navLabel">
            <let name="curlang" value="ancestor-or-self::*[@xml:lang][1]/@xml:lang" />            
            <assert test="count(../ncx:navLabel[lang($curlang)]) &lt; 2"
                >Sibling navLabel elements must use different languages 
                (multiple occurrences of the language '<value-of select="$curlang"/>').</assert>
        </rule>
    </pattern>
    
    <!-- pattern is-a="unique-sibling-lang-test">
        <param name="select" value="ncx:navLabel"/>
    </pattern -->
    
    <include href="./mod/id-unique.sch"/>
    
</schema>