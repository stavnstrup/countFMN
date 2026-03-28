<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:saxon="http://saxon.sf.net/"
                extension-element-prefixes="saxon"
                exclude-result-prefixes="xsl xsi"
                version='2.0'>

<xsl:output indent="yes" saxon:next-in-chain="xPG-p2.xsl"/>

<!--
<xsl:output indent="yes" />
-->

<!-- Define the title of Profile Group the different FMN profiles belongs to -->
<xsl:param name="pgTitle" select="'FMN Spiral 4 Specification'"/>

<xsl:template match="model">
  <model pgTitle="{$pgTitle}">
    <xsl:apply-templates/>
  </model>
</xsl:template>


<xsl:template match="element">
  <xsl:variable name="stereotype" select="properties/property[@propertyDefinitionRef='s5524-stereotype']/value"/>
  <element>
    <xsl:attribute name="nisp-identifier">
      <xsl:value-of select="properties/property[@propertyDefinitionRef='nisp-identifier']/value"/>
    </xsl:attribute>
    <xsl:attribute name="title">
      <xsl:value-of select="properties/property[@propertyDefinitionRef='nisp-title']/value"/>
    </xsl:attribute>
    <xsl:attribute name="stereotype">
      <xsl:value-of select="$stereotype"/>
    </xsl:attribute>
    <xsl:attribute name="identifier">
      <xsl:value-of select="@identifier"/>
    </xsl:attribute>
    <xsl:attribute name="pubnum">
      <xsl:value-of select="properties/property[@propertyDefinitionRef='nisp-pubnum']/value"/>
    </xsl:attribute>
    <xsl:attribute name="compoundpubnum">
      <xsl:value-of select="properties/property[@propertyDefinitionRef='nisp-compoundPubnum']/value"/>
    </xsl:attribute>
    <xsl:attribute name="uuid">
      <xsl:value-of select="properties/property[@propertyDefinitionRef='s5524-UUID']/value"/>
    </xsl:attribute>
    <xsl:attribute name="status">
      <xsl:value-of select="properties/property[@propertyDefinitionRef='nisp-maintenanceStatus']/value"/>
    </xsl:attribute>
    <xsl:attribute name="obligation">
      <xsl:value-of select="properties/property[@propertyDefinitionRef='nisp-obligationQualifier']/value"/>
    </xsl:attribute>
  </element>
</xsl:template>


<xsl:template match="relationship">
  <relationship type="{@type}" identifier="{@identifier}"
    source="{@source}" target="{@target}">
    <xsl:attribute name="stereotype">
      <xsl:value-of select="properties/property[@propertyDefinitionRef='s5524-stereotype']/value"/>
    </xsl:attribute>
  </relationship>
</xsl:template>


<xsl:template match="views|organizations"/>


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
