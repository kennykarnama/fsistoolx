<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!-- Output format: preserve CDATA for selected elements -->
  <xsl:output method="xml" indent="yes" encoding="UTF-8"
              cdata-section-elements="assessment_factor score_rule rating_rule value_rule threshold rating_to_score"/>
  
  <!-- Root template -->
  <xsl:template match="/RiskProfileTree">
    <RiskProfileTree xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="./xsd/InherentRiskProfile.xsd">
      <!-- Apply templates only to RiskProfileNodes with Risiko Kredit -->
      <xsl:apply-templates select="RiskProfileNode[risiko_name='Risiko Reputasi']"/>
    </RiskProfileTree>
  </xsl:template>
  
  <!-- Template to copy RiskProfileNode and its descendants -->
  <xsl:template match="RiskProfileNode">
    <RiskProfileNode>
      <xsl:apply-templates select="@*|node()"/>
    </RiskProfileNode>
  </xsl:template>
  
  <!-- Template to copy all attributes -->
  <xsl:template match="@*">
    <xsl:copy/>
  </xsl:template>
  
  <!-- Template to copy all elements -->
  <xsl:template match="*">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
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
