#!/bin/bash

# Script to copy KPMR calculated files

# Source directory (adjust if needed)
SOURCE_DIR="$HOME/go/src/gitlab.banksinarmas.com/risk-project/fsis-api"

# Destination directory (adjust as needed)
DEST_DIR="./testdata"

# Array of files to copy
FILES=(
    "files/calculated_kpmr_1ddbe9ad-f539-44e7-a2db-919465125c28__riskid_20.xml"
    "files/calculated_kpmr_fc45a213-a20f-43a5-b707-1b47721fed3a__riskid_14.xml"
    "files/calculated_kpmr_03c1fe35-1e21-431e-8b55-2c619d7b7b0d__riskid_15.xml"
    "files/calculated_kpmr_2d1bfa1e-4a15-45d6-9b1f-2f897f9fbda0__riskid_16.xml"
    "files/calculated_kpmr_54a352b4-e6d6-4d20-8ee6-49136d28c2fd__riskid_7.xml"
    "files/calculated_kpmr_99584d32-af16-4ba5-a7b9-387665655bcf__riskid_8.xml"
    "files/calculated_kpmr_905460db-3fe6-4cd2-afcd-fd3cf02a6ac5__riskid_9.xml"
    "files/calculated_kpmr_3a1eec7b-ccbb-4593-9a4d-f2780a7f233b__riskid_11.xml"
    "files/calculated_kpmr_e0bff1a4-8cb7-4177-a6a1-fed18be50fdb__riskid_12.xml"
    "files/calculated_kpmr_11828cfa-453d-4e8f-b768-da24f41fa552__riskid_13.xml"
    "files/calculated_kpmr_f96a0651-95a3-4a11-8eae-ae0be5f95407__riskid_10.xml"
)

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy each file
for file in "${FILES[@]}"; do
    if [ -f "$SOURCE_DIR/$file" ]; then
        echo "Copying: $file"
        cp "$SOURCE_DIR/$file" "$DEST_DIR/"
    else
        echo "Warning: File not found: $file"
    fi
done

echo "Copy completed!"
