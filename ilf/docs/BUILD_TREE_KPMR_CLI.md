# build_tree_kpmr_cli - KPMR Risk Profile Tree Builder

## Overview
The `build_tree_kpmr_cli` tool builds hierarchical tree structures from KPMR (Konsolidasi Profil Manajemen Risiko) Risk Profile XML data files. It processes flat `DATA_RECORD` elements and organizes them into parent-child relationships based on Profile_ID patterns.

## Purpose
This CLI tool:
- Parses KPMR risk profile XML files containing `DATA_RECORD` elements
- Builds a hierarchical tree structure based on Profile_ID relationships
- Outputs the tree in either text or XML format
- Helps visualize and understand the KPMR risk profile hierarchy

## Profile_ID Format
KPMR risk profile IDs follow this pattern:
```
RK [CC] [SSS] [IIII]
│  │    │     │
│  │    │     └─ Item code (0001-9999)
│  │    └─ Sub-category code (001-999)
│  └─ Category code (01-12)
└─ Risk Konsolidasi prefix
```

### Risk Category Codes
| Code | Risk Type |
|------|-----------|
| 01 | Risiko Kredit |
| 02 | Risiko Pasar |
| 04 | Risiko Operasional |
| 05 | Risiko Hukum |
| 06 | Risiko Reputasi |
| 07 | Risiko Stratejik |
| 08 | Risiko Kepatuhan |
| 09 | Risiko Intragrup |
| 10 | Risiko Asuransi |
| 11 | Risiko Investasi |
| 12 | Risiko Imbal Hasil |

### Parent-Child Relationship Logic
- Parent IDs end with `000` or `0000` (e.g., `RK01001000`, `RK02000000`)
- Child IDs share the parent's prefix but have non-zero suffixes (e.g., `RK01001001`, `RK01001002`)

**Examples:**
- `RK01001000` is parent of `RK01001001`, `RK01001002`, etc.
- `RK01000000` is parent of `RK01001000`, `RK01002000`, etc.

## Usage

### Basic Syntax
```bash
build_tree_kpmr_cli --input <file> [--output <file>] [--format <text|xml>] [--help]
```

### Options

#### Required
- `--input <file>` - Input XML file containing DATA_RECORD elements

#### Optional
- `--output <file>` - Output file path (required for `--format xml`)
- `--format <text|xml>` - Output format (default: text)
  - `text`: Print tree structure to stdout
  - `xml`: Save tree structure to XML file
- `--help`, `-h` - Show help message

## Examples

### 1. Print Tree Structure to Console (Text Format)
```bash
./build_tree_kpmr_cli --input data/kpmr_risk_profile.xml
```

**Output:**
```
Building KPMR risk profile tree from 'data/kpmr_risk_profile.xml'...
KPMR Risk Profile Tree Structure:
==================================

  [RK01001001] Risiko Kredit - Penetapan tingkat Risiko kredit...
  [RK01001002] Risiko Kredit - Awareness dan pemahaman Dewan Komisaris...
  [RK01002001] Risiko Kredit - Fungsi Manajemen Risiko kredit...
  ...
```

### 2. Save Tree to XML File
```bash
./build_tree_kpmr_cli --input data/kpmr_risk_profile.xml \
                      --output kpmr_risk_profile_tree.xml \
                      --format xml
```

**Output XML Structure:**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<RiskProfileTree>
  <RiskProfileNode>
    <Profile_ID>RK01001001</Profile_ID>
    <risiko_name>Risiko Kredit</risiko_name>
    <Faktor_Penilaian>Penetapan tingkat Risiko kredit...</Faktor_Penilaian>
    <risk_id>8</risk_id>
    <id>2</id>
  </RiskProfileNode>
  ...
</RiskProfileTree>
```

### 3. Explicit Text Format
```bash
./build_tree_kpmr_cli --input data/kpmr_risk_profile.xml --format text
```

## Input File Format

The tool expects XML files with this structure:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<kpmr_risk_profile_edge>
  <DATA_RECORD>
    <risiko_name>Risiko Kredit</risiko_name>
    <Profile_ID>RK01001001</Profile_ID>
    <Faktor_Penilaian>Assessment factor description</Faktor_Penilaian>
    <risk_id>8</risk_id>
    <id>2</id>
    <!-- other fields -->
  </DATA_RECORD>
  <DATA_RECORD>
    ...
  </DATA_RECORD>
</kpmr_risk_profile_edge>
```

### Required Fields
- `Profile_ID` - Must not be empty
- `risiko_name` - Risk category name

### Optional Fields
- `Faktor_Penilaian` - Assessment factor description
- `risk_id` - Risk identifier
- `id` - Record identifier

## Output Formats

### Text Format
Human-readable hierarchical tree structure showing:
- Profile_ID
- risiko_name  
- Faktor_Penilaian (if present)

Indentation indicates hierarchy depth.

### XML Format
Structured XML with `<RiskProfileNode>` elements containing:
- `<Profile_ID>` - Profile identifier
- `<risiko_name>` - Risk name
- `<Faktor_Penilaian>` - Assessment factor (if present)
- `<risk_id>` - Risk ID (if present)
- `<id>` - Record ID (if present)
- Nested `<RiskProfileNode>` elements for children

## Building from Source

### Prerequisites
```bash
# Debian/Ubuntu
sudo apt-get install libglib2.0-dev libxml2-dev

# RHEL/CentOS
sudo yum install glib2-devel libxml2-devel
```

### Build Commands
```bash
# Build only build_tree_kpmr_cli
make build_tree_kpmr_cli

# Build all tools
make all

# Clean build artifacts
make clean
```

## Comparison with Similar Tools

| Tool | Input Source | ID Pattern | Purpose |
|------|--------------|------------|---------|
| `build_tree_cli` | Risk Profile Reports | Various | General risk profile trees |
| `kpmr_source_tree_cli` | KPMR Source Data | SK* | KPMR source data trees |
| **`build_tree_kpmr_cli`** | **KPMR Risk Profiles** | **RK*** | **KPMR risk profile trees** |

## Use Cases

1. **Visualize KPMR Risk Hierarchy**
   - Understand parent-child relationships
   - Identify risk categories and subcategories

2. **Data Validation**
   - Verify Profile_ID patterns
   - Check for orphaned records
   - Validate hierarchy structure

3. **Documentation Generation**
   - Export risk structure to XML
   - Create visual representations
   - Generate reports

4. **Integration Testing**
   - Verify data transformations
   - Test risk profile processing
   - Validate aggregation logic

## Error Handling

The tool will exit with an error if:
- Input file doesn't exist or can't be parsed
- Output file can't be written (XML format)
- Invalid format specified
- Missing required options

## Implementation Details

### Tree Building Algorithm
1. Parse all `DATA_RECORD` elements from input XML
2. Extract Profile_ID, risiko_name, and other fields
3. For each record, find potential parent by checking parent-child relationships
4. Build GNode tree structure with parent-child links
5. Serialize to requested output format

### Parent Detection
- Check if one Profile_ID is a parent of another
- Parent ends with `000` or `0000`
- Child shares parent prefix but has non-zero suffix
- Only direct parent-child relationships are established

## Limitations

1. **Flat Input Only**: Expects flat `DATA_RECORD` structure, not pre-nested XML
2. **Single Root**: Creates virtual root for top-level nodes
3. **ID Pattern Dependency**: Relies on RK* Profile_ID pattern
4. **No Validation**: Doesn't validate against XSD schema

## Related Files

- **Source**: `src/build_tree_kpmr_cli.c`
- **Build**: Defined in `Makefile`
- **Input Example**: `data/kpmr_risk_profile.xml`
- **Related Tools**: `build_tree_cli`, `kpmr_source_tree_cli`

## Exit Codes

- `0` - Success
- `1` - Error (see stderr for details)

## Author

Kenny Karnama <kennykarnama@gmail.com>

## License

MIT License
