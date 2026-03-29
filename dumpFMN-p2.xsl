<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://saxon.sf.net/"
                extension-element-prefixes="saxon"
                exclude-result-prefixes="xsl"
                version='2.0'>

<xsl:output indent="yes" saxon:next-in-chain="dumpFMN-p3.xsl"/>

<!--
<xsl:output indent="yes" />
-->

<!-- ========================================================
      Transform the ArchiMate file to a tree structure
     ========================================================
-->

<xsl:template match="model">
  <fmnprofile>
    <xsl:apply-templates select="//element[@stereotype='Service Profile']"/>
  </fmnprofile>
</xsl:template>


<xsl:template match="element[@stereotype='Service Profile']">
  <xsl:variable name="myid" select="@identifier"/>
  <profile id="{@fmn-identifier}" title="{@name}">
    <xsl:apply-templates select="//relationship[(@stereotype='is composed of') and (@source=$myid)]" mode="getchildren"/>
  </profile>
</xsl:template>


<xsl:template match="relationship" mode="getchildren">
  <xsl:variable name="mytarget" select="@target"/>
  <xsl:apply-templates select="//element[@identifier=$mytarget]"/>
</xsl:template>


<xsl:template match="element[@stereotype='Standard Group']">
  <xsl:variable name="myid" select="@identifier"/>
  <xsl:variable name="obligation" select="@obligation"/>
  <profilestandard obligation="{$obligation}">
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
    <xsl:apply-templates select="//relationship[(@stereotype='is composed of') and (@source=$myid)]" mode="getchildren"/>
  </profilestandard>
</xsl:template>


<xsl:template match="element[@stereotype='Standard']">
  <standard>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </standard>
</xsl:template>


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


</xsl:stylesheet>
