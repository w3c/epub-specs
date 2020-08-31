# Introduction #

Another way to use generic xref


An example of an alternate approach (greatly abbreviated!) is as follows:
```


 
<!--  lots of stuff -->

<generic.list id=”gl1” type=”flower”> 
   <term id="a091">Azaleas</term> 
   <term id="p085">Peonies</term> 
   <term id="r074">Roses</term> 
</generic.list> 

<!--  lots of stuff --> 

<index.entry id="a091"> 
   <term semantic.content.type="flower">azaleas</term> 
   <locator semantic.structure.type="tex" idref="c67440">24</locator> 
   <locator semantic.structure.type="fig" idref="c67449">25</locator> 
</index.entry> 

<!--  lots of stuff --> 

<index.entry id="f909783"> 
   <term>flowering plants</term> 
   <locator semantic.structure.type="tab" idref="c32987">12-17</locator> 
   <xref idref="gl1" xref.type="relatedgeneric">names of specific flowers</xref> 
</index.entry> 

<!--  lots of stuff --> 

<index.entry id="r074" level="1"> 
   <term semantic.content.type="flower">Roses</term> 
   <locator semantic.structure.type="fig" idref="r5227">52</locator> 
</index.entry> 

... 
... 

```