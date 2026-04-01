<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:kpmr="http://example.com/kpmr">
  
  <!-- Output format -->
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  
  <!-- Root template -->
  <xsl:template match="/kpmr:kpmr_risk_profile_tree">
    <kpmr_risk_profile_tree xmlns="http://example.com/kpmr" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://example.com/kpmr ./xsd/KPMRRiskProfile.xsd">
      <!-- Apply templates only to nodes with Risiko Reputasi -->
      <xsl:apply-templates select="kpmr:node[kpmr:risiko_name='Risiko Reputasi']"/>
    </kpmr_risk_profile_tree>
  </xsl:template>
  
  <!-- Template to copy node and its descendants -->
  <xsl:template match="kpmr:node">
    <node xmlns="http://example.com/kpmr">
      <xsl:apply-templates select="@*|node()"/>
    </node>
  </xsl:template>
  
  <!-- Template to copy all attributes -->
  <xsl:template match="@*">
    <xsl:copy/>
  </xsl:template>
  
  <!-- Template to copy all elements -->
  <xsl:template match="*">
    <xsl:element name="{local-name()}" namespace="http://example.com/kpmr">
      <xsl:apply-templates select="@*|node()"/>
    </xsl:element>
  </xsl:template>
  
  <!-- Template to copy text nodes -->
  <xsl:template match="text()">
    <xsl:copy/>
  </xsl:template>
  
  <!-- Template to copy comments -->
  <xsl:template match="comment()">
    <xsl:copy/>
  </xsl:template>
  
</xsl:stylesheet>
