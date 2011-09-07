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

	<xsl:template match="*" mode="ecm-display" priority="-5">
		<!--		<xsl:message>ecm-display: <xsl:value-of select="local-name()" /> i <xsl:value-of select="ancestor::grammar/@name" /></xsl:message>-->
		<div class="rng">
			<span class="rng-x">
				<strong>
					<xsl:value-of select="local-name()" />
				</strong>
			</span>
			<div class="rng-content">
				<xsl:apply-templates mode="ecm-display" />
			</div>
		</div>
	</xsl:template>

	<xsl:template match="grammar" mode="ecm-display">
		<xsl:variable name="displayRDFaLink" as="xs:boolean" select="exists(link[@to eq 'rdfa'])" />
		<xsl:if test="attribute">
			<div class="rng-required-attributes">
				<xsl:text>required attributes: </xsl:text>
				<xsl:for-each select="attribute">
					<xsl:sort select="@qname" />
					<a class="attribute" href="{@doc-pointer}">
						<xsl:text>@</xsl:text>
						<xsl:value-of select="@qname" />
					</a>
					<xsl:choose>
						<xsl:when test="position() eq last()" />
						<xsl:when test="position() eq last() - 1">
							<xsl:text> and </xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>, </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="$newLine" />
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="optional[count(attribute) eq 1]/attribute">
			<div class="rng-optional-attributes">
				<xsl:text>optional attributes: </xsl:text>
				<xsl:for-each select="optional[count(attribute) eq 1]/attribute">
					<xsl:sort select="@qname" />
					<xsl:apply-templates select="." mode="ecm-display" />
					<xsl:choose>
						<xsl:when test="position() eq last()" />
						<xsl:when test="not($displayRDFaLink) and position() eq last() - 1">
							<xsl:text> and </xsl:text>
							<xsl:value-of select="$newLine" />
						</xsl:when>
						<!--						<xsl:when test="$displayRDFaLink and position() eq last() - 1">
							<xsl:text>, </xsl:text>
						</xsl:when>-->
						<xsl:otherwise>
							<xsl:text>, </xsl:text>
							<xsl:value-of select="$newLine" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:if test="$displayRDFaLink">
					<xsl:text> and the </xsl:text>
					<a class="attribute" href="attributes.html#rdfa">RDFa attribute set</a>
				</xsl:if>
			</div>
		</xsl:if>

		<xsl:apply-templates mode="ecm-display" />
	</xsl:template>

	<!-- Ignore required and optional attribs, they are handled above -->
	<xsl:template match="grammar/attribute | grammar/optional[count(child::*) eq 1 and attribute]"
		mode="ecm-display" priority="5" />

	<xsl:template match="grammar[count(child::*) eq 1]/empty" mode="ecm-display">
		<div class="rng">no attributes, child elements or text allowed</div>
	</xsl:template>
	<xsl:template match="optional[every $e in child::* satisfies local-name($e) eq 'element']"
		mode="ecm-display">
		<div class="rng">
			<xsl:apply-templates select="@order-text" />
			<xsl:choose>
				<xsl:when test="count(element) eq 1">
					<span class="rng-term">
						<xsl:text>an optional </xsl:text>
					</span>
					<xsl:apply-templates mode="ecm-display" />
				</xsl:when>
				<xsl:otherwise>
					<!--<xsl:message>Several elements together in one optional <xsl:value-of select="ancestor::grammar/@name" /></xsl:message>-->
					<span class="rng-term">
						<xsl:text>optionally the following </xsl:text>
						<xsl:value-of select="count(element)" />
						<xsl:text> elements: </xsl:text>
					</span>
					<xsl:for-each select="element">
						<xsl:apply-templates select="." mode="ecm-display" />
						<xsl:choose>
							<xsl:when test="position() eq last()" />
							<xsl:otherwise>
								<xsl:text>, followed by </xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template match="optional[every $e in child::* satisfies local-name($e) eq 'attribute']"
		mode="ecm-display">
		<div class="rng">
			<xsl:apply-templates select="@order-text" />
			<xsl:choose>
				<xsl:when test="count(attribute) eq 1">
					<span class="rng-term">
						<xsl:text>an optional </xsl:text>
					</span>
					<xsl:apply-templates mode="ecm-display" />
				</xsl:when>
				<xsl:otherwise>
					<span class="rng-term">
						<xsl:text>optionally the following </xsl:text>
						<xsl:value-of select="count(attribute)" />
						<xsl:text> co-ocurring attributes: </xsl:text>
					</span>
					<xsl:for-each select="attribute">
						<xsl:sort select="@qname" />
						<xsl:apply-templates select="." mode="ecm-display" />
						<xsl:choose>
							<xsl:when test="position() eq last()" />
							<xsl:when test="position() eq last() - 1">
								<xsl:text> and </xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>, </xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>


	<xsl:template match="link[@to eq 'rdfa']" mode="ecm-display" />

	<xsl:template match="optional" mode="ecm-display">
		<div class="rng">
			<xsl:apply-templates select="@order-text" />
			<span class="rng-term">optionally </span>
			<xsl:apply-templates mode="ecm-display" />
		</div>
	</xsl:template>
	<xsl:template match="oneOrMore" mode="ecm-display">
		<div class="rng">
			<xsl:apply-templates select="@order-text" />
			<span class="rng-term">one or more of </span>
			<xsl:apply-templates mode="ecm-display" />
		</div>
	</xsl:template>
	<xsl:template match="zeroOrMore" mode="ecm-display">
		<div class="rng">
			<xsl:apply-templates select="@order-text" />
			<span class="rng-term">zero or more of </span>
			<xsl:apply-templates mode="ecm-display" />
		</div>
	</xsl:template>
	<xsl:template match="interleave" mode="ecm-display">
		<div class="rng">
			<xsl:apply-templates select="@order-text" />
			<span class="rng-term">a mix of</span>
			<xsl:apply-templates mode="ecm-display" />
			<span class="rng-term">end of mix</span>
		</div>
	</xsl:template>

	<xsl:template match="choice" mode="ecm-display">
		<div>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="parent::grammar">
						<xsl:text>rng-choice</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>rng</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:apply-templates select="@order-text" />
			<span class="rng-term">a choice of</span>
			<xsl:apply-templates mode="ecm-display" />
			<span class="rng-term">end of choice</span>
		</div>
	</xsl:template>
	
	<xsl:template match="choice/empty" mode="ecm-display">
		<div class="rng">
			<xsl:apply-templates select="@order-text" />
			<xsl:choose>
				<xsl:when test="some $e in following-sibling::element()|preceding-sibling::element() satisfies some $f in $e/descendant-or-self::element() satisfies matches(local-name($f),'^(element|elementgroup)$')">
					<xsl:text>no content</xsl:text>
					<!--<xsl:message>no content: <xsl:value-of select="ancestor::grammar/@name"/></xsl:message>-->
				</xsl:when>
				<xsl:when test="some $e in following-sibling::element()|preceding-sibling::element() satisfies some $f in $e/descendant-or-self::element() satisfies matches(local-name($f),'^attribute$')">
					<xsl:text>no attribute</xsl:text>
					<!--<xsl:message>no attribute: <xsl:value-of select="ancestor::grammar/@name"/></xsl:message>-->
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>empty</xsl:text>
					<!--<xsl:message>empty: <xsl:value-of select="ancestor::grammar/@name"/></xsl:message>-->
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template match="choice[count(child::*) = 1 and elementgroup]" mode="ecm-display">
		<div class="rng">
			<xsl:apply-templates select="@order-text" />
			<xsl:choose>
				<xsl:when test="elementgroup/@count eq '1'">
					<xsl:apply-templates select="elementgroup/element" mode="ecm-display" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>any of the </xsl:text>
					<xsl:value-of select="elementgroup/@count" />
					<xsl:text> elements: </xsl:text>
					<xsl:for-each select="elementgroup/element">
						<xsl:sort select="@qname" />
						<xsl:apply-templates select="." mode="ecm-display" />
						<xsl:choose>
							<xsl:when test="position() eq last()" />
							<xsl:when test="position() eq last() - 1">
								<xsl:text> and </xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>, </xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template match="choice[count(child::*) gt 1 and elementgroup and not(attributegroup)]"
		mode="ecm-display">
		<div>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="parent::grammar">
						<xsl:text>rng-choice</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>rng</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>

			<xsl:apply-templates select="@order-text" />
			<span class="tng-term">a choice of </span>
			<xsl:apply-templates mode="ecm-display" />
			<span class="tng-term">end of choice</span>
		</div>
	</xsl:template>

	<xsl:template match="datatype-with-RDF" mode="ecm-display">
		<div class="rng">
			<xsl:apply-templates select="@order-text" />
			<xsl:apply-templates mode="ecm-display" />
		</div>
	</xsl:template>

	<!-- Generally, ignore datatype-with-RDF/rdf:RDF in ecm-display mode (but look at eg the templates below) -->
	<!-- MG <xsl:template match="datatype-with-RDF/rdf:RDF" mode="ecm-display" /> -->
	<xsl:template match="datatype-with-RDF/db:annotation" mode="ecm-display" />
	
	<xsl:template match="datatype-with-RDF/data[@type and @datatypeLibrary]" mode="ecm-display">
		<div class="rng">
			<xsl:text>some data of type </xsl:text>
			<code>
				<xsl:value-of select="@type" />
			</code>
			<xsl:text> compliant with the data type library </xsl:text>
			<code>
				<xsl:value-of select="@datatypeLibrary" />
			</code>
			<xsl:apply-templates mode="ecm-display" />
			<!-- MG <xsl:apply-templates select="(following-sibling::rdf:RDF,preceding-sibling::rdf:RDF)[1]"
				mode="ecm-display-rdf" /> -->
			<xsl:apply-templates select="(following-sibling::db:annotation,preceding-sibling::db:annotation)[1]"
				mode="ecm-display-rdf" />
		</div>
	</xsl:template>

	<xsl:template match="data/param[@name eq 'length']" mode="ecm-display">
		<div class="rng">
			<xsl:text>length must be </xsl:text>
			<xsl:apply-templates mode="ecm-display" />
		</div>
	</xsl:template>
	
	<xsl:template match="elementgroup" mode="ecm-display">
		<div class="rng">
			<xsl:apply-templates select="@order-text" />
			<xsl:choose>
				<xsl:when test="@count eq '1'">
					<xsl:apply-templates select="element" mode="ecm-display" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>one of the </xsl:text>
					<xsl:value-of select="@count" />
					<xsl:text> elements: </xsl:text>
					<xsl:for-each select="element">
						<xsl:sort select="@qname" />
						<xsl:apply-templates select="." mode="ecm-display" />
						<xsl:choose>
							<xsl:when test="position() eq last()" />
							<xsl:when test="position() eq last() - 1">
								<xsl:text> or </xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>, </xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template match="attributegroup" mode="ecm-display">
		<div class="rng">
			<xsl:apply-templates select="@order-text" />
			<xsl:choose>
				<xsl:when test="@count eq '1'">
					<xsl:apply-templates select="attribute" mode="ecm-display" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>one of the </xsl:text>
					<xsl:value-of select="@count" />
					<xsl:text> attributes: </xsl:text>
					<xsl:for-each select="attribute">
						<xsl:sort select="@qname" />
						<xsl:apply-templates select="." mode="ecm-display" />
						<xsl:choose>
							<xsl:when test="position() eq last()" />
							<xsl:when test="position() eq last() - 1">
								<xsl:text> or </xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>, </xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template match="text" mode="ecm-display">
		<div class="rng">
			<xsl:apply-templates select="@order-text" />
			<xsl:text>text</xsl:text>
		</div>
	</xsl:template>
	<xsl:template match="element" mode="ecm-display">
		<xsl:apply-templates select="@order-text" />
		<a class="element" href="{@doc-pointer}">
			<xsl:value-of select="@qname" />
		</a>
	</xsl:template>
	<xsl:template match="attribute" mode="ecm-display">
		<xsl:apply-templates select="@order-text" />
		<a class="attribute" href="{@doc-pointer}">
			<xsl:text>@</xsl:text>
			<xsl:value-of select="@qname" />
		</a>
	</xsl:template>
	<xsl:template
		match="
			attribute[@order-text] 
			| element[@order-text]
			| attribute[some $e in following-sibling::* satisfies local-name($e) ne 'attribute'] 
			| attribute[some $e in preceding-sibling::* satisfies local-name($e) ne 'attribute']
			"
		mode="ecm-display">
		<div class="rng">
			<xsl:next-match />
		</div>
	</xsl:template>

	<xsl:template match="choice/group" mode="ecm-display">
		<div class="rng">
			<xsl:apply-templates select="@order-text" />
			<xsl:apply-templates mode="ecm-display" />
		</div>
	</xsl:template>

	<xsl:template match="grammar/data[@type and @datatypeLibrary]" mode="ecm-display">
		<div class="rng">
			<xsl:text>some data of type </xsl:text>
			<code>
				<xsl:value-of select="@type" />
			</code>
			<xsl:text> compliant with the data type library </xsl:text>
			<code>
				<xsl:value-of select="@datatypeLibrary" />
			</code>
			<xsl:apply-templates mode="ecm-display" />
		</div>
	</xsl:template>
	
	<!-- start mode: ecm-display-rdf -->
	<!-- MG <xsl:template match="rdf:RDF" mode="ecm-display-rdf"> -->
	<xsl:template match="db:annotation" mode="ecm-display-rdf">
		<div class="rdf">
			<xsl:apply-templates mode="ecm-display-rdf" />
		</div>
	</xsl:template>
	
	<!-- <xsl:template match="dcterms:title" mode="ecm-display-rdf"> -->
	<xsl:template match="db:title" mode="ecm-display-rdf">
		<strong>
			<xsl:apply-templates mode="ecm-display-rdf" />
			<xsl:text>:</xsl:text>
		</strong>
	</xsl:template>
	<!-- MG <xsl:template match="dcterms:description" mode="ecm-display-rdf"> -->
	<xsl:template match="db:para[contains(@role,'desc-main')]" mode="ecm-display-rdf">
		<xsl:apply-templates mode="ecm-display-rdf" />
	</xsl:template>
	
	<xsl:template match="x:*" mode="ecm-display-rdf">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates mode="ecm-display-rdf" />
		</xsl:copy>
	</xsl:template>
	<!-- end mode: ecm-display-rdf -->
	
</xsl:stylesheet>
