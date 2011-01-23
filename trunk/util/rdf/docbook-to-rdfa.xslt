<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dcterms="http://purl.org/dc/terms/"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:role="http://www.w3.org/1999/xhtml/vocab#"
	xmlns:zf="http://www.daisy.org/ns/xslt/functions"
	xmlns:z="http://www.daisy.org/ns/rdf/"
	xmlns:htu="http://www.daisy.org/ns/rdf/usage/html/#"
	xmlns:db="http://docbook.org/ns/docbook"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	exclude-result-prefixes="zf xsl rdfs rdf dcterms owl xsd role htu z xlink">

	<xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes"/>

	<!-- the canonical URI of the vocab being rendered -->
	<xsl:param name="vocab-canonical-uri" required="yes"/>

	<!-- vocab name -->
	<xsl:param name="vocab-name" required="yes"/>
	
	<!-- URI of xhtml vocab -->
	<xsl:variable name="xhv-uri">http://www.w3.org/1999/xhtml/vocab/#</xsl:variable>
	
	<!-- spec metadata for this vocab -->
	<xsl:variable name="vocab-meta" select="//db:annotation[@xml:id=concat('rdfa-vocab-',$vocab-name,'-meta')]"/>

	<xsl:template match="/">
		<html lang="en-US" xml:lang="en-US"
			prefix="dcterms: http://purl.org/dc/terms/ 
  			owl: http://www.w3.org/2002/07/owl#
  			rdf: http://www.w3.org/1999/02/22-rdf-syntax-ns#
  			rdfs: http://www.w3.org/2000/01/rdf-schema#
  			xsd: http://www.w3.org/2001/XMLSchema 
  			role: http://www.w3.org/1999/xhtml/vocab#
  			htu: http://www.daisy.org/ns/rdf/usage/html">
			<head>
				<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
				<xsl:for-each select="$vocab-meta/dc:*">
					<xsl:choose>
						<xsl:when test="name(.) eq 'dc:title'">
							<title>
								<xsl:value-of select="."/>
							</title>
						</xsl:when>
						<xsl:when test="name(.) eq 'dc:description'"/>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="starts-with(name(.),'dc:')">
									<meta property="dcterms:{local-name(.)}" content="{.}"/>
								</xsl:when>
								<xsl:otherwise>
									<meta property="{name(.)}" content="{.}"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<link rel="stylesheet" type="text/css" href="../../epub-spec.css"/>
			</head>
			<body>
				<h1 property="dcterms:title">
					<xsl:apply-templates select="$vocab-meta/dc:title/text()"/>
				</h1>

				<div>
					<h2>About this vocabulary</h2>
					<xsl:if test="$vocab-meta/dc:description">
						<div property="dcterms:description">
							<xsl:for-each select="$vocab-meta/dc:description">
								<p>
									<xsl:apply-templates mode="vocab-builder"/>
								</p>
							</xsl:for-each>
						</div>
					</xsl:if>
					<!--  				  				
  				<p class="vocab-date">Document last modified: <xsl:value-of select="//rdf:Description[@rdf:about=$vocab-uri]/dcterms:modified"
  				/>. Refer to the <a href="{$vocab-revision-history}">revision history</a> for details.</p>
  				-->
				</div>

				<div id="vocab" class="vocabulary">
					<xsl:for-each select="tokenize($vocab-meta/z:bag-order, ',[^-a-zA-Z0-9]*')">
						<xsl:variable name="bag-name" select="concat('rdfa-vocab-',$vocab-name,'-bag-',.)"/>
						<xsl:variable name="bag" select="$vocab-meta/ancestor::db:book//db:informaltable[@xml:id=$bag-name]|$vocab-meta/ancestor::db:book//db:variablelist[@xml:id=$bag-name]"/>
						<xsl:call-template name="create-bag">
							<xsl:with-param name="id" select="."/>
							<xsl:with-param name="bag" select="$bag"/>
						</xsl:call-template>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="create-bag">
		<xsl:param name="id" as="xsd:string"/>
		<xsl:param name="bag" as="element()"/>
		
		<div id="{$id}" about="#{$id}" typeof="rdf:Bag">
			<xsl:element name="h2">
				<xsl:attribute name="id">h_<xsl:value-of select="$id"/></xsl:attribute>
				<xsl:attribute name="about">#<xsl:value-of select="$id"/></xsl:attribute>
				<xsl:attribute name="rev">dcterms:title</xsl:attribute>
				<xsl:apply-templates select="$bag/db:info/db:annotation/db:para/text()"/>
			</xsl:element>
			<xsl:if test="$bag/child::dc:description">
				<xsl:for-each select="child::dc:description">
					<p about="#{$id}" rev="dcterms:description">
						<xsl:apply-templates mode="vocab-builder"/>
					</p>
				</xsl:for-each>
			</xsl:if>
			<dl about="#{$id}" rev="rdfs:member">
				<xsl:apply-templates select="$bag/*" mode="vocab-builder"/>
			</dl>
		</div>
	</xsl:template>
	
	<xsl:template match="db:info" mode="vocab-builder"/>
	
	<xsl:template match="db:tgroup|db:varlistentry" mode="vocab-builder">
		<xsl:variable name="about">
			<xsl:value-of select="normalize-space(.//db:*[@role='rdfa-property'])"/>
		</xsl:variable>
		<dt id="{$about}" about="#{$about}" typeof="rdf:Property">
			<xsl:value-of select="$about"/>
		</dt>
		
		<!-- create a datatype variable -->
		<xsl:variable name="datatype">
			<xsl:choose>
				<!-- <rdfs:datatype rdf:resource="http://www.w3.org/2001/XMLSchema#integer"/> -->
				<xsl:when test="rdfs:datatype">
					<xsl:value-of
						select="replace(rdfs:datatype/@rdf:resource,'http://www.w3.org/2001/XMLSchema#','xsd:')"
					/>
				</xsl:when>
				<xsl:otherwise>xsd:string</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<dd about="#{$about}" property="rdfs:comment" datatype="{$datatype}">
			<p>
				<xsl:apply-templates select=".//db:*[@role='rdfa-property-desc']/node()" mode="vocab-builder"/>
			</p>
			<xsl:if test="not(matches($datatype, 'xsd:string'))">
				<p>Datatype: <code><xsl:value-of select="$datatype"/></code>.</p>
			</xsl:if>
		</dd>
		
		<!-- then get the non-generic stuff with specialized rendering -->
		<xsl:if test="rdfs:subPropertyOf|rdfs:subClassOf">
			<xsl:call-template name="render-sub-dl">
				<xsl:with-param name="label">Inherits from:</xsl:with-param>
				<xsl:with-param name="about" select="$about"/>
				<xsl:with-param name="members" select="rdfs:subPropertyOf|rdfs:subClassOf"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="rdfs:seeAlso">
			<xsl:call-template name="render-sub-dl">
				<xsl:with-param name="label">See also:</xsl:with-param>
				<xsl:with-param name="about" select="$about"/>
				<xsl:with-param name="members" select="rdfs:seeAlso"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="owl:sameAs">
			<xsl:call-template name="render-sub-dl">
				<xsl:with-param name="label">Same as:</xsl:with-param>
				<xsl:with-param name="about" select="$about"/>
				<xsl:with-param name="members" select="owl:sameAs"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="owl:equivalentProperty">
			<xsl:call-template name="render-sub-dl">
				<xsl:with-param name="label">Equivalent to:</xsl:with-param>
				<xsl:with-param name="about" select="$about"/>
				<xsl:with-param name="members" select="owl:equivalentProperty"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="role:scope">
			<xsl:call-template name="render-sub-dl">
				<xsl:with-param name="label">Required parent context:</xsl:with-param>
				<xsl:with-param name="about" select="$about"/>
				<xsl:with-param name="members" select="role:scope"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="htu:usage">
			<xsl:call-template name="render-sub-dl">
				<xsl:with-param name="label">HTML usage context:</xsl:with-param>
				<xsl:with-param name="about" select="$about"/>
				<xsl:with-param name="members" select="htu:usage"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="render-sub-dl">
		<xsl:param name="label" as="xsd:string"/>
		<xsl:param name="members" as="element()*"/>
		<xsl:param name="about" as="xsd:string"/>
		<dd>

			<p>
				<span class="subproplabel">
					<xsl:value-of select="$label"/>
				</span>
				<xsl:for-each select="$members">
					<xsl:choose>
						<xsl:when test="@rdf:resource">
							<span class="subpropref" about="#{$about}" rel="{name(.)}"
								resource="{@rdf:resource}">
								<a href="{@rdf:resource}">
									<xsl:value-of
										select="zf:get-link-label(@rdf:resource,ancestor::rdf:RDF)"
									/>
								</a>
							</span>
						</xsl:when>
						<xsl:otherwise>
							<span class="subpropref" about="#{$about}" rel="{name(.)}">
								<xsl:apply-templates/>
							</span>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="position() eq last()"/>
						<xsl:when test="position() eq last() - 1">
							<xsl:text> and </xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>, </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</p>

			<!-- <dl>
 			<dt><xsl:value-of select="$label"/></dt>
 			<xsl:for-each select="$members">
 				<xsl:choose> 					
	 				<xsl:when test="@rdf:resource">	 				
		 				<dd about="#{$about}" rel="{name(.)}" resource="{@rdf:resource}">
		 					<a href="{@rdf:resource}">
		 						<xsl:value-of select="zf:get-link-label(@rdf:resource,ancestor::rdf:RDF)"/>
		 					</a>
		 				</dd>	
	 				</xsl:when>
	 				<xsl:otherwise>
	 					<dd about="#{$about}" rel="{name(.)}">	 						
	 						<xsl:call-template name="wiki-links-to-xhtml">
	 							<xsl:with-param name="text" select="./text()"/>
	 						</xsl:call-template>	 						
	 					</dd>	
	 				</xsl:otherwise>
	 			</xsl:choose>
 			</xsl:for-each>
 		</dl> -->
		</dd>
	</xsl:template>

	<xsl:function name="zf:get-link-label">
		<xsl:param name="uri" as="xsd:string"/>
		<xsl:param name="root" as="element()"/>
		<xsl:choose>
			<xsl:when test="starts-with($uri,'#') or starts-with($uri,$vocab-canonical-uri)">
				<!-- local link -->
				<xsl:variable name="target" select="substring-after($uri,'#')"/>
				<xsl:variable name="dest"
					select="$root//rdf:Description[@rdf:ID=$target]/rdfs:label"/>
				<xsl:if test="not($dest) or $dest eq ''">
					<xsl:message>WARNING: Could not resolve destination <xsl:value-of
							select="$target"/></xsl:message>
					<xsl:value-of select="$target"/>
				</xsl:if>
				<xsl:apply-templates select="$dest/text()"/>
			</xsl:when>
			<xsl:when test="starts-with($uri, $xhv-uri)">
				<xsl:text>xhv:</xsl:text>
				<xsl:value-of select="substring-after($uri, '#')"/>
			</xsl:when>
			<xsl:otherwise>
				<!-- external link -->
				<xsl:value-of select="$uri"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<xsl:function name="zf:get-type">
		<xsl:param name="uri" as="xsd:string"/>
		<xsl:choose>
			<xsl:when test="$uri eq 'http://www.w3.org/1999/02/22-rdf-syntax-ns#Property'">
				<xsl:value-of>rdf:Property</xsl:value-of>
			</xsl:when>
			<xsl:when test="$uri eq 'http://www.w3.org/1999/02/22-rdf-syntax-ns#class'">
				<xsl:value-of>rdf:class</xsl:value-of>
			</xsl:when>
			<xsl:otherwise>
				<xsl:message>WARNING: unknown URI in zf:get-type: <xsl:value-of select="$uri"
					/></xsl:message>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<xsl:function name="zf:get-heading-for-bag">
		<xsl:param name="bag" as="element()"/>
		<xsl:variable name="ancestors" select="count($bag/ancestor::*)" as="xsd:integer"/>
		<xsl:value-of select="concat('h',string($ancestors+1))"/>
	</xsl:function>
	
	
	<!-- limited docbook tag support -->
	
	<xsl:template match="db:link" mode="vocab-builder">
		<xsl:element name="a">
			<xsl:attribute name="href" select="@xlink:href|@linkend"/>
			<xsl:apply-templates mode="vocab-builder"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="db:code|db:literal" mode="vocab-builder">
		<xsl:element name="code">
			<xsl:attribute name="class"><xsl:value-of select="local-name(.)"/></xsl:attribute>
			<xsl:apply-templates mode="vocab-builder"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="db:remark" mode="vocab-builder">
		<xsl:element name="span">
			<xsl:attribute name="style">background-color: yellow</xsl:attribute>
			<xsl:apply-templates mode="vocab-builder"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*"/>

</xsl:stylesheet>
