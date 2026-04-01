# Company PIC XML Schema Documentation

## Overview

The `company_pic.xsd` schema defines the structure for company and person-in-charge (PIC) data. This schema validates configuration data for financial institutions (LJK) including company information, contact details, and PIC information.

## Schema Location

- **File**: `schema/company_pic.xsd`
- **Target XML**: `data/company_pic.xml`
- **Namespace**: None (default namespace)
- **Version**: XML Schema 1.0

## Schema Structure

### Root Element: prmtr_company

The root element contains zero or more `DATA_RECORD` entries representing individual company records.

```xml
<prmtr_company>
  <DATA_RECORD>...</DATA_RECORD>
  <DATA_RECORD>...</DATA_RECORD>
  ...
</prmtr_company>
```

**Constraints**:
- Can contain 0 to unlimited `DATA_RECORD` elements
- Elements must appear in sequence

### Complex Type: DataRecordType

Defines the structure of each company data record with 19 fields.

**Elements** (all optional, in strict order):
1. `id` - Unique record identifier
2. `company_name` - Company name
3. `address` - Company address
4. `telephone_no` - Telephone number
5. `feedback` - Feedback or notes
6. `status` - Record status code
7. `draft_name` - Draft name
8. `tag` - Record tag
9. `created_at` - Creation timestamp
10. `created_by` - Creator name
11. `updated_at` - Update timestamp
12. `updated_by` - Updater name
13. `flag` - Internal or external flag
14. `fsi_abbreviation` - FSI abbreviation
15. `fsi_code` - FSI code
16. `type` - Company type
17. `pic_name` - Person in charge name
18. `pic_phone_number` - PIC phone number
19. `pic_email` - PIC email address

```xml
<DATA_RECORD>
  <id>133</id>
  <company_name>PT Bank Sinarmas</company_name>
  <address>Jakarta Pusat</address>
  <telephone_no>021-319-90101</telephone_no>
  <feedback>deleted</feedback>
  <status>6</status>
  <draft_name></draft_name>
  <tag>approve</tag>
  <created_at>2024-07-18 11:10:02.950 +0700</created_at>
  <created_by>John Doe</created_by>
  <updated_at>2025-07-22 15:29:54.210 +0700</updated_at>
  <updated_by>Jane Smith</updated_by>
  <flag>external</flag>
  <fsi_abbreviation>BSIM</fsi_abbreviation>
  <fsi_code>BSIM-001</fsi_code>
  <type>BANK</type>
  <pic_name>John Doe</pic_name>
  <pic_phone_number>0812345678901</pic_phone_number>
  <pic_email>john@bsim.com</pic_email>
</DATA_RECORD>
```

## Data Types

### 1. id (Positive Integer)

**Base Type**: xs:positiveInteger  
**Description**: Unique record identifier  
**Validation Rules**: Must be positive integer (1, 2, 3, ...)

**Example**:
```xml
<id>133</id>
```

### 2. company_name (String)

**Base Type**: xs:string  
**Description**: Company or institution name  
**Validation Rules**: Any string value

**Example**:
```xml
<company_name>PT Bank Sinarmas Tbk</company_name>
```

### 3. address (String)

**Base Type**: xs:string  
**Description**: Company address  
**Validation Rules**: Any string value

**Example**:
```xml
<address>Sinar Mas Land Plaza Tower I, Jl. MH Thamrin No. 51, Jakarta Pusat 10350</address>
```

### 4. telephone_no (String)

**Base Type**: xs:string  
**Description**: Company telephone number  
**Validation Rules**: Any string value (flexible format)

**Examples**:
```xml
<telephone_no>021-319-90101</telephone_no>
<telephone_no>08542195</telephone_no>
```

### 5. feedback (String)

**Base Type**: xs:string  
**Description**: Feedback or notes about the record  
**Validation Rules**: Any string value

**Example**:
```xml
<feedback>deleted</feedback>
```

### 6. StatusType (Integer or Empty)

**Base Type**: Union of xs:positiveInteger and EmptyStringType  
**Description**: Record status code  
**Validation Rules**: Positive integer or empty string

**Valid Values**: 5, 6, 14, 15, 16, 17, or empty

**Examples**:
```xml
<status>6</status>
<status></status>
```

### 7. draft_name (String)

**Base Type**: xs:string  
**Description**: Draft name or identifier  
**Validation Rules**: Any string value

**Example**:
```xml
<draft_name>punya gian</draft_name>
```

### 8. tag (String)

**Base Type**: xs:string  
**Description**: Record tag or label  
**Validation Rules**: Any string value

**Examples**:
```xml
<tag>approve</tag>
<tag>add New</tag>
```

### 9. created_at (String)

**Base Type**: xs:string  
**Description**: Creation timestamp  
**Validation Rules**: Any string value (flexible format)

**Examples**:
```xml
<created_at>2024-07-18 11:10:02.950 +0700</created_at>
<created_at>0001-01-01 07:00:00.000 +0700</created_at>
```

### 10. created_by (String)

**Base Type**: xs:string  
**Description**: Name of person who created the record  
**Validation Rules**: Any string value

**Example**:
```xml
<created_by>Muhammad Refa Yanuar Anshari</created_by>
```

### 11. updated_at (String)

**Base Type**: xs:string  
**Description**: Last update timestamp  
**Validation Rules**: Any string value (flexible format)

**Example**:
```xml
<updated_at>2025-07-22 15:29:54.210 +0700</updated_at>
```

### 12. updated_by (String)

**Base Type**: xs:string  
**Description**: Name of person who last updated the record  
**Validation Rules**: Any string value

**Example**:
```xml
<updated_by>Sidharta G Djugo</updated_by>
```

### 13. FlagType (Enumeration or Empty)

**Base Type**: Union of FlagEnumType and EmptyStringType  
**Description**: Internal or external classification  
**Validation Rules**: Must be "internal", "external", or empty string

**Valid Values**:
- `internal` - Internal company
- `external` - External company
- Empty string

**Examples**:
```xml
<flag>external</flag>
<flag>internal</flag>
<flag></flag>
```

### 14. fsi_abbreviation (String)

**Base Type**: xs:string  
**Description**: Financial Services Institution abbreviation  
**Validation Rules**: Any string value

**Examples**:
```xml
<fsi_abbreviation>BSIM</fsi_abbreviation>
<fsi_abbreviation></fsi_abbreviation>
```

### 15. fsi_code (String)

**Base Type**: xs:string  
**Description**: Financial Services Institution code  
**Validation Rules**: Any string value

**Examples**:
```xml
<fsi_code>BSIM-001</fsi_code>
<fsi_code></fsi_code>
```

### 16. CompanyTypeType (Enumeration or Empty)

**Base Type**: Union of CompanyTypeEnumType and EmptyStringType  
**Description**: Type of financial institution  
**Validation Rules**: Must be one of predefined types or empty

**Valid Values**:
- `BANK` - Banking institution
- `FINANCING_COMPANY` - Financing/pembiayaan company
- `INSURANCE_COMPANY` - Insurance company
- `SECURITIES_COMPANY` - Securities company
- `Perusahaan efek` - Securities company (Indonesian)
- `approve_depthead` - Special approval type
- Empty string

**Examples**:
```xml
<type>BANK</type>
<type>FINANCING_COMPANY</type>
<type>SECURITIES_COMPANY</type>
<type></type>
```

### 17. pic_name (String)

**Base Type**: xs:string  
**Description**: Person in charge (PIC) name  
**Validation Rules**: Any string value

**Example**:
```xml
<pic_name>John Doe</pic_name>
```

### 18. pic_phone_number (String)

**Base Type**: xs:string  
**Description**: PIC phone number  
**Validation Rules**: Any string value (flexible format)

**Example**:
```xml
<pic_phone_number>0812345678901</pic_phone_number>
```

### 19. EmailType (Email Pattern or Empty)

**Base Type**: Union of EmailPatternType and EmptyStringType  
**Description**: PIC email address  
**Validation Rules**: Must be valid email format or empty string

**Pattern**: `[^@]+@[^@]+\.[^@]+` (basic email validation)

**Valid Examples**:
```xml
<pic_email>john@bsim.com</pic_email>
<pic_email>jane.smith@company.co.id</pic_email>
<pic_email></pic_email>
```

**Invalid Examples**:
```xml
<pic_email>invalid-email</pic_email>  <!-- Missing @ and domain -->
<pic_email>@company.com</pic_email>    <!-- Missing local part -->
```

## Validation Rules

### Element Order
- Elements within `DATA_RECORD` must appear in strict order as defined
- Schema uses `xs:sequence` to enforce ordering

### Optional Elements
- **All** elements within `DATA_RECORD` are optional (minOccurs="0")
- Empty strings are explicitly allowed for most fields
- Partial records are valid

### Empty Values
- Most fields accept empty strings
- Uses `EmptyStringType` union for flexible validation
- Allows for incomplete or pending data entry

## Validation Examples

### Valid XML Example

```xml
<?xml version="1.0" encoding="UTF-8"?>
<prmtr_company>
  <!-- Complete record -->
  <DATA_RECORD>
    <id>133</id>
    <company_name>PT Bank Sinarmas</company_name>
    <address>Jakarta Pusat</address>
    <telephone_no>021-319-90101</telephone_no>
    <feedback>deleted</feedback>
    <status>6</status>
    <draft_name></draft_name>
    <tag>approve</tag>
    <created_at>2024-07-18 11:10:02.950 +0700</created_at>
    <created_by>John Doe</created_by>
    <updated_at>2025-07-22 15:29:54.210 +0700</updated_at>
    <updated_by>Jane Smith</updated_by>
    <flag>external</flag>
    <fsi_abbreviation>BSIM</fsi_abbreviation>
    <fsi_code>BSIM-001</fsi_code>
    <type>BANK</type>
    <pic_name>John Doe</pic_name>
    <pic_phone_number>0812345678901</pic_phone_number>
    <pic_email>john@bsim.com</pic_email>
  </DATA_RECORD>
  
  <!-- Minimal record -->
  <DATA_RECORD>
    <id>5</id>
    <company_name>Test Company</company_name>
  </DATA_RECORD>
  
  <!-- Record with empty values -->
  <DATA_RECORD>
    <id>27</id>
    <company_name>Another Company</company_name>
    <flag>internal</flag>
    <fsi_abbreviation></fsi_abbreviation>
    <type></type>
    <pic_email></pic_email>
  </DATA_RECORD>
</prmtr_company>
```

### Invalid XML Examples

**Invalid email format**:
```xml
<DATA_RECORD>
  <pic_email>invalid-email</pic_email>  <!-- ERROR: Not valid email format -->
</DATA_RECORD>
```

**Invalid flag value**:
```xml
<DATA_RECORD>
  <flag>public</flag>  <!-- ERROR: Must be internal, external, or empty -->
</DATA_RECORD>
```

**Invalid type value**:
```xml
<DATA_RECORD>
  <type>INVESTMENT_COMPANY</type>  <!-- ERROR: Not in enumeration -->
</DATA_RECORD>
```

**Wrong element order**:
```xml
<DATA_RECORD>
  <company_name>Test</company_name>  <!-- ERROR: company_name before id -->
  <id>123</id>
</DATA_RECORD>
```

**Invalid ID (not positive)**:
```xml
<DATA_RECORD>
  <id>0</id>  <!-- ERROR: Must be positive integer (1, 2, 3...) -->
</DATA_RECORD>
```

## Validation

### Command Line Validation

```bash
# Validate company PIC data
xmllint --noout --schema schema/company_pic.xsd data/company_pic.xml
```

**Success Output**:
```
data/company_pic.xml validates
```

**Error Output Example**:
```
data/company_pic.xml:45: element pic_email: Schemas validity error : 
Element 'pic_email': [facet 'pattern'] The value 'invalid' is not accepted 
by the pattern '[^@]+@[^@]+\.[^@]+'.
data/company_pic.xml fails to validate
```

### Programmatic Validation

#### Python (lxml)

```python
from lxml import etree

# Load schema
schema = etree.XMLSchema(file='schema/company_pic.xsd')

# Parse and validate XML
doc = etree.parse('data/company_pic.xml')

if schema.validate(doc):
    records = doc.findall('.//DATA_RECORD')
    print(f"Valid! {len(records)} company records")
    
    # Count by type
    banks = len(doc.findall('.//DATA_RECORD[type="BANK"]'))
    financing = len(doc.findall('.//DATA_RECORD[type="FINANCING_COMPANY"]'))
    print(f"  Banks: {banks}")
    print(f"  Financing Companies: {financing}")
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
    xmlSchemaNewParserCtxt("schema/company_pic.xsd");
xmlSchemaPtr schema = xmlSchemaParse(parser_ctxt);

// Load and validate document
xmlDocPtr doc = xmlReadFile("data/company_pic.xml", NULL, 0);
xmlSchemaValidCtxtPtr valid_ctxt = xmlSchemaNewValidCtxt(schema);
int is_valid = xmlSchemaValidateDoc(valid_ctxt, doc);

printf("Company data is %s\n", is_valid == 0 ? "valid" : "invalid");

// Cleanup
xmlSchemaFreeValidCtxt(valid_ctxt);
xmlSchemaFree(schema);
xmlSchemaFreeParserCtxt(parser_ctxt);
xmlFreeDoc(doc);
```

## Schema Design Rationale

### Why All Elements Optional?

**Rationale**:
- Records may be incomplete during data entry
- Not all fields applicable to all companies
- Allows for draft/partial records
- Flexibility for data migration
- Gradual data completion over time

### Why Union Types for Optional Fields?

**Rationale**:
- Allows both meaningful values and empty strings
- Preserves XML structure even when data is missing
- Easier to parse (element always present)
- Clearer than using minOccurs="0"

### Why Flexible String for Timestamps?

**Rationale**:
- Multiple timestamp formats in source data
- Includes timezone information (+0700)
- Special values (0001-01-01 for unset)
- Avoids strict xs:dateTime validation issues
- Can be parsed by application logic

### Why Basic Email Pattern?

**Rationale**:
- Validates basic email format (local@domain.tld)
- Not overly strict (allows various formats)
- Catches obvious typos
- Balances validation with flexibility
- Accepts international domains

### Why Company Type Enumeration?

**Rationale**:
- Ensures consistent categorization
- Prevents typos in company types
- Based on actual OJK institution types
- Includes legacy values (Perusahaan efek)
- Includes special types (approve_depthead)

## Common Use Cases

### 1. Company Registration

Store basic company information:

```xml
<DATA_RECORD>
  <id>150</id>
  <company_name>PT New Bank</company_name>
  <address>Jakarta</address>
  <telephone_no>021-123456</telephone_no>
  <status>5</status>
  <flag>external</flag>
  <type>BANK</type>
</DATA_RECORD>
```

### 2. Complete Company Profile with PIC

Full company data with person in charge:

```xml
<DATA_RECORD>
  <id>133</id>
  <company_name>PT Bank Sinarmas</company_name>
  <address>Sinar Mas Land Plaza Tower I</address>
  <telephone_no>021-319-90101</telephone_no>
  <flag>external</flag>
  <fsi_abbreviation>BSIM</fsi_abbreviation>
  <fsi_code>BSIM-001</fsi_code>
  <type>BANK</type>
  <pic_name>John Doe</pic_name>
  <pic_phone_number>0812345678901</pic_phone_number>
  <pic_email>john@bsim.com</pic_email>
</DATA_RECORD>
```

### 3. Draft/Incomplete Record

Partial data during entry:

```xml
<DATA_RECORD>
  <id>200</id>
  <company_name>New Company Name</company_name>
  <draft_name>pending review</draft_name>
  <status>5</status>
  <fsi_abbreviation></fsi_abbreviation>
  <type></type>
</DATA_RECORD>
```

## Integration with ILF System

### Usage in System

The company PIC data is used for:
- Company identification and lookup
- Contact information management
- PIC assignment and tracking
- Company type categorization
- FSI code mapping

### Data Flow

```
1. Company PIC XML (validated by THIS SCHEMA)
          ↓
2. Parse company records
          ↓
3. Build company lookup table
          ↓
4. Map FSI codes to companies
          ↓
5. Associate PICs with companies
          ↓
6. Use in risk assessment workflows
```

## Statistics (data/company_pic.xml)

- **Total Records**: 168
- **Company Types**: 6 (BANK, FINANCING_COMPANY, INSURANCE_COMPANY, SECURITIES_COMPANY, etc.)
- **File Size**: ~600 KB
- **Lines**: 3577

## Troubleshooting

### Error: "Element 'pic_email': [facet 'pattern'] The value 'invalid' is not accepted"

**Cause**: Email doesn't match basic pattern (local@domain.tld)

**Fix**:
```xml
<!-- Wrong -->
<pic_email>invalid</pic_email>

<!-- Correct -->
<pic_email>user@company.com</pic_email>
<!-- Or leave empty -->
<pic_email></pic_email>
```

### Error: "Element 'flag': 'public' is not an element of the set"

**Cause**: flag value not in enumeration

**Fix**:
```xml
<!-- Wrong -->
<flag>public</flag>

<!-- Correct -->
<flag>external</flag>
<!-- Or -->
<flag>internal</flag>
```

### Error: "Element 'type': 'INVESTMENT' is not an element of the set"

**Cause**: type value not in enumeration

**Fix**:
```xml
<!-- Wrong -->
<type>INVESTMENT</type>

<!-- Correct (use closest match) -->
<type>FINANCING_COMPANY</type>
```

### Error: "Element 'company_name': This element is not expected"

**Cause**: Elements out of order

**Fix**:
```xml
<!-- Wrong order -->
<DATA_RECORD>
  <company_name>Test</company_name>
  <id>123</id>
</DATA_RECORD>

<!-- Correct order (id first) -->
<DATA_RECORD>
  <id>123</id>
  <company_name>Test</company_name>
</DATA_RECORD>
```

## Best Practices

1. **Always validate** after editing company_pic.xml
2. **Use consistent formats** for phone numbers and timestamps
3. **Provide PIC information** when available
4. **Use FSI codes** for proper company identification
5. **Keep email addresses valid** (or leave empty)
6. **Document changes** in feedback field
7. **Version control** for schema and data files

## Maintenance

### Adding New Company Types

To add a new company type:

1. Update CompanyTypeEnumType in schema:
```xml
<xs:simpleType name="CompanyTypeEnumType">
  <xs:restriction base="xs:string">
    <!-- ... existing values ... -->
    <xs:enumeration value="NEW_TYPE"/>
  </xs:restriction>
</xs:simpleType>
```

2. Revalidate: `xmllint --noout --schema schema/company_pic.xsd data/company_pic.xml`

### Updating Email Validation

To make email validation stricter:

```xml
<xs:simpleType name="EmailPatternType">
  <xs:restriction base="xs:string">
    <!-- More strict pattern -->
    <xs:pattern value="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"/>
  </xs:restriction>
</xs:simpleType>
```

## Related Documentation

- `docs/SCHEMA_DOCUMENTATION.md` - Risk profile output schema
- `docs/RATING_SCHEMA_DOCUMENTATION.md` - Rating to score schema
- `docs/SOURCE_INHERENT_SCHEMA_DOCUMENTATION.md` - Source inherent schema
- `README.md` - Project overview

## Version History

- **v1.0** (2025-11-30)
  - Initial schema creation
  - 6 company types supported
  - Basic email validation
  - Union types for flexible empty values
  - All elements optional
  - Successfully validates data/company_pic.xml (168 records)
