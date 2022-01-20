<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:oxy="http://www.oxygenxml.com/ns/author/xpath-extension-functions"
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs oxy"
    version="2.0">

    <xsl:param name="keep" as="xs:string" required="yes"/>

    <xsl:template match="/">
        <!--xsl:message>'/' matched, '<xsl:value-of select="local-name()"/>', local-name(*[1])='<xsl:value-of select="local-name(*[1])"/>'</xsl:message-->
        <xsl:apply-templates select="choice"/>
    </xsl:template>

    <xsl:template match="choice[child::corr]|choice[child::sic]">
        <xsl:choose>
            <xsl:when test="exists(sic) and $keep eq 'sic'">
                <xsl:copy-of select="sic"/>
            </xsl:when>
            <xsl:when test="exists(corr) and $keep eq 'corr'">
                <xsl:copy-of select="corr"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">ERROR: '<xsl:value-of select="$keep"/>' does not exist. Aborting operation</xsl:message>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="choice[child::unclear]">
        <xsl:choose>
            <xsl:when test="exists(child::*[number($keep)])">
                <xsl:copy-of select="child::*[number($keep)]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">ERROR: element no <xsl:value-of select="$keep"/> does not exist. Aborting operation</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="choice[child::sic/app]">
        <xsl:choose>
            <xsl:when test="exists(sic/app/*[number($keep)])">
                <app>
                    <lem><xsl:copy-of select="sic/app/*[number($keep)]/(*|text())"/></lem>
                    <xsl:copy-of select="sic/app/*[position() ne number($keep)]"/>
                </app>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">ERROR: reading no <xsl:value-of select="$keep"/> does not exist. Aborting operation</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="*">
        <xsl:message terminate="yes">ERROR: Context: '<xsl:value-of select="local-name()"/>': No template found. Aborting operation</xsl:message>
        <xsl:copy-of select="."/>
    </xsl:template>

</xsl:stylesheet>