[Back to Indexes Main Page](IndexesMainPage.md)

# Indexes Sample Pseudocode 2 - Simple/Basic Index #

Following is a pseudocode example of a relatively simple, basic index.  Note that in this example, no punctuation is provided, nor are the terms "see" or "see also" hard coded in; they will be provided by the CSS.

```

<index>
   <index.head>
      <index.title>Index</index.title>

      <!-- head notes for index (optional) -->
      <index.headnotes>
         <p>Locators in italics indicate a figure reference.  You can filter the
            index by the following categories: actors, politicians or sports 
            figures.</p>
      </index.headnotes>

      <!-- legend (optional) -->
      <index.legend>
         <symbol>italics</symbol><definition>table</definition>
      </index.legend>

      <!-- list of semantic.content.type terms used in the index -->
      <semantic.content.type.list>
         <term id="act">Actors</term>
         <term id="pol">Politicians</term>
         <term id="spo">Sports figures</term>
      </semantic.content.type.list>

      <!-- list of semantic.structure.type terms used in the index 
      (may end up being combined with semantic.content.type.list 
      above) -->
      <semantic.structure.type.list>
         <term id="fig">Figures, diagrams</term>
         <term id="tab">Tables, charts</term>
         <term id="tex">Texts</term>
      </semantic.structure.type.list>

   </index.head>

   <!-- body of index -->
   <index.body>

      <index.group id="gA">
         <group.title>A</group.title>

         <index.entry id="a001" level="1">
            <term id="a002">actors and acting</term>
            <locator semantic.structure.type="tex" idref="c6345">3-7</locator>
            <!-- Or, if we want to indicate both start and end of range, here are three possibilities: -->
            <locator semantic.structure.type="tex" idref="c6345-c6349">3-7</locator>
            <locator semantic.structure.type="tex" idref="c6345" endref="c6349">3-7</locator>
            <locator semantic.structure.type="tex" idref="c6345">3</locator>-
                 <locator semantic.structure.type="tex" idref="c6349">7</locator>
            <locator semantic.structure.type="tab" idref="c8756">7</locator>
            <!-- generic cross-reference -->
            <xref idref="act" xref.type="relatedgeneric">names of specific actors</xref>
         </index.entry>

         <index.entry id="a003" level="1">
            <term id="a004" semantic.content.type="act pol">Azmi, Shabana</term>
            <locator semantic.structure.type="fig" idref="c9857">12-13</locator>
            <locator semantic.structure.type="tex" idref="c2365">15</locator>
            <locator semantic.structure.type="tex" idref="c7136">18-22</locator>
         </index.entry>
      </index.group>

      <index.group id="gC">
         <group.title>C</group.title>

         <index.entry id="c001" level="1">
            <term id="c002" semantic.content.type="act">Cruise, Tom</term>
            <locator semantic.structure.type="fig" idref="c6643">27</locator>
            <locator semantic.structure.type="tex" idref="c2391">26-28</locator>
         </index.entry>
      </index.group>

      <index.group id="gD">
         <group.title>D</group.title>

         <index.entry id="d001" level="1">
            <term id="d002" semantic.content.type="act">De Niro, Robert</term>
            <locator semantic.structure.type="fig" idref="c1298">35</locator>
            <locator semantic.structure.type="tex" idref="c2477">36</locator>
            <locator semantic.structure.type="tex" idref="c9838">39-40</locator>
         </index.entry>

         <index.entry id="d003" level="1">
            <term id="d004" semantic.content.type="act">Delon, Alain</term>
            <locator semantic.structure.type="tex" idref="c5508">105-109</locator>
            <locator semantic.structure.type="tex" idref="c1367">131</locator>
         </index.entry>

         <index.entry id="d005" level="1">
            <term id="d006" semantic.content.type="act">Depp, Johnny</term>

            <!-- second-level entries -->
            <index.entry id="d007" level="2">
               <term id="d008">Alice in Wonderland</term>
               <locator semantic.structure.type="fig" idref="c4661">89</locator>
               <locator semantic.structure.type="tex" idref="c4009">89-90</locator>
            </index.entry>

            <index.entry id="d009" level="2">
               <term id="d010">Pirates of the Caribbean</term>
               <locator semantic.structure.type="fig" idref="c8080">90</locator>
               <locator semantic.structure.type="fig" idref="c8147">93</locator>
               <locator semantic.structure.type="tex" idref="c2006">94-98</locator>
            </index.entry>
         </index.entry>
      </index.group>

      <index.group id="gM">
         <group.title>M</group.title>

         <index.entry id="m001" level="1">
            <term id="m002">Morrison, Marion Robert</term>
            <!-- see reference -->
            <xref idref="w001" xref.type="preferred">Wayne, John</xref>
         </index.entry>
      </index.group>

      <index.group id="gR">
         <group.title>R</group.title>

         <index.entry id="r001" level="1">
            <term id="r002" semantic.content.type="act pol">Reagan, Ronald</term>
            <locator semantic.structure.type="fig" idref="c7127">68</locator>
            <locator semantic.structure.type="fig" idref="c2860">70</locator>
            <locator semantic.structure.type="tex" idref="c9494">71-75</locator>
            <!-- see also reference -->
            <xref idref="w003" xref.type="related">Wyman, Jane</xref>
         </index.entry>

         <index.entry id="r003" level="1">
            <term id="r004" semantic.content.type="spo">Ruth, Babe</term>
            <locator semantic.structure.type="fig" idref="c5227">52</locator>
            <locator semantic.structure.type="fig" idref="c1319">55</locator>
            <locator semantic.structure.type="fig" idref="c3305">56</locator>
            <!-- see also reference -->
            <xref idref="w003" xref.type="related">Wyman, Jane</xref>
         </index.entry>
      </index.group>

      <index.group id="gW">
         <group.title>R</group.title>

         <index.entry id="w001" level="1">
            <term id="w002" semantic.content.type="act">Wayne, John</term>
            <locator semantic.structure.type="fig" idref="c2659">213</locator>
            <locator semantic.structure.type="tex" idref="c3760">212-215</locator>
         </index.entry>

         <index.entry id="w003" level="1">
            <term id="w004" semantic.content.type="act">Wyman, Jane</term>
            <locator semantic.structure.type="tex" idref="c1885">185-186</locator>
         </index.entry>
      </index.group>
   </index.body>
</index>

```