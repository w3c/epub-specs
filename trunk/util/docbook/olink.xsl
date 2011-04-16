<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:db="http://docbook.org/ns/docbook" xmlns:fn="http://idpf.org/fn"
    xmlns:epub="http://www.idpf.org/2011/epub" xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:output method="xml" encoding="UTF-8" exclude-result-prefixes="db"/>

    <!-- olink specialization for epub specs. Only used for cross-epub3-spec linking.
       * to activate behavior, must provide @type="epub-spec" 
       * targetdoc must be one of the enum given in rng customization
       * targetpointer must be an xml:id in targetdoc
       * if @epub:specref-exclude is specified on the olink, the trailing [SPEC-BIBLIOREF] link is excluded

        TODO link labels don't get the XHTML style prefixes a la "Section 1.2.3" - this would
        probably benefit from being in the db2html xsl customization layer instead
    -->

    <xsl:param name="db-spec-base-uri" required="yes"/>
    <!-- must end with slash -->
    
    
    <xsl:param name="spec-group" required="yes"/>
    
    <!-- translate for windows paths -->
    <xsl:param name="db-spec-base-uri-safe"
        select="concat('file:///',translate($db-spec-base-uri, '\\', '/'))"/>

    <!-- load all spec docs -->
    <xsl:variable name="doc-changes"
        select="doc(concat($db-spec-base-uri-safe, 'epub30-changes.xml'))" as="document-node()"/>
    <xsl:variable name="doc-contentdocs"
        select="doc(concat($db-spec-base-uri-safe, 'epub30-contentdocs.xml'))" as="document-node()"/>
    <xsl:variable name="doc-mediaoverlays"
        select="doc(concat($db-spec-base-uri-safe, 'epub30-mediaoverlays.xml'))"
        as="document-node()"/>
    <xsl:variable name="doc-ocf" select="doc(concat($db-spec-base-uri-safe, 'epub30-ocf.xml'))"
        as="document-node()"/>
    <xsl:variable name="doc-overview"
        select="doc(concat($db-spec-base-uri-safe, 'epub30-overview.xml'))" as="document-node()"/>
    <xsl:variable name="doc-publications"
        select="doc(concat($db-spec-base-uri-safe, 'epub30-publications.xml'))" as="document-node()"/>
    <xsl:variable name="doc-linking"
        select="doc(concat($db-spec-base-uri-safe, 'epub-linking.xml'))" as="document-node()"/>
    <xsl:variable name="doc-cfi"
        select="doc(concat($db-spec-base-uri-safe, 'cfi/epub-cfi.xml'))" as="document-node()"/>
    
    <xsl:template match="//db:olink[@type='epub-spec']">
        <!--
            Given the olink
            <db:olink type="epub-spec" targetdoc="doc" targetptr="frag" />

            generate the following docbook
            <db:link xlink:href="doc#frag">destination label</db:link> in <db:xref linkend="refDoc"/>.

            with the intent of generating the following XHTML
            <a href="full-uri">destination label</a> in <a href="#refXXX">[BIBLIOLABEL]</a>                       
        -->

        <xsl:variable name="olink" select="."/>
        <xsl:variable name="targetdoc" select="./@targetdoc"/>
        <xsl:variable name="targetptr" select="./@targetptr"/>

        <xsl:variable name="dest-doc-uri" select="fn:getDestDocHTMLURI($targetdoc)"/>
        <xsl:variable name="link-label" select="fn:getLinkLabel($olink, $targetdoc, $targetptr)"/>
        <xsl:variable name="biblioref" select="fn:getBiblioRef($targetdoc)"/>

        <xsl:element name="phrase" namespace="http://docbook.org/ns/docbook">
            <!-- copy the epub:spec-include attribute if existing, in case this olink
                is part of a switch -->
            <xsl:copy-of select="@*[namespace-uri() eq 'http://www.idpf.org/2011/epub']"/>

            <xsl:element name="link" namespace="http://docbook.org/ns/docbook">
                <xsl:attribute name="href" namespace="http://www.w3.org/1999/xlink">
                    <xsl:value-of select="$dest-doc-uri"/>#<xsl:value-of select="$targetptr"/>
                </xsl:attribute>
                <xsl:value-of select="$link-label"/>
            </xsl:element>
                        
            <xsl:if test="not(@epub:specref-exclude)">
                <xsl:text> </xsl:text>
                <xsl:element name="xref" namespace="http://docbook.org/ns/docbook">
                    <xsl:attribute name="linkend">
                        <xsl:value-of select="$biblioref"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:if>

        </xsl:element>
    </xsl:template>
    
    <xsl:function name="fn:getLinkLabel" as="text()">
        <xsl:param name="olink" as="element()"/>
        <xsl:param name="targetdoc" as="attribute()"/>
        <xsl:param name="targetptr" as="attribute()"/>

        <xsl:variable name="curelem" select="fn:getDestDoc($targetdoc)//*[@xml:id=$targetptr]"/>
        <xsl:if test="not($curelem)">
            <xsl:message terminate="yes">Failed retrieving a target element for id '<xsl:value-of
                    select="$targetptr"/>' in <xsl:value-of select="$targetdoc"/> in
                olink.xsl#fn:getLinkLabel</xsl:message>
        </xsl:if>

        <xsl:choose>
            <xsl:when test="string-length($olink/text())>0">
                <xsl:value-of select="$olink/text()"/>
            </xsl:when>
            <xsl:when test="$curelem/@xreflabel">
                <xsl:value-of select="$curelem/@xreflabel"/>
            </xsl:when>
            <xsl:when test="$curelem/db:title">
                <xsl:value-of select="$curelem/db:title"/>
            </xsl:when>
            <xsl:when test="$curelem/db:term">
                <xsl:value-of select="$curelem/db:term"/>
            </xsl:when>
            <xsl:when test="$curelem/db:glossterm">
                <xsl:value-of select="$curelem/db:glossterm"/>
            </xsl:when>
            <xsl:when test="local-name($curelem) eq 'bridgehead' ">
                <xsl:value-of select="$curelem"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">Failed retrieving a label in olink.xsl#fn:getLinkLabel
                    for id '<xsl:value-of select="$targetptr"/>' in <xsl:value-of
                        select="$targetdoc"/> in olink.xsl#fn:getLinkLabel</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="fn:getDestDoc" as="document-node()">
        <xsl:param name="targetdoc" as="attribute()"/>
        <xsl:choose>
            <xsl:when test="matches($targetdoc, 'changes')">
                <xsl:sequence select="$doc-changes"/>
            </xsl:when>
            <xsl:when test="matches($targetdoc, 'contentdocs')">
                <xsl:sequence select="$doc-contentdocs"/>
            </xsl:when>
            <xsl:when test="matches($targetdoc, 'mediaoverlays')">
                <xsl:sequence select="$doc-mediaoverlays"/>
            </xsl:when>
            <xsl:when test="matches($targetdoc, 'ocf')">
                <xsl:sequence select="$doc-ocf"/>
            </xsl:when>
            <xsl:when test="matches($targetdoc, 'overview')">
                <xsl:sequence select="$doc-overview"/>
            </xsl:when>
            <xsl:when test="matches($targetdoc, 'publications')">
                <xsl:sequence select="$doc-publications"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">no match for $targetdoc in olink.xsl#fn:getDestDoc
                        (<xsl:value-of select="$targetdoc"/>)</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="fn:getDestDocHTMLURI" as="text()">
        <xsl:param name="targetdoc" as="attribute()"/>
        <xsl:value-of>
            <xsl:choose>
                <xsl:when test="$spec-group='epub30'">
                    <xsl:choose>
                        <xsl:when test="matches($targetdoc, 'linking')">../../linking/</xsl:when>
                        <xsl:when test="matches($targetdoc, 'cfi')">../../linking/cfi/</xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$spec-group='linking'">
                    <xsl:choose>
                        <xsl:when test="matches($targetdoc, 'cfi')">cfi/</xsl:when>
                        <xsl:otherwise>../30/spec/</xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$spec-group='cfi'">
                    <xsl:choose>
                        <xsl:when test="matches($targetdoc, 'linking')">../</xsl:when>
                        <xsl:otherwise>../../30/spec/</xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="matches($targetdoc, 'changes')">epub30-changes.html</xsl:when>
                <xsl:when test="matches($targetdoc, 'contentdocs')">epub30-contentdocs.html</xsl:when>
                <xsl:when test="matches($targetdoc, 'mediaoverlays')"
                    >epub30-mediaoverlays.html</xsl:when>
                <xsl:when test="matches($targetdoc, 'ocf')">epub30-ocf.html</xsl:when>
                <xsl:when test="matches($targetdoc, 'overview')">epub30-overview.html</xsl:when>
                <xsl:when test="matches($targetdoc, 'publications')">epub30-publications.html</xsl:when>
                <xsl:when test="matches($targetdoc, 'linking')">epub-linking.html</xsl:when>
                <xsl:when test="matches($targetdoc, 'cfi')">epub-cfi.html</xsl:when>
                <xsl:otherwise>
                    <xsl:message terminate="yes">no match for $targetdoc in
                        olink.xsl#fn:getDestDocHTMLURI (<xsl:value-of select="$targetdoc"
                        />)</xsl:message>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:value-of>
    </xsl:function>

    <xsl:function name="fn:getBiblioRef" as="text()">
        <xsl:param name="targetdoc" as="attribute()"/>
        <xsl:choose>
            <xsl:when test="matches($targetdoc, 'changes')">refChanges30</xsl:when>
            <xsl:when test="matches($targetdoc, 'contentdocs')">refContentDocs3</xsl:when>
            <xsl:when test="matches($targetdoc, 'mediaoverlays')">refOverlays3</xsl:when>
            <xsl:when test="matches($targetdoc, 'ocf')">refOCF30</xsl:when>
            <xsl:when test="matches($targetdoc, 'overview')">refEPUB3Overview</xsl:when>
            <xsl:when test="matches($targetdoc, 'publications')">refPublications3</xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">no match for $targetdoc in olink.xsl#fn:getBiblioRef
                        (<xsl:value-of select="$targetdoc"/>)</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!-- remove dummies -->
    <xsl:template match="db:appendix[@xml:id='DUMMY_REMOVE']"/>

    <xsl:template match="*|comment()">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
