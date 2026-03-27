<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:saxon="http://saxon.sf.net/"
                extension-element-prefixes="saxon"
                exclude-result-prefixes="xsl xsi"
                version='1.1'>

<xsl:output indent="yes" saxon:next-in-chain="countFMN-p4.xsl"/>



<xsl:template match="model">
  <archimate>
    <xsl:apply-templates select="//element[(@stereotype='ProfileGroup') and
                                 (@title='FMN Spiral 4 Specification')]"
                                 mode="profilegroup"/>
  </archimate>
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
  <profile id="{@nisp-identifier}" title="{@title}">
    <xsl:apply-templates select="//relationship[(@stereotype='is composed of') and (@source=$myid)]" mode="getchildren"/>
  </profile>
</xsl:template>

<xsl:template match="relationship" mode="getchildren">
  <xsl:variable name="mytarget" select="@target"/>
  <xsl:apply-templates select="//element[@identifier=$mytarget]"/>
</xsl:template>

<xsl:template match="element[@stereotype='ProfileStandards']">
  <xsl:variable name="myid" select="@identifier"/>
  <profilestandard>
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
