#!/bin/bash
# Quick start script for rating_threshold_cli

echo "==================================="
echo "Rating Threshold CLI - Quick Start"
echo "==================================="
echo ""

# Check if the executable exists
if [ ! -f "build/bin/rating_threshold_cli" ]; then
    echo "Error: rating_threshold_cli not found in build/bin/"
    echo "Please build the project first:"
    echo "  cd /path/to/tools/ilfx"
    echo "  mkdir -p build && cd build"
    echo "  cmake .."
    echo "  make rating_threshold_cli"
    echo ""
    exit 1
fi

echo "Running example 1: Basic threshold evaluation (value=55.5)"
echo "-----------------------------------------------------------"
./build/bin/rating_threshold_cli --threshold_file=examples/sample_threshold.txt --value=55.5
echo ""

echo "Running example 2: Lower boundary test (value=20.0)"
echo "----------------------------------------------------"
./build/bin/rating_threshold_cli --threshold_file=examples/sample_threshold.txt --value=20.0
echo ""

echo "Running example 3: Complex threshold rules (value=45)"
echo "------------------------------------------------------"
./build/bin/rating_threshold_cli --threshold_file=examples/complex_threshold.txt --value=45
echo ""

echo "Running example 4: Edge case - value 5"
echo "---------------------------------------"
./build/bin/rating_threshold_cli --threshold_file=examples/complex_threshold.txt --value=5
echo ""

echo "Running example 5: No match scenario (value=150)"
echo "-------------------------------------------------"
./build/bin/rating_threshold_cli --threshold_file=examples/sample_threshold.txt --value=150
echo ""

echo "==================================="
echo "All examples completed!"
echo "==================================="
