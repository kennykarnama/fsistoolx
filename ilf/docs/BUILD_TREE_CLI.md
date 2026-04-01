# Build Tree CLI Documentation

## Overview

`build_tree_cli` is a command-line tool that builds and visualizes hierarchical risk profile trees from XML files. It reads XML data containing `RiskProfile` elements and constructs a tree structure based on the `Profile_ID` hierarchy.

## Features

- **Tree Building**: Automatically constructs parent-child relationships based on Profile_ID hierarchical structure
- **Multiple Output Formats**: Display tree as formatted text or save as structured XML
- **Clear Visualization**: Print tree with indentation showing hierarchy depth
- **XML Serialization**: Save tree structure to XML file for further processing or integration

## Installation

### Build from Source

```bash
# Build only build_tree_cli
make build_tree_cli

# Or build all tools including build_tree_cli
make all

# Install to system (optional)
make install
```

The executable will be created at `./build_tree_cli`

## Usage

### Basic Syntax

```bash
./build_tree_cli --input <file> [--format <format>] [--output <file>] [--help]
```

### Arguments

#### Required Arguments

- `--input <file>` - Path to the input XML file containing RiskProfile elements

#### Optional Arguments

- `--format <text|xml>` - Output format (default: `text`)
  - `text`: Print tree structure to stdout with visual indentation
  - `xml`: Serialize tree structure to XML file
- `--output <file>` - Output file path (required when using `--format xml`)
- `--help, -h` - Display help message

## Examples

### Example 1: Print Tree to Console (Default)

Display the tree structure directly in the terminal:

```bash
./build_tree_cli --input data/risk_profile_report_items.xml
```

Output:
```
Risk Profile Tree Structure:
============================

(virtual root)
  [RI0100100000] Risk Category 1 - Factor 1
    [RI0100100100] Sub-Risk 1.1 - Factor 1.1
      [RI0100100101] Sub-Risk 1.1.1 - Factor 1.1.1
    [RI0100100200] Sub-Risk 1.2 - Factor 1.2
  [RI0100200000] Risk Category 2 - Factor 2
    [RI0100200100] Sub-Risk 2.1 - Factor 2.1

Done.
```

### Example 2: Explicitly Specify Text Format

```bash
./build_tree_cli --input data/risk_profile_report_items.xml --format text
```

### Example 3: Save Tree as XML

Serialize the hierarchical tree structure to an XML file:

```bash
./build_tree_cli \
  --input data/risk_profile_report_items.xml \
  --format xml \
  --output risk_profile_tree.xml
```

The output XML file will have this structure:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<RiskProfileTree>
  <RiskProfileNode>
    <Profile_ID>RI0100100000</Profile_ID>
    <risiko_name>Risk Category 1</risiko_name>
    <Faktor_Penilaian>Factor 1</Faktor_Penilaian>
    <RiskProfileNode>
      <Profile_ID>RI0100100100</Profile_ID>
      <risiko_name>Sub-Risk 1.1</risiko_name>
      <Faktor_Penilaian>Factor 1.1</Faktor_Penilaian>
    </RiskProfileNode>
  </RiskProfileNode>
</RiskProfileTree>
```

## Tree Structure

The tool builds trees based on the Profile_ID hierarchy:

- **Root Nodes**: Profile IDs ending with `0000` (e.g., `RI0100100000`)
- **Child Nodes**: Profile IDs with matching prefix but different suffix
- **Parent-Child Relation**: A Profile_ID is a child of another if:
  - They have the same length
  - They differ in exactly one 2-digit segment
  - The parent's differing segment is `00`
  - The child's differing segment is non-`00`

### Hierarchy Example

```
RI0100100000        (root)
├── RI0100100100    (child, differs at position 4)
│   └── RI0100100101 (child, differs at position 5)
├── RI0100100200    (child, differs at position 4)
└── RI0100100300    (child, differs at position 4)
```

## Error Handling

The tool provides clear error messages for common issues:

```bash
# Missing required input
./build_tree_cli
# Error: --input is required

# Invalid XML file
./build_tree_cli --input nonexistent.xml
# Error: Failed to parse XML file 'nonexistent.xml'

# Output without --format xml
./build_tree_cli --input data/file.xml --output out.xml
# Error: --output is required when using --format xml

# Invalid format
./build_tree_cli --input data/file.xml --format json
# Error: Invalid format 'json'. Must be 'text' or 'xml'
```

## Integration with Other Tools

### With eval_cli

Use the tree structure output to understand risk profile relationships before evaluation:

```bash
# First, visualize the tree structure
./build_tree_cli --input data/risk_profile_report_items.xml

# Then run evaluation
./eval_cli \
  --risk-profile data/risk_profile_report_items.xml \
  --sandi-source data/source_inherent_out.xml \
  --rating-to-score data/rating_to_score.xml \
  --output result.xml
```

### With External Tools

The XML output format is compatible with standard XML processing tools:

```bash
# Pretty-print with xmllint
xmllint --format risk_profile_tree.xml

# Transform with XSLT
xsltproc transform.xslt risk_profile_tree.xml

# Query with xpath
xmllint --xpath "//RiskProfileNode[risiko_name='specific_name']" risk_profile_tree.xml
```

## Performance Considerations

- **Time Complexity**: O(n²) in worst case due to parent-child matching algorithm, where n is number of RiskProfile elements
- **Memory Usage**: Proportional to tree size and number of nodes
- **Large Files**: Suitable for files with thousands of RiskProfile elements

## Return Codes

- `0` - Success
- `1` - Error (invalid arguments, file not found, parsing error, etc.)

## Compilation Notes

The tool is compiled with:
- GLib 2.0 for data structures and memory management
- libxml2 for XML parsing and serialization
- Standard C11

### Required Dependencies

```bash
# macOS (Homebrew)
brew install glib libxml2

# Linux (Ubuntu/Debian)
sudo apt-get install libglib2.0-dev libxml2-dev

# Linux (Fedora/RHEL)
sudo dnf install glib2-devel libxml2-devel
```

## Troubleshooting

### Build Fails with "libxml2 not found"

Ensure libxml2 development headers are installed and pkg-config can find them:

```bash
# Verify installation
pkg-config --cflags --libs libxml-2.0

# On macOS with Homebrew
export PKG_CONFIG_PATH="/opt/homebrew/opt/libxml2/lib/pkgconfig"
```

### "No RiskProfile nodes found"

The input XML file doesn't contain any `<RiskProfile>` elements. Check:
- File is valid XML
- Contains `<RiskProfile>` elements (case-sensitive)
- File is not empty

### Output file permission error

Ensure you have write permission to the output directory:

```bash
# Check/fix directory permissions
chmod 755 /path/to/output/directory
```

## See Also

- `eval_cli` - For evaluating risk profiles
- `eval_server` - For service-based evaluation
- XML schema files in `schema/` directory
