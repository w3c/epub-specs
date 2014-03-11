<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
    
    <xsl:output indent="yes" encoding="UTF-8" method="xml" />
    
    <xsl:param name="list" required="yes" as="xs:string"/>
    <xsl:param name="www-base" required="yes" as="xs:string"/>            
    <xsl:variable name="entries" select="tokenize(translate($list,'\','/'), ';')"/>
                
    <xsl:template match="/">
        <catalog>                               
            <xsl:for-each select="$entries">
                
                <xsl:if test="not(current() eq 'catalog.xml')">
                    <!-- full uri -->                    
                    <system systemId="{concat($www-base, current())}" uri="{current()}"/>
                    <xsl:if test="contains(current(),'/')">
                        <!-- remove first subdir -->
                        <xsl:variable name="dir1" select="concat(substring-before(current(), '/'),'/')" />
                        <xsl:variable name="dir1-removed" select="replace(current(), $dir1, '')"/>
                        <system systemId="{$dir1-removed}" uri="{current()}"/>
                        <!-- remove first and second subdir -->
                        <xsl:if test="contains($dir1-removed,'/')">
                            <xsl:variable name="dir2" select="concat(substring-before($dir1-removed, '/'),'/')" />
                            <xsl:variable name="dir2-removed" select="replace($dir1-removed, $dir2, '')"/>
                            <system systemId="{$dir2-removed}" uri="{current()}"/>
                        </xsl:if>                        
                    </xsl:if>                                        
                    <xsl:text>
                        
</xsl:text>
                </xsl:if>    
            </xsl:for-each>            
        </catalog>        
    </xsl:template>
    
</xsl:stylesheet>