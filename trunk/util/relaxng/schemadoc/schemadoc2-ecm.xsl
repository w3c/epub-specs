<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs rng xd dcterms z rdf zrng zsd a x sch" version="2.0"
	xmlns="http://www.w3.org/1999/xhtml" xmlns:dcterms="http://purl.org/dc/terms/"
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

	<!-- Include ecm-display mode templates: -->
	<xsl:include href="schemadoc2-ecm-display.xsl" />

	<!-- Start: mode="ecm" -->
	<!-- Ignore optional attributes, they are already presented -->
	<xsl:template
		match="element/optional[ref][every $e in ref satisfies $e/@zrng:define eq 'attribute']"
		mode="ecm" priority="2" />

	<!-- empty children of element can be ignored, they occur very frequently, and are not used to decide whether an element has content, or not -->
	<xsl:template match="element//empty" mode="ecm" />

	<xsl:template
		match="interleave[descendant::rng:ref][every $e in descendant::rng:ref satisfies $e/@zrng:define eq 'attribute']"
		mode="ecm">
		<!-- If we only have attributes in an interleave, the don't present. Order is not relevant for attribs  -->
		<xsl:apply-templates mode="ecm" />
	</xsl:template>
	<xsl:template match="interleave" mode="ecm">
		<div class="rng-interleave">
			<xsl:text>mix of </xsl:text>
			<xsl:apply-templates mode="ecm" />
			<xsl:text> end of mix</xsl:text>
		</div>
	</xsl:template>

	<xsl:template match="zeroOrMore" mode="ecm">
		<div class="rng"> zero or more of <xsl:apply-templates mode="ecm" />
		</div>
	</xsl:template>
	<xsl:template match="oneOrMore" mode="ecm">
		<div class="rng"> at least one of <xsl:apply-templates mode="ecm" />
		</div>
	</xsl:template>
	<xsl:template match="group" mode="ecm">
		<!-- group doesn't give any information except for ordering, which is taken care of, so just apply templates -->
		<xsl:apply-templates mode="ecm" />
	</xsl:template>


	<xsl:template match="choice" mode="ecm">
		<xsl:variable name="elementRefs" as="element()*" select="ref[@zrng:define eq 'element']" />
		<xsl:variable name="childElements" as="element()*"
			select="for $e in $elementRefs return $SCHEMA.REORGANIZED//*[@zsd:define-name eq $e/@name]" />
		<!-- ignore occurences of  choice/empty  -->
		<xsl:variable name="otherStuffNotEmpty" as="element()*"
			select="rng:* except $elementRefs except empty" />
		<xsl:choose>
			<xsl:when test="not($childElements) and not($otherStuffNotEmpty)" />
			<xsl:when test="not($childElements) and count($otherStuffNotEmpty) eq 1">
				<!-- No direct refs to children, and just one element of an other kind:
					Don't present as a choice, we are only having one possibility.
					So just apply templates for the other stuff
				-->
				<xsl:apply-templates select="$otherStuffNotEmpty" mode="ecm" />
			</xsl:when>
			<xsl:when test="not($childElements) and count($otherStuffNotEmpty) gt 1">
				<!-- No direct refs to children, but several elements of an other kind, so we have a real choice.
					So present the choice, and apply templates for the other stuff
				-->
				<div class="rng-choice">
					<span class="rng-term">choice of one of</span>
					<xsl:for-each select="$otherStuffNotEmpty">
						<div class="rng-choice-item">
							<xsl:if test="position() gt 1">
								<span class="rng-term">or</span>
							</xsl:if>
							<xsl:apply-templates select="." mode="ecm" />
						</div>
					</xsl:for-each>
					<span class="rng-term">end of choice</span>
				</div>
			</xsl:when>
			<xsl:when test="$childElements and not($otherStuffNotEmpty)">
				<!-- Only refs to children in this choice, so present them -->
				<div class="rng">
					<xsl:if test="count($childElements) gt 1">
						<span class="rng-choice-term">choice of one of the following elements:
						</span>
					</xsl:if>
					<xsl:for-each select="$childElements">
						<xsl:sort select="@zsd:qname" />
						<a class="element" href="{@zsd:doc-pointer}">
							<xsl:value-of select="@zsd:qname" />
						</a>
						<xsl:choose>
							<xsl:when test="position() eq last()" />
							<xsl:when test="position() eq last() -1"> and </xsl:when>
							<xsl:otherwise>
								<xsl:text>, </xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</div>
			</xsl:when>
			<xsl:when test="$childElements and count($otherStuffNotEmpty) eq 1">
				<!-- We have refs to children in this choice, together with one other element, so there is a choice -->
				<div class="rng-choice">
					<span class="rng-choice-term">choice of one of </span>
					<div class="rng">
						<span class="rng-choice-term">the following elements </span>
						<xsl:for-each select="$childElements">
							<xsl:sort select="@zsd:qname" />
							<a class="element" href="{@zsd:doc-pointer}">
								<xsl:value-of select="@zsd:qname" />
							</a>
							<xsl:choose>
								<xsl:when test="position() eq last()" />
								<xsl:when test="position() eq last() -1"> and </xsl:when>
								<xsl:otherwise>
									<xsl:text>, </xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</div>
					<span class="rng-choice-term">or </span>
					<xsl:apply-templates select="$otherStuffNotEmpty" mode="ecm" />
					<span class="rng-term">end of choice</span>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<!-- We have both refs to children, and we have at least two more elements of a different type,
					so we'll present a choice
				-->
				<div class="rng-choice">
					<span class="rng-choice-term">choice of one of </span>
					<div class="rng">
						<span class="rng-choice-term">the following elements </span>
						<xsl:for-each select="$childElements">
							<xsl:sort select="@zsd:qname" />
							<a class="element" href="{@zsd:doc-pointer}">
								<xsl:value-of select="@zsd:qname" />
							</a>
							<xsl:choose>
								<xsl:when test="position() eq last()" />
								<xsl:when test="position() eq last() -1"> and </xsl:when>
								<xsl:otherwise>
									<xsl:text>, </xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</div>
					<xsl:for-each select="$otherStuffNotEmpty">
						<div class="rng-choice-item">
							<xsl:if test="position() gt 1">
								<span class="rng-term">or</span>
							</xsl:if>
							<xsl:apply-templates select="." mode="ecm" />
						</div>
					</xsl:for-each>
					<span class="rng-term">end of choice</span>
				</div>
			</xsl:otherwise>
		</xsl:choose>
		<!--<hr />
			<div class="rng-choice">
			<xsl:text>exactly one of </xsl:text>
			<xsl:if test="$elementRefs">
			<div class="rng">
			<xsl:text>the following elements: </xsl:text>
			<xsl:for-each select="$childElements">
			<xsl:sort select="@zsd:qname" />
			<a class="element" href="{@zsd:doc-pointer}">
			<xsl:value-of select="@zsd:qname" />
			<xsl:text> (e)</xsl:text>
			</a>
			<xsl:choose>
			<xsl:when test="position() eq last()" />
			<xsl:when test="position() eq last() -1"> and </xsl:when>
			<xsl:otherwise>
			<xsl:text>, </xsl:text>
			</xsl:otherwise>
			</xsl:choose>
			
			</xsl:for-each>
			</div>
			<div class="rng"> other stuff <xsl:apply-templates select="$otherStuffNotEmpty"
			mode="ecm" />
			</div>
			</xsl:if>
			</div>-->
	</xsl:template>

	<xsl:template match="optional[ref/@zrng:define eq 'attribute']" mode="ecm">
		<!-- optional is handled in the template below, so just apply templates -->
		<xsl:apply-templates mode="ecm" />
	</xsl:template>

	<xsl:template match="ref[@zrng:define eq 'attribute']" mode="ecm">
		<xsl:variable name="referenced-attributes" as="element()"
			select="$SCHEMA.REORGANIZED//attribute[@zsd:define-name eq current()/@name]" />

		<div class="rng">
			<xsl:if
				test="parent::optional or $referenced-attributes/ancestor::rng-optional-attribute-list">
				<xsl:text>optional </xsl:text>
			</xsl:if>
			<a href="{$referenced-attributes/@zsd:doc-pointer}" class="attribute">
				<xsl:text>@</xsl:text>
				<xsl:value-of select="$referenced-attributes/@zsd:qname" />
				<!--<xsl:text> (a)</xsl:text>-->

			</a>
		</div>
	</xsl:template>


	<xsl:template match="ref[@zrng:define eq 'element']" mode="ecm">
		<xsl:variable name="referenced-element" as="element()"
			select="$SCHEMA.REORGANIZED//element[@zsd:define-name eq current()/@name]" />

		<div class="rng">
			<a href="{$referenced-element/@zsd:doc-pointer}" class="element">
				<xsl:value-of select="$referenced-element/@zsd:qname" />
				<!--<xsl:text> (e)</xsl:text>-->
			</a>
		</div>
	</xsl:template>

	<xsl:template match="ref[@zrng:define eq 'data']" mode="ecm">
		<xsl:variable name="referenced-element" as="element()"
			select="$SCHEMA.REORGANIZED//*[@zsd:define-name eq current()/@name]/data" />

		<div class="rng">
			<xsl:text>some data of type </xsl:text>
			<code>
				<xsl:value-of select="$referenced-element/@type" />
			</code>
			<xsl:text> compliant with the data type library </xsl:text>
			<code>
				<xsl:value-of select="$referenced-element/@datatypeLibrary" />
			</code>
		</div>
	</xsl:template>

	<xsl:template match="text" mode="ecm">
		<div class="rng">text</div>
	</xsl:template>

	<!-- For other rng elements, simply present the local-name() and continue -->
	<xsl:template match="*" mode="ecm" priority="-5">
		<!--<xsl:message> ecm: <xsl:value-of select="local-name()"/></xsl:message>-->
		<div class="rng">
			<span class="rng-x">
				<xsl:value-of select="local-name()" />
			</span>
			<div class="rng-content">
				<xsl:apply-templates mode="ecm" />
			</div>
		</div>
	</xsl:template>
	<!-- End: mode="ecm" -->


	<!-- start mode: ecm-build -->
	<xsl:template match="*" mode="ecm-build">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates mode="ecm-build" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="ref[@zrng:define eq 'attribute']" mode="ecm-build">
		<xsl:variable name="att" as="element()"
			select="$SCHEMA.REORGANIZED//attribute[@zsd:define-name eq current()/@name]" />
		<attribute xmlns="http://relaxng.org/ns/structure/1.0">
			<xsl:attribute name="doc-pointer" select="$att/@zsd:doc-pointer" />
			<xsl:attribute name="qname" select="$att/@zsd:qname" />
			<!--<xsl:attribute name="define-name" select="@name"></xsl:attribute>-->
			<xsl:attribute name="isRDFa"
				select="if (matches(@name,'^rdfa\..+\.attrib$')) then 'yes' else 'no'" />
		</attribute>
	</xsl:template>

	<xsl:template match="ref[@zrng:define eq 'element']" mode="ecm-build">
		<xsl:variable name="elm" as="element()"
			select="$SCHEMA.REORGANIZED//*[@zsd:define-name eq current()/@name]" />
		<element xmlns="http://relaxng.org/ns/structure/1.0">
			<xsl:attribute name="doc-pointer" select="$elm/@zsd:doc-pointer" />
			<xsl:attribute name="qname" select="$elm/@zsd:qname" />
		</element>
	</xsl:template>

	<xsl:template match="ref[@zrng:define eq 'data']" mode="ecm-build">
		<xsl:variable name="data" as="element()"
			select="$SCHEMA.REORGANIZED//*[@zsd:define-name eq current()/@name]" />
		<xsl:choose>
			<xsl:when test="local-name($data) eq 'some-stuff'">
				<xsl:copy-of select="$data/data" />
			</xsl:when>
			<xsl:when test="local-name($data) eq 'datatype'">
				<datatype-with-RDF xmlns="http://relaxng.org/ns/structure/1.0">
					<xsl:copy-of select="$data/*" />
				</datatype-with-RDF>
			</xsl:when>
			<xsl:otherwise>
				<xsl:message terminate="yes">Unexpected container for reference to data from an element</xsl:message>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- end mode: ecm-build -->


	<!-- start mode: ecm-rdfa -->
	<xsl:template match="grammar" mode="ecm-rdfa">
		<xsl:apply-templates mode="ecm-rdfa" />
	</xsl:template>

	<xsl:template match="optional/attribute[@isRDFa eq 'yes']" mode="ecm-rdfa">
		<xsl:param name="stripRDFa" as="xs:boolean" tunnel="yes" />
		<xsl:choose>
			<xsl:when test="$stripRDFa" />
			<xsl:otherwise>
				<xsl:next-match />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="*" mode="ecm-rdfa">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates mode="ecm-rdfa" />
		</xsl:copy>
	</xsl:template>
	<!-- end mode: ecm-rdfa -->

	<!-- start mode: ecm-clean -->
	<xsl:template match="*" mode="ecm-clean" priority="-5">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates mode="ecm-clean" />
		</xsl:copy>
	</xsl:template>

	<!-- Remove choice/empty from choice -->
	<xsl:template match="choice/empty" mode="ecm-clean" />

	<xsl:template match="choice[element or attribute]" mode="ecm-clean">
		<xsl:copy>
			<xsl:if test="element">
				<elementgroup xmlns="http://relaxng.org/ns/structure/1.0" count="{count(element)}">
					<xsl:apply-templates select="element" mode="ecm-clean" />
				</elementgroup>
			</xsl:if>
			<xsl:if test="attribute">
				<attributegroup xmlns="http://relaxng.org/ns/structure/1.0"
					count="{count(attribute)}">
					<xsl:apply-templates select="attribute" mode="ecm-clean" />
				</attributegroup>
			</xsl:if>
			<xsl:apply-templates select="* except element except attribute" mode="ecm-clean" />
		</xsl:copy>
	</xsl:template>

	<!-- Remove empty option elements, they are leftovers from RDFa stripping -->
	<xsl:template match="optional[not(child::*) and normalize-space(.) eq '']" mode="ecm-clean">
		<xsl:comment>removes empty optional</xsl:comment>
	</xsl:template>

	<!-- Ignore grouping unless containing elements -->
	<xsl:template match="grammar/group[not(descendant::element)]" mode="ecm-clean">
		<xsl:comment>removed group</xsl:comment>
		<xsl:apply-templates mode="ecm-clean" />
		<xsl:comment>up to this point</xsl:comment>
	</xsl:template>
	<xsl:template match="interleave[not(parent::choice)][not(descendant::element)]" mode="ecm-clean">
		<!--<xsl:message>ignoring interleave in <xsl:value-of select="ancestor::grammar/@name" /></xsl:message>-->
		<xsl:comment>removed interleave</xsl:comment>
		<xsl:apply-templates mode="ecm-clean" />
		<xsl:comment>up to this point</xsl:comment>
	</xsl:template>

	<xsl:template
		match="grammar/optional[not(descendant::element)][count(child::*) eq 1 and group][every $e in group/child::* satisfies local-name($e) eq 'optional']"
		mode="ecm-clean">
		<!--<xsl:message>ignoring optional/group in <xsl:value-of select="ancestor::grammar/@name" /></xsl:message>-->
		<xsl:comment>removed optional/group</xsl:comment>
		<xsl:apply-templates select="group/*" mode="ecm-clean" />
		<xsl:comment>up to this point</xsl:comment>
	</xsl:template>

	<!-- Ignore interleave unless containing elements -->
	<!-- end mode: ecm-clean -->


	<!-- start mode: ecm-order -->
	<xsl:template match="*" mode="ecm-order" priority="-5">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates mode="ecm-order" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="choice[count(child::*) gt 1]/*" mode="ecm-order">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" />
			<xsl:attribute name="order-text">
				<xsl:choose>
					<xsl:when test="not(preceding-sibling::*)">
						<xsl:value-of select="'either '" />
					</xsl:when>
					<!--<xsl:when test="not(following-sibling::*)">
						<xsl:value-of select="'or '" />
					</xsl:when>-->
					<xsl:otherwise>
						<xsl:value-of select="'or '" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:apply-templates mode="ecm-order" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="group[count(child::*) gt 1 and count(descendant::element) gt 1]/*"
		mode="ecm-order">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" />
			<xsl:attribute name="order-text">
				<xsl:choose>
					<xsl:when test="not(preceding-sibling::*)">
						<xsl:value-of select="'first '" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'followed by '" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:apply-templates mode="ecm-order" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="interleave[count(child::*) gt 1]/*" mode="ecm-order">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" />
			<xsl:attribute name="order-text">
				<xsl:text>&#8226; </xsl:text>
			</xsl:attribute>
			<xsl:apply-templates mode="ecm-order" />
		</xsl:copy>
	</xsl:template>
	<!-- end mode: ecm-order -->

	<!-- start mode: ecm-clean-strip-choice -->
	<xsl:template match="*" mode="ecm-clean-strip-choice" priority="-5">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates mode="ecm-clean-strip-choice" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="choice[count(child::*) = 1]" mode="ecm-clean-strip-choice">
		<xsl:comment>Remove choice</xsl:comment>
		<xsl:apply-templates mode="ecm-clean-strip-choice" />
	</xsl:template>

	<!-- end mode: ecm-clean-strip-choice -->

</xsl:stylesheet>
