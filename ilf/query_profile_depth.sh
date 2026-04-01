#!/bin/bash

# Script to query Profile_ID and return its depth in the XML tree
# Usage: ./query_profile_depth.sh <Profile_ID>

XML_FILE="/home/kenny/go/src/gitlab.banksinarmas.com/risk-project/fsis-api/tools/ilf/inherent_risk_profile_tree.xml"

if [ -z "$1" ]; then
    echo "Usage: $0 <Profile_ID>"
    echo "Example: $0 RI0400100301"
    exit 1
fi

PROFILE_ID="$1"

# Check if the Profile_ID exists
EXISTS=$(xmllint --xpath "//RiskProfileNode[Profile_ID='${PROFILE_ID}']/Profile_ID/text()" "$XML_FILE" 2>/dev/null)

if [ -z "$EXISTS" ]; then
    echo "Error: Profile_ID '${PROFILE_ID}' not found in the XML file"
    exit 1
fi

# Get the depth (count of ancestor RiskProfileNode elements)
DEPTH=$(xmllint --xpath "count(//RiskProfileNode[Profile_ID='${PROFILE_ID}']/ancestor::RiskProfileNode)" "$XML_FILE")

# Get additional information
RISIKO_NAME=$(xmllint --xpath "//RiskProfileNode[Profile_ID='${PROFILE_ID}']/risiko_name/text()" "$XML_FILE" 2>/dev/null)
FAKTOR=$(xmllint --xpath "//RiskProfileNode[Profile_ID='${PROFILE_ID}']/Faktor_Penilaian/text()" "$XML_FILE" 2>/dev/null)

echo "=========================================="
echo "Profile_ID: $PROFILE_ID"
echo "Depth: $DEPTH"
echo "Risiko Name: $RISIKO_NAME"
if [ -n "$FAKTOR" ]; then
    echo "Faktor Penilaian: $FAKTOR"
fi
echo "=========================================="
