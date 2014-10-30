<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ieso="http://www.theIMO.com/schema" version="1.0">
  <xsl:output encoding="UTF-8" method="text"/>
  <xsl:template match="/">
    <xsl:variable name="created">
      <!-- ☞ i really fucking hate namespaces ☜ -->
      <xsl:value-of select="ieso:IMODocument/ieso:IMODocHeader/ieso:CreatedAt"/>
    </xsl:variable>
    <xsl:variable name="date">
      <xsl:value-of select="ieso:IMODocument/ieso:IMODocBody/ieso:Date"/>
    </xsl:variable>
    <xsl:text>date,hour,name,fuel,energy_MW&#x0A;</xsl:text>
    <xsl:for-each select="ieso:IMODocument/ieso:IMODocBody/ieso:Generators/ieso:Generator">
      <xsl:variable name="fuel">
        <xsl:value-of select="ieso:FuelType"/>
      </xsl:variable>
      <xsl:variable name="name">
        <xsl:value-of select="ieso:GeneratorName"/>
      </xsl:variable>
      <xsl:for-each select="ieso:Outputs/ieso:Output">
        <xsl:variable name="hour">
          <xsl:value-of select="ieso:Hour"/>
        </xsl:variable>
        <xsl:variable name="energy_MW">
          <xsl:value-of select="ieso:EnergyMW"/>
        </xsl:variable>
        <xsl:value-of select="$date"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$hour"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$name"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$fuel"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$energy_MW"/>
        <xsl:text>&#x0A;</xsl:text>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>

