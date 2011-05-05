<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:saxon="http://icl.com/saxon" xmlns:exsl="http://exslt.org/common"
    xmlns:db="http://docbook.org/ns/docbook" xmlns:d="http://docbook.org/ns/docbook"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
    xmlns:xtbl="xalan://com.nwalsh.xalan.Table" xmlns:lxslt="http://xml.apache.org/xslt"
    xmlns:ptbl="http://nwalsh.com/xslt/ext/xsltproc/python/Table"
    xmlns:stbl="http://nwalsh.com/xslt/ext/com.nwalsh.saxon.Table"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="doc stbl xtbl lxslt ptbl d saxon db exsl xlink">
    
    <xsl:import href="docbook-xsl-ns-1.76.1/xhtml-1_1/docbook.xsl"/>
    
    <xsl:param name="ebnf.assignment">
        <code>=</code> <!-- default is "::=" -->
    </xsl:param>
    <xsl:param name="ebnf.statement.terminator">;</xsl:param>
    <xsl:param name="ebnf.table.bgcolor">#EEE</xsl:param>
    <xsl:param name="ebnf.table.border" select="0"/>
    
    <xsl:param name="user.print.css"/>
    
    <xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="no" indent="no"/>

    <!-- ==================================================================== -->
    <!-- toc settings                                                         -->
    <xsl:param name="generate.toc"> book toc,title part nop chapter nop </xsl:param>

    <!-- ==================================================================== -->
    <!-- override gentext to get "Chapter" etc out of link labels             -->

    <xsl:param name="local.l10n.xml" select="document('')"/>
    <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
        <l:l10n language="en">
            <l:context name="xref-number-and-title">
                <l:template name="chapter" text="%t"/>
                <l:template name="section" text="%t"/>
                <l:template name="table" text="%t"/>
                <l:template name="bridgehead" text="%t"/>
            </l:context>
            <l:context name="title">
                <l:template name="note" text="note"/>
                <l:template name="caution" text="caution"/>
                <l:template name="chapter" text="%t"/>
                <l:template name="table" text="%t"/>
            </l:context>
            <l:context name="title-unnumbered">
                <l:template name="chapter" text="%t"/>
                <l:template name="section" text="%t"/>
            </l:context>
            <l:context name="title-numbered">
                <l:template name="chapter" text="%n %t"/>
                <l:template name="section" text="%n %t"/>
            </l:context>
        </l:l10n>
    </l:i18n>

    <xsl:param name="admon.style"/>
    <xsl:param name="admon.textlabel">1</xsl:param>
    <xsl:param name="table.borders.with.css">0</xsl:param>

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
                <xsl:with-param name="title">Editors</xsl:with-param>
                <xsl:with-param name="node"
                    select="$topinfo/db:authorgroup[not(@role) or @role='current']"/>
            </xsl:call-template>
        </xsl:if>      
        <!--
        <xsl:if test="$topinfo/db:authorgroup[@role='previous']">
            <xsl:call-template name="render-authorgroup">
                <xsl:with-param name="title">Editors (previous versions)</xsl:with-param>
                <xsl:with-param name="node" select="$topinfo/db:authorgroup[@role='previous']"/>
            </xsl:call-template>
        </xsl:if>
        -->
    </xsl:template>

    <xsl:template name="render-authorgroup">
        <xsl:param name="title"/>
        <xsl:param name="node"/>
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
    <!-- overrides in html.xsl to get @id on elements instead of in child anchor -->

    <xsl:template name="anchor">

        <!-- This is the template that we typically override and dont execute in order
            to get IDs directly on elements instead of child anchors. There's a couple 
            of exceptions due to exceedingly messy underlying xslt, and we also use this
            template to conditionally add the "Link Here" feature. 
        
            The templates used for id-on-element follow immediately after this one.
        -->

        <xsl:param name="node" select="."/>
        <xsl:param name="conditional" select="1"/>
        <xsl:variable name="id">
            <xsl:call-template name="object.id">
                <xsl:with-param name="object" select="$node"/>
            </xsl:call-template>
        </xsl:variable>

        <!-- for cals tables, there's no way to reasonably override table.xsl#d:entry|d:entrytbl -->
        <xsl:if
            test="(local-name($node) = 'production' or local-name($node) = 'constraintdef' or
                    local-name($node) = 'entry' or local-name($node) = 'tgroup') and $node/@xml:id">
            <xsl:attribute name="id">
                <xsl:value-of select="$id"/>
            </xsl:attribute>
        </xsl:if>

        <!-- link here anchor -->

        <xsl:variable name="is-conformance-list-para"
            select="ancestor::db:*[@role='conformance-list'] and local-name(.) = 'para' and string-length($id) > 0"/>

        <xsl:variable name="parentName" select="local-name(..)"/>

        <xsl:variable name="is-section"
            select="$node[d:title] and ($parentName='section' or $parentName='book' or $parentName='chapter' or $parentName='appendix') and string-length($id) > 0"/>

        <xsl:if test="$conditional = 0 or $node/@id or $node/@xml:id">
            <xsl:if test="$is-section or $is-conformance-list-para">
                <xsl:call-template name="render-link-here-anchor">
                    <xsl:with-param name="id" select="$id"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>

        <!-- match the headers in the property cals tables -->
        <xsl:if test="local-name($node) = 'literal' and parent::db:entry[@role='rdfa-property']">
            <xsl:call-template name="render-link-here-anchor">
                <xsl:with-param name="id" select="../@xml:id"/>
            </xsl:call-template>
        </xsl:if>

    </xsl:template>

    <xsl:template name="render-link-here-anchor">
        <xsl:param name="id"/>
        <xsl:element name="span">
            <xsl:attribute name="class">link-marker</xsl:attribute>
            <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class">hidden-reveal</xsl:attribute>
                <xsl:attribute name="title">Link here</xsl:attribute>
                <xsl:attribute name="href">#<xsl:value-of select="$id"/></xsl:attribute>
                <xsl:text disable-output-escaping="no">&#8250;</xsl:text>
            </xsl:element>
            <xsl:text disable-output-escaping="no">&#160;</xsl:text>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*" mode="common.html.attributes">
        <xsl:param name="class" select="local-name(.)"/>
        <xsl:param name="inherit" select="0"/>

        <xsl:apply-imports>
            <xsl:with-param name="class" select="$class"/>
            <xsl:with-param name="inherit" select="$inherit"/>
        </xsl:apply-imports>

        <xsl:variable name="id">
            <xsl:call-template name="object.id">
                <xsl:with-param name="object" select="."/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:if test="./@id or ./@xml:id">
            <xsl:attribute name="id">
                <xsl:value-of select="$id"/>
            </xsl:attribute>
        </xsl:if>

    </xsl:template>

    <xsl:template match="*" mode="locale.html.attributes">
        <xsl:apply-imports/>
        <xsl:apply-templates select="." mode="common.html.attributes"/>
    </xsl:template>

    <!-- override to add @id to element instead of child anchor -->
    <xsl:template match="d:glossentry">
        <xsl:element name="dt" namespace="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="." mode="common.html.attributes"/>
            <xsl:choose>
                <xsl:when test="$glossentry.show.acronym = 'primary'">
                    <xsl:call-template name="anchor">
                        <xsl:with-param name="conditional">
                            <xsl:choose>
                                <xsl:when test="$glossterm.auto.link != 0">0</xsl:when>
                                <xsl:otherwise>1</xsl:otherwise>
                            </xsl:choose>
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:choose>
                        <xsl:when test="d:acronym|d:abbrev">
                            <xsl:apply-templates select="d:acronym|d:abbrev"/>
                            <xsl:text> (</xsl:text>
                            <xsl:apply-templates select="d:glossterm"/>
                            <xsl:text>)</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="d:glossterm"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$glossentry.show.acronym = 'yes'">
                    <xsl:call-template name="anchor">
                        <xsl:with-param name="conditional">
                            <xsl:choose>
                                <xsl:when test="$glossterm.auto.link != 0">0</xsl:when>
                                <xsl:otherwise>1</xsl:otherwise>
                            </xsl:choose>
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:apply-templates select="d:glossterm"/>
                    <xsl:if test="d:acronym|d:abbrev">
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates select="d:acronym|d:abbrev"/>
                        <xsl:text>)</xsl:text>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="anchor">
                        <xsl:with-param name="conditional">
                            <xsl:choose>
                                <xsl:when test="$glossterm.auto.link != 0">0</xsl:when>
                                <xsl:otherwise>1</xsl:otherwise>
                            </xsl:choose>
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:apply-templates select="d:glossterm"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
        <xsl:apply-templates select="d:indexterm|d:revhistory|d:glosssee|d:glossdef"/>
    </xsl:template>

    <!-- ==================================================================== -->
    <!-- override to add @id to element instead of child anchor -->
    <xsl:template match="d:varlistentry">
        <xsl:element name="dt" namespace="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="." mode="common.html.attributes"/>
            <xsl:call-template name="anchor"/>
            <xsl:apply-templates select="d:term"/>
        </xsl:element>
        <xsl:element name="dd" namespace="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="d:listitem"/>
        </xsl:element>
    </xsl:template>

    <!-- ==================================================================== -->
    <!-- override to add @id to element instead of child anchor -->

    <xsl:template name="informal.object">
        <xsl:param name="class" select="local-name(.)"/>
        <xsl:variable name="content">
            <xsl:element name="div">
                <xsl:apply-templates select="." mode="common.html.attributes"/>
                <xsl:if test="$spacing.paras != 0">
                    <p/>
                </xsl:if>
                <xsl:call-template name="anchor"/>
                <xsl:apply-templates/>
                <xsl:if test="local-name(.) = 'informaltable'">
                    <xsl:call-template name="table.longdesc"/>
                </xsl:if>
                <xsl:if test="$spacing.paras != 0">
                    <p/>
                </xsl:if>
            </xsl:element>
        </xsl:variable>
        <xsl:variable name="floatstyle">
            <xsl:call-template name="floatstyle"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$floatstyle != ''">
                <xsl:call-template name="floater">
                    <xsl:with-param name="class"><xsl:value-of select="$class"
                        />-float</xsl:with-param>
                    <xsl:with-param name="floatstyle" select="$floatstyle"/>
                    <xsl:with-param name="content" select="$content"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$content"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- ============================================================================= -->
    <!-- end of id and template related templates (see also htmlTableAtt below though -->
    <!-- ============================================================================= -->


    <!-- ============================================================================= -->
    <!-- override in html.xsl to set preference order for creating a class value -->

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
        <xsl:element name="link">
            <xsl:attribute name="rel">stylesheet</xsl:attribute>
            <xsl:attribute name="href"><xsl:value-of select="$user.print.css"/></xsl:attribute>
            <xsl:attribute name="type">text/css</xsl:attribute>
            <xsl:attribute name="media">print</xsl:attribute>
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
            <xsl:apply-templates select="." mode="common.html.attributes"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- ==================================================================== -->
    <!-- remove code wrapping xrefs and links to fix whitespace problems -->

    <xsl:template match="d:code[@role='linkwrap']">
        <xsl:apply-templates/>
    </xsl:template>


    <!-- ==================================================================== -->
    <!-- override tgroup so id isn't stripped from vocabs -->

    <lxslt:component prefix="xtbl" functions="adjustColumnWidths"/>

    <xsl:template match="d:tgroup" name="tgroup">
        <xsl:if test="not(@cols) or @cols = '' or string(number(@cols)) = 'NaN'">
            <xsl:message terminate="yes">
                <xsl:text>Error: CALS tables must specify the number of columns.</xsl:text>
            </xsl:message>
        </xsl:if>

        <xsl:variable name="summary">
            <xsl:call-template name="pi.dbhtml_table-summary"/>
        </xsl:variable>

        <xsl:variable name="cellspacing">
            <xsl:call-template name="pi.dbhtml_cellspacing"/>
        </xsl:variable>

        <xsl:variable name="cellpadding">
            <xsl:call-template name="pi.dbhtml_cellpadding"/>
        </xsl:variable>

        <table>
            <xsl:choose>
                <!-- If there's a textobject/phrase for the table summary, use it -->
                <xsl:when test="../d:textobject/d:phrase">
                    <xsl:attribute name="summary">
                        <xsl:value-of select="../d:textobject/d:phrase"/>
                    </xsl:attribute>
                </xsl:when>

                <!-- If there's a <?dbhtml table-summary="foo"?> PI, use it for
                    the HTML table summary attribute -->
                <xsl:when test="$summary != ''">
                    <xsl:attribute name="summary">
                        <xsl:value-of select="$summary"/>
                    </xsl:attribute>
                </xsl:when>

                <!-- Otherwise, if there's a title, use that -->
                <xsl:when test="../d:title">
                    <xsl:attribute name="summary">
                        <!-- This screws up on inline markup and footnotes, oh well... -->
                        <xsl:value-of select="string(../d:title)"/>
                    </xsl:attribute>
                </xsl:when>

                <!-- Otherwise, forget the whole idea -->
                <xsl:otherwise><!-- nevermind --></xsl:otherwise>
            </xsl:choose>

            <xsl:if test="$cellspacing != '' or $html.cellspacing != ''">
                <xsl:attribute name="cellspacing">
                    <xsl:choose>
                        <xsl:when test="$cellspacing != ''">
                            <xsl:value-of select="$cellspacing"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$html.cellspacing"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="$cellpadding != '' or $html.cellpadding != ''">
                <xsl:attribute name="cellpadding">
                    <xsl:choose>
                        <xsl:when test="$cellpadding != ''">
                            <xsl:value-of select="$cellpadding"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$html.cellpadding"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="../@pgwide=1 or local-name(.) = 'entrytbl'">
                <xsl:attribute name="width">100%</xsl:attribute>
            </xsl:if>

            <xsl:choose>
                <xsl:when test="$table.borders.with.css != 0">
                    <xsl:choose>
                        <xsl:when
                            test="../@frame='all' or (not(../@frame) and $default.table.frame='all')">
                            <xsl:attribute name="style">
                                <xsl:text>border-collapse: collapse;</xsl:text>
                                <xsl:call-template name="border">
                                    <xsl:with-param name="side" select="'top'"/>
                                    <xsl:with-param name="style" select="$table.frame.border.style"/>
                                    <xsl:with-param name="color" select="$table.frame.border.color"/>
                                    <xsl:with-param name="thickness"
                                        select="$table.frame.border.thickness"/>
                                </xsl:call-template>
                                <xsl:call-template name="border">
                                    <xsl:with-param name="side" select="'bottom'"/>
                                    <xsl:with-param name="style" select="$table.frame.border.style"/>
                                    <xsl:with-param name="color" select="$table.frame.border.color"/>
                                    <xsl:with-param name="thickness"
                                        select="$table.frame.border.thickness"/>
                                </xsl:call-template>
                                <xsl:call-template name="border">
                                    <xsl:with-param name="side" select="'left'"/>
                                    <xsl:with-param name="style" select="$table.frame.border.style"/>
                                    <xsl:with-param name="color" select="$table.frame.border.color"/>
                                    <xsl:with-param name="thickness"
                                        select="$table.frame.border.thickness"/>
                                </xsl:call-template>
                                <xsl:call-template name="border">
                                    <xsl:with-param name="side" select="'right'"/>
                                    <xsl:with-param name="style" select="$table.frame.border.style"/>
                                    <xsl:with-param name="color" select="$table.frame.border.color"/>
                                    <xsl:with-param name="thickness"
                                        select="$table.frame.border.thickness"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when
                            test="../@frame='topbot' or (not(../@frame) and $default.table.frame='topbot')">
                            <xsl:attribute name="style">
                                <xsl:text>border-collapse: collapse;</xsl:text>
                                <xsl:call-template name="border">
                                    <xsl:with-param name="side" select="'top'"/>
                                    <xsl:with-param name="style" select="$table.frame.border.style"/>
                                    <xsl:with-param name="color" select="$table.frame.border.color"/>
                                    <xsl:with-param name="thickness"
                                        select="$table.frame.border.thickness"/>
                                </xsl:call-template>
                                <xsl:call-template name="border">
                                    <xsl:with-param name="side" select="'bottom'"/>
                                    <xsl:with-param name="style" select="$table.frame.border.style"/>
                                    <xsl:with-param name="color" select="$table.frame.border.color"/>
                                    <xsl:with-param name="thickness"
                                        select="$table.frame.border.thickness"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when
                            test="../@frame='top' or (not(../@frame) and $default.table.frame='top')">
                            <xsl:attribute name="style">
                                <xsl:text>border-collapse: collapse;</xsl:text>
                                <xsl:call-template name="border">
                                    <xsl:with-param name="side" select="'top'"/>
                                    <xsl:with-param name="style" select="$table.frame.border.style"/>
                                    <xsl:with-param name="color" select="$table.frame.border.color"/>
                                    <xsl:with-param name="thickness"
                                        select="$table.frame.border.thickness"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when
                            test="../@frame='bottom' or (not(../@frame) and $default.table.frame='bottom')">
                            <xsl:attribute name="style">
                                <xsl:text>border-collapse: collapse;</xsl:text>
                                <xsl:call-template name="border">
                                    <xsl:with-param name="side" select="'bottom'"/>
                                    <xsl:with-param name="style" select="$table.frame.border.style"/>
                                    <xsl:with-param name="color" select="$table.frame.border.color"/>
                                    <xsl:with-param name="thickness"
                                        select="$table.frame.border.thickness"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when
                            test="../@frame='sides' or (not(../@frame) and $default.table.frame='sides')">
                            <xsl:attribute name="style">
                                <xsl:text>border-collapse: collapse;</xsl:text>
                                <xsl:call-template name="border">
                                    <xsl:with-param name="side" select="'left'"/>
                                    <xsl:with-param name="style" select="$table.frame.border.style"/>
                                    <xsl:with-param name="color" select="$table.frame.border.color"/>
                                    <xsl:with-param name="thickness"
                                        select="$table.frame.border.thickness"/>
                                </xsl:call-template>
                                <xsl:call-template name="border">
                                    <xsl:with-param name="side" select="'right'"/>
                                    <xsl:with-param name="style" select="$table.frame.border.style"/>
                                    <xsl:with-param name="color" select="$table.frame.border.color"/>
                                    <xsl:with-param name="thickness"
                                        select="$table.frame.border.thickness"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="../@frame='none'">
                            <xsl:attribute name="style">
                                <xsl:text>border: none;</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="style">
                                <xsl:text>border-collapse: collapse;</xsl:text>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:when>
                <xsl:when
                    test="../@frame='none' or (not(../@frame) and $default.table.frame='none') or local-name(.) = 'entrytbl'">
                    <xsl:attribute name="border">0</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="border">1</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>

            <xsl:if test="@xml:id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>

            <xsl:variable name="colgroup">
                <colgroup>
                    <xsl:call-template name="generate.colgroup">
                        <xsl:with-param name="cols" select="@cols"/>
                    </xsl:call-template>
                </colgroup>
            </xsl:variable>

            <xsl:variable name="explicit.table.width">
                <xsl:call-template name="pi.dbhtml_table-width">
                    <xsl:with-param name="node" select=".."/>
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="table.width">
                <xsl:choose>
                    <xsl:when test="$explicit.table.width != ''">
                        <xsl:value-of select="$explicit.table.width"/>
                    </xsl:when>
                    <xsl:when test="$default.table.width = ''">
                        <xsl:text>100%</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$default.table.width"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:if
                test="$default.table.width != ''                   or $explicit.table.width != ''">
                <xsl:attribute name="width">
                    <xsl:choose>
                        <xsl:when test="contains($table.width, '%')">
                            <xsl:value-of select="$table.width"/>
                        </xsl:when>
                        <xsl:when
                            test="$use.extensions != 0                           and $tablecolumns.extension != 0">
                            <xsl:choose>
                                <xsl:when test="function-available('stbl:convertLength')">
                                    <xsl:value-of select="stbl:convertLength($table.width)"/>
                                </xsl:when>
                                <xsl:when test="function-available('xtbl:convertLength')">
                                    <xsl:value-of select="xtbl:convertLength($table.width)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:message terminate="yes">
                                        <xsl:text>No convertLength function available.</xsl:text>
                                    </xsl:message>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$table.width"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>

            <xsl:choose>
                <xsl:when
                    test="$use.extensions != 0                       and $tablecolumns.extension != 0">
                    <xsl:choose>
                        <xsl:when test="function-available('stbl:adjustColumnWidths')">
                            <xsl:copy-of select="stbl:adjustColumnWidths($colgroup)"/>
                        </xsl:when>
                        <xsl:when test="function-available('xtbl:adjustColumnWidths')">
                            <xsl:copy-of select="xtbl:adjustColumnWidths($colgroup)"/>
                        </xsl:when>
                        <xsl:when test="function-available('ptbl:adjustColumnWidths')">
                            <xsl:copy-of select="ptbl:adjustColumnWidths($colgroup)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:message terminate="yes">
                                <xsl:text>No adjustColumnWidths function available.</xsl:text>
                            </xsl:message>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="$colgroup"/>
                </xsl:otherwise>
            </xsl:choose>

            <xsl:apply-templates select="d:thead"/>
            <xsl:apply-templates select="d:tfoot"/>
            <xsl:apply-templates select="d:tbody"/>

            <xsl:if test=".//d:footnote|../d:title//d:footnote">
                <tbody class="footnotes">
                    <tr>
                        <td colspan="{@cols}">
                            <xsl:apply-templates select=".//d:footnote|../d:title//d:footnote"
                                mode="table.footnote.mode"/>
                        </td>
                    </tr>
                </tbody>
            </xsl:if>
        </table>
    </xsl:template>

    <!-- ==================================================================== -->
    <!-- acknowledgements -->
    <xsl:template match="d:para[@role='personlist']">
        <div>
            <xsl:apply-templates select="." mode="common.html.attributes"/>
            <xsl:for-each select="./d:person">
                <span>
                    <xsl:apply-templates select="." mode="common.html.attributes"/>
                    <span class="name">
                        <xsl:call-template name="person.name"/>                                                                       
                        <xsl:if test="not(current()/d:affiliation) and not(position() = last())"><xsl:text>, </xsl:text></xsl:if>
                    </span><xsl:text> </xsl:text>   
                    <xsl:if test="current()/d:affiliation">
                        <xsl:apply-templates select="d:affiliation"/>
                        <xsl:if test="not(position() = last())"><xsl:text>, </xsl:text></xsl:if>
                    </xsl:if>                        
                </span>                
            </xsl:for-each>
        </div>
    </xsl:template>
    
    <xsl:template match="d:affiliation">
        <span>
            <xsl:apply-templates select="." mode="common.html.attributes"/>
            <xsl:text>(</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>)</xsl:text>
        </span>
    </xsl:template>
        
    <xsl:template match="d:itemizedlist[@role='leads']">
        <ul>
            <xsl:apply-templates select="." mode="common.html.attributes"/>
            <xsl:for-each select="./d:listitem">
                <li>
                    <xsl:apply-templates select="." mode="common.html.attributes"/>
                    <xsl:apply-templates select=".//d:personname"/>       
                    <span class="orgname">
                        (<xsl:value-of select=".//d:orgname"/>)
                    </span>
                    <xsl:apply-templates select=".//d:jobtitle"/>
                </li>
            </xsl:for-each>
        </ul>    
    </xsl:template>
    
    <!-- override, to avoid nested table layout -->
    <xsl:template match="d:productionset">
        <p>
            <xsl:text>EBNF productions (</xsl:text>
            <a href="http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=26153">
            <xsl:text>ISO/IEC 14977</xsl:text>
            </a>
            <xsl:text>)</xsl:text>
            <xsl:if test="d:title">
                <xsl:text> for </xsl:text>
                <xsl:value-of select="d:title"/>
            </xsl:if>
            :
        </p>
        <table border="0" width="99%" cellpadding="0">
            <xsl:if test="$ebnf.table.bgcolor != ''">
                <xsl:attribute name="bgcolor">
                    <xsl:value-of select="$ebnf.table.bgcolor"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="class">
                <xsl:value-of select="local-name(.)"/>
            </xsl:attribute>
            <xsl:attribute name="summary">
                <xsl:text>EBNF productions</xsl:text>
                <xsl:if test="d:title">
                    <xsl:text> for </xsl:text>
                    <xsl:value-of select="d:title"/>
                </xsl:if>
            </xsl:attribute>
            <xsl:apply-templates select="d:production|d:productionrecap"/>
        </table>
    </xsl:template>
    
    <xsl:template match="d:production">
        <xsl:param name="recap" select="false()"/>
        <tr>
            <!-- td align="{$direction.align.start}" valign="top" width="3%">
                <xsl:text>[</xsl:text>
                <xsl:number count="d:production" level="any"/>
                <xsl:text>]</xsl:text>
            </td -->
            <td align="{$direction.align.end}" valign="top" width="10%">
                <xsl:choose>
                    <xsl:when test="$recap">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:call-template name="href.target">
                                    <xsl:with-param name="object" select="."/>
                                </xsl:call-template>
                            </xsl:attribute>
                            <xsl:apply-templates select="d:lhs"/>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="anchor"/>
                        <xsl:apply-templates select="d:lhs"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td valign="top" width="5%" align="center">
                <xsl:copy-of select="$ebnf.assignment"/>
            </td>
            <td valign="top" width="85%">
                <xsl:apply-templates select="d:rhs"/>
                <xsl:copy-of select="$ebnf.statement.terminator"/>
            </td>
            <!-- td align="{$direction.align.start}" valign="top" width="30%">
                <xsl:choose>
                    <xsl:when test="d:rhs/d:lineannotation|d:constraint">
                        <xsl:apply-templates select="d:rhs/d:lineannotation" mode="rhslo"/>
                        <xsl:apply-templates select="d:constraint"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>&#160;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </td -->
        </tr>
    </xsl:template>
    
    <xsl:template match="d:lhs">
        <a>
            <xsl:attribute name="href">
                <xsl:text>#</xsl:text>
                <xsl:value-of select="../@xml:id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
</xsl:stylesheet>
