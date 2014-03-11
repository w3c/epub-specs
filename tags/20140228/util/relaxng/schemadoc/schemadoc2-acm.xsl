<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs rng xd dcterms z rdf zrng zsd a x sch db" version="2.0"
	xmlns="http://www.w3.org/1999/xhtml" xmlns:dcterms="http://purl.org/dc/terms/"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rng="http://relaxng.org/ns/structure/1.0" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:z="http://www.daisy.org/ns/z3986/annotations/#"
	xmlns:zrng="http://www.daisy.org/ns/rng/annotations" xmlns:x="http://www.w3.org/1999/xhtml"
	xmlns:zsd="http://www.daisy.org/ns/rng/schemadoc"
	xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
	xmlns:sch="http://purl.oclc.org/dsdl/schematron"
	xmlns:db="http://docbook.org/ns/docbook"
	xpath-default-namespace="http://relaxng.org/ns/structure/1.0">

	<!-- start mode: acm1 -->
	<xsl:template match="*" mode="acm1">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates mode="acm1" />
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="ref" mode="acm1">
		<xsl:comment>start ref: <xsl:value-of select="@name" /></xsl:comment>
		<xsl:apply-templates select="$SCHEMA.REORGANIZED//*[@zsd:define-name eq current()/@name]"
			mode="acm1" />
		<xsl:comment>end ref</xsl:comment>
	</xsl:template>
	<!-- end mode: acm1 -->
	
	
	<!-- start mode: acm2-documentation -->
	<xsl:template match="a:documentation" mode="acm2-documentation">
		<div class="documentation">
			<xsl:apply-templates mode="acm2-documentation" />
		</div>
	</xsl:template>
	
	<xsl:template match="x:*" mode="acm2-documentation">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates mode="acm2-documentation" />
		</xsl:copy>
	</xsl:template>
	<!-- end mode: acm2-documentation -->
	
	<!-- start mode: acm2-rdf -->
	<!-- MG <xsl:template match="rdf:RDF" mode="acm2-rdf"> -->
	<xsl:template match="db:annotation" mode="acm2-rdf">
		<div class="rdf">
			<xsl:apply-templates mode="acm2-rdf" />
		</div>
	</xsl:template>
	
	<!-- MG <xsl:template match="dcterms:title" mode="acm2-rdf"> -->
	<xsl:template match="db:title" mode="acm2-rdf">
		<strong>
			<xsl:apply-templates mode="acm2-rdf" />
			<xsl:text>:</xsl:text>
		</strong>
	</xsl:template>
	<!-- MG <xsl:template match="dcterms:description" mode="acm2-rdf"> -->
	<xsl:template match="db:para[contains(@role,'desc-main')]" mode="acm2-rdf">
		<xsl:apply-templates mode="acm2-rdf" />
	</xsl:template>
	
	<xsl:template match="x:*" mode="acm2-rdf">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates mode="acm2-rdf" />
		</xsl:copy>
	</xsl:template>
	<!-- end mode: acm2-rdf -->
	
	<!-- start mode: acm2 -->
	<!-- Generally, ignore a:documentation in acm2 mode (but look at eg the templates below) -->
	<xsl:template match="a:documentation" mode="acm2" />
	
	<xsl:template match="datatype" mode="acm2">
		<!-- This is an artificial grouping element, so just carry on -->
		<xsl:apply-templates mode="acm2" />
	</xsl:template>
	
	<!-- Generally, ignore datatype/rdf:RDF in acm2 mode (but look at eg the templates below) -->
	<!-- MG <xsl:template match="datatype/rdf:RDF" mode="acm2" /> -->
	<xsl:template match="datatype/db:annotation" mode="acm2" />
	
	<xsl:template match="data[@type and @datatypeLibrary]" mode="acm2">
		<div class="rng">
			<xsl:text>some data of type </xsl:text>
			<code>
				<xsl:value-of select="@type" />
			</code>
			<xsl:text> compliant with the data type library </xsl:text>
			<code>
				<xsl:value-of select="@datatypeLibrary" />
			</code>
			<xsl:apply-templates mode="acm2" />
			<xsl:call-template name="attributeFeatureContribution" />
			<!-- MG <xsl:apply-templates select="(following-sibling::rdf:RDF,preceding-sibling::rdf:RDF)[1]"
				mode="acm2-rdf" /> -->
			<xsl:apply-templates select="(following-sibling::db:annotation,preceding-sibling::db:annotation)[1]"
				mode="acm2-rdf" />
			<xsl:apply-templates select="following-sibling::*[1][local-name() eq 'documentation']"
				mode="acm2-documentation" />
		</div>
		<!-- This is an artificial grouping element, so just carry on -->
		<!--		<xsl:apply-templates mode="acm2" />-->
	</xsl:template>
	
	<xsl:template match="data/param[@name eq 'pattern']" mode="acm2">
		<div class="rng">
			<xsl:text>the data must be compliant with the pattern </xsl:text>
			<code>
				<xsl:apply-templates mode="acm2" />
			</code>
		</div>
	</xsl:template>
	<xsl:template match="data/param[@name eq 'minLength']" mode="acm2">
		<div class="rng">
			<xsl:text>minimum length must be </xsl:text>
			<xsl:apply-templates mode="acm2" />
		</div>
	</xsl:template>
	<xsl:template match="data/param[@name eq 'length']" mode="acm2">
		<div class="rng">
			<xsl:text>length must be </xsl:text>
			<xsl:apply-templates mode="acm2" />
		</div>
	</xsl:template>
	
	
	<xsl:template match="choice[every $e in child::rng:* satisfies local-name($e) eq 'value']"
		mode="acm2">
		<div class="rng">
			<span class="rng-term">one of the following values</span>
			<xsl:apply-templates mode="acm2" />
		</div>
	</xsl:template>
	<xsl:template match="choice[not(every $e in child::rng:* satisfies local-name($e) eq 'value')]"
		mode="acm2">
		<div class="rng">
			<span class="rng-term">one of the following</span>
			<xsl:apply-templates mode="acm2" />
		</div>
	</xsl:template>
	
	
	<xsl:template
		match="choice[every $e in child::rng:* satisfies local-name($e) eq 'value']/value[@type eq 'token']"
		mode="acm2" priority="5">
		<div class="rng">
			<code>
				<xsl:value-of select="." />
			</code>
			<xsl:call-template name="attributeFeatureContribution" />
			<xsl:apply-templates select="following-sibling::*[1][local-name() eq 'documentation']"
				mode="acm2-documentation" />
			<!--			<xsl:value-of select="name(following-sibling::*[1])"/>
				<xsl:if test="local-name(following-sibling::*[1]) eq 'document'">
				<div class="documentation">
				<xsl:apply-templates></xsl:apply-templates>
				</div>
				</xsl:if>-->
		</div>
	</xsl:template>
	
	<!-- Don't use rdf when in acm2 mode -->
	<!-- MG <xsl:template match="grammar/rdf:RDF" mode="acm2">REMOVED</xsl:template> -->
	<xsl:template match="grammar/db:annotation" mode="acm2">REMOVED</xsl:template>
	
	<xsl:template match="text" mode="acm2">
		<div class="rng">text</div>
	</xsl:template>
	
	<xsl:template match="value[not(child::element())]" mode="acm2">
		<div class="rng">
			<xsl:text>the value </xsl:text>
			<code>
				<xsl:value-of select="." />
			</code>
			<xsl:call-template name="attributeFeatureContribution" />
			<xsl:apply-templates select="following-sibling::*[1][local-name() eq 'documentation']"
				mode="acm2-documentation" />
		</div>
	</xsl:template>
	
	<xsl:template match="list" mode="acm2">
		<div class="rng">
			<span class="rng-term">a white space separated list of</span>
			<xsl:apply-templates mode="acm2" />
		</div>
	</xsl:template>
	<xsl:template match="oneOrMore" mode="acm2">
		<div class="rng">
			<span class="rng-term">one or more of</span>
			<xsl:apply-templates mode="acm2" />
		</div>
	</xsl:template>
	<xsl:template match="zeroOrMore" mode="acm2">
		<div class="rng">
			<span class="rng-term">zero or more of</span>
			<xsl:apply-templates mode="acm2" />
		</div>
	</xsl:template>
	
	<xsl:template match="some-stuff" mode="acm2">
		<xsl:apply-templates mode="acm2" />
	</xsl:template>
	<xsl:template match="*" mode="acm2">
		<xsl:if test="$Debug">
			<xsl:message><xsl:text>## debug: </xsl:text><xsl:value-of select="ancestor::grammar/@name" />: missing template for <xsl:value-of select="name()" /></xsl:message>
		</xsl:if>
		<div class="rng">
			<span class="rng-x">
				<xsl:value-of select="local-name()" />
			</span>
			<div class="rng-content">
				<xsl:apply-templates mode="acm2" />
			</div>
		</div>
	</xsl:template>
	<!-- end mode: acm2 -->
	
</xsl:stylesheet>
