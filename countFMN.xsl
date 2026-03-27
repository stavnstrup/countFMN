<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:saxon="http://saxon.sf.net/"
                extension-element-prefixes="saxon"                
                exclude-result-prefixes="xsl xsi"
                version='1.1'>


<xsl:output indent="yes" saxon:next-in-chain="countFMN-p2.xsl"/>

<!-- *****************************************************
      Remove namespaces

     *****************************************************
-->

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
