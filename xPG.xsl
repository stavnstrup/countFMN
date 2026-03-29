<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:am="http://www.opengroup.org/xsd/archimate/3.0/"
                xmlns:saxon="http://saxon.sf.net/"
                extension-element-prefixes="saxon"
                exclude-result-prefixes="xsl xsi am"
                version='2.0'>

<xsl:output indent="yes" saxon:next-in-chain="xPG-p2.xsl"/>

<!--
<xsl:output indent="yes" />
-->

<!-- Define the title of Profile Group the different FMN profiles belongs to -->
<xsl:param name="pgTitle" select="'FMN Spiral 6 Specification'"/>

<xsl:template match="am:model">
  <model pgTitle="{$pgTitle}">
    <xsl:apply-templates/>
  </model>
</xsl:template>


<xsl:template match="am:element">
  <xsl:variable name="stereotype" select="am:properties/am:property[@propertyDefinitionRef='s5524-stereotype']/am:value"/>
  <element>
    <xsl:attribute name="nisp-identifier">
      <xsl:value-of select="am:properties/am:property[@propertyDefinitionRef='nisp-identifier']/am:value"/>
    </xsl:attribute>
    <xsl:attribute name="title">
      <xsl:value-of select="am:properties/am:property[@propertyDefinitionRef='nisp-title']/am:value"/>
    </xsl:attribute>
    <xsl:attribute name="stereotype">
      <xsl:value-of select="$stereotype"/>
    </xsl:attribute>
    <xsl:attribute name="identifier">
      <xsl:value-of select="@identifier"/>
    </xsl:attribute>
    <xsl:attribute name="pubnum">
      <xsl:value-of select="am:properties/am:property[@propertyDefinitionRef='nisp-pubnum']/am:value"/>
    </xsl:attribute>
    <xsl:attribute name="compoundpubnum">
      <xsl:value-of select="am:properties/am:property[@propertyDefinitionRef='nisp-compoundPubnum']/am:value"/>
    </xsl:attribute>
    <xsl:attribute name="uuid">
      <xsl:value-of select="am:properties/am:property[@propertyDefinitionRef='s5524-UUID']/am:value"/>
    </xsl:attribute>
    <xsl:attribute name="status">
      <xsl:value-of select="am:properties/am:property[@propertyDefinitionRef='nisp-maintenanceStatus']/am:value"/>
    </xsl:attribute>
    <xsl:attribute name="obligation">
      <xsl:value-of select="am:properties/am:property[@propertyDefinitionRef='nisp-obligationQualifier']/am:value"/>
    </xsl:attribute>
  </element>
</xsl:template>


<xsl:template match="am:relationship">
  <relationship type="{@type}" identifier="{@identifier}"
    source="{@source}" target="{@target}">
    <xsl:attribute name="stereotype">
      <xsl:value-of select="am:properties/am:property[@propertyDefinitionRef='s5524-stereotype']/am:value"/>
    </xsl:attribute>
  </relationship>
</xsl:template>


<xsl:template match="am:views|am:organizations"/>


<xsl:template match="*">
    <!-- remove element prefix -->
    <xsl:element name="{local-name()}">
      <!-- process attributes -->
      <xsl:for-each select="@*">
        <!-- remove attribute prefix -->
        <xsl:attribute name="{local-name()}">
          <xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
