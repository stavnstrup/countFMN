<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://saxon.sf.net/"
                extension-element-prefixes="saxon"
                exclude-result-prefixes="xsl"
                version='2.0'>

<xsl:output indent="yes" saxon:next-in-chain="xPG-p4.xsl"/>

<!--
<xsl:output indent="yes" />
-->

<xsl:template match="profilegroup">
  <profilegroup>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates select="//profile[@type!='Profile node']"/>
  </profilegroup>
</xsl:template>

<!-- Flatten profile tree -->

<xsl:template match="profile">
  <profile>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates select="profilestandard"/>
  </profile>
</xsl:template>


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


</xsl:stylesheet>
