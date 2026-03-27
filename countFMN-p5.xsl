<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:saxon="http://saxon.sf.net/"
                extension-element-prefixes="saxon"
                exclude-result-prefixes="xsl xsi"
                version='1.1'>

<xsl:output indent="yes" saxon:next-in-chain="countFMN-p6.xsl"/>
<!--
<xsl:output indent="yes" />
-->

<!-- Delete duplicate standards and profiles-->

<xsl:template match="standard">
  <xsl:variable name="myid" select="@nisp-identifier"/>
  <xsl:choose>
    <xsl:when test="preceding-sibling::standard[@nisp-identifier=$myid]"/>
    <xsl:otherwise>
      <xsl:copy-of select="."/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template match="profile">
  <xsl:variable name="myid" select="@nisp-identifier"/>
  <xsl:choose>
    <xsl:when test="preceding-sibling::profile[@nisp-identifier=$myid]"/>
    <xsl:otherwise>
      <xsl:copy-of select="."/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


</xsl:stylesheet>
