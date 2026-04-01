#!/bin/bash

# Script to run riskprofile_cli for all datasource combinations
# Navigate to build directory
cd "$(dirname "$0")/build" || exit 1

# Define risk types
RISK_TYPES=("asuransi" "hukum" "imbalhasil" "intragroup" "investasi" "kepatuhan" "kredit" "likuiditas" "operasional" "pasar" "reputasi" "stratejik")

# Path to riskprofile files
INHERENT_RISKPROFILE="../testdata/inherent_riskpro.xml"
KPMR_RISKPROFILE="../testdata/kpmr_riskpro.xml"

# Counter for tracking progress
TOTAL_TESTS=${#RISK_TYPES[@]}
CURRENT_TEST=0
PASSED=0
FAILED=0

echo "========================================="
echo "Risk Profile Testing Suite"
echo "========================================="
echo "Total test cases: $TOTAL_TESTS"
echo ""

# Process each risk type
for risk_type in "${RISK_TYPES[@]}"; do
    CURRENT_TEST=$((CURRENT_TEST + 1))
    
    # Define datasource files
    INHERENT_DS="../testdata/inherentds_${risk_type}.xml"
    KPMR_DS="../testdata/kpmrds_${risk_type}.xml"
    
    echo "[$CURRENT_TEST/$TOTAL_TESTS] Testing: $risk_type"
    echo "  Inherent DS: $INHERENT_DS"
    echo "  KPMR DS: $KPMR_DS"
    echo "  Inherent Risk Profile: $INHERENT_RISKPROFILE"
    echo "  KPMR Risk Profile: $KPMR_RISKPROFILE"
    echo ""
    
    # Run the riskprofile_cli tool and display output directly
    if ./bin/riskprofile_cli \
        --inherent_datasource="$INHERENT_DS" \
        --kpmr_datasource="$KPMR_DS" \
        --inherent_riskprofile="$INHERENT_RISKPROFILE" \
        --kpmr_riskprofile="$KPMR_RISKPROFILE"; then
        echo ""
        echo "  ✓ PASSED"
        PASSED=$((PASSED + 1))
    else
        EXIT_CODE=$?
        echo ""
        echo "  ✗ FAILED (Exit code: $EXIT_CODE)"
        FAILED=$((FAILED + 1))
    fi
    
    echo "---"
done

echo ""
echo "========================================="
echo "Test Summary"
echo "========================================="
echo "Total tests: $TOTAL_TESTS"
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo ""

if [ $FAILED -eq 0 ]; then
    echo "✓ All tests passed successfully!"
    exit 0
else
    echo "✗ Some tests failed."
    exit 1
fi
