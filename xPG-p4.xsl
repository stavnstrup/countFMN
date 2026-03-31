<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://saxon.sf.net/"
                extension-element-prefixes="saxon"
                exclude-result-prefixes="xsl"
                version='2.0'>

<xsl:output indent="yes" saxon:next-in-chain="xPG-p5.xsl"/>
<!--

<xsl:output indent="yes" />
-->

<!-- Sort profiles, profilestandards and standards and remove profiles with no standards -->

<xsl:template match="profilegroup">
  <profilegroup>
    <!-- Sort profiles by title -->
    <xsl:apply-templates>
      <xsl:sort select="@title"/>
    </xsl:apply-templates>
  </profilegroup>
</xsl:template>


<xsl:template match="profile[not(child::profilestandard)]"/>


<xsl:template match="profile">
  <profile>
    <xsl:apply-templates select="@*"/>
    <!-- Sort profilestandards by title -->
    <xsl:apply-templates>
      <xsl:sort select="@title"/>
    </xsl:apply-templates>
  </profile>
</xsl:template>

<!-- We sort standards by pubnum because that is the attribute FMN profiles use.
     However, we export the compoundpubnum because that includes the year of publication -->
<xsl:template match="profilestandard">
  <profilestandard>
    <xsl:apply-templates select="@*"/>
    <!-- Sort standards by publication number-->
    <xsl:apply-templates>
      <xsl:sort select="@pubnum"/> 
    </xsl:apply-templates>
  </profilestandard>
</xsl:template>


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


</xsl:stylesheet>
