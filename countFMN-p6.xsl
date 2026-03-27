<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:saxon="http://saxon.sf.net/"
                extension-element-prefixes="saxon"
                exclude-result-prefixes="xsl xsi"
                version='1.1'>

<xsl:output method="text"/>

<xsl:template match="/">
<xsl:value-of select="archimate/profilegroup/@title"/><xsl:text>&#x0A;</xsl:text>
<xsl:text>Standards: </xsl:text><xsl:value-of select="count(//standard)"/><xsl:text>&#x0A;</xsl:text>
<xsl:text>Profiles: </xsl:text><xsl:value-of select="count(//profile)"/><xsl:text>&#x0A;</xsl:text>
</xsl:template>


</xsl:stylesheet>
