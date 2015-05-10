<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ieso="http://www.theIMO.com/schema" version="1.0">
  <!-- ☞
       GenOutputCapability_CSV.xsl - make CSV from
       IESO Generators Output and Capability Report
       typically at
       http://reports.ieso.ca/public/GenOutputCapability/
       scruss - 2014-2015 - WTFPL (srsly)
       ☜ -->

  <xsl:output encoding="UTF-8" method="text"/>
  <xsl:template match="/">
    <xsl:variable name="created">
      
      <!-- ☞ i really fucking hate namespaces, so I do ☜ -->
      <xsl:value-of select="ieso:IMODocument/ieso:IMODocHeader/ieso:CreatedAt"/>
    </xsl:variable>
    <xsl:variable name="date">
      
      <!-- ☞
	   this, and ‘created’ above, aren't used
	   You might find them useful.
	   ☜ -->
      <xsl:value-of select="ieso:IMODocument/ieso:IMODocBody/ieso:Date"/>
    </xsl:variable>
    
    <!-- ☞ output header line ☜ -->
    <xsl:text>date,hour,name,fuel,energy_MW,capability_MW,capacity_MW&#x0A;</xsl:text>
    <xsl:for-each select="ieso:IMODocument/ieso:IMODocBody/ieso:Generators/ieso:Generator">
      
      <!-- ☞ loop for each generating station ☜ -->
      <xsl:variable name="fuel">
        <xsl:value-of select="ieso:FuelType"/>
      </xsl:variable>
      <xsl:variable name="name">
        <xsl:value-of select="ieso:GeneratorName"/>
      </xsl:variable>
      <xsl:for-each select="ieso:Outputs/ieso:Output">

	<!-- ☞ loop for each of the generation hours ☜ -->
        <xsl:variable name="hour">
          <xsl:value-of select="number(ieso:Hour)"/>
        </xsl:variable>
        <xsl:variable name="energy_MW">
          <xsl:value-of select="ieso:EnergyMW"/> 
        </xsl:variable>
        <xsl:variable name="capability_MW">

	  <!-- ☞
	       kind of hacky; use the 1-24 hour value to pull out
	       the 1-24th value of this array.
	       and I have no idea why I have to add zero to it,
	       but under xsltproc, it doesn't work without it.
	       ☜ -->
          <xsl:value-of select="../../ieso:Capabilities/ieso:Capability[$hour + 0]/ieso:EnergyMW"/>
        </xsl:variable>
        <xsl:variable name="capacity_MW">
          <xsl:value-of select="../../ieso:Capacities/ieso:AvailCapacity[$hour + 0]/ieso:EnergyMW"/>
        </xsl:variable>

	<!-- ☞ output data line☜ -->
        <xsl:value-of select="$date"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$hour"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$name"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$fuel"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$energy_MW"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$capability_MW"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$capacity_MW"/>
        <xsl:text>&#x0A;</xsl:text>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>

