# Source Inherent CLI

Command-line interface for evaluating source inherent and konsolidasi logic from XML files.

## Overview

The `src_inherent_cli` tool provides command-line access to the `evaluate_src_inherent` and `evaluate_konsolidasi_inherent` functions from `eval.c`. It processes XML files containing risk assessment logic written in C, compiles and executes them using TCC (Tiny C Compiler), and produces updated XML documents with evaluation results.

## Building

```bash
# Build only src_inherent_cli
make src_inherent_cli

# Or build all tools
make all
```

## Usage

```bash
./src_inherent_cli --input <source_xml> --pic <pic_xml> [OPTIONS]
```

### Required Arguments

- `--input <file>` - Source inherent XML file containing `sourceInherentRevampReport` records with `logicLjk` and `logicKonsolidasi` elements
- `--pic <file>` - Company PIC XML file (`prmtr_company`) to be updated with evaluation results

### Optional Arguments

- `--output-pic <file>` - Output PIC file path (default: `updated_pic.xml`)
- `--output-doc <file>` - Output document file path (default: `updated_doc.xml`)
- `--skip-konsolidasi` - Skip konsolidasi inherent evaluation (only evaluate source inherent)
- `--help`, `-h` - Show help message

## Examples

### Basic Usage

Evaluate both source inherent and konsolidasi logic:

```bash
./src_inherent_cli \
    --input data/inherent_source.xml \
    --pic data/prmtr_company.xml
```

This will:
1. Parse the input XML files
2. Evaluate `logicLjk` for each record (source inherent evaluation)
3. Update the PIC document with `sourceInherentEvalResult` nodes
4. Evaluate `logicKonsolidasi` for consolidation logic
5. Save results to `updated_pic.xml` and `updated_doc.xml`

### Skip Konsolidasi Evaluation

Evaluate only source inherent logic:

```bash
./src_inherent_cli \
    --input data/inherent_source.xml \
    --pic data/prmtr_company.xml \
    --skip-konsolidasi
```

### Custom Output Paths

Specify custom output file paths:

```bash
./src_inherent_cli \
    --input data/inherent_source.xml \
    --pic data/prmtr_company.xml \
    --output-pic results/evaluated_pic.xml \
    --output-doc results/evaluated_doc.xml
```

## Input XML Format

### Source Inherent XML (`--input`)

The input XML should contain `sourceInherentRevampReport` records with the following structure:

```xml
<sourceInherentRevampReport>
  <record>
    <sandiRevamp>SANDI_CODE</sandiRevamp>
    <permintaanData>DATA_REQUEST</permintaanData>
    <pic>PIC_NAME</pic>
    <logicLjk><![CDATA[
      // C code for source inherent evaluation
      double evaluate(double param1, double param2) {
          return param1 + param2;
      }
    ]]></logicLjk>
    <logicKonsolidasi><![CDATA[
      // C code for konsolidasi evaluation
      double consolidate(double value) {
          return value * 1.5;
      }
    ]]></logicKonsolidasi>
  </record>
</sourceInherentRevampReport>
```

**Note:** C code in `logicLjk` and `logicKonsolidasi` elements should be wrapped in `<![CDATA[...]]>` sections to preserve special characters.

### Company PIC XML (`--pic`)

The PIC XML file should follow the `prmtr_company` schema structure.

## Output XML Format

### Updated PIC Document (`updated_pic.xml`)

The PIC document will be updated with `sourceInherentEvalResult` nodes containing:

```xml
<sourceInherentEvalResult>
  <sandiRevamp>SANDI_CODE</sandiRevamp>
  <result>EVALUATION_RESULT</result>
</sourceInherentEvalResult>
```

### Updated Document (`updated_doc.xml`)

If konsolidasi evaluation is performed (not skipped), the document will contain `logicKonsolidasiResult` nodes:

```xml
<logicKonsolidasiResult>
  <sandiRevamp>SANDI_CODE</sandiRevamp>
  <result>KONSOLIDASI_RESULT</result>
</logicKonsolidasiResult>
```

## How It Works

1. **XML Parsing**: The CLI parses both input XML files using libxml2
2. **Context Setup**: Creates an `EvalContext` structure with:
   - `pic_doc`: The PIC document to be updated
   - `memo`: A hash table for caching compiled functions
3. **Source Inherent Evaluation** (`evaluate_src_inherent`):
   - Iterates through each record in the input XML
   - Extracts C code from `logicLjk` elements
   - Compiles the code using TCC (Tiny C Compiler)
   - Executes the compiled function to get evaluation results
   - Updates the PIC document with results
4. **Konsolidasi Evaluation** (`evaluate_konsolidasi_inherent`):
   - Similar to source inherent evaluation but processes `logicKonsolidasi`
   - Adds consolidation results to the document
5. **Output**: Saves the updated documents to the specified output paths

## Error Handling

The CLI provides clear error messages for:
- Missing required arguments
- File parsing failures
- Evaluation errors (compilation or execution failures)
- File I/O errors

Exit codes:
- `0` - Success
- `1` - Error (see stderr for details)

## Dependencies

- **GLib 2.0** - Data structures and utilities
- **libxml2** - XML parsing and manipulation
- **libtcc** - Tiny C Compiler for runtime C code compilation
- **GSL** - GNU Scientific Library (for evaluation functions)

## Related Tools

- `eval_cli` - Evaluates risk profile trees
- `build_tree_cli` - Builds and visualizes risk profile trees
- `kpmr_source_tree_cli` - Builds KPMR source trees

## Troubleshooting

### TCC Compilation Errors

If you encounter TCC compilation errors, check that:
- C code in `logicLjk`/`logicKonsolidasi` is syntactically correct
- Required function signatures match expected patterns
- All necessary includes are present in the C code

### File Not Found

Ensure all file paths are correct:
```bash
# Check if files exist
ls -la data/inherent_source.xml
ls -la data/prmtr_company.xml
```

### Permission Errors

Make sure you have read permissions on input files and write permissions on the output directory:
```bash
chmod +r data/inherent_source.xml data/prmtr_company.xml
chmod +w . # or the output directory
```

## License

SPDX-License-Identifier: MIT

## Author

Kenny Karnama <kennykarnama@gmail.com>
