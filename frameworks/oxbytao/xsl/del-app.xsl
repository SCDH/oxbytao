<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:oxy="http://www.oxygenxml.com/ns/author/xpath-extension-functions"
    exclude-result-prefixes="xs oxy" version="3.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">

    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:param name="keep" as="xs:string" required="yes"/>

    <xsl:template match="/">
        <xsl:message>Keeping variant <xsl:value-of select="$keep"/></xsl:message>
        <xsl:message>root: <xsl:value-of select="local-name(oxy:current-element())"/></xsl:message>
        <xsl:apply-templates select="oxy:current-element()"/>
    </xsl:template>

    <xsl:template match="app">
        <xsl:message>in app</xsl:message>
        <xsl:apply-templates select="child::*[number($keep)]" mode="inapp"/>
    </xsl:template>

    <xsl:template match="lem | rdg" mode="inapp">
        <xsl:message>in lem or rdg</xsl:message>
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>
