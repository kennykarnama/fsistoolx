<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
   <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"></xsl:output>
   <xsl:template match="/">
       <RiskProfileConf xmlns="http://example.com/kpmr"
           xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
           xsi:schemaLocation="http://example.com/kpmr file:/Users/kenny/go/src/github.com/kennykarnama/ilfreporter/xsd/KPMRRiskProfileConf.xsd">
           <xsl:for-each select="select_risiko_name_threshold_calculation_logic_from_kpmr_risk_profile_edge_where_profile_id_is_null_and_threshold_is_not_null/DATA_RECORD">
           <aggregationConfig>
               <risikoName>
                   <xsl:value-of select="risiko_name"/>
               </risikoName>
               <score_rule>
                   <xsl:value-of select="calculation_logic"/>
               </score_rule>
               <rating_rule>
                   <![CDATA[
                   
                   ]]>
               </rating_rule>
               <rating_to_score>
                   <xsl:value-of select="threshold"/>
               </rating_to_score>
           </aggregationConfig>
       </xsl:for-each>
       </RiskProfileConf>
   </xsl:template>
</xsl:stylesheet>