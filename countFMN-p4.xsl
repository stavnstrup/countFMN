<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:saxon="http://saxon.sf.net/"
                extension-element-prefixes="saxon"
                exclude-result-prefixes="xsl xsi"
                version='1.1'>

<xsl:output indent="yes" saxon:next-in-chain="countFMN-p5.xsl"/>


<xsl:template match="profilegroup">
  <profilegroup>
    <xsl:apply-templates select="@*"/>
    <allstandards>
      <xsl:apply-templates select="//standard">
        <xsl:sort select="@nisp-identifier"/>
      </xsl:apply-templates>
    </allstandards>
    <allprofiles>
      <xsl:apply-templates select="profile">
        <xsl:sort select="@nisp-identifier"/>
      </xsl:apply-templates>
    </allprofiles>
  </profilegroup>
</xsl:template>

<xsl:template match="profile">
  <profile>
    <xsl:apply-templates select="@*"/>
  </profile>
</xsl:template>

<xsl:template match="profilestandard"/>

<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


</xsl:stylesheet>
