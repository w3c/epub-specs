<?xml version="1.0" encoding="UTF-8"?>
<!-- toc.xsl generate the TOC and the links from TOC items to headings -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns="http://www.w3.org/1999/xhtml" xmlns:xhtml="http://www.w3.org/1999/xhtml"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:d="http://www.daisy.org/ns/"
	exclude-result-prefixes="xhtml xs d">

	<xsl:output indent="yes" method="xml" encoding="UTF-8" version="1.0" />

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="xhtml:body/xhtml:h1[1]">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
		<xsl:call-template name="toc"/>
	</xsl:template>

	<xsl:template name="toc">
		<h2 id="toc">Table of Contents</h2>
		<xsl:for-each-group
			select="//xhtml:h1|//xhtml:h2|//xhtml:h3|//xhtml:h4|//xhtml:h5|//xhtml:h6"
			group-starting-with="xhtml:h1">
			<xsl:apply-templates select="." mode="toc"/>
		</xsl:for-each-group>
	</xsl:template>

	<xsl:template match="xhtml:h1" mode="toc">
		<xsl:if test="following::xhtml:h2[1][preceding::xhtml:h1[1] = current-group()]">
			<ul>
				<xsl:for-each-group select="current-group() except ." group-starting-with="xhtml:h2">
					<xsl:apply-templates select="." mode="toc"/>
				</xsl:for-each-group>
			</ul>
		</xsl:if>
	</xsl:template>
		
	<xsl:function name="d:generateId" as="xs:string" >
		<!-- generate an id given an input string -->
		<xsl:param name="source" as="xs:string"/>
		<xsl:sequence  
			select="concat('h_',lower-case(replace(replace(replace(replace(normalize-space($source),' ',''),'/',''),'—',''),':','')))"/>
	</xsl:function>
	
	<xsl:template match="xhtml:h2" mode="toc">
		<xsl:variable name="target">
			<xsl:choose>
				<xsl:when test="./@id">
					<xsl:value-of select="./@id" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="content"><xsl:value-of select="."/></xsl:variable>
					<xsl:value-of select="d:generateId($content)"/>				
				</xsl:otherwise>
			</xsl:choose>	
		</xsl:variable>
		<li class="first">
			<a href="#{$target}">
				<xsl:value-of select="."/>
			</a>
			<xsl:if test="following::xhtml:h3[1][preceding::xhtml:h2[1] = current-group()]">
				<ul>
					<xsl:for-each-group select="current-group() except ."
						group-starting-with="xhtml:h3">
						<xsl:apply-templates select="." mode="toc"/>
					</xsl:for-each-group>
				</ul>
			</xsl:if>
		</li>
	</xsl:template>

	<xsl:template match="xhtml:h3" mode="toc">
		<xsl:variable name="target">
			<xsl:choose>
				<xsl:when test="./@id">
					<xsl:value-of select="./@id" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="content"><xsl:value-of select="."/></xsl:variable>
					<xsl:value-of select="d:generateId($content)"/>				
				</xsl:otherwise>
			</xsl:choose>	
		</xsl:variable>
		<li>
			<a href="#{$target}">
				<xsl:value-of select="."/>
			</a>
			<xsl:if test="following::xhtml:h4[1][preceding::xhtml:h3[1]  = current-group()]">
				<ul>
					<xsl:for-each-group select="current-group() except ."
						group-starting-with="xhtml:h4">
						<xsl:apply-templates select="." mode="toc"/>
					</xsl:for-each-group>
				</ul>
			</xsl:if>
		</li>
	</xsl:template>

	<xsl:template match="xhtml:h4" mode="toc">
		<xsl:variable name="target">
			<xsl:choose>
				<xsl:when test="./@id">
					<xsl:value-of select="./@id" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="content"><xsl:value-of select="."/></xsl:variable>
					<xsl:value-of select="d:generateId($content)"/>				
				</xsl:otherwise>
			</xsl:choose>	
		</xsl:variable>
		<li>
			<a href="#{$target}">
				<xsl:value-of select="."/>
			</a>
			<xsl:if test="following::xhtml:h5[1][preceding::xhtml:h4[1]  = current-group()]">
				<ul>
					<xsl:for-each-group select="current-group() except ."
						group-starting-with="xhtml:h5">
						<xsl:apply-templates select="." mode="toc"/>
					</xsl:for-each-group>
				</ul>
			</xsl:if>
		</li>
	</xsl:template>

	<xsl:template match="xhtml:h5" mode="toc">
		<xsl:variable name="target">
			<xsl:choose>
				<xsl:when test="./@id">
					<xsl:value-of select="./@id" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="content"><xsl:value-of select="."/></xsl:variable>
					<xsl:value-of select="d:generateId($content)"/>				
				</xsl:otherwise>
			</xsl:choose>	
		</xsl:variable>
		<li>
			<a href="#{$target}">
				<xsl:value-of select="."/>
			</a>

			<xsl:if test="following::xhtml:h6[1][preceding::xhtml:h5[1]  = current-group()]">
				<ul>
					<xsl:for-each-group select="current-group() except ."
						group-starting-with="xhtml:h6">
						<xsl:apply-templates select="." mode="toc"/>
					</xsl:for-each-group>
				</ul>
			</xsl:if>
		</li>
	</xsl:template>

	<xsl:template match="xhtml:h6" mode="toc">
		<li>
			<xsl:variable name="target">
				<xsl:choose>
					<xsl:when test="./@id">
						<xsl:value-of select="./@id" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="content"><xsl:value-of select="."/></xsl:variable>
						<xsl:value-of select="d:generateId($content)"/>				
					</xsl:otherwise>
				</xsl:choose>	
			</xsl:variable>
			
			<a href="#{$target}">
				<xsl:value-of select="."/>
			</a>

			<xsl:if test="following::xhtml:h7[1][preceding::xhtml:h6[1]  = current-group()]">
				<ul>
					<xsl:for-each-group select="current-group() except ."
						group-starting-with="xhtml:h7">
						<xsl:apply-templates select="." mode="toc"/>
					</xsl:for-each-group>
				</ul>
			</xsl:if>
		</li>
	</xsl:template>

	<xsl:template match="xhtml:h2|xhtml:h3|xhtml:h4|xhtml:h5|xhtml:h6">
		<xsl:variable name="name" select="name()"/>
		<xsl:element name="{$name}">
			<xsl:choose>
				<xsl:when test="@id"></xsl:when>
				<xsl:otherwise>
					<xsl:variable name="content"><xsl:value-of select="."/></xsl:variable>
					<xsl:attribute name="id" select="d:generateId($content)"/>	
				</xsl:otherwise>
			</xsl:choose>			
			<xsl:apply-templates select="@*|node()"/>
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>
