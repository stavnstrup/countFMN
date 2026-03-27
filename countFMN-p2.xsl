<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:saxon="http://saxon.sf.net/"
                extension-element-prefixes="saxon"                
                exclude-result-prefixes="xsl xsi"
                version='1.1'>


<xsl:output indent="yes" saxon:next-in-chain="countFMN-p3.xsl"/>

<xsl:template match="element">
  <element>
    <xsl:attribute name="nisp-identifier">
      <xsl:value-of select="properties/property[@propertyDefinitionRef='nisp-identifier']/value"/>
    </xsl:attribute>    <xsl:attribute name="title">
    <xsl:value-of select="name"/>
    </xsl:attribute>
    <xsl:attribute name="stereotype">
      <xsl:value-of select="properties/property[@propertyDefinitionRef='s5524-stereotype']/value"/>
    </xsl:attribute>
    <xsl:attribute name="identifier">
      <xsl:value-of select="@identifier"/>
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
