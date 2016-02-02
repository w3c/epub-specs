<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dcterms="http://purl.org/dc/terms/"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:role="http://www.w3.org/1999/xhtml/vocab#"
	xmlns:zf="http://www.daisy.org/ns/xslt/functions"
	xmlns:zt="http://www.daisy.org/ns/rdf/property#"
	xmlns:htu="http://www.daisy.org/ns/rdf/usage/html/#"
	xmlns:mou="http://www.daisy.org/ns/rdf/usage/media-overlays/#"
	xmlns:epub="http://www.idpf.org/epub/vocab#"
	exclude-result-prefixes="zf xsl rdfs rdf dcterms owl xsd role htu zt mou">

	<xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes"/>

	<xsl:include href="wiki-link-handler.xsl"/>

	<!-- the canonical URI of the vocab being rendered -->
	<xsl:param name="vocab-uri" required="yes"/>

	<!-- a relative link to this vocab in Notation3 syntax -->
	<xsl:param name="vocab-as-n3" required="no"/>

	<!-- a relative link to this vocab in RDF/XML syntax -->
	<xsl:param name="vocab-as-rdfxml" required="no"/>

	<!-- a relative link to this vocabs revision history document -->
	<xsl:param name="vocab-revision-history" required="yes"/>

	<!-- whether to output a leading blurb on the nature of htu:usage (for epub structure vocab only) -->
	<xsl:param name="output-htu-expl" required="no" select="0"/>
	
	<!-- whether to output version links  -->
	<xsl:param name="output-version-links" required="no" select="0"/>
	
	<!-- URI of xhtml vocab -->
	<xsl:variable name="xhv-uri">http://www.w3.org/1999/xhtml/vocab/#</xsl:variable>

	<!-- the rdf:Description that describes the vocab being rendered -->
	<xsl:variable name="vocab-rdf-description" as="element()"
		select="//rdf:Description[@rdf:about=$vocab-uri]|//rdf:Description[@rdf:about='']|//rdf:Description[@rdf:about='.']"/>

	<xsl:template match="rdf:RDF">
		<html xml:lang="en-US"
			xmlns:dcterms="http://purl.org/dc/terms/" 
  			xmlns:owl="http://www.w3.org/2002/07/owl#"
  			xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  			xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  			xmlns:xsd="http://www.w3.org/2001/XMLSchema"
  			xmlns:role="http://www.w3.org/1999/xhtml/vocab#"
  			xmlns:htu="http://www.daisy.org/ns/rdf/usage/html/#">
			<head>
				<meta charset="utf-8"/>
				<xsl:for-each select="$vocab-rdf-description/*">
					<xsl:choose>
						<xsl:when test="name(.) eq 'dcterms:title'">
							<title>
								<xsl:value-of select="."/>
							</title>
						</xsl:when>
						<xsl:when test="name(.) eq 'dcterms:description'"/>
						<xsl:otherwise>
							<meta property="{name(.)}" content="{.}"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:choose>
					<xsl:when test="contains($vocab-uri,'magazine')">
						<link rel="stylesheet" type="text/css" href="../../../css/epub-spec-2016.css"/>
					</xsl:when>
					<xsl:otherwise>
						<link rel="stylesheet" type="text/css" href="../../css/epub-spec-2016.css"/>
					</xsl:otherwise>
				</xsl:choose>
				<style>
					dt { font-weight: bold; }
				</style>
			</head>
			<body>
				<header>
					<p>
						<xsl:choose>
							<xsl:when test="contains($vocab-uri,'magazine')">
								<a href="http://www.idpf.org"><img src="../../../images/idpflogo_web_125.jpg" alt="IDPF" class="logo"/></a>
							</xsl:when>
							<xsl:otherwise>
								<a href="http://www.idpf.org"><img src="../../images/idpflogo_web_125.jpg" alt="IDPF" class="logo"/></a>
							</xsl:otherwise>
						</xsl:choose>
					</p>
					
					<h1 class="title" property="dcterms:title">
						<xsl:call-template name="wiki-links-to-xhtml">
							<xsl:with-param name="text"
								select="$vocab-rdf-description/dcterms:title/text()"/>
						</xsl:call-template>
					</h1>
					
					<xsl:if test="$output-version-links eq '1'">
						<xsl:choose>
							<xsl:when test="contains($vocab-uri,'magazine')">
								<div class="printhistory">
									<p class="identity">
										<span class="pubdate">19 November 2014</span>
									</p>
									
									<dl class="printhistory">
										<dt>This version</dt>
										<dd>
											<a class="link"
												href="http://www.idpf.org/epub/vocab/structure/magazine/epub-vocab-magazine-20141119.html">http://www.idpf.org/epub/vocab/structure/magazine/epub-vocab-magazine-20141119.html</a>
										</dd>
										<dt>Latest version</dt>
										<dd>
											<a class="link" href="http://www.idpf.org/epub/vocab/structure/magazine">http://www.idpf.org/epub/vocab/structure/magazine</a>
										</dd>
										<dt>Previous version</dt>
										<dd>
											<a class="link"
												href="http://www.idpf.org/epub/vocab/structure/magazine/epub-vocab-magazine-20131209.html">http://www.idpf.org/epub/vocab/structure/magazine/epub-vocab-magazine-20131209.html</a>
										</dd>
									</dl>
									<div class="history">
										<span class="history-title">Document history</span>
										<ul>
											<li><a
												href="https://github.com/IDPF/epub-revision/commits/master/src/vocab/magazine.n3"
												>Changes to this document</a></li>					
											<li><a href="https://github.com/IDPF/epub-revision/issues">Report an issue</a></li>
										</ul>
									</div>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="printhistory">
									<p class="identity">
										<span class="pubdate">30 January 2016</span>
									</p>
									
									<dl class="printhistory">
										<dt>This version</dt>
										<dd>
											<a class="link"
												href="http://www.idpf.org/epub/vocab/structure/epub-vocab-structure-20160130.html">http://www.idpf.org/epub/vocab/structure/epub-vocab-structure-20160130.html</a>
										</dd>
										<dt>Latest version</dt>
										<dd>
											<a class="link" href="http://www.idpf.org/epub/vocab/structure">http://www.idpf.org/epub/vocab/structure</a>
										</dd>
										<dt>Previous version</dt>
										<dd>
											<a class="link"
												href="http://www.idpf.org/epub/vocab/structure/epub-vocab-structure-20150717.html">http://www.idpf.org/epub/vocab/structure/epub-vocab-structure-20150717.html</a>
										</dd>
									</dl>
									<div class="history">
										<span class="history-title">Document history</span>
										<ul>
											<li><a
												href="https://github.com/IDPF/epub-revision/commits/master/src/vocab/structure.n3"
												>Changes to this document</a></li>					
											<li><a href="https://github.com/IDPF/epub-revision/issues">Report an issue</a></li>
										</ul>
									</div>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</header>
				
				<section id="sotd">
					<h2>Status of this Document</h2>
					<xsl:choose>
						<xsl:when test="contains($vocab-uri,'magazine')">
							<p>This document contains terms for use with the <a href="http://www.idpf.org/epub/renditions/region-nav/">EPUB Region-Based Navigation</a> specification.</p>
						</xsl:when>
						<xsl:otherwise>
							<p>This document contains draft terms from the <a href="http://www.idpf.org/epub/profiles/edu/10">EDUPUB profile</a>.</p>
							
							<p>All terms in the <a href="#h_indexes">Indexes</a> section, with the exception of the <code>index</code> term, are 
								new in the <a href="http://www.idpf.org/epub/idx">EPUB Indexes specification</a>, which is now a Proposed
								Specification.</p>
						</xsl:otherwise>
					</xsl:choose>
					<p>Any use of the terms marked <span class="status draft">[draft]</span> should be considered experimental.</p>
					
					<p>Deprecated term are identified by the label <span class="status deprecated">[deprecated]</span>. These terms are no longer recommended
						for use.</p>
					
					<p>Terms without a label are considered stable.</p>
				</section>

				<section id="about">
					<h2>About this vocabulary</h2>
					<xsl:if test="$vocab-rdf-description/dcterms:description">
						<div property="dcterms:description">
							<xsl:for-each select="$vocab-rdf-description/dcterms:description">
								<p>
									<xsl:call-template name="wiki-links-to-xhtml">
										<xsl:with-param name="text" select="./text()"/>
									</xsl:call-template>
								</p>
							</xsl:for-each>
							<xsl:if test="$output-htu-expl eq '1'">
								<p class="output-htu-expl" id="htu-expl">The <i>HTML usage 
										context</i> fields indicate contexts in HTML5 documents 
									where the given property is considered relevant. Authors may 
									use the properties on HTML5 markup elements not specifically 
									listed, but must ensure that the semantics they express represent 
									a subset of the carrying element's semantics and do not attach 
									an existing element's meaning to a semantically neutral element.</p>
								<p class="output-htu-expl">When processing HTML5 documents, Reading 
									Systems may ignore such non-compliant properties, unless their 
									usage context is explicitly overridden or extended by the host 
									specification.</p>
								<p>The <i>Usage Details</i> sections identify IDPF specifications
									that define or utilize the specified properties.</p>
							</xsl:if>
						</div>
					</xsl:if>
					
					<h2>Revision Policy</h2>
					
					<p>This document is subject to change at any time. The terms defined in this vocabulary 
						will never be removed, but may be deprecated.</p>
					
					<p>Requests for additions, modifications and clarifications must be made through the 
						<a href="https://code.google.com/p/epub-revision/issues/list">EPUB 3 Revision Tracker</a>.</p>
					
					<!--  				  				
  				<p class="vocab-date">Document last modified: <xsl:value-of select="//rdf:Description[@rdf:about=$vocab-uri]/dcterms:modified"
  				/>. Refer to the <a href="{$vocab-revision-history}">revision history</a> for details.</p>
  				-->
				</section>

				<xsl:if test="contains($vocab-uri,'magazine')">
					<section id="prism">
						<h2>PRISM Controlled Vocabularies</h2>
						<p>The <a href="http://www.idealliance.org/specifications/prism-metadata-initiative/prism/specifications/controlled-vocabularies">PRISM
							Controlled Vocabularies</a> should be used to provide industry-standard magazine semantics to aid
							in region-based navigation.</p>
						<p>In particular, the following subset of terms from the <a
							href="http://www.prismstandard.org/specifications/3.0/PRISM_CV_Spec_3.0.htm#_Toc337191589">PAM 
							Content Class Vocabulary</a> are recommended for their use in magazine navigation:</p>
						<ul>
							<li>title</li>
							<li>deck</li>
							<li>subtitle</li>
							<li>byline</li>
							<li>contributors</li>
							<li>caption</li>
							<li>credit</li>
							<li>box</li>
							<li>advertisement</li>
							<li>pullQuote</li>
						</ul>
						<p>When using these terms for EPUB region-based navigation, the predefined prefix "<code>prism:</code>"
							is required.</p>
					</section>
				</xsl:if>
				
				<section id="vocab" class="vocabulary">
					<xsl:apply-templates/>
				</section>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="rdf:Bag">
		<xsl:variable name="id" select="./@rdf:ID"/>
		<div id="{$id}" about="#{$id}" typeof="rdf:Bag">			
			<xsl:element name="{zf:get-heading-for-bag(.)}">
				<xsl:attribute name="id">h_<xsl:value-of select="$id"/></xsl:attribute>
				<xsl:attribute name="about">#<xsl:value-of select="$id"/></xsl:attribute>
				<xsl:attribute name="rev">dcterms:title</xsl:attribute>
				<xsl:call-template name="wiki-links-to-xhtml">
					<xsl:with-param name="text" select="./dcterms:title/text()"/>
				</xsl:call-template>
			</xsl:element>
			<xsl:if test="./dcterms:description">
				<xsl:for-each select="./dcterms:description">
					<p about="#{$id}" rev="dcterms:description">
						<xsl:call-template name="wiki-links-to-xhtml">
							<xsl:with-param name="text" select="./text()"/>
						</xsl:call-template>
					</p>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="./rdf:Description">
				<dl about="#{$id}" rev="rdfs:member">
					<xsl:apply-templates select="./rdf:Description"/>
				</dl>
			</xsl:if>
			<xsl:apply-templates select="./rdf:Bag"/>
		</div>
	</xsl:template>

	<xsl:template match="rdf:Bag/rdf:Description">
		<xsl:variable name="about" select="@rdf:ID"/>
		<dt id="{$about}" about="#{$about}" typeof="{zf:get-type(rdf:type/@rdf:resource)}">
			<xsl:value-of select="rdfs:label"/>
			<xsl:if test="epub:status">
				<span class="status draft"> [<xsl:value-of select="epub:status"/>]</span>
			</xsl:if>
			<xsl:if test="owl:deprecated">
				<span class="status deprecated" property="owl:deprecated" content="true"> [deprecated]</span>
			</xsl:if>
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

		<!-- first a generic loop -->
		<xsl:for-each
			select="./*[not(matches(name(.),'rdfs:label|rdf:type|rdfs:subPropertyOf|rdfs:subClassOf|rdfs:seeAlso|owl:sameAs|owl:equivalentProperty|rdfs:datatype|role:scope|htu:usage|epub:status|epub:usage|owl:deprecated|dcterms:isReplacedBy|mou:usage|zt:ex|zt:extends|zt:for|zt:value'))]">
			<dd about="#{$about}" property="{name(.)}" datatype="{$datatype}">
				<p>
					<xsl:call-template name="wiki-links-to-xhtml">
						<xsl:with-param name="text" select="./text()"/>
					</xsl:call-template>
					<xsl:if test="@rdf:resource">
						<xsl:text> </xsl:text>
						<a href="@rdf:resource">
							<xsl:value-of select="@rdf:resource"/>
						</a>
					</xsl:if>
				</p>
				<xsl:if test="not(matches($datatype, 'xsd:string'))">
					<p>Datatype: <code><xsl:value-of select="$datatype"/></code>.</p>
				</xsl:if>
			</dd>
		</xsl:for-each>
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
			<!-- output without rdfa properties kept -->
			<xsl:call-template name="render-sub-dl-plain">
				<xsl:with-param name="label">HTML usage context: </xsl:with-param>
				<xsl:with-param name="members" select="htu:usage"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="epub:usage">
			<!-- output without rdfa properties kept -->
			<xsl:call-template name="render-sub-dl-plain">
				<xsl:with-param name="label">Usage details: </xsl:with-param>
				<xsl:with-param name="members" select="epub:usage"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="mou:usage">
			<!-- output without rdfa properties kept -->
			<xsl:call-template name="render-sub-dl-plain">
				<xsl:with-param name="label">Media Overlays usage context: </xsl:with-param>
				<xsl:with-param name="members" select="mou:usage"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="dcterms:isReplacedBy">
			<xsl:call-template name="render-sub-dl">
				<xsl:with-param name="label">Replaced by:</xsl:with-param>
				<xsl:with-param name="about" select="$about"/>
				<xsl:with-param name="members" select="dcterms:isReplacedBy"/>
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
								<xsl:call-template name="wiki-links-to-xhtml">
									<xsl:with-param name="text" select="./text()"/>
								</xsl:call-template>
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

	<xsl:template name="render-sub-dl-plain">
		<!-- output rdfxml data without rdfa markup -->
		<xsl:param name="label" as="xsd:string"/>
		<xsl:param name="members" as="element()*"/>
		<dd>
			<p>
				<span class="subproplabel">
					<xsl:value-of select="$label"/>
				</span>
				<xsl:for-each select="$members">
					<xsl:choose>
						<xsl:when test="@rdf:resource">
							<a href="{@rdf:resource}">
								<xsl:value-of
									select="zf:get-link-label(@rdf:resource,ancestor::rdf:RDF)"/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="wiki-links-to-xhtml">
								<xsl:with-param name="text" select="./text()"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="position() eq last()"/>
						<xsl:when test="position() eq last() - 1">
							<xsl:text> or </xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>, </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</p>
		</dd>
	</xsl:template>

	<xsl:function name="zf:get-link-label">
		<xsl:param name="uri" as="xsd:string"/>
		<xsl:param name="root" as="element()"/>
		<xsl:choose>
			<xsl:when test="starts-with($uri,'#') or starts-with($uri,$vocab-uri)">
				<!-- local link -->
				<xsl:variable name="target" select="substring-after($uri,'#')"/>
				<xsl:variable name="dest"
					select="$root//rdf:Description[@rdf:ID=$target]/rdfs:label"/>
				<xsl:if test="not($dest) or $dest eq ''">
					<xsl:message>WARNING: Could not resolve destination <xsl:value-of
							select="$target"/></xsl:message>
					<xsl:value-of select="$target"/>
				</xsl:if>
				<xsl:call-template name="wiki-links-to-xhtml">
					<xsl:with-param name="text" select="$dest/text()"/>
				</xsl:call-template>
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

	<xsl:template match="*"/>

</xsl:stylesheet>
