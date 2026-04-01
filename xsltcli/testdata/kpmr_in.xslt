<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:k="http://example.com/kpmr"
    exclude-result-prefixes="k">

  <!-- Output formatting -->
  <xsl:output method="xml" indent="yes" encoding="UTF-8"
              cdata-section-elements="score_rule rating_rule value_rule score_formula_cdata threshold_cdata"/>

  <!-- Identity transform -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Root template: filter Risiko Asuransi -->
  <xsl:template match="k:kpmr_risk_profile_tree">
    <kpmr_risk_profile_tree xmlns="http://example.com/kpmr" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://example.com/kpmr ./xsd/KPMRRiskProfile.xsd">
        <xsl:apply-templates select="@* | k:node[k:risiko_name='Risiko Asuransi']"/>
    </kpmr_risk_profile_tree>
  </xsl:template>

</xsl:stylesheet>