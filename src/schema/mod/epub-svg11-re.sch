<?xml version="1.0" encoding="UTF-8"?>
<pattern id="svg-fo-re" xmlns="http://purl.oclc.org/dsdl/schematron">    
    <rule context="svg:foreignObject/@requiredExtensions">
        <assert test=". = 'http://www.idpf.org/2007/ops'"
            >Invalid value (expecting: 'http://www.idpf.org/2007/ops')</assert>
    </rule>
</pattern>