#!/bin/bash

# Script to run ilfx_cli for all XML files in testdata directory
# Exit immediately if a command exits with a non-zero status
set -e

# Navigate to build directory
cd "$(dirname "$0")/build" || exit 1

# Path to weight file
WEIGHT_PATH="../sampledata/weighing.xml"

# Process each XML file in testdata
for data_file in ../testdata/kpmrds_*.xml; do
    # Extract the filename without path and extension
    filename=$(basename "$data_file" .xml)
    
    # Create output filename
    output_file="../${filename}_out.xml"
    
    echo "Processing: $data_file"
    echo "Output to: $output_file"
    
    # Run the CLI tool
    if ! ./bin/kpmr_cli --data_path="$data_file" --output_path="$output_file" --weight_path="$WEIGHT_PATH"; then
        echo "ERROR: Failed to process $data_file"
        exit 1
    fi
    
    echo "---"
done

echo "All files processed!"
