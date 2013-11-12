<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:x="http://www.w3.org/1999/xhtml"
	xmlns:rng="http://relaxng.org/ns/structure/1.0"
	xmlns:p="http://www.daisy.org/schemadoc/patterns"
	xmlns:e="http://www.daisy.org/schemadoc/elements"
	xmlns:a="http://www.daisy.org/schemadoc/attributes"
	xmlns:fs="http://www.daisy.org/schemadoc/fileset" xmlns="http://www.w3.org/1999/xhtml"
	xpath-default-namespace="http://relaxng.org/ns/structure/1.0"
	exclude-result-prefixes="xs x rng p e fs a">

	<xsl:output method="xhtml" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>


	<!-- VARIOUS PARAMETERS -->
	<xsl:param name="debug" as="xs:boolean" select="true()"/>
	
	<!-- Store the driver rng in a variable; we will need it in other contexts later -->
	
	<xsl:variable name="html.head" as="element()">
		<head>
			<title>Schema topology: <xsl:value-of select="$driver.filename"/></title>
			<link rel="stylesheet" type="text/css" href="schemadoc2.css"/>
		</head>
	</xsl:variable>
	
	<xsl:variable name="driver" as="node()" select="."/>
	<xsl:variable name="driver.filename" as="xs:anyURI" select="resolve-uri(document-uri(.))"/>
	<xsl:variable name="driver.SingleFile" as="xs:boolean" select="count(//rng:include) eq 0"/>

	<xsl:variable name="fileMap" as="element()">
		<filemap xmlns="http://www.daisy.org/schemadoc/fileset">
			<file uri="{$driver.filename}" includes="{count(//rng:include)}">
				<xsl:if test="//rng:include">
					<includes xmlns="http://www.daisy.org/schemadoc/fileset">
						<xsl:apply-templates select="//rng:include" mode="fileMap">
							<xsl:with-param name="includingFile" as="xs:string"
								select="$driver.filename"/>
						</xsl:apply-templates>
					</includes>
				</xsl:if>
			</file>
		</filemap>
	</xsl:variable>

	<xsl:template match="rng:include" mode="fileMap">
		<xsl:param name="includingFile" as="xs:string"/>
		<xsl:variable name="currentFile" as="xs:anyURI" select="resolve-uri(document-uri(/))"/>
		<file xmlns="http://www.daisy.org/schemadoc/fileset"
			uri="{resolve-uri(@href,$includingFile)}"
			includes="{count(doc(resolve-uri(@href,$currentFile))//rng:include)}">
			<xsl:if test="doc(resolve-uri(@href,$currentFile))//rng:include">
				<includes xmlns="http://www.daisy.org/schemadoc/fileset">
					<xsl:apply-templates select="doc(resolve-uri(@href,$currentFile))//rng:include"
						mode="fileMap">
						<xsl:with-param name="includingFile" as="xs:string"
							select="resolve-uri(@href,$currentFile)"/>
					</xsl:apply-templates>
				</includes>
			</xsl:if>
		</file>
	</xsl:template>

	<xsl:variable name="simplifiedRNG" as="element()">
		<grammar xmlns="http://relaxng.org/ns/structure/1.0">
			<xsl:copy-of select="/rng:grammar/@ns"/>
			<xsl:apply-templates mode="sRNG"/>
		</grammar>
	</xsl:variable>

	<xsl:template match="*" mode="sRNG"/>
	<xsl:template match="rng:*" mode="sRNG">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="sRNG"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="rng:div | rng:grammar" mode="sRNG">
		<xsl:apply-templates mode="sRNG"/>
	</xsl:template>
	<xsl:template match="rng:include" mode="sRNG">
		<xsl:variable name="currentFile" as="xs:anyURI" select="resolve-uri(document-uri(/))"/>
		<div from="{$currentFile}" to="{resolve-uri(@href,$currentFile)}"
			xmlns="http://relaxng.org/ns/structure/1.0">
			<div class="included" xmlns="http://relaxng.org/ns/structure/1.0">
				<xsl:apply-templates select="doc(resolve-uri(@href,$currentFile))" mode="sRNG"/>
			</div>
			<xsl:if test="child::rng:*">
				<div class="replacing" xmlns="http://relaxng.org/ns/structure/1.0">
					<xsl:apply-templates mode="sRNG"/>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:variable name="patterns" as="element()">
		<patterns xmlns="http://www.daisy.org/schemadoc/patterns">
			<xsl:apply-templates select="$simplifiedRNG//rng:define" mode="patterns"/>
		</patterns>
	</xsl:variable>
	<xsl:template match="rng:define" mode="patterns">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="replacing"
				select="if (../@class eq 'replacing') then 'yes' else 'no'"/>
			<xsl:attribute name="location">
				<xsl:choose>
					<xsl:when test="local-name(..) eq 'grammar'">
						<xsl:value-of select="$driver.filename"/>
					</xsl:when>
					<xsl:when test="../@class eq 'replacing'">
						<xsl:value-of select="ancestor::rng:div[@from][1]/@from"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="ancestor::rng:div[@to][1]/@to"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:if test="../@class eq 'replacing'">
				<xsl:attribute name="replacingDefIn" select="ancestor::rng:div[@to][1]/@to"/>
			</xsl:if>
			<xsl:copy-of select="child::rng:*"/>
		</xsl:copy>
	</xsl:template>

	<xsl:variable name="patterns.grouped" as="element()">
		<patterns xmlns="http://www.daisy.org/schemadoc/patterns">
			<xsl:for-each-group select="$patterns//rng:define" group-by="@name">
				<xsl:sort select="lower-case(@name)"/>
				<pattern xmlns="http://www.daisy.org/schemadoc/patterns">
					<xsl:copy-of select="@name"/>
					<xsl:for-each select="current-group()">
						<xsl:copy-of select="."/>
					</xsl:for-each>
				</pattern>
			</xsl:for-each-group>
		</patterns>
	</xsl:variable>
	<xsl:variable name="patterns.available" as="xs:boolean"
		select="count($patterns.grouped//rng:define) gt 0"/>

	<xsl:variable name="elements.grouped" as="element()">
		<elements xmlns="http://www.daisy.org/schemadoc/elements">
			<xsl:for-each-group select="$simplifiedRNG//rng:element" group-by="@name">
				<xsl:sort select="lower-case(@name)"/>
				<element-group element-name="{current-grouping-key()}">
					<xsl:apply-templates select="current-group()" mode="elements"/>
				</element-group>
			</xsl:for-each-group>
		</elements>
	</xsl:variable>
	<xsl:template match="rng:element" mode="elements">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="nspace" select="ancestor-or-self::*[@ns][1]/@ns"/>
			<xsl:attribute name="replacing"
				select="if (../../@class eq 'replacing') then 'yes' else 'no'"/>
			<xsl:attribute name="location">
				<xsl:choose>
					<xsl:when test="local-name(../..) eq 'grammar'">
						<xsl:value-of select="$driver.filename"/>
					</xsl:when>
					<xsl:when test="../../@class eq 'replacing'">
						<xsl:value-of select="ancestor::rng:div[@from][1]/@from"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="ancestor::rng:div[@to][1]/@to"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:if test="../../@class eq 'replacing'">
				<xsl:attribute name="replacingDefIn" select="ancestor::rng:div[@to][1]/@to"/>
			</xsl:if>
			<xsl:copy-of select="child::rng:*"/>
		</xsl:copy>
	</xsl:template>
	<xsl:variable name="elements.available" as="xs:boolean"
		select="count($elements.grouped//rng:element) gt 0"/>

	<xsl:variable name="attributes.grouped" as="element()">
		<elements xmlns="http://www.daisy.org/schemadoc/attributes">
			<xsl:for-each-group select="$simplifiedRNG//rng:attribute" group-by="@name">
				<xsl:sort select="lower-case(@name)"/>
				<attribute-group attribute-name="{current-grouping-key()}">
					<xsl:apply-templates select="current-group()" mode="attributes"/>
				</attribute-group>
			</xsl:for-each-group>
		</elements>
	</xsl:variable>
	<xsl:template match="rng:attribute" mode="attributes">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="nspace" select="ancestor-or-self::*[@ns][1]/@ns"/>
			<xsl:attribute name="replacing"
				select="if (../../@class eq 'replacing') then 'yes' else 'no'"/>
			<xsl:attribute name="location">
				<xsl:choose>
					<xsl:when test="local-name(../..) eq 'grammar'">
						<xsl:value-of select="$driver.filename"/>
					</xsl:when>
					<xsl:when test="../../@class eq 'replacing'">
						<xsl:value-of select="ancestor::rng:div[@from][1]/@from"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="ancestor::rng:div[@to][1]/@to"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:if test="../../@class eq 'replacing'">
				<xsl:attribute name="replacingDefIn" select="ancestor::rng:div[@to][1]/@to"/>
			</xsl:if>
			<xsl:copy-of select="child::rng:*"/>
		</xsl:copy>
	</xsl:template>
	<xsl:variable name="attributes.available" as="xs:boolean"
		select="count($attributes.grouped//rng:attribute) gt 0"/>

	<xsl:template match="/">
		<xsl:message>Creating schema doc</xsl:message>
		<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
			<xsl:copy-of select="$html.head" />
			<body>
				<h1>Schema Topology</h1>
				<div class="driver-filename">
					<xsl:value-of select="$driver.filename"/>
				</div>
				<div class="menu-buttons">
					<xsl:if test="not($driver.SingleFile)">
						<a href="_fileset.html">Files</a>
					</xsl:if>
					<xsl:if test="$patterns.available">
						<a href="_patterns.html">Named patterns</a>
					</xsl:if>
					<xsl:if test="$elements.available">
						<a href="_elements.html">Elements</a>
					</xsl:if>
					<xsl:if test="$attributes.available">
						<a href="_attributes.html">Attributes</a>
					</xsl:if>
					<!--					<a href="_attributes.html">Attributes</a>-->
				</div>
			</body>
		</html>
		<xsl:if test="not($driver.SingleFile)">
			<xsl:call-template name="handleFiles"/>
		</xsl:if>

		<xsl:if test="$patterns.available">
			<xsl:call-template name="handlePatterns"/>
		</xsl:if>
		<xsl:if test="$elements.available">
			<xsl:call-template name="handleElements"/>
		</xsl:if>
		<xsl:if test="$attributes.available">
			<xsl:call-template name="handleAttributes"/>
		</xsl:if>

		<!-- <xsl:result-document href="schemaDoc.css" method="text">
			<xsl:copy-of select="$CSS"/>
		</xsl:result-document> -->
		<xsl:if test="$debug">
			<xsl:result-document href="_fileMap.xml" method="xml">
				<xsl:copy-of select="$fileMap"/>
			</xsl:result-document>
			<xsl:result-document href="_patterns01.xml" method="xml">
				<xsl:copy-of select="$patterns"/>
			</xsl:result-document>
			<xsl:result-document href="_patterns02.xml" method="xml">
				<xsl:copy-of select="$patterns.grouped"/>
			</xsl:result-document>
			<xsl:result-document href="_elements01.xml" method="xml">
				<xsl:copy-of select="$elements.grouped"/>
			</xsl:result-document>
			<xsl:result-document href="_attributes01.xml" method="xml">
				<xsl:copy-of select="$attributes.grouped"/>
			</xsl:result-document>
			<!--<xsl:result-document href="_sRNG.xml" method="xml" indent="no">
				<xsl:copy-of select="$simplifiedRNG" />
			</xsl:result-document>-->
		</xsl:if>
	</xsl:template>
	<xsl:template name="handleFiles">
		<xsl:result-document href="_fileset.html">
			<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
				<!--<head>
					<title>Profile Documentation: <xsl:value-of select="$driver.filename"/></title>
					<link rel="stylesheet" type="text/css" href="schemaDoc.css"/>
				</head>-->
				<xsl:copy-of select="$html.head" />
				<body>
					<h1>Schema Topology: Files</h1>
					<div class="driver-filename">
						<xsl:value-of select="$driver.filename"/>
					</div>

					<div class="schema-fileset">
						<p>A total of <xsl:value-of select="count($fileMap//fs:file)"/> files are
							used in this schema.</p>
						<!--<p>The following files are used in this schema:</p>-->
						<xsl:apply-templates select="$fileMap"/>
					</div>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>

	<!-- ATTRIBUTE HANDLING -->

	<xsl:template name="handleAttributes">
		<xsl:call-template name="createAttributeTOC"/>
		<xsl:call-template name="createAttributeFiles"/>
	</xsl:template>
	<xsl:template name="createAttributeTOC">
		<xsl:result-document href="_attributes.html" indent="yes">
			<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
				<!--<head>
					<title>Profile Documentation: <xsl:value-of select="$driver.filename"/></title>
					<link rel="stylesheet" type="text/css" href="schemaDoc.css"/>
					</head>-->
				<xsl:copy-of select="$html.head" />
				<body>
					<h1>Schema Topology: Attributes</h1>
					<div class="driver-filename">
						<xsl:value-of select="$driver.filename"/>
					</div>

					<p>There are <xsl:value-of
							select="count($attributes.grouped//a:attribute-group)"/> attributes in
						the schema.</p>
					<xsl:for-each-group select="$attributes.grouped//a:attribute-group"
						group-by="lower-case(substring(@attribute-name,1,1))">
						<a class="a-local-toc" href="{concat('#',current-grouping-key())}">
							<xsl:value-of select="current-grouping-key()"/>
						</a>
					</xsl:for-each-group>
					<div class="element-toc">
						<xsl:for-each-group select="$attributes.grouped//a:attribute-group"
							group-by="lower-case(substring(@attribute-name,1,1))">
							<div id="{current-grouping-key()}">
								<xsl:value-of select="current-grouping-key()"/>
							</div>
							<xsl:for-each select="current-group()">
								<a href="{concat('_a_',translate(@attribute-name,':','-'),'.html')}">
									<xsl:value-of select="@attribute-name"/>
								</a><br/>
								<xsl:text>&#10;</xsl:text>
							</xsl:for-each>
						</xsl:for-each-group>
					</div>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	<xsl:template name="createAttributeFiles">
		<xsl:for-each select="$attributes.grouped//a:attribute-group">
			<xsl:result-document href="{concat('_a_',translate(@attribute-name,':','-'),'.html')}"
				indent="yes">
				<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
					<xsl:copy-of select="$html.head" />
					<body class="element">
						<h1>Schema Topology: Attribute <code><xsl:value-of select="@attribute-name"/></code></h1>
						<div class="driver-filename">
							<xsl:value-of select="$driver.filename"/>
						</div>
						
						<xsl:for-each select="rng:attribute">
							<xsl:sort select="@replacing" order="descending"/>
							<div class="element">
								<xsl:if
									test="some $e in (preceding-sibling::rng:attribute | following-sibling::rng:attribute) satisfies $e/@replacingDefIn eq current()/@location">
									<xsl:attribute name="style"
										select="'background-color:rgb(180,180,180);'"/>
								</xsl:if>
								<table class="element-info">
									<tr valign="top">
										<td class="lbl">Namespace:</td>
										<td>
											<xsl:value-of select="@nspace"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="lbl">
											<xsl:text>Location</xsl:text>
										</td>

										<td>
											<xsl:value-of select="@location"/>
										</td>
									</tr>
									<xsl:if
										test="preceding-sibling::rng:attribute or following-sibling::rng:attribute">
										<tr valign="top">
											<td class="lbl">Replacing other
												element-definitions:</td>
											<td>
												<xsl:choose>
												<xsl:when test="@replacing eq 'yes'">
												<xsl:text>Yes, those in </xsl:text>
												<xsl:value-of select="@replacingDefIn"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>No</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:if>
									<xsl:if
										test="
										some $e in (preceding-sibling::rng:attribute | following-sibling::rng:attribute) satisfies $e/@replacingDefIn eq current()/@location
										
										">
										<tr valign="top">
											<td colspan="3" class="lbl">This definition is
												replaced</td>
										</tr>
									</xsl:if>
								</table>
								<xsl:apply-templates select="."/>
							</div>
						</xsl:for-each>

					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>

	<!-- ElEMENT HANDLING -->
	<xsl:template name="handleElements">
		<xsl:call-template name="createElementTOC"/>
		<xsl:call-template name="createElementFiles"/>
	</xsl:template>
	<xsl:template name="createElementTOC">
		<xsl:result-document href="_elements.html" indent="yes">
			<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
				<!--<head>
					<title>Profile Documentation: <xsl:value-of select="$driver.filename"/></title>
					<link rel="stylesheet" type="text/css" href="schemaDoc.css"/>
					</head>-->
				<xsl:copy-of select="$html.head" />
				<body>
					<h1>Schema Topology: Elements</h1>
					<div class="driver-filename">
						<xsl:value-of select="$driver.filename"/>
					</div>

					<p>There are <xsl:value-of select="count($elements.grouped//e:element-group)"/>
						elements in the schema.</p>
					<xsl:for-each-group select="$elements.grouped//e:element-group"
						group-by="lower-case(substring(@element-name,1,1))">
						<a class="e-local-toc" href="{concat('#',current-grouping-key())}">
							<xsl:value-of select="current-grouping-key()"/>
						</a>
					</xsl:for-each-group>
					<div class="element-toc">
						<xsl:for-each-group select="$elements.grouped//e:element-group"
							group-by="lower-case(substring(@element-name,1,1))">
							<div id="{current-grouping-key()}">
								<xsl:value-of select="current-grouping-key()"/>
							</div>
							<xsl:for-each select="current-group()">
								<a href="{concat('_e_',@element-name,'.html')}">
									<xsl:value-of select="@element-name"/>
								</a><br/>
								<xsl:text>&#10;</xsl:text>
							</xsl:for-each>
						</xsl:for-each-group>
					</div>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	<xsl:template name="createElementFiles">
		<xsl:for-each select="$elements.grouped//e:element-group">
			<xsl:result-document href="{concat('_e_',@element-name,'.html')}" indent="yes">
				<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
					<!--<head>
						<title>Profile Documentation: <xsl:value-of select="$driver.filename"
							/></title>
						<link rel="stylesheet" type="text/css" href="schemaDoc.css"/>
						</head>-->
					<xsl:copy-of select="$html.head" />
					<body class="element">
						<h1>Schema Topology: Element <code><xsl:value-of select="@element-name"/></code></h1>
						<div class="driver-filename">
							<xsl:value-of select="$driver.filename"/>
						</div>
						
						<xsl:for-each select="rng:element">
							<xsl:sort select="@replacing" order="descending"/>
							<div class="element">
								<xsl:if
									test="some $e in (preceding-sibling::rng:element | following-sibling::rng:element) satisfies $e/@replacingDefIn eq current()/@location">
									<xsl:attribute name="style"
										select="'background-color:rgb(180,180,180);'"/>
								</xsl:if>
								<table class="element-info">
									<tr valign="top">
										<td class="lbl">Namespace:</td>
										<td>
											<xsl:value-of select="@nspace"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="lbl">
											<xsl:text>Location</xsl:text>
										</td>

										<td>
											<xsl:value-of select="@location"/>
										</td>
									</tr>
									<xsl:if
										test="preceding-sibling::rng:element or following-sibling::rng:element">
										<tr valign="top">
											<td class="lbl">Replacing other
												element-definitions:</td>
											<td>
												<xsl:choose>
												<xsl:when test="@replacing eq 'yes'">
												<xsl:text>Yes, those in </xsl:text>
												<xsl:value-of select="@replacingDefIn"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>No</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:if>
									<xsl:if
										test="
										some $e in (preceding-sibling::rng:element | following-sibling::rng:element) satisfies $e/@replacingDefIn eq current()/@location
										
										">
										<tr valign="top">
											<td colspan="3" class="lbl">This definition is
												replaced</td>
										</tr>
									</xsl:if>
								</table>
								<xsl:apply-templates select="."/>
							</div>
						</xsl:for-each>

					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>



	<!-- PATTERN HANDLING -->
	<xsl:template name="handlePatterns">
		<xsl:call-template name="createPatternTOC"/>
		<xsl:call-template name="createPatternFiles"/>
	</xsl:template>

	<xsl:template name="createPatternTOC">
		<xsl:result-document href="_patterns.html" indent="yes">
			<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
				<!--<head>
					<title>Profile Documentation: <xsl:value-of select="$driver.filename"/></title>
					<link rel="stylesheet" type="text/css" href="schemaDoc.css"/>
					</head>-->
				<xsl:copy-of select="$html.head" />
				<body>
					<h1>Schema Topology: Patterns</h1>
					<div class="driver-filename">
						<xsl:value-of select="$driver.filename"/>
					</div>

					<p>There are <xsl:value-of select="count($patterns.grouped//p:pattern)"/> named
						patterns in the schema.</p>
					<xsl:for-each-group select="$patterns.grouped//p:pattern"
						group-by="lower-case( substring(@name,1,1))">
						<a class="p-local-toc" href="{concat('#',current-grouping-key())}">
							<xsl:value-of select="current-grouping-key()"/>
						</a>
					</xsl:for-each-group>
					<div class="pattern-toc">
						<xsl:for-each-group select="$patterns.grouped//p:pattern"
							group-by="lower-case( substring(@name,1,1))">
							<div id="{current-grouping-key()}">
								<xsl:value-of select="current-grouping-key()"/>
							</div>
							<xsl:for-each select="current-group()">
								<a href="{concat('_p_',@name,'.html')}">
									<xsl:value-of select="@name"/>
								</a><br/>
								<xsl:text>&#10;</xsl:text>
							</xsl:for-each>
						</xsl:for-each-group>
					</div>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	<xsl:template name="createPatternFiles">
		<xsl:for-each select="$patterns.grouped//p:pattern">
			<xsl:result-document href="{concat('_p_',@name,'.html')}" indent="yes">
				<html xmlns="http://www.w3.org/1999/xhtml" lang="en">					
					<xsl:copy-of select="$html.head" />
					<body class="pattern">
						<h1>Schema Topology: Pattern <code><xsl:value-of select="@name"/></code></h1>
												
						<table class="pattern-info">

							<tr valign="top">
								<td>Number of definitions:</td>
								<td>
									<xsl:value-of select="count(rng:define)"/>
								</td>
							</tr>
							<xsl:if test="count(rng:define) gt 1">
								<tr valign="top">
									<td>Number of files where pattern is defined:</td>
									<td>
										<xsl:value-of
											select="count(distinct-values(rng:define/@location))"/>
									</td>
								</tr>
								<xsl:if test="rng:define[@combine]">
									<tr valign="top">
										<td>Type of combination:</td>
										<td>
											<xsl:value-of select="rng:define[@combine][1]/@combine"
											/>
										</td>
									</tr>
								</xsl:if>
								<tr valign="top">
									<td>Some patterns are replaced:</td>
									<td>
										<xsl:value-of
											select="if (some $e in rng:define satisfies $e/@replacing eq 'yes') then 'yes' else 'no'"
										/>
									</td>
								</tr>

							</xsl:if>
						</table>
						<xsl:apply-templates>
							<xsl:sort select="@replacing" order="descending"/>
							<xsl:sort select="@combine" order="ascending"/>
						</xsl:apply-templates>
						<!--<xsl:message>Pattern: <xsl:value-of select="@name"/></xsl:message>-->
						<h2>References to this pattern</h2>
						<xsl:choose>
							<xsl:when test="some $sr in $simplifiedRNG//rng:start//rng:ref satisfies $sr/@name eq current()/@name">
								<xsl:variable name="start" as="element()" select="$simplifiedRNG//rng:start[some $e in descendant::rng:ref satisfies $e/@name eq current()/@name]" />
								<div class="referenced-start">
									<xsl:text>This pattern is referenced from the start element in the schema:</xsl:text>
									<xsl:apply-templates select="$start" />
									<xsl:text>located in </xsl:text>
									<xsl:for-each select="$start">
										<xsl:value-of select="ancestor::rng:div[@to][1]/@to"/>
									</xsl:for-each>
									
								</div>
							</xsl:when>
							<xsl:when
								test="
								(some $pr in $patterns.grouped//rng:define//rng:ref satisfies $pr/@name eq current()/@name)
								or
								(some $er in $elements.grouped//rng:element//rng:ref satisfies $er/@name eq current()/@name)
								or
								(some $ar in $attributes.grouped//rng:attribute//rng:ref satisfies $ar/@name eq current()/@name)
								">
								<div class="referenced">
									<p>This pattern is referenced from the following constructs in
										the schema:</p>
									<ul>
										<xsl:if
											test="some $pr in $patterns.grouped//rng:define//rng:ref satisfies $pr/@name eq current()/@name">
											<li>
												<em>Patterns:</em>
												<ul>
												<xsl:for-each
												select="$patterns.grouped//rng:define[some $e in descendant::rng:ref satisfies $e/@name eq current()/@name]">
												<li>
												<a href="{concat('_p_',@name,'.html')}">
												<xsl:value-of select="@name"/>
												</a>
												</li>
												</xsl:for-each>
												</ul>
											</li>
										</xsl:if>
										<xsl:if
											test="some $er in $elements.grouped//rng:element//rng:ref satisfies $er/@name eq current()/@name">
											<li>
												<em>Elements:</em>
												<ul>
												<xsl:for-each
												select="$elements.grouped//rng:element[some $e in descendant::rng:ref satisfies $e/@name eq current()/@name]">
												<li>
												<a href="{concat('_e_',@name,'.html')}">
												<xsl:value-of select="@name"/>
												</a>
												</li>
												</xsl:for-each>
												</ul>
											</li>
										</xsl:if>
										<xsl:if
											test="some $ar in $attributes.grouped//rng:attribute//rng:ref satisfies $ar/@name eq current()/@name">
											<li>
												<em>Attributes:</em>
												<ul>
												<xsl:for-each
												select="$attributes.grouped//rng:attribute[some $e in descendant::rng:ref satisfies $e/@name eq current()/@name]">
												<li>
												<a href="{concat('_a_',@name,'.html')}">
												<xsl:value-of select="@name"/>
												</a>
												</li>
												</xsl:for-each>
												</ul>
											</li>
										</xsl:if>
									</ul>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<xsl:message><xsl:text>Warning: this define seems not to be referenced within the schema: </xsl:text> <xsl:value-of select="@name"/></xsl:message>
								<p class="not-referenced"> This pattern does not seem to be
									referenced from any other construct (pattern, element or
									attribute) in the schema! </p>
							</xsl:otherwise>
						</xsl:choose>
						<p class="driver-filename">
							Driver: <xsl:value-of select="$driver.filename"/>
						</p>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="rng:define">
		<div class="named-pattern">
			<xsl:if
				test="some $e in (preceding-sibling::rng:define | following-sibling::rng:define) satisfies $e/@replacingDefIn eq current()/@location">
				<xsl:attribute name="style" select="'background-color:rgb(180,180,180);'"/>
			</xsl:if>
			<table class="pattern-info">
				<tr valign="top">
					<td class="lbl">Base pattern:</td>
					<td>
						<xsl:choose>
							<xsl:when
								test="not(preceding-sibling::rng:define or following-sibling::rng:define)">
								<xsl:text>Yes</xsl:text>
							</xsl:when>
							<xsl:when
								test="
									not(@combine) 
									and 	(preceding-sibling::rng:define/@combine
										or
										following-sibling::rng:define/@combine
										)">
								<xsl:text>Yes</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>No</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
				<tr>
					<td class="lbl">
						<xsl:text>Location</xsl:text>
					</td>

					<td>
						<xsl:value-of select="@location"/>
					</td>
				</tr>
				<tr valign="top">
					<td class="lbl">Replacing other patterns:</td>
					<td colspan="3">
						<xsl:choose>
							<xsl:when test="@replacing eq 'yes'">
								<xsl:text>Yes, those in </xsl:text>
								<xsl:value-of select="@replacingDefIn"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>No</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
				<xsl:if
					test="
					some $e in (preceding-sibling::rng:define | following-sibling::rng:define) satisfies $e/@replacingDefIn eq current()/@location
					
					">
					<tr valign="top">
						<td colspan="4" class="lbl">This definition is replaced</td>
					</tr>
				</xsl:if>
			</table>
			<xsl:next-match/>
		</div>
	</xsl:template>


	<xsl:template match="rng:*">
		<xsl:variable name="ref" as="xs:boolean" select="local-name() eq 'ref'"/>
		<div class="rng">
			<span class="rng-element">
				<xsl:value-of select="concat('&lt;',local-name())"/>
				<xsl:for-each
					select="attribute::* except @location except @replacing except @replacingDefIn except @nspace">
					<xsl:text> </xsl:text>
					<xsl:value-of select="name()"/>
					<xsl:text>=&quot;</xsl:text>
					<xsl:choose>
						<xsl:when test="$ref and local-name() eq 'name'">
							<a href="{concat('_p_',.,'.html')}">
								<xsl:value-of select="."/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>&quot;</xsl:text>
				</xsl:for-each>
			</span>
			<xsl:choose>
				<xsl:when test="child::rng:* or text()">
					<xsl:text>&gt;</xsl:text>
					<xsl:apply-templates/>
					<span class="rng-element">
						<xsl:value-of select="concat('&lt;/',local-name(),'&gt;')"/>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> /&gt;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<!-- FILESET TEMPLATES -->
	<xsl:template match="fs:includes">
		<div class="include-info"> This file includes the following <xsl:value-of
				select="../@includes"/> files: </div>
		<div class="include">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="fs:file">
		<div class="file">
			<span class="filenumber">
				<xsl:number select="." level="any"/>
			</span>
			<span class="filename">
				<xsl:value-of select="@uri"/>
			</span>

			<xsl:apply-templates/>
		</div>
	</xsl:template>
</xsl:stylesheet>
