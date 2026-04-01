# build_tree_cli - Quick Reference

## Overview
Command-line tool to build and visualize hierarchical risk profile trees from XML files.

## Quick Start

```bash
# Build the tool
make build_tree_cli

# Display tree in terminal (default)
./build_tree_cli --input data/risk_profile_report_items.xml

# Save tree as XML
./build_tree_cli --input data/risk_profile_report_items.xml \
                 --output risk_profile_tree.xml \
                 --format xml

# Show help
./build_tree_cli --help
```

## Command Syntax

```
build_tree_cli --input <file> [--format text|xml] [--output <file>] [--help]
```

## Arguments Reference

| Argument | Required | Description |
|----------|----------|-------------|
| `--input <file>` | Yes | Path to input XML file with RiskProfile elements |
| `--format <fmt>` | No | Output format: `text` (default) or `xml` |
| `--output <file>` | No* | Output file path (required for `--format xml`) |
| `--help, -h` | No | Display help message |

## Output Formats

### Text Format (Default)
Displays hierarchical tree in terminal with indentation:
```
(virtual root)
  [RI0100100000] Risk Name - Factor
    [RI0100100100] Sub-Risk - Sub-Factor
```

### XML Format
Serializes tree structure to XML file:
```xml
<RiskProfileTree>
  <RiskProfileNode>
    <Profile_ID>...</Profile_ID>
    <risiko_name>...</risiko_name>
    <Faktor_Penilaian>...</Faktor_Penilaian>
    <RiskProfileNode>...</RiskProfileNode>
  </RiskProfileNode>
</RiskProfileTree>
```

## Common Use Cases

### Use Case 1: Analyze Tree Structure
```bash
./build_tree_cli --input data/risk_profile_report_items.xml
```

### Use Case 2: Export Tree for Integration
```bash
./build_tree_cli --input data/risk_profile_report_items.xml \
                 --format xml \
                 --output tree.xml
```

### Use Case 3: Process with Other Tools
```bash
# Pretty print the tree XML
./build_tree_cli --input data/file.xml --format xml --output tree.xml
xmllint --format tree.xml

# Query specific nodes
xmllint --xpath "//RiskProfileNode[risiko_name='Risk Name']" tree.xml
```

## Makefile Targets

```bash
make build_tree_cli      # Build only build_tree_cli
make all                 # Build all tools including build_tree_cli
make clean               # Remove build artifacts
make install             # Install build_tree_cli to /usr/local/bin
make uninstall           # Remove build_tree_cli from /usr/local/bin
make help                # Show all available targets
```

## Error Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | Error (invalid args, file not found, parsing error, etc.) |

## Typical Error Messages

```
Error: --input is required
  → Provide --input with path to XML file

Error: Failed to parse XML file 'path'
  → Check file exists and is valid XML

Error: Failed to build risk profile tree
  → Check XML contains RiskProfile elements

Error: --output is required when using --format xml
  → Provide --output path for XML format

Error: Invalid format 'xyz'. Must be 'text' or 'xml'
  → Use --format text or --format xml
```

## Requirements

- GLib 2.0
- libxml2
- C11 compiler (gcc/clang)

## Installation on macOS

```bash
brew install glib libxml2
cd /path/to/ilf
make build_tree_cli
```

## Installation on Linux

```bash
# Ubuntu/Debian
sudo apt-get install libglib2.0-dev libxml2-dev
cd /path/to/ilf
make build_tree_cli

# Fedora/RHEL
sudo dnf install glib2-devel libxml2-devel
cd /path/to/ilf
make build_tree_cli
```

## Integration with Other Tools

### eval_cli Integration
```bash
# Visualize structure first
./build_tree_cli --input data/risk_profile_report_items.xml

# Then run evaluation
./eval_cli --risk-profile data/risk_profile_report_items.xml \
           --sandi-source data/source_inherent_out.xml \
           --rating-to-score data/rating_to_score.xml \
           --output result.xml
```

## Performance

- **Input**: Handles thousands of RiskProfile elements
- **Speed**: Typically processes large files in < 1 second
- **Memory**: Proportional to tree size

## File Locations

- **Executable**: `./build_tree_cli` (in repo root)
- **Source**: `src/build_tree_cli.c`
- **Documentation**: `docs/BUILD_TREE_CLI.md`
- **Header**: `src/risk_profile_tree.h`

---

For detailed documentation, see: `docs/BUILD_TREE_CLI.md`
