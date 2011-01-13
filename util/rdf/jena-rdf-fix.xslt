<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0"	
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"		
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" 
	xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:jena="http://www.daisy.org/ns/rdf/jena#"
	xmlns:dcterms="http://purl.org/dc/terms/"
	xmlns:zt="http://www.daisy.org/ns/rdf/property#"
	xmlns:htu="http://www.daisy.org/ns/rdf/usage/html/#"
	xpath-default-namespace="http://www.w3.org/1999/02/22-rdf-syntax-ns#" exclude-result-prefixes="jena">
	
	<!-- tweaks the RDF output from Jena -->

	<!-- the uri of the vocab being fixed -->
	<xsl:param name="vocab-uri" required="yes"/>
	
	

	<xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes" />

	<xsl:variable name="rdf-property-uri"
		>http://www.w3.org/1999/02/22-rdf-syntax-ns#Property</xsl:variable>
	<xsl:variable name="rdf-class-uri"
		>http://www.w3.org/1999/02/22-rdf-syntax-ns#class</xsl:variable>
	<xsl:variable name="rdf-bag-uri"
		>http://www.w3.org/1999/02/22-rdf-syntax-ns#Bag</xsl:variable>

	<xsl:template match="rdf:RDF">
		<rdf:RDF>
			<xsl:copy-of select="@*"/>			
			<!-- get the rdf:Description of the vocab itself -->
			<xsl:copy-of select="//rdf:Description[./@rdf:about=$vocab-uri]" copy-namespaces="no"/>								
			<!-- select all bags without a rdf:member child (these are top-level bags) -->
			<xsl:apply-templates mode="bag" select="./rdf:Description[rdf:type/@rdf:resource=$rdf-bag-uri and not(rdf:member)]">
				<xsl:sort data-type="number" select="./jena:bag-sort"/>				
			</xsl:apply-templates>			
		</rdf:RDF>		
	</xsl:template>
	
	<xsl:template match="rdf:Description" mode="bag">
		<xsl:variable name="about" select="@rdf:about"/>	
		<rdf:Bag rdf:ID="{substring-after($about,'#')}">
			<!-- bag title and description -->
			<xsl:copy-of select="./dcterms:title" copy-namespaces="no"/>
			<xsl:copy-of select="./dcterms:description" copy-namespaces="no" />
			<!-- render any properties -->
			<xsl:apply-templates mode="property" select="//rdf:Description[rdf:type/@rdf:resource=$rdf-property-uri and rdf:member/@rdf:resource=$about]">
				<xsl:sort data-type="number" select="./jena:prop-sort"/>
			</xsl:apply-templates>	
			<!-- render any sub-bags -->
			<xsl:apply-templates mode="bag" select="//rdf:Description[rdf:type/@rdf:resource=$rdf-bag-uri and rdf:member/@rdf:resource=$about]">				
				<xsl:sort data-type="number" select="jena:bag-sort"/>			
			</xsl:apply-templates>	
		</rdf:Bag>
	</xsl:template>
	
	<xsl:template match="rdf:Description" mode="property">
		<xsl:element name="{name(.)}">			
			<xsl:variable name="about" select="./@rdf:about"/>
			<xsl:variable name="name" select="substring-after($about,'#')"/>			
			<xsl:copy-of select="@*"/>			
			<!-- de-expand the full URIs to self -->
			<xsl:if test="starts-with($about, $vocab-uri)">
				<xsl:attribute name="about" namespace="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
					<xsl:text>#</xsl:text>
					<xsl:value-of select="substring-after($about, '#')"/>
				</xsl:attribute>
			</xsl:if>		
			<!-- add an rdf:ID if not existing -->
			<xsl:if test="not(./@rdf:ID)">
				<xsl:attribute name="ID" namespace="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
					<xsl:value-of select="$name"/>
				</xsl:attribute>
			</xsl:if>
			<!-- label first child element, for readability -->
			<xsl:choose>
				<xsl:when test="not(./rdfs:label)">
					<xsl:element name="rdfs:label">
						<xsl:value-of select="$name"/>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="./rdfs:label" copy-namespaces="no"/>
				</xsl:otherwise>
			</xsl:choose>
			<!-- then the comment, for readability -->
			<xsl:copy-of select="./rdfs:comment" copy-namespaces="no" />
			<!-- then all others -->
			<xsl:apply-templates select="./*[not(name() eq 'rdfs:label') and not(name() eq 'rdfs:comment') and not(name() eq 'rdf:member')]">
				<xsl:sort data-type="text" select="name(.)"/>				
			</xsl:apply-templates>
		</xsl:element>	
	</xsl:template>
	
	<xsl:template match="*[@rdf:resource]">
		<!-- reduce the full URIs created by Jena to fragments -->		
		<xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
			<xsl:copy-of select="@*"/>
			<xsl:variable name="resource" select="@rdf:resource"/>
			<xsl:if test="starts-with($resource, $vocab-uri)">
				<xsl:attribute name="resource"
					namespace="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
					<xsl:text>#</xsl:text>
					<xsl:value-of select="substring-after($resource, '#')"/>
				</xsl:attribute>
			</xsl:if>						
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="jena:*"/>
	
	<xsl:template match="zt:*[not(contains('extendsforvalue', local-name()))]"/>
	
	<xsl:template match="*">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" copy-namespaces="no"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	
	
</xsl:stylesheet>
