<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://saxon.sf.net/"
                extension-element-prefixes="saxon"
                exclude-result-prefixes="xsl"
                version='2.0'>

<xsl:output indent="yes" saxon:next-in-chain="xPG-p3.xsl"/>
<!--

<xsl:output indent="yes" />
-->

<!-- ========================================================
      Transform the ArchiMate file to a tree structure
     ========================================================
-->

<xsl:template match="model">
  <xsl:variable name="pgTitle" select="@pgTitle"/>
  <xsl:apply-templates select="//element[(@stereotype='ProfileGroup') and
                               (@title=$pgTitle)]"
                               mode="profilegroup"/>
</xsl:template>


<xsl:template match="element" mode="profilegroup">
  <profilegroup title="{@title}">
    <xsl:variable name="pgid" select="@identifier"/>
    <xsl:apply-templates select="//relationship[(@stereotype='belongs to group') and (@target=$pgid)]" mode="relPGtoProfile"/>
  </profilegroup>
</xsl:template>


<xsl:template match="relationship" mode="relPGtoProfile">
  <xsl:variable name="pid" select="@source"/>
  <xsl:apply-templates select="//element[@identifier=$pid]"/>
</xsl:template>


<xsl:template match="element[@stereotype='Profile']">
  <xsl:variable name="myid" select="@identifier"/>
  <profile id="{@nisp-identifier}" title="{@title}" type="{@profiletype}">
    <xsl:apply-templates select="//relationship[(@stereotype='is composed of') and (@source=$myid)]" mode="getchildren"/>
  </profile>
</xsl:template>


<xsl:template match="relationship" mode="getchildren">
  <xsl:variable name="mytarget" select="@target"/>
  <xsl:apply-templates select="//element[@identifier=$mytarget]"/>
</xsl:template>


<xsl:template match="element[@stereotype='ProfileStandards']">
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
