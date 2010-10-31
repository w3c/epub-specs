<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs rng xd dcterms z rdf zrng zsd a x sch db" version="2.0"
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


	<!-- Include acm (and related) mode templates: -->
	<xsl:include href="schemadoc2-acm.xsl" />

	<!-- Include ecm (and related) mode templates: -->
	<xsl:include href="schemadoc2-ecm.xsl" />

	<!-- Include other mode templates: -->
	<xsl:include href="schemadoc2-other-modes.xsl" />

	<!-- Include a few functions: -->
	<xsl:include href="schemadoc2-functions.xsl" />

	<xsl:param as="xs:string" name="output-path" select="'undefined'" />
	<xsl:param as="xs:string" name="profile-machine-name" select="'undefined'" />
	<xsl:param name="rd-summary" as="xs:string" select="'undefined'" />
	<!--<xsl:param as="document-node()" name="summary" />-->

	<xsl:variable name="rdSummary" as="xs:string" select="zsd:adjustURI($rd-summary,false())" />

	<xsl:variable name="summary" as="document-node()" select="doc($rdSummary)" />
	<!--	<xsl:variable name="profile-version" as="xs:string?"
		select="replace($summary//*:profile[@machinename eq $profile-machine-name]/@rd-uri,'^.+/(.+?)/','$1')" />-->

	<xsl:variable name="outputPath" as="xs:string" select="zsd:adjustURI($output-path,true())" />

	<xsl:variable name="newLine" as="xs:string" select="'&#10;'" />

	<xsl:variable name="profile-nice-name" as="xs:string"
		select="$summary//*:profile[@machinename eq $profile-machine-name]/@nicename" />

	<xsl:variable name="rdfa.attribs" as="xs:string*"
		select="distinct-values(//define[matches(@name,'^rdfa\..+\.attrib$')]/@name)" />
	<xd:doc>
		<xd:desc>
			<xd:p>control output of debug information.</xd:p>
			<xd:p>By turning debug presentation on, some messages are written to standard out, and
				several XML-elements used internally during processing, are written to file. <xd:ref
					name="presentDebugInformation" type="template">See</xd:ref></xd:p>
			<xd:p>Possible values:</xd:p>
			<xd:ul>
				<xd:li><xd:b>1</xd:b>, <xd:b>yes</xd:b>, <xd:b>ok</xd:b> or <xd:b>true</xd:b>:
					Present debug information</xd:li>
				<xd:li>All other values: Don't present debug information</xd:li>
			</xd:ul>
			<xd:p>Case is not relevant.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:param as="xs:string" name="debug" select="'yes'" />
	<xsl:variable as="xs:boolean" name="Debug" select="matches($debug,'^yes|1|ok|true$','i')" />

	<xsl:variable name="xhtml-files.banner.top" as="element()">
		<div class="top-banner">
			<xsl:text>Schema Documentation - </xsl:text>
			<xsl:value-of select="$profile-nice-name" />
			<span class="titlesub">
				<br />
				<xsl:text> version </xsl:text>
				<xsl:value-of
					select="replace($summary//*:profile[@machinename eq $profile-machine-name]/@rd-uri,'^.+/(.+?)/','$1')"
				 />
			</span>
		</div>
	</xsl:variable>
	<xsl:variable name="xhtml-files.attributes.link-to-main-menu" as="element()">
		<a class="link-to-main-menu" href="../index.html">Back to<br /> main menu</a>
	</xsl:variable>

	<!-- Subfolder for the large number of doc files (may be left empty, but if not, should end with a slash) -->
	<xsl:variable as="xs:string" name="documentation.subfolder" select="'subfiles/'" />
	<xsl:variable name="documentation.attribute-information.filename" as="xs:string"
		select="'attributes.html'" />
	<xsl:variable name="documentation.datatype-information.filename" as="xs:string"
		select="'datatypes.html'" />

	<xsl:output method="text" />
	<xsl:output encoding="UTF-8" indent="yes" method="xml" name="plain-xml" />
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" encoding="UTF-8"
		indent="yes" method="xhtml" name="xhtml" />

	<xsl:variable name="SCHEMA" as="document-node()" select="/" />
	<xsl:variable as="xs:string*" name="SCHEMA.feature-names"
		select="distinct-values(//@zrng:feature[. ne 'none'])" />
	<xsl:variable as="xs:string" name="SCHEMA.base-filename"
		select="replace(base-uri(/),'^.+/(.+)\..+?$','$1')" />

	<xsl:variable name="SCHEMA.NAMESPACE-MAP" as="element()">
		<namespace-map xmlns="http://www.daisy.org/ns/rng/schemadoc">
			<xsl:attribute name="timestamp" select="current-dateTime()" />
			<xsl:for-each select="in-scope-prefixes(/grammar)[. ne '']">
				<ns prefix="{.}">
					<xsl:attribute name="ns-uri"
						select="namespace-uri-for-prefix(.,$SCHEMA/grammar)" />
				</ns>
			</xsl:for-each>
		</namespace-map>
	</xsl:variable>
	<xsl:variable name="SCHEMA.ELEMENT-LIST" as="element()">
		<xsl:variable as="xs:string" name="start.ref.name" select="//start/ref/@name" />
		<rng-element-list xmlns="http://relaxng.org/ns/structure/1.0">
			<xsl:attribute name="timestamp" select="current-dateTime()" />
			<named-elements>
				<xsl:for-each select="/grammar/define/element[@name]">
					<xsl:copy copy-namespaces="no">
						<xsl:attribute name="zsd:define-name" select="../@name" />
						<xsl:attribute name="zsd:qname">
							<xsl:choose>
								<xsl:when test="zsd:elementNamespacePrefix(@ns) ne ''">
									<xsl:value-of
										select="concat(zsd:elementNamespacePrefix(@ns),':',@name)"
									 />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@name" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<xsl:attribute name="zsd:isRootElement" select="../@name eq $start.ref.name" />
						<xsl:attribute name="zsd:define-name" select="../@name" />
						<xsl:attribute name="zsd:ns-prefix" select="zsd:elementNamespacePrefix(@ns)" />
						<xsl:attribute name="zsd:doc-pointer"
							select="concat(
						'e-',
						@name,
						format-number(
						count(preceding::element[@name eq current()/@name]) + 1,
						'00'),
						'.html')" />
						<!-- MG <xsl:if test="descendant::dcterms:title/@z:short"> -->
						<xsl:if test="descendant::db:title/@xreflabel"> 
							<xsl:attribute name="zsd:context">
								<xsl:choose>
									<!-- MG <xsl:when
										test="matches(descendant::dcterms:title/@z:short,'^.+ \(.+\)$')">
										<xsl:value-of
											select="replace(descendant::dcterms:title/@z:short,'^.+ \((.+)\)$','$1')"
										 /> -->
									<xsl:when
										test="matches(descendant::db:title/@xreflabel,'^.+ \(.+\)$')">
										<xsl:value-of
											select="replace(descendant::db:title/@xreflabel,'^.+ \((.+)\)$','$1')"
										/>	
									</xsl:when>
									<xsl:otherwise>										
										<!-- MG <xsl:value-of select="descendant::dcterms:title/@z:short" /> -->
										<xsl:value-of select="descendant::db:title/@xreflabel" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</xsl:if>
						<xsl:copy-of select="@*" />
						<xsl:copy-of select="child::node()" copy-namespaces="no" />
					</xsl:copy>
				</xsl:for-each>
			</named-elements>
			<!--<unnamed-elements>
				<xsl:for-each select="/grammar/define/element[not(@name)]">
					<xsl:copy copy-namespaces="no">
						<xsl:attribute name="zsd:define-name" select="../@name" />
						<xsl:attribute name="zsd:type">
							<xsl:choose>
								<xsl:when test="anyName and not(nsName)">
									<xsl:value-of select="'anyName'" />
								</xsl:when>
								<xsl:when test="not(anyName) and nsName">
									<xsl:value-of select="'nsName'" />
								</xsl:when>
								<xsl:when test="anyName and nsName">
									<xsl:message>!! Unexpected element type: anyName and nsName</xsl:message>
									<xsl:value-of select="'anyName-nsName'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:message>!! Unexpected element type.</xsl:message>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<xsl:copy-of select="@*" />
						<xsl:copy-of select="child::node()" copy-namespaces="no" />
					</xsl:copy>
				</xsl:for-each>
			</unnamed-elements>-->
		</rng-element-list>
	</xsl:variable>

	<xsl:variable as="element()" name="SCHEMA.ROOT-ELEMENT"
		select="$SCHEMA.ELEMENT-LIST//element[@zsd:isRootElement eq 'true']" />

	<xsl:variable as="element()" name="SCHEMA.ELEMENT-LIST.GROUPED">
		<rng-element-list-grouped xmlns="http://relaxng.org/ns/structure/1.0">
			<xsl:attribute name="timestamp" select="current-dateTime()" />
			<xsl:for-each-group group-by="@zsd:qname"
				select="$SCHEMA.ELEMENT-LIST/named-elements/element">
				<element-group
					zsd:doc-pointer="{concat('_',translate(current-group()[1]/@zsd:qname,':','-'),'.html')}"
					zsd:multiplicity="{count(current-group())}" zsd:qname="{current-grouping-key()}">
					<!--<xsl:copy-of select="current-group()[1]/@name, current-group()[1]/@ns" />-->
					<xsl:copy-of select="current-group()" />
				</element-group>
			</xsl:for-each-group>
		</rng-element-list-grouped>
	</xsl:variable>

	<xsl:variable as="element()" name="SCHEMA.ATTRIBUTE-LIST">
		<rng-attribute-list xmlns="http://relaxng.org/ns/structure/1.0">
			<xsl:attribute name="timestamp" select="current-dateTime()" />
			<xsl:for-each select="/grammar/define/attribute[@name]">
				<xsl:copy copy-namespaces="no">
					<xsl:attribute name="zsd:define-name" select="../@name" />
					<xsl:attribute name="zsd:ns-prefix" select="zsd:elementNamespacePrefix(@ns)" />
					<xsl:attribute name="zsd:qname">
						<xsl:choose>
							<xsl:when test="zsd:elementNamespacePrefix(@ns) ne ''">
								<xsl:value-of
									select="concat(zsd:elementNamespacePrefix(@ns),':',@name)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@name" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:attribute name="zsd:doc-pointer"
						select="
						concat(
						$documentation.attribute-information.filename,
						'#',
						@name,
						format-number(
						count(preceding::attribute[parent::define and @name eq current()/@name]) + 1,
						'00')
						)
						" />
					<xsl:copy-of select="@*" />
					<!-- Do we have any RDF siblings? -->
					<!-- MG <xsl:if test="preceding-sibling::rdf:RDF or following-sibling::rdf:RDF"> -->
					<xsl:if test="preceding-sibling::db:annotation or following-sibling::db:annotation">
						<!-- If so, copy the preceding sibling, or if no preceding, copy the following -->
						<zsd:rdf-doc>
							<!-- MG <xsl:copy-of
								select="(preceding-sibling::rdf:RDF,following-sibling::rdf:RDF)[1]" copy-namespaces="no"
								/> -->
							<xsl:copy-of
								select="(preceding-sibling::db:annotation,following-sibling::db:annotation)[1]" 
								copy-namespaces="no" />
						</zsd:rdf-doc>
					</xsl:if>
					<xsl:copy-of select="child::node()" copy-namespaces="no" />
				</xsl:copy>
			</xsl:for-each>
		</rng-attribute-list>
	</xsl:variable>
	<xsl:variable as="element()" name="SCHEMA.OPTIONAL-ATTRIBUTE-LIST">
		<rng-optional-attribute-list xmlns="http://relaxng.org/ns/structure/1.0">
			<xsl:attribute name="timestamp" select="current-dateTime()" />
			<xsl:for-each select="/grammar/define/optional/attribute[@name]">
				<xsl:copy copy-namespaces="no">
					<xsl:attribute name="zsd:define-name" select="../../@name" />
					<xsl:attribute name="zsd:ns-prefix" select="zsd:elementNamespacePrefix(@ns)" />
					<xsl:attribute name="zsd:qname">
						<xsl:choose>
							<xsl:when test="zsd:elementNamespacePrefix(@ns) ne ''">
								<xsl:value-of
									select="concat(zsd:elementNamespacePrefix(@ns),':',@name)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@name" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<!--					<xsl:attribute name="zsd:doc-pointer"
						select="
						concat(
						$documentation.attribute-information.filename,
						'#',
						@name,
						format-number(
						count(preceding::attribute[parent::define and @name eq current()/@name]) + 1,
						'00')
						)
						" />-->
					<xsl:attribute name="zsd:doc-pointer"
						select="
						concat(
						$documentation.attribute-information.filename,
						'#',
						@name,
						'-',
						generate-id()
						)
						" />
					<xsl:copy-of select="@*" />
					<xsl:copy-of select="child::node()" copy-namespaces="no" />
				</xsl:copy>
			</xsl:for-each>
		</rng-optional-attribute-list>
	</xsl:variable>

	<xsl:variable name="SCHEMA.ATTRIBUTE-LIST.GROUPED" as="element()">
		<rng-attribute-list-grouped xmlns="http://relaxng.org/ns/structure/1.0">
			<xsl:attribute name="timestamp" select="current-dateTime()" />
			<xsl:for-each-group group-by="@zsd:qname" select="$SCHEMA.ATTRIBUTE-LIST/attribute">
				<attribute-group
					zsd:doc-pointer="{concat($documentation.attribute-information.filename,'#',translate(current-group()[1]/@zsd:qname,':','-'))}"
					zsd:multiplicity="{count(current-group())}">
					<xsl:copy-of select="current-group()[1]/@zsd:qname, current-group()[1]/@ns" />
					<xsl:copy-of select="current-group()" />
				</attribute-group>
			</xsl:for-each-group>
		</rng-attribute-list-grouped>
	</xsl:variable>

	<xsl:variable as="element()" name="SCHEMA.UNNAMED-ELEMENTS">
		<rng-unnamed-elements xmlns="http://relaxng.org/ns/structure/1.0">
			<xsl:for-each select="//define/element[not(@name)]">
				<xsl:copy copy-namespaces="no">
					<xsl:attribute name="zsd:define-name" select="../@name" />
					<xsl:copy-of select="@*" />
					<xsl:copy-of select="child::node()" copy-namespaces="no" />
				</xsl:copy>
			</xsl:for-each>
		</rng-unnamed-elements>
	</xsl:variable>
	<xsl:variable as="element()" name="SCHEMA.UNNAMED-ATTRIBUTES">
		<rng-unnamed-attributes xmlns="http://relaxng.org/ns/structure/1.0">
			<xsl:for-each select="//define/attribute[not(@name)]">
				<xsl:copy copy-namespaces="no">
					<xsl:attribute name="zsd:define-name" select="../@name" />
					<xsl:copy-of select="@*" />
					<xsl:copy-of select="child::node()" copy-namespaces="no" />
				</xsl:copy>
			</xsl:for-each>
		</rng-unnamed-attributes>
	</xsl:variable>
	<!--<rng-unnamed-elements xmlns="http://relaxng.org/ns/structure/1.0">
		<xsl:attribute name="timestamp" select="current-dateTime()" />
		<xsl:for-each select="//define[not(element/@name or attribute/@name)]/child::element()">
			<xsl:copy>
				<xsl:attribute name="zsd:define-name" select="ancestor::define/@name" />
				<xsl:copy-of select="@*" />
				<xsl:copy-of select="child::node()" />
			</xsl:copy>
		</xsl:for-each>
	</rng-unnamed-elements>-->

	<xsl:variable as="element()" name="SCHEMA.OTHER-FEATURE-STUFF">
		<rng-other-feature-stuff xmlns="http://relaxng.org/ns/structure/1.0">
			<xsl:attribute name="timestamp" select="current-dateTime()" />
			<xsl:for-each
				select="//*[
				not(matches(local-name(),'^(element|attribute|data)$')) (: Exluded the data element as well, after communicating with Markus :)
				and @zrng:feature ne 'none' 
				and (every $e in ancestor::* satisfies not($e/@zrng:feature) or $e/@zrng:feature eq 'none')]">
				<xsl:copy copy-namespaces="no">
					<xsl:attribute name="zsd:define-name" select="ancestor::define/@name" />
					<xsl:copy-of select="@*" />
					<xsl:copy-of select="child::node()" copy-namespaces="no" />
				</xsl:copy>
			</xsl:for-each>
		</rng-other-feature-stuff>
	</xsl:variable>

	<xsl:variable name="SCHEMA.DATATYPES" as="element()">
		<rng-datatypes xmlns="http://relaxng.org/ns/structure/1.0">
			<!-- MG <xsl:for-each
			select="//define[count(child::*) eq 2 and count(child::data) eq 1 and count(child::rdf:RDF) eq 1]"> -->
			<xsl:for-each
				select="//define[count(child::*) eq 2 and count(child::data) eq 1 and count(child::db:annotation) eq 1]">
				<datatype>
					<xsl:attribute name="zsd:define-name" select="@name" />
					<xsl:attribute name="zsd:doc-pointer"
						select="concat($documentation.datatype-information.filename,'#',@name)" />
					<xsl:copy-of select="child::node()" copy-namespaces="no" />
				</datatype>
			</xsl:for-each>
		</rng-datatypes>
	</xsl:variable>
	<xsl:variable name="SCHEMA.OTHER-STUFF" as="element()">
		<rng-other-stuff xmlns="http://relaxng.org/ns/structure/1.0">
			<!-- MG <xsl:for-each
			select="//define[not(element or attribute or optional/attribute)][not(count(child::*) eq 2 and count(child::data) eq 1 and count(child::rdf:RDF) eq 1)]"> -->
			<xsl:for-each
				select="//define[not(element or attribute or optional/attribute)][not(count(child::*) eq 2 and count(child::data) eq 1 and count(child::db:annotation) eq 1)]">
				<some-stuff>
					<xsl:attribute name="zsd:define-name" select="@name" />
					<xsl:copy-of select="child::node()" copy-namespaces="no" />
				</some-stuff>
			</xsl:for-each>
		</rng-other-stuff>
	</xsl:variable>
	<xsl:variable name="SCHEMA.REORGANIZED" as="element()">
		<rng-reorganized xmlns="http://relaxng.org/ns/structure/1.0">
			<xsl:attribute name="timestamp" select="current-dateTime()" />
			<xsl:copy-of select="$SCHEMA.ELEMENT-LIST.GROUPED" />
			<xsl:copy-of select="$SCHEMA.UNNAMED-ELEMENTS" />
			<xsl:copy-of select="$SCHEMA.ATTRIBUTE-LIST.GROUPED" />
			<xsl:copy-of select="$SCHEMA.OPTIONAL-ATTRIBUTE-LIST" />
			<xsl:copy-of select="$SCHEMA.UNNAMED-ATTRIBUTES" />
			<xsl:copy-of select="$SCHEMA.OTHER-FEATURE-STUFF" />
			<xsl:copy-of select="$SCHEMA.DATATYPES" />
			<xsl:copy-of select="$SCHEMA.OTHER-STUFF" />
		</rng-reorganized>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$output-path eq 'undefined'">
				<xsl:message terminate="yes">## The parameter 'output-path' must be specified</xsl:message>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="$Debug">
					<xsl:call-template name="presentDebugInformation" />
				</xsl:if>
				<xsl:call-template name="generateSchemaDoc" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="generateSchemaDoc">
		<!-- generate the XHTML menu file -->
		<xsl:call-template name="generateXhtmlMenu" />
		<!-- generate the XHTML files per element -->
		<xsl:call-template name="generateXhtmlFilesForElements" />

		<xsl:call-template name="generateXhtmlFilesForMultiplyDefinedElements" />

		<!-- generate the XHTML file containing all attribute information -->

		<xsl:call-template name="generateAttributeInformation" />
	</xsl:template>

	<xsl:template name="generateAttributeInformation">
		<xsl:result-document format="xhtml"
			href="{concat($outputPath,$documentation.subfolder,$documentation.attribute-information.filename)}">
			<html xml:lang="en">
				<head>
					<title>
						<xsl:text>Schema Documentation: attribute information</xsl:text>
					</title>
					<link href="../schemadoc.css" rel="stylesheet" type="text/css" />
				</head>
				<body class="attributeInformation">
					<xsl:copy-of select="$xhtml-files.banner.top" />
					<h1>Attributes</h1>
					<xsl:for-each
						select="$SCHEMA.REORGANIZED//attribute-group[attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))]]">
						<xsl:sort select="@zsd:qname" />
						<div class="attributeGroup" id="{substring-after(@zsd:doc-pointer,'#')}">
							<xsl:variable name="attributeMultiplicity" as="xs:integer"
								select="xs:integer(@zsd:multiplicity)" />
							<xsl:for-each
								select="attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))]">
								<xsl:sort select="@zsd:qname" />
								<div class="attributeInformation"
									id="{substring-after(@zsd:doc-pointer,'#')}">
									<xsl:copy-of select="$xhtml-files.attributes.link-to-main-menu" />
									<h2>
										<xsl:text>The </xsl:text>
										<code><xsl:value-of select="@zsd:qname" /></code>
<!--										<span class="attribute">
											<xsl:value-of select="@zsd:qname" />
										</span>-->
										<xsl:text> attribute</xsl:text>
									</h2>

									<xsl:if test="@zrng:feature and @zrng:feature ne 'none'">
										<p>
											<xsl:text>This attribute is contributed by the </xsl:text>
											<xsl:value-of
												select="$summary//*:feature[@machinename eq current()/@zrng:feature]/@nicename" />
											<xsl:text>.</xsl:text>
										</p>
									</xsl:if>
									<!-- Description -->
									<!-- MG <xsl:if
										test="descendant::dcterms:description or local-name(child::*[1]) eq 'documentation'"> -->
									<xsl:if
											test="descendant::db:para[contains(@role,'desc-main')] or local-name(child::*[1]) eq 'documentation'">	
										<!--<h3>Description</h3>-->
										<!-- MG <xsl:apply-templates
										select="descendant::dcterms:description,descendant::z:info" /> -->
										<xsl:apply-templates
											select="descendant::db:para[contains(@role,'desc-')]" />
										<xsl:apply-templates
											select="child::*[1][local-name() eq 'documentation']" />
										<xsl:if test="descendant::*:longDesc">
											<p class="longdesc-link">
												<xsl:text>Usage details available in the </xsl:text>
												<a href="#schemadoc-longdesc">Usage Details</a>
												<xsl:text> section.</xsl:text>
											</p>
										</xsl:if>

									</xsl:if>

									<!-- Handle attribute multiplicity -->
									<xsl:if test="$attributeMultiplicity gt 1">
										<xsl:call-template name="presentAttributeMultiplicity">
											<xsl:with-param name="attributeMultiplicity"
												as="xs:integer" select="$attributeMultiplicity" />
										</xsl:call-template>
									</xsl:if>

									<!-- Usage Example -->
									<xsl:if test="descendant::*:shortSample">
										<h3>Usage Example</h3>
										<xsl:for-each select="descendant::*:shortSample">
											<pre>
							<xsl:copy-of select="child::node()" />
						</pre>
										</xsl:for-each>
									</xsl:if>

									<!-- Present possible parent elements -->
									<xsl:call-template name="presentAttributeParentElements" />
									<!-- Attribute content model -->
									<xsl:call-template name="presentAttributeContentModel">
										<xsl:with-param name="t-feature" as="xs:string"
											select="@zrng:feature" tunnel="yes" />
									</xsl:call-template>

									<!-- Usage Details -->
									<xsl:if test="descendant::*:longDesc">
										<h3>Usage Details</h3>
										<xsl:copy-of select="descendant::*:longDesc/child::node()"
											copy-namespaces="no" />
									</xsl:if>

								</div>
							</xsl:for-each>
						</div>
					</xsl:for-each>
					<xsl:for-each
						select="$SCHEMA.REORGANIZED//rng-optional-attribute-list/attribute">
						<xsl:sort select="@zsd:qname" />
						<div class="attributeInformation"
							id="{substring-after(@zsd:doc-pointer,'#')}">
							<xsl:copy-of select="$xhtml-files.attributes.link-to-main-menu" />

							<h2>
								<xsl:text>The </xsl:text>
								<code><xsl:value-of select="@zsd:qname" /></code>
<!--								<span class="attribute">
									<xsl:value-of select="@zsd:qname" />
								</span>-->
								<xsl:text> attribute</xsl:text>
							</h2>
							<!-- Description -->
							<!-- MG <xsl:if test="descendant::dcterms:description"> -->
							<xsl:if test="descendant::db:para[contains(@role,'desc-main')]">
								<h3>Description</h3>
								<!-- MG <xsl:apply-templates
									select="descendant::dcterms:description,descendant::z:info" /> -->
								<xsl:apply-templates
									select="descendant::db:para[contains(@role,'desc-')]" />
							</xsl:if>
							<!-- Present possible parent elements -->
							<xsl:call-template name="presentAttributeParentElements" />
							<!-- Attribute content model -->
							<xsl:call-template name="presentAttributeContentModel" />
						</div>
					</xsl:for-each>
					<xsl:if
						test="$SCHEMA.REORGANIZED//attribute[matches(@zsd:define-name,'^rdfa\..+\.attrib$')]">
						<hr />
						<h1 id="rdfa">RDFa attributes</h1>
						<xsl:for-each
							select="$SCHEMA.REORGANIZED//attribute-group[attribute[matches(@zsd:define-name,'^rdfa\..+\.attrib$')]]">
							<xsl:sort select="@zsd:qname" />
							<div class="attributeGroup"
								id="rdfa-{substring-after(@zsd:doc-pointer,'#')}">
								<xsl:variable name="attributeMultiplicity" as="xs:integer"
									select="xs:integer(@zsd:multiplicity)" />
								<xsl:for-each
									select="attribute[matches(@zsd:define-name,'^rdfa\..+\.attrib$')]">
									<xsl:sort select="@zsd:qname" />
									<div class="attributeInformation"
										id="{substring-after(@zsd:doc-pointer,'#')}">
										<xsl:copy-of
											select="$xhtml-files.attributes.link-to-main-menu" />

										<h2>
											<xsl:text>The RDFa </xsl:text>
											<code><xsl:value-of select="@zsd:qname" /></code>
<!--											<span class="attribute">
												<xsl:value-of select="@zsd:qname" />
											</span>-->
											<xsl:text> attribute</xsl:text>
										</h2>

										<xsl:if test="@zrng:feature and @zrng:feature ne 'none'">
											<p>
												<xsl:text>This attribute is contributed by the </xsl:text>
												<xsl:value-of
												select="$summary//*:feature[@machinename eq current()/@zrng:feature]/@nicename" />
												<xsl:text>.</xsl:text>
											</p>
										</xsl:if>
										<!-- Description -->
										<!-- MG <xsl:if
											test="descendant::dcterms:description or local-name(child::*[1]) eq 'documentation'"> -->
										<xsl:if
											test="descendant::db:para[contains(@role,'desc-main')] or local-name(child::*[1]) eq 'documentation'">
											<h3>Description</h3>
											<xsl:apply-templates
												select="db:para[contains(@role,'desc-')]" />
											<xsl:apply-templates
												select="child::*[1][local-name() eq 'documentation']"
											 />
										</xsl:if>
										<!-- Handle attribute multiplicity -->
										<xsl:if test="$attributeMultiplicity gt 1">
											<xsl:call-template
												name="presentAttributeMultiplicityRDFa">
												<xsl:with-param name="attributeMultiplicity"
												as="xs:integer" select="$attributeMultiplicity" />
											</xsl:call-template>
										</xsl:if>
										<!-- Present possible parent elements -->
										<xsl:call-template name="presentAttributeParentElements" />
										<!-- Attribute content model -->
										<xsl:call-template name="presentAttributeContentModel" />
									</div>
								</xsl:for-each>
							</div>
						</xsl:for-each>
					</xsl:if>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>

	<xsl:template name="presentAttributeContentModel">
		<div class="attributeContentModel">
			<h3>Attribute content model</h3>
			<xsl:variable name="attributeContent" as="element()">
				<grammar xmlns="http://relaxng.org/ns/structure/1.0"
					name="{substring-after(@zsd:doc-pointer,'#')}">
					<xsl:apply-templates mode="acm1" />
				</grammar>
			</xsl:variable>
			<!--<xsl:if test="$debug">
				<xsl:result-document
					href="{concat('acm/',substring-after(@zsd:doc-pointer,'#'),'.rng')}"
					method="xml" indent="yes">
					<xsl:copy-of select="$attributeContent" />
				</xsl:result-document>
			</xsl:if>-->
			<div class="element-content-model">
				<xsl:choose>
					<xsl:when test="not($attributeContent/child::rng:*)">
						<div class="rng">text</div>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="$attributeContent/child::rng:*" mode="acm2" />
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
	</xsl:template>







	<xsl:template name="attributeFeatureContribution">
		<xsl:param name="t-feature" as="xs:string" tunnel="yes" select="'[undefined]'" />
		<!--   and @zrng:feature ne $t-feature -->
		<xsl:if test="@zrng:feature and @zrng:feature ne 'none' and @zrng:feature ne $t-feature">
			<div class="documentation">
				<xsl:text>Contributed by the </xsl:text>
				<xsl:value-of
					select="$summary//*:feature[@machinename eq current()/@zrng:feature]/@nicename"
				 />
			</div>
		</xsl:if>
	</xsl:template>


	<xsl:template name="presentAttributeParentElements">
		<xsl:variable name="elements" as="element()*"
			select="$SCHEMA.REORGANIZED//element-group/element[some $a in descendant::ref satisfies $a/@name eq current()/@zsd:define-name and $a/@zrng:define eq 'attribute']" />
		<div class="attributeElementList">
			<h3>Parent elements</h3>
			<p>
				<xsl:choose>
					<xsl:when test="count($elements) eq 0">
						<xsl:text>This attribute may not be used on any element !!!</xsl:text>
					</xsl:when>
					<xsl:when test="count($elements) eq 1">
						<xsl:text>This attribute occurs on the </xsl:text>
						<xsl:call-template name="presentElementnamesWithLinks">
							<xsl:with-param name="elems" as="element()+" select="$elements" />
						</xsl:call-template>
						<xsl:text> element</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>This attribute occurs on the following elements: </xsl:text>
						<xsl:call-template name="presentElementnamesWithLinks">
							<xsl:with-param name="elems" as="element()+" select="$elements" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</p>
		</div>
	</xsl:template>

	<xsl:template name="presentAttributeMultiplicity">
		<xsl:param name="attributeMultiplicity" as="xs:integer" />
		<div class="attributeVariants">
			<p>
				<strong>Note: </strong>
				<xsl:text>There are </xsl:text>
				<xsl:value-of select="../@zsd:multiplicity" />
				<xsl:text> different attributes with the name </xsl:text>
				<span class="attribute">
					<xsl:value-of select="@zsd:qname" />
				</span>
				<xsl:choose>
					<xsl:when
						test="
						preceding-sibling::attribute[matches(@zsd:define-name,'^rdfa\..+\.attrib$')] 
						or 
						following-sibling::attribute[matches(@zsd:define-name,'^rdfa\..+\.attrib$')]">
						<xsl:text>, amongst them </xsl:text>
						<xsl:value-of
							select="count(preceding-sibling::attribute[matches(@zsd:define-name,'^rdfa\..+\.attrib$')]) + count(following-sibling::attribute[matches(@zsd:define-name,'^rdfa\..+\.attrib$')])" />
						<xsl:text> </xsl:text>
						<a href="#rdfa-{substring-after(../@zsd:doc-pointer,'#')}">RDFa
							attribute(s)</a>
						<xsl:text>. You will find information about the other non-RDFa </xsl:text>
						<span class="attribute">
							<xsl:value-of select="@zsd:qname" />
						</span>
						<xsl:text> attribute(s) immediately </xsl:text>
						<xsl:choose>
							<xsl:when
								test="
								preceding-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))] 
								and 
								following-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))]
								">
								<a
									href="{preceding-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))][1]/@zsd:doc-pointer}"
									>before</a>
								<xsl:text> and </xsl:text>
								<a
									href="{following-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))][1]/@zsd:doc-pointer}"
									>after</a>
							</xsl:when>
							<xsl:when
								test="preceding-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))]">
								<a
									href="{preceding-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))][1]/@zsd:doc-pointer}"
									>before</a>
								<!--<xsl:text>before</xsl:text>-->
							</xsl:when>
							<xsl:when
								test="following-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))]">
								<a
									href="{following-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))][1]/@zsd:doc-pointer}"
									>after</a>
								<!--<xsl:text>after</xsl:text>-->
							</xsl:when>
							<xsl:otherwise />
						</xsl:choose>
						<xsl:text> the presentation of this </xsl:text>
						<span class="attribute">
							<xsl:value-of select="@zsd:qname" />
						</span>
						<xsl:text> attribute.</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>. You will find information about the other </xsl:text>
						<span class="attribute">
							<xsl:value-of select="@zsd:qname" />
						</span>
						<xsl:text> attribute(s) immediately </xsl:text>
						<xsl:choose>
							<xsl:when
								test="
								preceding-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))] 
								and 
								following-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))]
								">
								<a
									href="{preceding-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))][1]/@zsd:doc-pointer}"
									>before</a>
								<xsl:text> and </xsl:text>
								<a
									href="{following-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))][1]/@zsd:doc-pointer}"
									>after</a>
							</xsl:when>
							<xsl:when
								test="preceding-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))]">
								<a
									href="{preceding-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))][1]/@zsd:doc-pointer}"
									>before</a>
							</xsl:when>
							<xsl:when
								test="following-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))]">
								<a
									href="{following-sibling::attribute[not(matches(@zsd:define-name,'^rdfa\..+\.attrib$'))][1]/@zsd:doc-pointer}"
									>after</a>
							</xsl:when>

							<xsl:otherwise />
						</xsl:choose>
						<xsl:text> the presentation of this </xsl:text>
						<span class="attribute">
							<xsl:value-of select="@zsd:qname" />
						</span>
						<xsl:text> attribute.</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</p>
		</div>
	</xsl:template>

	<xsl:template name="presentAttributeMultiplicityRDFa">
		<xsl:param name="attributeMultiplicity" as="xs:integer" />
		<div class="attributeVariants">
			<p>
				<strong>Note: </strong>
				<xsl:text>There are </xsl:text>
				<xsl:value-of select="../@zsd:multiplicity" />
				<xsl:text> different attributes with the name </xsl:text>
				<span class="attribute">
					<xsl:value-of select="@zsd:qname" />
				</span>
				<xsl:text>. You will find information about the other </xsl:text>
				<span class="attribute">
					<xsl:value-of select="@zsd:qname" />
				</span>
				<xsl:text> attribute(s) by following </xsl:text>
				<a href="{../@zsd:doc-pointer}">this link</a>
				<xsl:text>.</xsl:text>
			</p>
		</div>
	</xsl:template>

	<xsl:template name="generateXhtmlMenu">
		<xsl:variable as="xs:string+" name="uniqueElementNames"
			select="distinct-values($SCHEMA.ELEMENT-LIST/element/@name)" />
		<xsl:result-document format="xhtml" href="{concat($outputPath,'index.html')}">
			<html xml:lang="en">
				<xsl:comment>generated: <xsl:value-of select="current-dateTime()" /></xsl:comment>
				<xsl:comment>input file: <xsl:value-of select="document-uri(/)" /></xsl:comment>
				
				<head>
					<title>Schema Documentation: <xsl:value-of select="$profile-nice-name"
						 /></title>
					<link href="schemadoc.css" rel="stylesheet" type="text/css" />
				</head>
				<body style="margin-top:4em;margin-bottom:2em;">
					<h1>Schema Documentation: <span class="doctitle"><xsl:value-of
								select="$profile-nice-name" /></span>
						<span class="titlesub">
							<br />
							<xsl:text> version </xsl:text>
							<xsl:value-of
								select="replace($summary//*:profile[@machinename eq $profile-machine-name]/@rd-uri,'^.+/(.+?)/','$1')"
							 />
						</span></h1>
					<p class="alert">This schema documentation is an informative rendition based on
						this profiles' normative schema and associated definitions. In the case of
						conflicts between expressions herein and the normative schema, the normative
						schema takes precedence.</p>
					<p>
						<xsl:text>Below is a list of all elements in this profile.</xsl:text>
						<br />
						<xsl:text>An asterisk (*) after the element name indicates an element available in multiple variants.</xsl:text>
						<br />
						<xsl:text>The root element in this grammar is </xsl:text>
						<a class="element"
							href="{concat($documentation.subfolder,$SCHEMA.ROOT-ELEMENT/@zsd:doc-pointer)}">
							<xsl:value-of select="$SCHEMA.ROOT-ELEMENT/@name" />
						</a>
					</p>
					<h2>Core Elements</h2>
					<xsl:call-template name="presentElementsInMenu">
						<!-- psps: visit this again (should be 'every'? )-->
						<xsl:with-param name="elementGroup" as="element()+"
							select="$SCHEMA.REORGANIZED//element-group[every $e in element satisfies $e/@zrng:feature eq 'none']"
						 />
					</xsl:call-template>
					<xsl:call-template name="presentNamespaceInfoInMenu">
						<xsl:with-param as="element()+" name="elementGroup"
							select="$SCHEMA.REORGANIZED//element-group[every $e in element satisfies $e/@zrng:feature eq 'none']"
						 />
					</xsl:call-template>

					<xsl:variable name="coreAttributes" as="element()*"
						select="$SCHEMA.REORGANIZED//attribute-group[some $a in attribute satisfies $a/@zrng:feature eq 'none']" />
					<xsl:if test="$coreAttributes">
						<h2>Core Attributes</h2>
						<xsl:call-template name="presentAttributesInMenu">
							<xsl:with-param name="ag" as="element()*" select="$coreAttributes" />
							<xsl:with-param name="feature" as="xs:string" select="'none'" />
						</xsl:call-template>
						<xsl:call-template name="presentNamespaceInfoInMenu">
							<xsl:with-param as="element()+" name="elementGroup"
								select="$coreAttributes" />
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="count($SCHEMA.feature-names) gt 0">
						<h2>Features</h2>
						<!--<p>Depending on the variant of the profile, some features may not be
							available.</p>-->
						<xsl:for-each select="$SCHEMA.feature-names">
							<xsl:sort select="." />
							<xsl:variable name="feature.nicename"
								select="$summary//*:feature[@machinename eq current()]/@nicename" />
							<xsl:variable name="feature.rd-uri" as="xs:string"
								select="$summary//*:feature[@machinename eq current()]/@rd-uri" />
							<xsl:variable as="element()*" name="elementGroups"
								select="$SCHEMA.REORGANIZED//element-group[some $e in element satisfies $e/@zrng:feature eq current()]" />
							<xsl:variable as="element()*" name="attributeGroups"
								select="$SCHEMA.REORGANIZED//attribute-group[some $e in attribute satisfies $e/@zrng:feature eq current()]" />
							<xsl:variable name="otherFeatureStuff" as="element()*"
								select="$SCHEMA.REORGANIZED/rng-other-feature-stuff/*[@zrng:feature eq current()]" />
							<h3>
								<xsl:value-of select="$feature.nicename" />
							</h3>
							<p>
								<xsl:text>More information about this feature is available at the </xsl:text>
								<a href="{$feature.rd-uri}"><xsl:value-of select="$feature.nicename"
									 /> Resource Directory</a>
								<xsl:text>.</xsl:text>
							</p>
							<!-- Present the feature elements, if any -->
							<xsl:if test="$elementGroups">
								<xsl:choose>
									<xsl:when test="count($elementGroups) = 1">
										<p>This feature contributes the following element:</p>
									</xsl:when>
									<xsl:otherwise>
										<p>
											<xsl:text>This feature contributes the following </xsl:text>
											<xsl:value-of select="count($elementGroups)" />
											<xsl:text> elements:</xsl:text>
										</p>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:call-template name="presentElementsInMenu">
									<xsl:with-param as="element()+" name="elementGroup"
										select="$elementGroups" />
								</xsl:call-template>
								<xsl:call-template name="presentNamespaceInfoInMenu">
									<xsl:with-param as="element()+" name="elementGroup"
										select="$elementGroups" />
								</xsl:call-template>
							</xsl:if>

							<!-- Present the feature attributes, if any -->
							<xsl:if test="$attributeGroups">
								<xsl:choose>
									<xsl:when test="count($attributeGroups) = 1">
										<p>
											<xsl:text>This feature </xsl:text>
											<xsl:if test="$elementGroups">also</xsl:if>
											<xsl:text> contributes the following attribute:</xsl:text>
										</p>
									</xsl:when>
									<xsl:otherwise>
										<p>
											<xsl:text>This feature </xsl:text>
											<xsl:if test="$elementGroups">also</xsl:if>
											<xsl:text> contributes the following </xsl:text>
											<xsl:value-of select="count($attributeGroups)" />
											<xsl:text> attributes:</xsl:text>
										</p>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:call-template name="presentAttributesInMenu">
									<xsl:with-param as="element()+" name="ag"
										select="$attributeGroups" />
									<xsl:with-param name="feature" as="xs:string" select="current()"
									 />
								</xsl:call-template>
								<xsl:call-template name="presentNamespaceInfoInMenu">
									<xsl:with-param as="element()+" name="elementGroup"
										select="$attributeGroups" />
								</xsl:call-template>

							</xsl:if>

							<!-- Present other feature stuff, if any -->
							<xsl:if test="$otherFeatureStuff">
								<p>
									<xsl:text>This feature </xsl:text>
									<xsl:if test="$elementGroups or $attributeGroups">also</xsl:if>
									<xsl:text> contributes the following:</xsl:text>
								</p>
								<xsl:call-template name="presentOtherFeatureStuffInMenu">
									<xsl:with-param name="otherStuff" as="element()+"
										select="$otherFeatureStuff" />
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>

	<xsl:template name="presentNamespaceInfoInMenu">
		<xsl:param name="elementGroup" as="element()+" />
		<xsl:choose>
			<xsl:when test="local-name($elementGroup[1]) eq 'element-group'">
				<xsl:variable name="namespaceprefixes" as="xs:string*"
					select="distinct-values($elementGroup/element/@zsd:ns-prefix[. ne ''])" />
				<xsl:if test="count($namespaceprefixes) gt 0">
					<xsl:choose>
						<xsl:when test="count($namespaceprefixes) = 1">
							<p>where elements prefixed with <code><xsl:value-of
										select="$namespaceprefixes" /></code> are associated with
								the namespace <code><xsl:value-of
										select="zsd:elementNamespaceURI($namespaceprefixes)"
									 /></code></p>
						</xsl:when>
						<xsl:otherwise>
							<p>where</p>
							<ul>
								<xsl:for-each select="$namespaceprefixes">
									<li>elements prefixed with <code><xsl:value-of select="."
											 /></code> are associated with the namespace
												<code><xsl:value-of
												select="zsd:elementNamespaceURI(.)" /></code>
									</li>
								</xsl:for-each>
							</ul>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:when>
			<xsl:when test="local-name($elementGroup[1]) eq 'attribute-group'">
				<xsl:variable name="namespaceprefixes" as="xs:string*"
					select="distinct-values($elementGroup/attribute/@zsd:ns-prefix[. ne ''])" />
				<xsl:if test="count($namespaceprefixes) gt 0">
					<xsl:choose>
						<xsl:when test="count($namespaceprefixes) = 1">
							<p>where attributes prefixed with <code><xsl:value-of
										select="$namespaceprefixes" /></code> are associated with
								the namespace <code><xsl:value-of
										select="zsd:elementNamespaceURI($namespaceprefixes)"
									 /></code></p>
						</xsl:when>
						<xsl:otherwise>
							<p>where</p>
							<ul>
								<xsl:for-each select="$namespaceprefixes">
									<li>attributes prefixed with <code><xsl:value-of select="."
											 /></code> are associated with the namespace
												<code><xsl:value-of
												select="zsd:elementNamespaceURI(.)" /></code>
									</li>
								</xsl:for-each>
							</ul>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:message terminate="yes">This should never occur, so we better stop it now!</xsl:message>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="presentOtherFeatureStuffInMenu">
		<xsl:param name="otherStuff" as="element()+" />
		<xsl:for-each select="$otherStuff">
			<div class="menu-rng">
				<xsl:apply-templates select="." mode="menu-present-other-feature-stuff" />
			</div>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="presentElementsInMenu">
		<xsl:param as="element()+" name="elementGroup" />
		<ul class="main-element-toc">
			<xsl:for-each select="$elementGroup">
				<xsl:sort select="@zsd:qname" />
				<li>
					<xsl:choose>
						<xsl:when test="number(@zsd:multiplicity) = 1">
							<a href="{concat($documentation.subfolder,element/@zsd:doc-pointer)}">
								<xsl:value-of select="@zsd:qname" />
							</a>
						</xsl:when>
						<xsl:otherwise>
							<a href="{concat($documentation.subfolder,@zsd:doc-pointer)}">
								<xsl:value-of select="@zsd:qname" />
								<xsl:text> *</xsl:text>
							</a>
						</xsl:otherwise>
					</xsl:choose>
				</li>
			</xsl:for-each>
		</ul>

	</xsl:template>

	<xsl:template name="presentAttributesInMenu">
		<xsl:param as="element()+" name="ag" />
		<xsl:param name="feature" as="xs:string" />
		<ul class="main-attribute-toc">
			<xsl:for-each select="$ag">
				<xsl:sort select="@zsd:qname" />
				<!--<xsl:variable name="group-doc-pointer" as="xs:string" select="@zsd:doc-pointer" />-->
				<li>
					<xsl:choose>
						<xsl:when test="count(attribute[@zrng:feature eq $feature]) eq 1">
							<a
								href="{concat($documentation.subfolder,attribute[@zrng:feature eq $feature]/@zsd:doc-pointer)}">
								<xsl:value-of select="@zsd:qname" />
							</a>
						</xsl:when>
						<!--						<xsl:when test="number(@zsd:multiplicity) = 1">
							<a href="{concat($documentation.subfolder,attribute/@zsd:doc-pointer)}">
								<xsl:value-of select="@zsd:qname" />
							</a>
						</xsl:when>-->
						<xsl:otherwise>
							<a href="{concat($documentation.subfolder,@zsd:doc-pointer)}">
								<xsl:value-of select="@zsd:qname" />
								<xsl:text> * </xsl:text>
							</a>
						</xsl:otherwise>
					</xsl:choose>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template name="generateXhtmlFilesForElements">
		<xsl:for-each select="$SCHEMA.ELEMENT-LIST/named-elements/element">
			<xsl:call-template name="generateXhtmlFileForElement">
				<xsl:with-param name="element-from-list" as="element()" select="." />
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="generateXhtmlFileForElement">
		<xsl:param name="element-from-list" as="element()" />
		<xsl:variable as="xs:string" name="filename"
			select="concat($outputPath,$documentation.subfolder,@zsd:doc-pointer)" />
		<xsl:variable name="defineName" select="@zsd:define-name" as="xs:string" />
		<xsl:variable name="elementMultiplicity" as="xs:integer"
			select="$SCHEMA.ELEMENT-LIST.GROUPED/element-group[some $e in element satisfies $e/@zsd:define-name eq $defineName]/@zsd:multiplicity" />
		<xsl:variable as="node()+" name="element.title">
			<xsl:text>The </xsl:text>
			<xsl:if test="$elementMultiplicity gt 1">
				<span class="element-variant">
					<xsl:value-of select="zsd:elementVariant($element-from-list)" />
				</span>
				<xsl:text> variant of  the </xsl:text>
			</xsl:if>
			<span class="element">
				<xsl:value-of select="@name" />
			</span>
			<xsl:text> element</xsl:text>
		</xsl:variable>

		<xsl:variable name="elementContentBuild" as="element()">
			<grammar xmlns="http://relaxng.org/ns/structure/1.0"
				name="{substring-before(@zsd:doc-pointer,'.html')}">
				<xsl:apply-templates select="rng:*" mode="ecm-build" />
			</grammar>
		</xsl:variable>
		<!--<xsl:if test="$debug and false()">
			<xsl:result-document
				href="{concat('ecm/',substring-before(@zsd:doc-pointer,'.html'),'-build.rng')}"
				method="xml" indent="yes">
				<xsl:copy-of select="$elementContentBuild" />
			</xsl:result-document>
		</xsl:if>-->

		<xsl:variable name="elementContentStrippedRDFa" as="element()">
			<grammar xmlns="http://relaxng.org/ns/structure/1.0"
				name="{substring-before(@zsd:doc-pointer,'.html')}">
				<xsl:variable name="replaceRDFaAttribsWithLink" as="xs:boolean"
					select="count($elementContentBuild//attribute[@isRDFa eq 'yes']) = count($rdfa.attribs)" />
				<xsl:if test="$replaceRDFaAttribsWithLink">
					<link to="rdfa" />
				</xsl:if>
				<xsl:apply-templates select="$elementContentBuild" mode="ecm-rdfa">
					<xsl:with-param name="stripRDFa" as="xs:boolean"
						select="$replaceRDFaAttribsWithLink" tunnel="yes" />
				</xsl:apply-templates>
			</grammar>
		</xsl:variable>
		<!--<xsl:if test="$debug and false()">
			<xsl:result-document
				href="{concat('ecm/',substring-before(@zsd:doc-pointer,'.html'),'-striprdfa.rng')}"
				method="xml" indent="yes">
				<xsl:copy-of select="$elementContentStrippedRDFa" />
			</xsl:result-document>
		</xsl:if>-->

		<xsl:variable name="elementContentClean" as="element()">
			<xsl:apply-templates select="$elementContentStrippedRDFa" mode="ecm-clean" />
		</xsl:variable>
		<!--<xsl:if test="$debug and false()">
			<xsl:result-document
				href="{concat('ecm/',substring-before(@zsd:doc-pointer,'.html'),'-clean.rng')}"
				method="xml" indent="yes">
				<xsl:comment>
					<xsl:value-of select="current-dateTime()" />
				</xsl:comment>
				<xsl:copy-of select="$elementContentClean" />
			</xsl:result-document>
		</xsl:if>-->


		<xsl:variable name="elementContentOrdered" as="element()">
			<xsl:apply-templates select="$elementContentClean" mode="ecm-order" />
		</xsl:variable>
		<!--<xsl:if test="$debug and false()">
			<xsl:result-document
				href="{concat('ecm/',substring-before(@zsd:doc-pointer,'.html'),'-ordered.rng')}"
				method="xml" indent="yes">
				<xsl:comment>
					<xsl:value-of select="current-dateTime()" />
				</xsl:comment>
				<xsl:copy-of select="$elementContentOrdered" />
			</xsl:result-document>
		</xsl:if>-->

		<!-- Create the variable containing most of the information about this element -->
		<xsl:variable name="element.core.info" as="element()">
			<div class="element-coreinfo" xmlns="http://www.w3.org/1999/xhtml">
				<!-- Description (but avoid using lower level a:documentation, as these may document something else than the element) -->
				<!-- MG <xsl:if test="descendant::dcterms:description or child::a:documentation"> -->
				<xsl:if test="descendant::db:para[contains(@role,'desc-main')] or child::a:documentation">
					<div class="main-description">
						<!--<h2>Description</h2>-->
						<xsl:choose>
							<!-- MG <xsl:when test="descendant::dcterms:description"> -->
							<xsl:when test="descendant::db:para[contains(@role,'desc-main')]">
								<!-- MG <xsl:apply-templates
									select="descendant::dcterms:description, descendant::z:info" /> -->
								<xsl:apply-templates
									select="descendant::db:para[contains(@role,'desc-')]" />
							</xsl:when>
							<xsl:when test="child::a:documentation">
								<xsl:apply-templates select="child::a:documentation" />
							</xsl:when>
							<xsl:otherwise />
						</xsl:choose>
						<xsl:if test="$element-from-list//*:longDesc">
							<p class="longdesc-link">
								<xsl:text>Usage details available in the </xsl:text>
								<a href="#schemadoc-longdesc">Usage Details</a>
								<xsl:text> section.</xsl:text>
							</p>
						</xsl:if>
					</div>

				</xsl:if>


				<!-- Usage Example -->
				<xsl:if test="$element-from-list//*:shortSample">
					<h2>Usage Example</h2>
					<xsl:for-each select="$element-from-list//*:shortSample">
						<pre>
							<xsl:copy-of select="child::node()" />
						</pre>
					</xsl:for-each>
					<!--					<xsl:if test="$element-from-list//*:longDesc">
						<p class="longdesc-link">
							<xsl:text>Usage details available in the </xsl:text>
							<a href="#schemadoc-longdesc">Usage Details</a>
							<xsl:text> section.</xsl:text>
						</p>
					</xsl:if>-->
				</xsl:if>

				<!-- Allowed parents -->
				<h2>Allowed parents</h2>
				<xsl:choose>
					<xsl:when test="@zsd:isRootElement eq 'true'">
						<p>This is the root element</p>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="parents" as="element()*"
							select="$SCHEMA.ELEMENT-LIST//named-elements/element[some $ref in descendant::ref satisfies $ref/@name eq $element-from-list/@zsd:define-name]" />
						<xsl:if test="count($parents) gt 0">
							<p>
								<xsl:call-template name="presentElementnamesWithLinks">
									<xsl:with-param name="elems" as="element()+" select="$parents"
									 />
								</xsl:call-template>
							</p>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>

				<h2>Allowed children</h2>
				<!-- Let's first get the parent elements of all text elem descendants -->
				<xsl:variable name="textelementparents" as="element()*"
					select="$element-from-list//*[text]" />
				<!-- Let's have a look at possible children -->
				<xsl:variable name="children.refs" as="element()*"
					select="$element-from-list//ref[@zrng:define eq 'element']" />

				<xsl:choose>
					<xsl:when test="not($textelementparents or $children.refs)">
						<p>This element is empty</p>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<!-- if we have such elements, and they are either 'optional', 'choice' or 'zeroOrMore'
								then the text element must be optional -->
							<xsl:when
								test="$textelementparents and (every $e in $textelementparents satisfies matches(local-name($e),'^(optional|choice|zeroOrMore)$'))">
								<p>This element <em>may</em> contain text.</p>
							</xsl:when>
							<!-- If we have elements containing text, and the above didn't pass then the text is not optional -->
							<xsl:when test="$textelementparents">
								<p>This element <em>must</em> contain text.</p>
							</xsl:when>
							<!-- And if no text element parent, then no text allowed -->
							<xsl:otherwise>
								<p>This element <em>must not</em> contain text.</p>
							</xsl:otherwise>
						</xsl:choose>

						<xsl:choose>
							<xsl:when test="$children.refs">
								<xsl:variable name="children.refs.optional" as="element()*"
									select="$children.refs[some $e in ancestor::* satisfies matches(local-name($e),'^(optional|choice|zeroOrMore)$')]" />
								<xsl:variable name="children.refs.mandatory" as="element()*"
									select="$children.refs except $children.refs.optional" />
								<xsl:variable name="children.optional" as="element()*"
									select="for $n in distinct-values($children.refs.optional/@name) return $SCHEMA.ELEMENT-LIST/named-elements/element[@zsd:define-name eq $n]" />
								<xsl:variable name="children.mandatory" as="element()*"
									select="for $n in distinct-values($children.refs.mandatory/@name) return $SCHEMA.ELEMENT-LIST/named-elements/element[@zsd:define-name eq $n]" />
								<xsl:if test="$children.mandatory">
									<p>
										<xsl:text>This element </xsl:text>
										<em>must</em>
										<xsl:text> contain the following children: </xsl:text>
										<xsl:call-template name="presentElementnamesWithLinks">
											<xsl:with-param name="elems" as="element()+"
												select="$children.mandatory" />
										</xsl:call-template>
									</p>
								</xsl:if>
								<xsl:if test="$children.optional">
									<p>
										<xsl:text>This element </xsl:text>
										<em>may</em>
										<xsl:text> contain the following children: </xsl:text>
										<xsl:call-template name="presentElementnamesWithLinks">
											<xsl:with-param name="elems" as="element()+"
												select="$children.optional" />
										</xsl:call-template>
									</p>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<p>This element <em>must not</em> contain any children.</p>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>

				<!--				<xsl:if
					test="not(
					$textelementparents and (every $e in $textelementparents satisfies matches(local-name($e),'^(optional|choice|zeroOrMore)$'))
					or
					$textelementparents
					)">
					<p>c: This element <em>must not</em> contain text.</p>
				</xsl:if>-->

				<!-- Assertions -->
				<xsl:if test="$element-from-list//sch:assert">
					<h2>Assertions</h2>
					<xsl:choose>
						<xsl:when test="count($element-from-list//sch:assert) eq 1">
							<p>
								<xsl:text>Use of this element must respect the following assertion: 
								</xsl:text>
								<xsl:copy-of select="$element-from-list//sch:assert/child::node()"
									copy-namespaces="no" />
							</p>
						</xsl:when>
						<xsl:otherwise>
							<p>Use of this element must respect the following assertions:</p>
							<ul>
								<xsl:for-each select="$element-from-list//sch:assert">
									<li>
										<xsl:copy-of select="child::node()" copy-namespaces="no" />
									</li>
								</xsl:for-each>
							</ul>
						</xsl:otherwise>
					</xsl:choose>

				</xsl:if>

				<!-- Content model -->
				<h2>Content model</h2>
				<xsl:call-template name="presentElementContentModelNew">
					<xsl:with-param name="grammar" as="element()" select="$elementContentOrdered" />
				</xsl:call-template>

				<!-- Other variants ? -->
				<xsl:if test="$elementMultiplicity gt 1">
					<h2>Variants</h2>
					<p>
						<xsl:text>This element exists in </xsl:text>
						<xsl:value-of select="$elementMultiplicity" />
						<xsl:text> variants. The other </xsl:text>
						<xsl:choose>
							<xsl:when test="$elementMultiplicity eq 2">
								<!-- Just one other variant -->
								<xsl:variable name="variant" as="element()"
									select="$SCHEMA.REORGANIZED//element-group[some $e in element satisfies $e/@zsd:define-name eq $defineName]/element[@zsd:define-name ne $element-from-list/@zsd:define-name]" />
								<xsl:text>variant is the </xsl:text>
								<a href="{$variant/@zsd:doc-pointer}">
									<span class="element-variant">
										<xsl:value-of select="zsd:elementVariant($variant)" />
									</span>
									<xsl:text> variant.</xsl:text>
								</a>
							</xsl:when>
							<xsl:otherwise>
								<!-- Several other variants -->
								<xsl:value-of select="$elementMultiplicity - 1" />
								<xsl:text>  variants are:</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</p>
					<xsl:if test="$elementMultiplicity gt 2">
						<ul>
							<xsl:for-each
								select="$SCHEMA.REORGANIZED//element-group[some $e in element satisfies $e/@zsd:define-name eq $defineName]/element[@zsd:define-name ne $element-from-list/@zsd:define-name]">
								<li>
									<a href="{@zsd:doc-pointer}">
										<xsl:text>The </xsl:text>
										<span class="element-variant">
											<xsl:value-of select="zsd:elementVariant(.)" />
										</span>
										<xsl:text> variant of  the </xsl:text>
										<span class="element">
											<xsl:value-of select="@zsd:qname" />
										</span>
										<xsl:text> element</xsl:text>
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</xsl:if>
				</xsl:if>


				<!-- Namespace -->
				<h2>Namespace</h2>
				<p>
					<span class="namespace">
						<xsl:value-of select="@ns" />
					</span>
				</p>
				<!-- Usage Details -->
				<xsl:if test="$element-from-list//*:longDesc">
					<h2 id="schemadoc-longdesc">Usage Details</h2>
					<xsl:copy-of select="$element-from-list//*:longDesc/child::node()"
						copy-namespaces="no" />
				</xsl:if>
			</div>
		</xsl:variable>

		<xsl:result-document format="xhtml" href="{$filename}">
			<html xml:lang="en">
				<head>
					<title>
						<xsl:text>Schema Documentation: the </xsl:text>
						<xsl:value-of select="@name" />
						<xsl:text> element</xsl:text>
					</title>
					<link href="../schemadoc.css" rel="stylesheet" type="text/css" />
				</head>
				<body>
					<xsl:copy-of select="$xhtml-files.banner.top" />
					<xsl:comment>Used to have a nav box with link to toc, and prev/next element. Not
						included yet</xsl:comment>
					<h1>
						<xsl:copy-of select="$element.title" />
					</h1>
					<div class="elementInformation">
						<div class="element-toc-container">
							<strong>On this page:</strong>
							<ul class="element-toc">
								<li id="link-to-main-menu">
									<a href="../index.html">Back to<br /> main menu</a>
								</li>
								<xsl:apply-templates
									select="$element.core.info//x:h1 | $element.core.info//x:h2 | $element.core.info//x:h3"
									mode="toc01" />
							</ul>
						</div>
						<xsl:apply-templates select="$element.core.info" mode="toc02" />
					</div>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>

	<xsl:template name="presentElementContentModelNew">
		<xsl:param name="grammar" as="element()" />

		<div class="element-content-model">
			<xsl:apply-templates select="$grammar" mode="ecm-display" />
		</div>
	</xsl:template>
	<xsl:template name="presentElementContentModel">
		<!--<p>The string '(e)' after a name signals that the name represents an element. Similar, the
		string '(a)' after a name signals that the name represents an attribute.</p>-->

		<div class="element-content-model">
			<!-- Start with straight forward optional attributes -->
			<xsl:if test="optional/ref[@zrng:define='attribute']">
				<xsl:variable name="optional-attributes" as="element()+"
					select="for $e in optional/ref[@zrng:define='attribute'] return $SCHEMA.REORGANIZED//attribute[@zsd:define-name eq $e/@name]" />
				<xsl:variable name="optional-attributes.rdfa" as="element()*"
					select="$optional-attributes[starts-with(@zsd:define-name,'rdfa.')]" />
				<xsl:variable name="optional-attributes.non-rdfa" as="element()*"
					select="$optional-attributes[not(starts-with(@zsd:define-name,'rdfa.'))]" />

				<xsl:if test="$optional-attributes.non-rdfa">
					<div class="rng-optional-attributes">
						<xsl:text>optional attributes: </xsl:text>
						<xsl:text> </xsl:text>
						<xsl:for-each select="$optional-attributes.non-rdfa">
							<xsl:sort select="@zsd:qname" />
							<a class="attribute" href="{@zsd:doc-pointer}">
								<xsl:text>@</xsl:text>
								<xsl:value-of select="@zsd:qname" />
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
				<xsl:if test="$optional-attributes.rdfa">
					<div class="rng-optional-attributes">
						<xsl:text>optional RDFa attributes: </xsl:text>
						<xsl:text> </xsl:text>
						<xsl:for-each select="$optional-attributes.rdfa">
							<xsl:sort select="@zsd:qname" />
							<a class="attribute" href="{@zsd:doc-pointer}">
								<xsl:text>@</xsl:text>
								<xsl:value-of select="@zsd:qname" />
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
			</xsl:if>
			<xsl:choose>
				<xsl:when
					test="every $e in descendant::ref satisfies $e/@zrng:define eq 'attribute'">
					<p>This element is empty</p>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="rng:*" mode="ecm" />
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

	<xsl:template name="presentElementnamesWithLinks">
		<!-- As parameter: one or more elements from $SCHEMA.ELEMENT-LIST -->
		<xsl:param name="elems" as="element()+" />
		<xsl:for-each select="$elems">
			<xsl:sort select="@name" />

			<xsl:variable name="defineName" select="@zsd:define-name" as="xs:string" />
			<xsl:variable name="elementMultiplicity" as="xs:integer"
				select="$SCHEMA.ELEMENT-LIST.GROUPED/element-group[some $e in element satisfies $e/@zsd:define-name eq $defineName]/@zsd:multiplicity" />
			<a class="element" href="{@zsd:doc-pointer}">
				<xsl:choose>
					<xsl:when test="@zsd:ns-prefix eq ''">
						<xsl:value-of select="@name" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(@zsd:ns-prefix,':',@name)" />
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if
					test="
					$elementMultiplicity gt 1 
					and
					count($elems[@zsd:qname eq current()/@zsd:qname]) gt 1">
					<xsl:text>&#160;(</xsl:text>
					<span class="element-variant">
						<xsl:value-of select="zsd:elementVariant(.)" />
					</span>
					<xsl:text>&#160;variant)</xsl:text>
				</xsl:if>
			</a>
			<xsl:choose>
				<xsl:when test="position() = last()" />
				<xsl:when test="position() = last()-1"> and </xsl:when>
				<xsl:otherwise>, </xsl:otherwise>
			</xsl:choose>
			<xsl:value-of select="'&#10;'" />
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="generateXhtmlFilesForMultiplyDefinedElements">
		<xsl:for-each
			select="$SCHEMA.ELEMENT-LIST.GROUPED/element-group[number(@zsd:multiplicity) gt 1]">
			<xsl:variable as="xs:string" name="filename"
				select="concat($outputPath,$documentation.subfolder,@zsd:doc-pointer)" />
			<xsl:result-document format="xhtml" href="{$filename}">
				<xsl:variable as="node()+" name="element.title">
					<xsl:text>The </xsl:text>
					<span class="element">
						<xsl:value-of select="@zsd:qname" />
					</span>
					<xsl:text> element</xsl:text>
				</xsl:variable>
				<html xml:lang="en">
					<head>
						<title>
							<xsl:text>Schema Documentation: the </xsl:text>
							<xsl:value-of select="@zsd:qname" />
							<xsl:text> element</xsl:text>
						</title>
						<link href="../schemadoc.css" rel="stylesheet" type="text/css" />
					</head>
					<body>
						<xsl:copy-of select="$xhtml-files.banner.top" />
						<h1>
							<xsl:copy-of select="$element.title" />
						</h1>
						<p>
							<xsl:text>This element exists in </xsl:text>
							<xsl:value-of select="@zsd:multiplicity" />
							<xsl:text> variants:</xsl:text>
						</p>
						<ul>
							<xsl:for-each select="element">
								<li>
									<a href="{@zsd:doc-pointer}">
										<xsl:text>The </xsl:text>
										<span class="element-variant">
											<xsl:value-of select="(@zsd:context,'UNDEFINED')[1]" />
										</span>
										<xsl:text> variant of  the </xsl:text>
										<span class="element">
											<xsl:value-of select="@zsd:qname" />
										</span>
										<xsl:text> element</xsl:text>
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="presentDebugInformation">
		<!--<xsl:message> ## debug: param output-path: <xsl:value-of select="$output-path" /></xsl:message>
		<xsl:message> ## debug: variable outputPath: <xsl:value-of select="$outputPath" /></xsl:message>
		
		<xsl:message> ## debug: param rd-summary: <xsl:value-of select="$rd-summary" /></xsl:message>
		<xsl:message> ## debug: variable rdSummary: <xsl:value-of select="$rdSummary" /></xsl:message>-->

		<!--<xsl:message> ## debug: writing namespace map <xsl:value-of select="concat('_',$SCHEMA.base-filename,'_namespace-map.xml')" /></xsl:message>
		<xsl:result-document format="plain-xml"
			href="{concat('_',$SCHEMA.base-filename,'_namespace-map.xml')}">
			<xsl:copy-of select="$SCHEMA.NAMESPACE-MAP" />
		</xsl:result-document>-->
		<xsl:message> ## debug: writing reorganized schema to <xsl:value-of select="concat('_',$SCHEMA.base-filename,'_reorganized.xml')" /></xsl:message>
		<xsl:result-document format="plain-xml"
			href="{concat('_',$SCHEMA.base-filename,'_reorganized.xml')}">
			<xsl:copy-of select="$SCHEMA.REORGANIZED" />
		</xsl:result-document>
		<xsl:message> ## debug: writing list of elements to <xsl:value-of select="concat('_',$SCHEMA.base-filename,'_element-list.xml')" /></xsl:message>
		<xsl:result-document format="plain-xml"
			href="{concat('_',$SCHEMA.base-filename,'_element-list.xml')}">
			<xsl:copy-of select="$SCHEMA.ELEMENT-LIST" />
		</xsl:result-document>
		<!--		<xsl:message> ## debug: writing list of other feature stuff to <xsl:value-of select="concat('_',$SCHEMA.base-filename,'_other-feature-list.xml')" /></xsl:message>
		<xsl:result-document format="plain-xml"
			href="{concat('_',$SCHEMA.base-filename,'_other-feature-list.xml')}">
			<xsl:copy-of select="$SCHEMA.OTHER-FEATURE-STUFF" />
		</xsl:result-document>
		<xsl:message> ## debug: writing list of attributes to <xsl:value-of select="concat('_',$SCHEMA.base-filename,'_attribute-list.xml')" /></xsl:message>
		<xsl:result-document format="plain-xml"
			href="{concat('_',$SCHEMA.base-filename,'_attribute-list.xml')}">
			<xsl:copy-of select="$SCHEMA.ATTRIBUTE-LIST" />
		</xsl:result-document>
		<xsl:message> ## debug: writing list of grouped attributes to <xsl:value-of select="concat('_',$SCHEMA.base-filename,'_attribute-list-grouped.xml')" /></xsl:message>
		<xsl:result-document format="plain-xml"
			href="{concat('_',$SCHEMA.base-filename,'_attribute-list-grouped.xml')}">
			<xsl:copy-of select="$SCHEMA.ATTRIBUTE-LIST.GROUPED" />
		</xsl:result-document>
		<xsl:message> ## debug: writing list of grouped elements to <xsl:value-of select="concat('_',$SCHEMA.base-filename,'_element-list-grouped.xml')" /></xsl:message>
		<xsl:result-document format="plain-xml"
			href="{concat('_',$SCHEMA.base-filename,'_element-list-grouped.xml')}">
			<xsl:copy-of select="$SCHEMA.ELEMENT-LIST.GROUPED" />
		</xsl:result-document>
		<xsl:if test="count($SCHEMA.feature-names) gt 0">
			<xsl:message> ## debug: included features:</xsl:message>
			<xsl:for-each select="$SCHEMA.feature-names">
				<xsl:message>    * <xsl:value-of select="." /></xsl:message>
			</xsl:for-each>
		</xsl:if>
-->
	</xsl:template>

	<!--<xsl:template name="presentChoicePosition">
		<xsl:choose>
			<xsl:when test="not(@position)" />
			<xsl:when test="@position eq 'first and last'" />
			<xsl:when test="@position eq 'first'">
				<xsl:text>either </xsl:text>
			</xsl:when>
			<xsl:when test="@position eq 'inbetween'">
				<xsl:text>or </xsl:text>
			</xsl:when>
			<xsl:when test="@position eq 'last'">
				<xsl:text>or </xsl:text>
			</xsl:when>
			<xsl:otherwise />
		</xsl:choose>
	</xsl:template>-->



	<!-- Start: Handle in-lined documentation -->
	<!-- MG <xsl:template match="dcterms:description | z:info | a:documentation"> -->
	<xsl:template match="db:para[contains(@role,'desc-')] | a:documentation">
		<p class="description {substring-before(name(),':')}">
			<xsl:apply-templates />
		</p>
	</xsl:template>

	<xsl:template match="x:*">
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="x:a[starts-with(@href,'#')]">
		<!-- Links on this form are used to direct the reader of the doc to other pages inside the set of doc files -->
		<xsl:variable name="define-name" as="xs:string" select="substring-after(@href,'#')" />
		<!-- Are we referencing an element? -->
		<xsl:variable name="e-filename" as="xs:string?"
			select="$SCHEMA.ELEMENT-LIST//element[@zsd:define-name eq $define-name]/@zsd:doc-pointer" />
		<!-- ...or an attribute? -->
		<xsl:variable name="a-filename" as="xs:string?"
			select="$SCHEMA.ATTRIBUTE-LIST//attribute[@zsd:define-name eq $define-name]/@zsd:doc-pointer" />
		<!-- And then choose the proper one: -->
		<xsl:variable name="filename" as="xs:string" select="($e-filename,$a-filename)[1]" />
		<xsl:copy copy-namespaces="no">
			<xsl:copy-of select="@* except @href" />
			<xsl:attribute name="href" select="$filename" />
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>

	<!-- End: Handle in-lined documentation -->


</xsl:stylesheet>
