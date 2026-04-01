# Source Inherent Out XML Schema Documentation

## Overview

The `source_inherent_out.xsd` schema defines the structure for source inherent risk data reports. This schema validates configuration data for risk assessment across multiple risk categories and financial institutions (LJK - Lembaga Jasa Keuangan).

## Schema Location

- **File**: `schema/source_inherent_out.xsd`
- **Target XML**: `data/source_inherent_out.xml`
- **Namespace**: None (default namespace)
- **Version**: XML Schema 1.0

## Schema Structure

### Root Element: sourceInherentRevampReport

The root element contains zero or more `record` entries representing individual data requests or calculations.

```xml
<sourceInherentRevampReport>
  <record>...</record>
  <record>...</record>
  ...
</sourceInherentRevampReport>
```

**Constraints**:
- Can contain 0 to unlimited `record` elements
- Elements must appear in sequence
- Empty records are allowed

### Complex Type: RecordType

Defines the structure of each data record entry for risk assessment.

**Elements** (all optional, in strict order):
1. `risiko` - Risk category
2. `sandiBefore` - Previous code identifier
3. `sandiRevamp` - New revamped code identifier (SI format)
4. `permintaanData` - Data request description
5. `pic` - Person/entity in charge
6. `petunjukPengisian` - Filling instructions
7. `kualitatifKuantitatif` - Qualitative or quantitative indicator
8. `inputType` - Input method type
9. `logicLjk` - Institution-specific logic/formula
10. `logicKonsolidasi` - Consolidation logic/formula

```xml
<record>
  <risiko>Kredit</risiko>
  <sandiBefore>001</sandiBefore>
  <sandiRevamp>SI01001000</sandiRevamp>
  <permintaanData>Total Aset</permintaanData>
  <pic>All LJK</pic>
  <petunjukPengisian>Diisi Nominal Total Aset</petunjukPengisian>
  <kualitatifKuantitatif>kuantitatif</kualitatifKuantitatif>
  <inputType>input</inputType>
  <logicKonsolidasi>sum</logicKonsolidasi>
</record>
```

## Data Types

### 1. RisikoType (Risk Category)

**Base Type**: xs:string (enumeration)  
**Description**: Standard risk categories for financial institutions  
**Validation Rules**: Must be one of the predefined risk categories

**Valid Values**:
- `Kredit` - Credit risk
- `Pasar` - Market risk
- `Likuiditas` - Liquidity risk
- `Operasional` - Operational risk
- `Hukum` - Legal risk
- `Reputasi` - Reputation risk
- `Stratejik` - Strategic risk
- `Kepatuhan` - Compliance risk
- `Intragrup` - Intragroup risk
- `Asuransi` - Insurance risk
- `Investasi` - Investment risk
- `Imbal Hasil` - Return/Yield risk

**Example**:
```xml
<risiko>Kredit</risiko>
```

### 2. SandiRevampType (Revamped Code)

**Base Type**: xs:string (pattern)  
**Description**: Standardized code identifier for data items  
**Validation Rules**: Must match pattern `SI[0-9]{8}`

**Pattern**: `SI` followed by exactly 8 digits

**Valid Examples**:
- `SI01001000`
- `SI02034000`
- `SI03005000`

**Invalid Examples**:
- `SI1001` (too few digits)
- `SI0100100000` (too many digits)
- `01001000` (missing SI prefix)

**Example**:
```xml
<sandiRevamp>SI01001000</sandiRevamp>
```

### 3. KualitatifKuantitatifType

**Base Type**: xs:string (enumeration)  
**Description**: Data classification type  
**Validation Rules**: Must be either qualitative or quantitative

**Valid Values**:
- `kualitatif` - Qualitative data
- `kuantitatif` - Quantitative data

**Example**:
```xml
<kualitatifKuantitatif>kuantitatif</kualitatifKuantitatif>
```

### 4. InputTypeType

**Base Type**: xs:string (enumeration)  
**Description**: Method of data input or calculation  
**Validation Rules**: Must be one of the predefined input types

**Valid Values**:
- `input` / `Input` - Manual input
- `threshold` / `Threshold` - Threshold-based
- `sistem` / `Sistem` / `system` - System-calculated

**Example**:
```xml
<inputType>input</inputType>
```

### 5. LogicKonsolidasiType

**Base Type**: xs:string  
**Description**: Consolidation logic or formula  
**Validation Rules**: Non-empty string (minimum length 1)

**Common Values**:
- `sum` / `SUM` - Sum aggregation
- `average` / `AVERAGE` - Average calculation
- `min` / `MIN` - Minimum value
- `max` / `MAX` - Maximum value
- `Rounded AVERAGE` - Rounded average
- `countif percentage` - Conditional count percentage
- `Conditional IF` - Conditional logic
- `Min value` - Minimum value selection
- Custom formulas and expressions

**Note**: This field is flexible and accepts any non-empty string to accommodate various formulas and expressions.

**Examples**:
```xml
<logicKonsolidasi>sum</logicKonsolidasi>
<logicKonsolidasi>AVERAGE</logicKonsolidasi>
<logicKonsolidasi>( SI01023001 + SI01023002 + SI01023003 ) / SI01001000</logicKonsolidasi>
<logicKonsolidasi>Conditional IF</logicKonsolidasi>
```

### 6. Simple String Types

The following elements use xs:string without restrictions:
- `sandiBefore` - Previous code (any string)
- `permintaanData` - Data request description
- `pic` - Person in charge
- `petunjukPengisian` - Filling instructions
- `logicLjk` - Institution-specific logic

## Validation Rules

### Element Order
- Elements within `record` must appear in strict order as defined
- Schema uses `xs:sequence` to enforce ordering

### Optional Elements
- **All** elements within `record` are optional (minOccurs="0")
- Empty records are valid
- Partial records are valid

### Record Cardinality
- Root element can contain 0 to unlimited records
- `minOccurs="0"` allows empty reports
- `maxOccurs="unbounded"` allows any number of records

## Validation Examples

### Valid XML Example

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<sourceInherentRevampReport>
  <!-- Basic input record -->
  <record>
    <risiko>Kredit</risiko>
    <sandiBefore>001</sandiBefore>
    <sandiRevamp>SI01001000</sandiRevamp>
    <permintaanData>Total Aset</permintaanData>
    <pic>All LJK</pic>
    <petunjukPengisian>Diisi Nominal Total Aset</petunjukPengisian>
    <kualitatifKuantitatif>kuantitatif</kualitatifKuantitatif>
    <inputType>input</inputType>
    <logicKonsolidasi>sum</logicKonsolidasi>
  </record>
  
  <!-- Record with calculation logic -->
  <record>
    <risiko>Pasar</risiko>
    <sandiBefore>500</sandiBefore>
    <sandiRevamp>SI02023000</sandiRevamp>
    <permintaanData>Rasio Konsentrasi</permintaanData>
    <pic>Bank</pic>
    <petunjukPengisian>Otomatis terkalkulasi</petunjukPengisian>
    <kualitatifKuantitatif>kuantitatif</kualitatifKuantitatif>
    <logicLjk>( SI01023001 + SI01023002 ) / SI01001000</logicLjk>
    <logicKonsolidasi>AVERAGE</logicKonsolidasi>
  </record>
  
  <!-- Empty record (valid) -->
  <record>
  </record>
  
  <!-- Partial record (valid) -->
  <record>
    <risiko>Operasional</risiko>
    <sandiRevamp>SI04001000</sandiRevamp>
  </record>
</sourceInherentRevampReport>
```

### Invalid XML Examples

**Invalid sandiRevamp pattern**:
```xml
<record>
  <sandiRevamp>SI1001</sandiRevamp>  <!-- ERROR: Must be SI + 8 digits -->
</record>
```

**Invalid risiko value**:
```xml
<record>
  <risiko>Technology</risiko>  <!-- ERROR: Not in enumeration list -->
</record>
```

**Invalid kualitatifKuantitatif value**:
```xml
<record>
  <kualitatifKuantitatif>mixed</kualitatifKuantitatif>  <!-- ERROR: Must be kualitatif or kuantitatif -->
</record>
```

**Wrong element order**:
```xml
<record>
  <sandiRevamp>SI01001000</sandiRevamp>  <!-- ERROR: sandiRevamp before risiko -->
  <risiko>Kredit</risiko>
</record>
```

## Validation

### Command Line Validation

```bash
# Validate source inherent data
xmllint --noout --schema schema/source_inherent_out.xsd data/source_inherent_out.xml
```

**Success Output**:
```
data/source_inherent_out.xml validates
```

**Error Output Example**:
```
data/source_inherent_out.xml:10: element sandiRevamp: Schemas validity error : 
Element 'sandiRevamp': [facet 'pattern'] The value 'SI123' is not accepted by 
the pattern 'SI[0-9]{8}'.
data/source_inherent_out.xml fails to validate
```

### Programmatic Validation

#### Python (lxml)

```python
from lxml import etree

# Load schema
schema = etree.XMLSchema(file='schema/source_inherent_out.xsd')

# Parse and validate XML
doc = etree.parse('data/source_inherent_out.xml')

if schema.validate(doc):
    print("Valid!")
    print(f"Total records: {len(doc.findall('.//record'))}")
else:
    print("Invalid:")
    for error in schema.error_log:
        print(f"  Line {error.line}: {error.message}")
```

#### C (libxml2)

```c
#include <libxml/xmlschemas.h>

// Load schema
xmlSchemaParserCtxtPtr parser_ctxt = 
    xmlSchemaNewParserCtxt("schema/source_inherent_out.xsd");
xmlSchemaPtr schema = xmlSchemaParse(parser_ctxt);

// Load and validate document
xmlDocPtr doc = xmlReadFile("data/source_inherent_out.xml", NULL, 0);
xmlSchemaValidCtxtPtr valid_ctxt = xmlSchemaNewValidCtxt(schema);
int is_valid = xmlSchemaValidateDoc(valid_ctxt, doc);

printf("Document is %s\n", is_valid == 0 ? "valid" : "invalid");

// Cleanup
xmlSchemaFreeValidCtxt(valid_ctxt);
xmlSchemaFree(schema);
xmlSchemaFreeParserCtxt(parser_ctxt);
xmlFreeDoc(doc);
```

## Schema Design Rationale

### Why All Elements Optional?

**Rationale**:
- Records can represent various types of data (input, calculated, threshold)
- Not all fields are applicable to all record types
- Empty records may be placeholders or section markers
- Flexibility for evolving data requirements

### Why Strict Element Ordering?

**Rationale**:
- Consistent data format across all records
- Easier to parse and process
- Human-readable structure
- Predictable file format

### Why Flexible logicKonsolidasi?

**Rationale**:
- Supports diverse calculation methods (sum, average, min, max, formulas)
- Allows custom expressions and complex formulas
- Accommodates conditional logic
- Prevents schema from becoming outdated as new logic types are added

### Why Pattern Validation for sandiRevamp?

**Rationale**:
- Ensures standardized code format (SI + 8 digits)
- Prevents typos and formatting errors
- Enables reliable code-based lookups
- Maintains consistency across systems

## Common Use Cases

### 1. Risk Data Collection

The schema validates data collection templates for various risk categories:

```xml
<record>
  <risiko>Kredit</risiko>
  <permintaanData>Total Kredit atau Pembiayaan</permintaanData>
  <pic>Bank, Perusahaan Pembiayaan</pic>
  <kualitatifKuantitatif>kuantitatif</kualitatifKuantitatif>
  <inputType>input</inputType>
</record>
```

### 2. Calculated Fields

Records with calculation logic:

```xml
<record>
  <risiko>Pasar</risiko>
  <sandiRevamp>SI02023000</sandiRevamp>
  <permintaanData>Rasio Konsentrasi</permintaanData>
  <inputType>sistem</inputType>
  <logicLjk>( SI01023001 + SI01023002 ) / SI01001000</logicLjk>
  <logicKonsolidasi>AVERAGE</logicKonsolidasi>
</record>
```

### 3. Threshold-Based Assessment

Records using threshold methodology:

```xml
<record>
  <risiko>Operasional</risiko>
  <sandiRevamp>SI04018000</sandiRevamp>
  <permintaanData>Proses penyediaan dana</permintaanData>
  <kualitatifKuantitatif>kualitatif</kualitatifKuantitatif>
  <inputType>threshold</inputType>
  <petunjukPengisian>Pilih angka 1-5 sesuai kondisi perusahaan</petunjukPengisian>
</record>
```

## Integration with ILF System

### Files Using This Schema

1. **data/source_inherent_out.xml**
   - Source inherent risk data configuration
   - 399 records (as of validation)
   - Multiple risk categories

2. **data/source_inherent_out_fx_tests.xml**
   - Test data for evaluation functions
   - Uses same schema structure

3. **src/eval.c, src/xmlh.c**
   - Reads source inherent data
   - Uses XPath: `/sourceInherentRevampReport/record`
   - Extracts sandiRevamp, values for calculations

### Data Flow

```
1. Source inherent XML (validated by THIS SCHEMA)
          ↓
2. Parse and extract sandi codes
          ↓
3. Lookup values by sandiRevamp code
          ↓
4. Apply logicLjk formulas
          ↓
5. Use in risk profile evaluation
          ↓
6. Apply logicKonsolidasi for aggregation
          ↓
7. Generate risk assessment results
```

## Record Types

### Type 1: Input Records
Records requiring manual data entry:
- `inputType`: input/Input
- Has `petunjukPengisian` with instructions
- Used for collecting LJK data

### Type 2: Calculated Records
Records with system calculations:
- `inputType`: sistem/Sistem/system
- Has `logicLjk` with formula
- Automatically calculated from other fields

### Type 3: Threshold Records
Records using threshold assessment:
- `inputType`: threshold/Threshold
- Has instructions for selecting rating (1-5)
- Used for qualitative assessments

### Type 4: Empty Records
Placeholders or section markers:
- No elements (empty record tags)
- Valid according to schema
- May serve organizational purpose

## Statistics (data/source_inherent_out.xml)

- **Total Records**: 399
- **Risk Categories**: 12 (Kredit, Pasar, Likuiditas, Operasional, Hukum, Reputasi, Stratejik, Kepatuhan, Intragrup, Asuransi, Investasi, Imbal Hasil)
- **File Size**: ~615 KB
- **Lines**: 4503

## Troubleshooting

### Error: "Element 'sandiRevamp': [facet 'pattern'] The value 'SI123' is not accepted"

**Cause**: sandiRevamp doesn't match SI + 8 digits pattern

**Fix**:
```xml
<!-- Wrong -->
<sandiRevamp>SI123</sandiRevamp>

<!-- Correct -->
<sandiRevamp>SI00000123</sandiRevamp>
```

### Error: "Element 'risiko': 'Technology' is not an element of the set"

**Cause**: risiko value not in enumeration list

**Fix**:
```xml
<!-- Wrong -->
<risiko>Technology</risiko>

<!-- Correct (use closest match) -->
<risiko>Operasional</risiko>
```

### Error: "Element 'sandiRevamp': This element is not expected"

**Cause**: Elements out of order

**Fix**:
```xml
<!-- Wrong order -->
<record>
  <sandiRevamp>SI01001000</sandiRevamp>
  <risiko>Kredit</risiko>
</record>

<!-- Correct order -->
<record>
  <risiko>Kredit</risiko>
  <sandiRevamp>SI01001000</sandiRevamp>
</record>
```

## Best Practices

1. **Always validate** after editing source_inherent_out.xml
2. **Use standard codes** for sandiRevamp (SI + 8 digits)
3. **Document formulas** clearly in logicLjk and logicKonsolidasi
4. **Consistent casing** for enumerated values
5. **Maintain order** of elements within records
6. **Test calculations** before deploying
7. **Version control** for schema and data files

## Maintenance

### Adding New Risk Categories

To add a new risk category:

1. Update RisikoType in schema:
```xml
<xs:simpleType name="RisikoType">
  <xs:restriction base="xs:string">
    <!-- ... existing values ... -->
    <xs:enumeration value="NewRiskType"/>
  </xs:restriction>
</xs:simpleType>
```

2. Revalidate: `xmllint --noout --schema schema/source_inherent_out.xsd data/source_inherent_out.xml`

### Extending Input Types

To add new input types:

1. Update InputTypeType in schema:
```xml
<xs:simpleType name="InputTypeType">
  <xs:restriction base="xs:string">
    <!-- ... existing values ... -->
    <xs:enumeration value="newType"/>
  </xs:restriction>
</xs:simpleType>
```

## Related Documentation

- `docs/SCHEMA_DOCUMENTATION.md` - Risk profile output schema
- `docs/RATING_SCHEMA_DOCUMENTATION.md` - Rating to score schema
- `docs/CLI_USAGE.md` - CLI tool usage
- `README.md` - Project overview

## Version History

- **v1.0** (2025-11-30)
  - Initial schema creation
  - 12 risk categories
  - SI code pattern validation (SI + 8 digits)
  - Flexible logicKonsolidasi (any non-empty string)
  - All elements optional
  - Strict element ordering
  - Successfully validates data/source_inherent_out.xml (399 records)
