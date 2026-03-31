<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://saxon.sf.net/"
                extension-element-prefixes="saxon"
                exclude-result-prefixes="xsl"
                version='2.0'>

<xsl:output method="text" />

<xsl:template match="profilegroup">
<xsl:text>Profile ID,Profile Title,Group,Obligation, STD ID,STD Title,STD Compound Pubnum&#x0A;</xsl:text>
<xsl:apply-templates select="//standard"/>
</xsl:template>

<xsl:template match="standard">
<xsl:value-of select="../../@id"/><xsl:text>,</xsl:text>
<xsl:text>"</xsl:text><xsl:value-of select="../../@title"/><xsl:text>",</xsl:text>
<xsl:apply-templates select=".."/><xsl:text>,</xsl:text>
<xsl:value-of select="../@obligation"/><xsl:text>,</xsl:text>
<xsl:value-of select="@nisp-identifier"/><xsl:text>,</xsl:text>
<xsl:text>"</xsl:text><xsl:value-of select="@title"/><xsl:text>",</xsl:text>
<xsl:value-of select="@compoundpubnum"/><xsl:text></xsl:text>
<xsl:text>&#x0A;</xsl:text>
</xsl:template>

<xsl:template match="profilestandard">
<xsl:number from="profilestandard"/>
</xsl:template>


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


</xsl:stylesheet>
