This folder contains the Schematron implementation used by oXygen.
You can use this to make sure that your results are fully consistent with the results you obtain from oXygen.
Please note that oXygen uses also the XML Catalogs that are set up in oXygen.

The first step in the processing pipeline for both ISO and 1.5 Schematron is 

schematronDispatcher.xsl
  it includes 
    XSD2Schtrn.xsl
    RNG2Schtrn.xsl

and provides support for extracting Schematron embedded rules and resolving ISO Schematron includes.


The next step in pipeline, only for ISO Schematron is

iso-schematron-abstract.xsl

that replaces abstract patterns with their instances.

Then, the Schematron schema is ready to be converted to an XSLT stylesheet. For that we use 

for ISO Schematron
iso-schematron-message.xsl
  it includes
    iso-schematron-skeleton.xsl

for Schematron 1.5
schematron-message.xsl
  it includes
    schematron1-5.xsl

The result is an XSLT stylesheet that can be applied on the input document to obtain the Schematron validation results.   
