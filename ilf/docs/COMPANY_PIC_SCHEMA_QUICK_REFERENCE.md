# Company PIC Schema - Quick Reference

## Quick Validation

```bash
xmllint --noout --schema schema/company_pic.xsd data/company_pic.xml
```

## Schema Summary

| Element | Type | Constraints | Required |
|---------|------|-------------|----------|
| **id** | Positive Integer | Must be > 0 | No |
| **company_name** | String | Any | No |
| **address** | String | Any | No |
| **telephone_no** | String | Any format | No |
| **feedback** | String | Any | No |
| **status** | Integer or Empty | Positive integer | No |
| **draft_name** | String | Any | No |
| **tag** | String | Any | No |
| **created_at** | String | Timestamp format | No |
| **created_by** | String | Any | No |
| **updated_at** | String | Timestamp format | No |
| **updated_by** | String | Any | No |
| **flag** | Enumeration or Empty | internal, external, or empty | No |
| **fsi_abbreviation** | String | Any | No |
| **fsi_code** | String | Any | No |
| **type** | Enumeration or Empty | 6 types or empty | No |
| **pic_name** | String | Any | No |
| **pic_phone_number** | String | Any format | No |
| **pic_email** | Email or Empty | Valid email or empty | No |

## Valid Structure

```xml
<prmtr_company>
  <DATA_RECORD>
    <id>positive integer</id>
    <company_name>string</company_name>
    <address>string</address>
    <telephone_no>string</telephone_no>
    <feedback>string</feedback>
    <status>integer or empty</status>
    <draft_name>string</draft_name>
    <tag>string</tag>
    <created_at>timestamp string</created_at>
    <created_by>string</created_by>
    <updated_at>timestamp string</updated_at>
    <updated_by>string</updated_by>
    <flag>internal|external|empty</flag>
    <fsi_abbreviation>string</fsi_abbreviation>
    <fsi_code>string</fsi_code>
    <type>BANK|FINANCING_COMPANY|...|empty</type>
    <pic_name>string</pic_name>
    <pic_phone_number>string</pic_phone_number>
    <pic_email>email@domain.com or empty</pic_email>
  </DATA_RECORD>
</prmtr_company>
```

## Flag Values

| Value | Description |
|-------|-------------|
| internal | Internal company |
| external | External company |
| (empty) | Not specified |

## Company Types

| Value | Description |
|-------|-------------|
| BANK | Banking institution |
| FINANCING_COMPANY | Financing/pembiayaan company |
| INSURANCE_COMPANY | Insurance company |
| SECURITIES_COMPANY | Securities company |
| Perusahaan efek | Securities company (Indonesian) |
| approve_depthead | Special approval type |
| (empty) | Not specified |

## Validation Rules

✅ **Allowed**
- All elements optional
- Empty strings for most fields
- Any number of DATA_RECORD (0+)
- Flexible phone number formats
- Flexible timestamp formats
- Valid email format: local@domain.tld

❌ **Invalid**
- ID must be positive (not 0 or negative)
- flag must be internal, external, or empty
- type must be one of 6 types or empty
- pic_email must be valid email or empty
- Elements must be in specified order

## Example Valid Records

### Complete Record
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

### Minimal Record
```xml
<DATA_RECORD>
  <id>5</id>
  <company_name>Test Company</company_name>
</DATA_RECORD>
```

### Record with Empty Values
```xml
<DATA_RECORD>
  <id>27</id>
  <company_name>Another Company</company_name>
  <flag>internal</flag>
  <fsi_abbreviation></fsi_abbreviation>
  <type></type>
  <pic_email></pic_email>
</DATA_RECORD>
```

## Common Errors

| Error Message | Problem | Solution |
|---------------|---------|----------|
| "Element 'pic_email': [facet 'pattern'] ... not accepted" | Invalid email format | Use email@domain.com or leave empty |
| "Element 'flag': 'public' is not an element of the set" | Invalid flag value | Use: internal, external, or empty |
| "Element 'type': 'INVESTMENT' is not an element" | Invalid type | Use: BANK, FINANCING_COMPANY, etc. |
| "Element 'company_name': This element is not expected" | Wrong order | Follow element order (id first) |
| "Element 'id': '0' is not a valid value" | ID not positive | Use positive integers (1, 2, 3...) |

## Python Validation

```python
from lxml import etree

schema = etree.XMLSchema(file='schema/company_pic.xsd')
doc = etree.parse('data/company_pic.xml')

if schema.validate(doc):
    records = doc.findall('.//DATA_RECORD')
    print(f"Valid! {len(records)} records")
else:
    for error in schema.error_log:
        print(f"Line {error.line}: {error.message}")
```

## Email Pattern

**Pattern**: `[^@]+@[^@]+\.[^@]+`

**Valid**:
- john@bsim.com
- jane.smith@company.co.id
- user+tag@domain.com

**Invalid**:
- invalid-email (no @)
- @company.com (no local part)
- user@domain (no TLD)

## Data Types

```xml
<!-- Positive integer for ID -->
<xs:element name="id" type="xs:positiveInteger"/>

<!-- String fields -->
<xs:element name="company_name" type="xs:string"/>
<xs:element name="address" type="xs:string"/>

<!-- Union types (value or empty) -->
<xs:simpleType name="StatusType">
  <xs:union memberTypes="xs:positiveInteger EmptyStringType"/>
</xs:simpleType>

<xs:simpleType name="FlagType">
  <xs:union memberTypes="FlagEnumType EmptyStringType"/>
</xs:simpleType>

<xs:simpleType name="EmailType">
  <xs:union memberTypes="EmailPatternType EmptyStringType"/>
</xs:simpleType>
```

## Element Order

Elements must appear in this order:
1. id
2. company_name
3. address
4. telephone_no
5. feedback
6. status
7. draft_name
8. tag
9. created_at
10. created_by
11. updated_at
12. updated_by
13. flag
14. fsi_abbreviation
15. fsi_code
16. type
17. pic_name
18. pic_phone_number
19. pic_email

## Files

- **Schema**: `schema/company_pic.xsd`
- **Data**: `data/company_pic.xml` (168 records)
- **Full Docs**: `docs/COMPANY_PIC_SCHEMA_DOCUMENTATION.md`

## Statistics

- **Total Records**: 168
- **Company Types**: 6
- **File Size**: ~600 KB
- **Validation**: ✅ Passes

## Quick Tips

1. ✅ All elements optional - use as needed
2. ✅ Empty strings allowed for most fields
3. ✅ ID must be positive integer (1, 2, 3...)
4. ✅ flag: internal, external, or empty
5. ✅ type: 6 predefined types or empty
6. ✅ pic_email: valid email or empty
7. ⚠️ Keep element order correct
8. ⚠️ Validate after every edit
