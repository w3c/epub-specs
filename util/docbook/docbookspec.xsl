<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:saxon="http://icl.com/saxon" xmlns:exsl="http://exslt.org/common"
    xmlns:db="http://docbook.org/ns/docbook" xmlns:d="http://docbook.org/ns/docbook"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:import href="docbook-xsl-ns-1.76.1/xhtml-1_1/docbook.xsl"/>


    <xsl:output method="xhtml" encoding="UTF-8" omit-xml-declaration="no" indent="yes"
        exclude-result-prefixes="saxon db exsl"/>

    <xsl:param name="generate.toc"> appendix nop article/appendix nop article toc,title book
        toc,title,example chapter title part toc,title preface title qandadiv toc qandaset toc
        reference toc,title sect1 toc sect2 toc sect3 toc sect4 toc sect5 toc set toc,title </xsl:param>

    <xsl:param name="admon.style"></xsl:param>
    <xsl:param name="admon.textlabel">0</xsl:param>

    <!-- ============================================================================= -->
    <!-- crude rearrange of the leading info element to structure as an IDPF spec document  -->
    <xsl:template name="book.titlepage">

        <!-- title -->
        <xsl:element name="h1" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">title</xsl:attribute>
            <xsl:value-of select="./db:title"/>
        </xsl:element>

        <!-- release info -->
        <xsl:variable name="topinfo" select="db:info[1]"/>

        <xsl:element name="p" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">identity</xsl:attribute>
            <xsl:element name="span" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class">releaseinfo</xsl:attribute>
                <xsl:value-of select="$topinfo/db:releaseinfo"/>
            </xsl:element>
            <xsl:text> </xsl:text>
            <xsl:element name="span" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class">pubdate</xsl:attribute>
                <xsl:value-of select="$topinfo/db:pubdate"/>
            </xsl:element>
        </xsl:element>

        <!-- history -->
        <xsl:if test="$topinfo/db:printhistory">
            <xsl:element name="dl" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class">printhistory</xsl:attribute>
                <xsl:for-each select="$topinfo/db:printhistory/db:formalpara">
                    <xsl:element name="dt" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:value-of select="current()/db:title"/>
                    </xsl:element>
                    <xsl:element name="dd" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:apply-templates select="current()/db:para"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:if>

        <!-- copyright -->
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">legal</xsl:attribute>
            <xsl:apply-templates mode="book.titlepage.recto.mode" select="$topinfo/db:copyright"/>
            <xsl:apply-templates mode="book.titlepage.recto.mode" select="$topinfo/db:legalnotice"/>
        </xsl:element>

        <!-- editors -->
        <xsl:if test="$topinfo/db:authorgroup[not(@role) or @role='current']">
            <xsl:call-template name="render-authorgroup">
                <xsl:with-param name="title">Editors (this version)</xsl:with-param>
                <xsl:with-param name="node" select="$topinfo/db:authorgroup[not(@role) or @role='current']"/>
            </xsl:call-template>
        </xsl:if>        
        <xsl:if test="$topinfo/db:authorgroup[@role='previous']">
            <xsl:call-template name="render-authorgroup">
                <xsl:with-param name="title">Editors (previous versions)</xsl:with-param>
                <xsl:with-param name="node" select="$topinfo/db:authorgroup[@role='previous']"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="render-authorgroup">
        <xsl:param name="title" />
        <xsl:param name="node" />
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">authorgroup</xsl:attribute>
            <xsl:element name="p" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class">bridgehead</xsl:attribute>
                <xsl:value-of select="$title"/>
            </xsl:element>
            <xsl:for-each select="$node/db:editor">
                <xsl:element name="p" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:apply-templates select="." mode="class.attribute"/>
                    <xsl:choose>
                        <xsl:when test="db:orgname">
                            <xsl:apply-templates/>
                        </xsl:when>
                        <xsl:when test="db:personname and db:affiliation">
                            <xsl:call-template name="person.name"/>, <xsl:value-of
                                select="db:affiliation"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="person.name"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>        
    </xsl:template>

    <!-- ============================================================================= -->
    <!-- override in html.xsl: get IDs directly on the carrier instead of on child <a>  -->
    <!-- TODO this seems to crash when xml:id appears on certain element types -->
    
    <xsl:template name="anchor">
        <xsl:param name="node" select="."/>
        <xsl:param name="conditional" select="1"/>
        <xsl:variable name="id">
            <xsl:call-template name="object.id">
                <xsl:with-param name="object" select="$node"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$conditional = 0 or $node/@id or $node/@xml:id">
            <xsl:attribute name="id" select="$id"/>
        </xsl:if>
        <xsl:variable name="parentName" select="local-name(..)"/>
        <xsl:if test="$conditional = 0 or $node/@id or $node/@xml:id">
            <xsl:if
                test="$node[d:title] and ($parentName='section' or $parentName='book' or $parentName='chapter' or $parentName='appendix')">
                <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="class">hidden-reveal</xsl:attribute>
                    <xsl:attribute name="title">Link here</xsl:attribute>
                    <xsl:attribute name="href">#<xsl:value-of select="$id"/></xsl:attribute>
                    <xsl:text disable-output-escaping="no">&#8250;</xsl:text>
                </xsl:element>
                <xsl:text disable-output-escaping="no">&#160;</xsl:text>
            </xsl:if>
        </xsl:if>
        </xsl:template> 

    <!-- ============================================================================= -->
    <!-- override in html.xsl --> 
    
    <xsl:template match="*" mode="class.value">
        <xsl:param name="class" select="local-name(.)"/>
        <xsl:choose>
            <xsl:when test="@xrefstyle">
                <xsl:value-of select="@xrefstyle"/>
            </xsl:when>
            <xsl:when test="@role">
                <xsl:value-of select="@role"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$class"/>
            </xsl:otherwise>
        </xsl:choose>                        
    </xsl:template>


    <!-- ============================================================================= -->
    <!-- override titlepage hr separators -->

    <xsl:template name="book.titlepage.separator"/>
    <xsl:template name="section.titlepage.separator"/>


    <!-- ============================================================================= -->
    <!-- give toc title bridgehead class -->
    <xsl:variable name="toc.title">
        <xsl:element name="p" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">bridgehead</xsl:attribute>
            <xsl:call-template name="gentext">
                <xsl:with-param name="key">TableofContents</xsl:with-param>
            </xsl:call-template>
        </xsl:element>
    </xsl:variable>

    <!-- ============================================================================= -->
    <!-- remark[@role='todo'] ==> span[@class='todo'] -->
    <!-- Note:  template copied from inline.xsl and modified -->
    <xsl:template match="db:remark[@role='todo']">
        <xsl:param name="content">
            <xsl:call-template name="anchor"/>
            <xsl:call-template name="simple.xlink">
                <xsl:with-param name="content">
                    <xsl:apply-templates/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:param>
        <!-- * if you want output from the inline.charseq template wrapped in -->
        <!-- * something other than a Span, call the template with some value -->
        <!-- * for the 'wrapper-name' param -->
        <xsl:param name="wrapper-name">span</xsl:param>
        <xsl:if test="$show.comments != 0">
            <xsl:element name="{$wrapper-name}" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class">todo</xsl:attribute>
                <xsl:call-template name="dir"/>
                <xsl:call-template name="generate.html.title"/>
                <xsl:copy-of select="$content"/>
                <xsl:call-template name="apply-annotations"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- ============================================================================= -->
    <!-- Fill in the docbook placeholder user.head.content template to add an http-equiv meta
        element (helps IE < 9) -->

    <xsl:template name="user.head.content">
        <xsl:element name="meta" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="http-equiv">Content-Type</xsl:attribute>
            <xsl:attribute name="content">text/html; charset=utf-8</xsl:attribute>
        </xsl:element>
    </xsl:template>

    <!-- ============================================================================= -->
    <!-- For chapters, preface, sections, and appendices that have @conformance, add a "This section is ..." line -->
    <!-- We match on title so that we can insert the text after the heading -->

    <xsl:template
        match="db:chapter/db:title|db:preface/db:title|db:section/db:title|db:appendix/db:title|db:bibliography/db:title">
        <xsl:apply-imports/>
        <!-- Do everything the normal transform does before adding more text -->
        <xsl:variable name="conformanceLevel" select="../@conformance"/>
        <xsl:variable name="parentName" select="local-name(..)"/>
        <xsl:variable name="structureName">
            <xsl:choose>
                <xsl:when
                    test="$parentName='preface' or $parentName='chapter' or $parentName='bibliography'">
                    <xsl:text>section</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$parentName"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="$conformanceLevel != ''">
            <xsl:element name="p" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class">
                    <xsl:value-of select="$conformanceLevel"/>
                </xsl:attribute> This <xsl:value-of select="$structureName"/> is <xsl:value-of
                    select="$conformanceLevel"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>


    <!-- ============================================================================= -->
    <!-- add templates as per htmltbl.xsl in order to get id and role -->

    <xsl:template mode="htmlTableAtt" match="@xml:id">
        <xsl:attribute name="id">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template mode="htmlTableAtt" match="@role">
        <xsl:attribute name="class">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>


    <!-- ============================================================================= -->
    <!-- override title page templates to remove all the excess divs -->


    <xsl:template name="book.titlepage-nomatch">
        <xsl:variable name="recto.content">
            <xsl:call-template name="book.titlepage.before.recto"/>
            <xsl:call-template name="book.titlepage.recto"/>
        </xsl:variable>
        <xsl:variable name="recto.elements.count">
            <xsl:choose>
                <xsl:when test="function-available('exsl:node-set')">
                    <xsl:value-of select="count(exsl:node-set($recto.content)/*)"/>
                </xsl:when>
                <xsl:when
                    test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
                    <!--Xalan quirk-->
                    <xsl:value-of select="count(exsl:node-set($recto.content)/*)"/>
                </xsl:when>
                <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
            <xsl:copy-of select="$recto.content"/>
        </xsl:if>
        <xsl:variable name="verso.content">
            <xsl:call-template name="book.titlepage.before.verso"/>
            <xsl:call-template name="book.titlepage.verso"/>
        </xsl:variable>
        <xsl:variable name="verso.elements.count">
            <xsl:choose>
                <xsl:when test="function-available('exsl:node-set')">
                    <xsl:value-of select="count(exsl:node-set($verso.content)/*)"/>
                </xsl:when>
                <xsl:when
                    test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
                    <!--Xalan quirk-->
                    <xsl:value-of select="count(exsl:node-set($verso.content)/*)"/>
                </xsl:when>
                <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
            <xsl:copy-of select="$verso.content"/>
        </xsl:if>
        <xsl:call-template name="book.titlepage.separator"/>
    </xsl:template>

    <xsl:template match="db:title" mode="book.titlepage.recto.auto.mode">
        <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
    </xsl:template>

    <xsl:template match="db:title" mode="chapter.titlepage.recto.auto.mode">
        <xsl:apply-templates select="." mode="chapter.titlepage.recto.mode"/>
    </xsl:template>

    <xsl:template match="db:title" mode="section.titlepage.recto.auto.mode">
        <xsl:apply-templates select="." mode="section.titlepage.recto.mode"/>
    </xsl:template>

    <xsl:template name="chapter.titlepage">
        <xsl:variable name="recto.content">
            <xsl:call-template name="chapter.titlepage.before.recto"/>
            <xsl:call-template name="chapter.titlepage.recto"/>
        </xsl:variable>
        <xsl:variable name="recto.elements.count">
            <xsl:choose>
                <xsl:when test="function-available('exsl:node-set')">
                    <xsl:value-of select="count(exsl:node-set($recto.content)/*)"/>
                </xsl:when>
                <xsl:when
                    test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
                    <!--Xalan quirk-->
                    <xsl:value-of select="count(exsl:node-set($recto.content)/*)"/>
                </xsl:when>
                <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
            <xsl:copy-of select="$recto.content"/>
        </xsl:if>
        <xsl:variable name="verso.content">
            <xsl:call-template name="chapter.titlepage.before.verso"/>
            <xsl:call-template name="chapter.titlepage.verso"/>
        </xsl:variable>
        <xsl:variable name="verso.elements.count">
            <xsl:choose>
                <xsl:when test="function-available('exsl:node-set')">
                    <xsl:value-of select="count(exsl:node-set($verso.content)/*)"/>
                </xsl:when>
                <xsl:when
                    test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
                    <!--Xalan quirk-->
                    <xsl:value-of select="count(exsl:node-set($verso.content)/*)"/>
                </xsl:when>
                <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
            <xsl:copy-of select="$verso.content"/>
        </xsl:if>
        <xsl:call-template name="chapter.titlepage.separator"/>
    </xsl:template>




    <!-- ============================================================================= -->
    <!-- override section title page templates to remove all the excess divs and correct heading levels -->

    <xsl:template name="section.titlepage">

        <xsl:variable name="recto.content">
            <xsl:call-template name="section.titlepage.before.recto"/>
            <xsl:call-template name="section.titlepage.recto"/>
        </xsl:variable>
        <xsl:variable name="recto.elements.count">
            <xsl:choose>
                <xsl:when test="function-available('exsl:node-set')">
                    <xsl:value-of select="count(exsl:node-set($recto.content)/*)"/>
                </xsl:when>
                <xsl:when
                    test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
                    <!--Xalan quirk-->
                    <xsl:value-of select="count(exsl:node-set($recto.content)/*)"/>
                </xsl:when>
                <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
            <xsl:copy-of select="$recto.content"/>
        </xsl:if>
        <xsl:variable name="verso.content">
            <xsl:call-template name="section.titlepage.before.verso"/>
            <xsl:call-template name="section.titlepage.verso"/>
        </xsl:variable>
        <xsl:variable name="verso.elements.count">
            <xsl:choose>
                <xsl:when test="function-available('exsl:node-set')">
                    <xsl:value-of select="count(exsl:node-set($verso.content)/*)"/>
                </xsl:when>
                <xsl:when
                    test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
                    <!--Xalan quirk-->
                    <xsl:value-of select="count(exsl:node-set($verso.content)/*)"/>
                </xsl:when>
                <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
            <xsl:copy-of select="$verso.content"/>
        </xsl:if>
        <xsl:call-template name="section.titlepage.separator"/>

    </xsl:template>



    <xsl:template name="section.level">
        <xsl:param name="node" select="."/>
        <xsl:choose>
            <xsl:when test="local-name($node)='sect1'">1</xsl:when>
            <xsl:when test="local-name($node)='sect2'">2</xsl:when>
            <xsl:when test="local-name($node)='sect3'">3</xsl:when>
            <xsl:when test="local-name($node)='sect4'">4</xsl:when>
            <xsl:when test="local-name($node)='sect5'">5</xsl:when>
            <xsl:when test="local-name($node)='section'">
                <xsl:choose>
                    <!-- bumping all values up one to make lower than the chapter -->
                    <xsl:when test="$node/../../../../../../db:section">6</xsl:when>
                    <xsl:when test="$node/../../../../../db:section">6</xsl:when>
                    <xsl:when test="$node/../../../../db:section">5</xsl:when>
                    <xsl:when test="$node/../../../db:section">4</xsl:when>
                    <xsl:when test="$node/../../db:section">3</xsl:when>
                    <xsl:when test="$node/../db:section">2</xsl:when>
                    <xsl:otherwise>1</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when
                test="local-name($node)='refsect1' or
                local-name($node)='refsect2' or
                local-name($node)='refsect3' or
                local-name($node)='refsection' or
                local-name($node)='refsynopsisdiv'">
                <xsl:call-template name="refentry.section.level">
                    <xsl:with-param name="node" select="$node"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="local-name($node)='simplesect'">
                <xsl:choose>
                    <xsl:when test="$node/../../db:sect1">2</xsl:when>
                    <xsl:when test="$node/../../db:sect2">3</xsl:when>
                    <xsl:when test="$node/../../db:sect3">4</xsl:when>
                    <xsl:when test="$node/../../db:sect4">5</xsl:when>
                    <xsl:when test="$node/../../db:sect5">5</xsl:when>
                    <xsl:when test="$node/../../db:section">
                        <xsl:choose>
                            <xsl:when test="$node/../../../../../db:section">5</xsl:when>
                            <xsl:when test="$node/../../../../db:section">4</xsl:when>
                            <xsl:when test="$node/../../../db:section">3</xsl:when>
                            <xsl:otherwise>2</xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>1</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- ==================================================================== -->
    <!-- copied and modified from xhtml1_1/sections.xsl, make bridgehead a p -->
    <xsl:template match="d:bridgehead">
        <xsl:element name="p" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">bridgehead</xsl:attribute>
            <xsl:call-template name="anchor">
                <xsl:with-param name="conditional" select="0"/>
            </xsl:call-template>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- ==================================================================== -->
    <!-- override gentext to get "Chapter" etc out of link labels -->

    <xsl:param name="local.l10n.xml" select="document('')"/> 
    <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"> 
        <l:l10n language="en"> 
            <l:context name="xref-number-and-title">  
                <l:template name="chapter" text="%t"/> <!-- %n, -->
                <l:template name="section" text="“%t”"/> <!-- %n, -->
            </l:context>    
        </l:l10n>
    </l:i18n>


</xsl:stylesheet>
