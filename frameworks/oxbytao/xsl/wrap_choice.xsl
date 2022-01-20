<?xml version="1.0" encoding="UTF-8"?>
<!-- XSLT for the wrap_choice author mode action -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:oxy="http://www.oxygenxml.com/ns/author/xpath-extension-functions"
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs oxy"
    version="2.0">

    <xsl:template match="/">
        <xsl:apply-templates select="oxy:current-element()"/>
    </xsl:template>

    <xsl:template match="sic">
        <choice>
            <corr>${caret}</corr>
            <xsl:copy-of select="self::sic"/>
        </choice>
    </xsl:template>

    <xsl:template match="corr">
        <choice>
            <xsl:copy-of select="self::corr"/>
            <sic>${caret}</sic>
        </choice>
    </xsl:template>

    <xsl:template match="unclear">
        <choice>
            <xsl:copy-of select="self::unclear"/>
            <unclear>${caret}</unclear>
        </choice>
    </xsl:template>

    <xsl:template match="lem|rdg">
        <xsl:apply-templates select="parent::app"/>
    </xsl:template>

    <xsl:template match="app">
        <xsl:variable name="witnesses" as="xs:string*"
            select="for $w in /TEI/teiHeader//witness/@xml:id return concat('#', $w)"/>
        <xsl:variable name="readings" as="xs:string*"
            select="tokenize(string-join(rdg/@wit, ' '), '\s+')"/>
        <xsl:variable name="lemWit"
            select="if (lem/@wit)
                      then lem/@wit
                      else string-join($witnesses[every $w in $readings satisfies $w ne .], ' ')"/>
        <choice>
            <corr>${caret}</corr>
            <sic>
                <app>
                    <rdg wit="{$lemWit}"><xsl:copy-of select="lem/*|lem/text()"/></rdg>
                    <xsl:copy-of select="rdg"/>
                </app>
            </sic>
        </choice>
    </xsl:template>

</xsl:stylesheet>
