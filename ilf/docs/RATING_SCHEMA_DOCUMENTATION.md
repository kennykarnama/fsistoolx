# Rating to Score XML Schema Documentation

## Overview

The `rating_to_score.xsd` schema defines the structure for mapping risk ratings (1-5) to numerical scores with associated weights. This schema ensures data integrity for the rating-to-score conversion table used in risk profile evaluations.

## Schema Location

- **File**: `schema/rating_to_score.xsd`
- **Target XML**: `data/rating_to_score.xml`
- **Namespace**: None (default namespace)
- **Version**: XML Schema 1.0

## Schema Structure

### Root Element: RatingScores

The root element contains one or more `RatingScore` entries.

```xml
<RatingScores>
  <RatingScore>...</RatingScore>
  <RatingScore>...</RatingScore>
  ...
</RatingScores>
```

**Constraints**:
- Must contain at least 1 `RatingScore` element
- Can contain unlimited `RatingScore` elements
- Elements must appear in sequence

### Complex Type: RatingScoreType

Defines the structure of each rating-to-score mapping entry.

**Elements** (in strict order):
1. `Rating` - The risk rating value
2. `Score` - The corresponding numerical score
3. `weight` - The weight factor for calculations

```xml
<RatingScore>
  <Rating>4</Rating>
  <Score>44</Score>
  <weight>0.28</weight>
</RatingScore>
```

## Data Types

### 1. RatingValueType

**Base Type**: xs:integer  
**Description**: Risk rating value  
**Validation Rules**:
- Minimum value: 1
- Maximum value: 5
- Must be an integer

**Valid Values**: 1, 2, 3, 4, 5

**Example**:
```xml
<Rating>4</Rating>
```

### 2. ScoreValueType

**Base Type**: xs:integer  
**Description**: Numerical score corresponding to the rating  
**Validation Rules**:
- Minimum value: 0
- Maximum value: 100
- Must be an integer

**Valid Values**: Any integer from 0 to 100

**Example**:
```xml
<Score>44</Score>
```

### 3. WeightValueType

**Base Type**: xs:decimal  
**Description**: Weight factor for score calculations  
**Validation Rules**:
- Minimum value: 0.0
- Maximum value: 1.0
- Decimal precision allowed

**Valid Values**: Any decimal from 0.0 to 1.0 (e.g., 0.28, 0.5, 1.0)

**Example**:
```xml
<weight>0.28</weight>
```

## Validation Rules

### Element Order
- Elements within `RatingScore` must appear in strict order:
  1. Rating
  2. Score  
  3. weight
- Schema uses `xs:sequence` to enforce this ordering

### Required Elements
- All three elements (Rating, Score, weight) are mandatory
- No optional elements allowed

### Value Constraints

| Element | Type    | Min   | Max   | Required |
|---------|---------|-------|-------|----------|
| Rating  | integer | 1     | 5     | Yes      |
| Score   | integer | 0     | 100   | Yes      |
| weight  | decimal | 0.0   | 1.0   | Yes      |

## Usage Examples

### Valid XML Example

```xml
<?xml version="1.0" encoding="UTF-8"?>
<RatingScores>
  <RatingScore>
    <Rating>1</Rating>
    <Score>92</Score>
    <weight>0.28</weight>
  </RatingScore>
  <RatingScore>
    <Rating>2</Rating>
    <Score>76</Score>
    <weight>0.28</weight>
  </RatingScore>
  <RatingScore>
    <Rating>3</Rating>
    <Score>60</Score>
    <weight>0.28</weight>
  </RatingScore>
  <RatingScore>
    <Rating>4</Rating>
    <Score>44</Score>
    <weight>0.28</weight>
  </RatingScore>
  <RatingScore>
    <Rating>5</Rating>
    <Score>28</Score>
    <weight>0.28</weight>
  </RatingScore>
</RatingScores>
```

### Invalid Examples

**Invalid Rating (out of range)**:
```xml
<RatingScore>
  <Rating>6</Rating>  <!-- ERROR: Maximum is 5 -->
  <Score>10</Score>
  <weight>0.28</weight>
</RatingScore>
```

**Invalid Score (out of range)**:
```xml
<RatingScore>
  <Rating>3</Rating>
  <Score>150</Score>  <!-- ERROR: Maximum is 100 -->
  <weight>0.28</weight>
</RatingScore>
```

**Invalid Weight (out of range)**:
```xml
<RatingScore>
  <Rating>2</Rating>
  <Score>76</Score>
  <weight>1.5</weight>  <!-- ERROR: Maximum is 1.0 -->
</RatingScore>
```

**Wrong Element Order**:
```xml
<RatingScore>
  <Score>44</Score>      <!-- ERROR: Must come after Rating -->
  <Rating>4</Rating>
  <weight>0.28</weight>
</RatingScore>
```

## Validation

### Command Line Validation

Validate an XML file against the schema using `xmllint`:

```bash
xmllint --noout --schema schema/rating_to_score.xsd data/rating_to_score.xml
```

**Success Output**:
```
data/rating_to_score.xml validates
```

**Error Output Example**:
```
data/rating_to_score.xml:3: element Rating: Schemas validity error : 
Element 'Rating': '6' is not a valid value of the atomic type 'RatingValueType'.
data/rating_to_score.xml fails to validate
```

### Programmatic Validation

#### Python (lxml)

```python
from lxml import etree

# Load schema
with open('schema/rating_to_score.xsd', 'rb') as f:
    schema_root = etree.XML(f.read())
schema = etree.XMLSchema(schema_root)

# Parse and validate XML
with open('data/rating_to_score.xml', 'rb') as f:
    doc = etree.parse(f)
    
if schema.validate(doc):
    print("Valid!")
else:
    print("Invalid:")
    for error in schema.error_log:
        print(f"  {error}")
```

#### C (libxml2)

```c
#include <libxml/xmlschemas.h>

xmlSchemaParserCtxtPtr parser_ctxt;
xmlSchemaPtr schema;
xmlSchemaValidCtxtPtr valid_ctxt;
xmlDocPtr doc;

// Load schema
parser_ctxt = xmlSchemaNewParserCtxt("schema/rating_to_score.xsd");
schema = xmlSchemaParse(parser_ctxt);

// Load XML document
doc = xmlReadFile("data/rating_to_score.xml", NULL, 0);

// Validate
valid_ctxt = xmlSchemaNewValidCtxt(schema);
int is_valid = xmlSchemaValidateDoc(valid_ctxt, doc);

if (is_valid == 0) {
    printf("Document is valid\n");
} else {
    printf("Document is invalid\n");
}

// Cleanup
xmlSchemaFreeValidCtxt(valid_ctxt);
xmlSchemaFree(schema);
xmlSchemaFreeParserCtxt(parser_ctxt);
xmlFreeDoc(doc);
```

## Schema Design Rationale

### Why These Constraints?

1. **Rating Range (1-5)**
   - Standard risk rating scale
   - Matches common risk assessment frameworks
   - Prevents invalid rating values

2. **Score Range (0-100)**
   - Percentage-based scoring system
   - Intuitive and widely understood
   - Allows for full range of scores

3. **Weight Range (0.0-1.0)**
   - Normalized weight factor
   - Enables proportional calculations
   - Standard mathematical convention

4. **Strict Ordering**
   - Ensures consistent data format
   - Simplifies parsing logic
   - Makes files human-readable

5. **All Elements Required**
   - Complete mapping information needed
   - Prevents incomplete data entries
   - Ensures calculation reliability

## Common Use Cases

### 1. Risk Profile Evaluation

The rating-to-score mapping is used in the evaluation pipeline:

```
Threshold Function → Rating (1-5)
       ↓
Rating to Score Mapping → Score (0-100)
       ↓
Score × Weight → Weighted Score
```

### 2. Configuration Management

- Centralized rating-to-score configuration
- Easy to update scoring rules
- Version controlled mappings

### 3. Integration Testing

- Validate test data before processing
- Ensure configuration integrity
- Catch data errors early

## Integration with ILF System

### Files Using This Schema

1. **data/rating_to_score.xml**
   - Primary rating-to-score mapping file
   - Used by evaluation engine
   - Validated by this schema

2. **src/eval.c**
   - Reads rating_to_score.xml
   - Uses xpath: `/RatingScores/RatingScore`
   - Extracts Rating, Score, weight elements

3. **src/eval_cli.c, src/eval_server.c**
   - Load rating mappings during evaluation
   - Apply weights to calculated scores
   - Require valid schema-compliant data

### Evaluation Pipeline

```
1. Parse risk profile XML
2. Build risk profile tree
3. Evaluate logic functions → raw scores
4. Apply threshold functions → ratings (1-5)
5. Load rating_to_score.xml (THIS SCHEMA)
6. Map ratings to scores
7. Apply weights → final weighted scores
8. Save results
```

## Maintenance

### Adding New Rating Levels

If you need to support additional rating levels (e.g., 1-10 scale):

1. Update `RatingValueType` in schema:
   ```xml
   <xs:simpleType name="RatingValueType">
     <xs:restriction base="xs:integer">
       <xs:minInclusive value="1"/>
       <xs:maxInclusive value="10"/>  <!-- Changed from 5 -->
     </xs:restriction>
   </xs:simpleType>
   ```

2. Update `rating_to_score.xml` with new entries
3. Revalidate: `xmllint --noout --schema schema/rating_to_score.xsd data/rating_to_score.xml`

### Changing Score Range

If you need different score ranges (e.g., 0-1000):

1. Update `ScoreValueType` in schema:
   ```xml
   <xs:simpleType name="ScoreValueType">
     <xs:restriction base="xs:integer">
       <xs:minInclusive value="0"/>
       <xs:maxInclusive value="1000"/>  <!-- Changed from 100 -->
     </xs:restriction>
   </xs:simpleType>
   ```

2. Update score values in XML
3. Revalidate

## Troubleshooting

### Common Validation Errors

**Error**: "Element 'Rating': '0' is not a valid value"  
**Cause**: Rating value is below minimum (1)  
**Fix**: Use rating values between 1 and 5

**Error**: "Element 'weight': '1.5' is not a valid value"  
**Cause**: Weight exceeds maximum (1.0)  
**Fix**: Use weight values between 0.0 and 1.0

**Error**: "Element 'weight': This element is not expected"  
**Cause**: Elements out of order  
**Fix**: Ensure order is Rating, Score, weight

**Error**: "Element 'RatingScores': Missing child element"  
**Cause**: No RatingScore elements present  
**Fix**: Add at least one RatingScore entry

## Best Practices

1. **Always validate** after editing rating_to_score.xml
2. **Use version control** for schema and data files
3. **Document changes** to rating or scoring rules
4. **Test thoroughly** after modifying mappings
5. **Validate in CI/CD** pipelines before deployment
6. **Keep backups** of working configurations

## Related Documentation

- `docs/SCHEMA_DOCUMENTATION.md` - Risk profile output schema
- `docs/SCHEMA_QUICK_REFERENCE.md` - Quick validation guide
- `docs/CLI_USAGE.md` - CLI tool documentation
- `docs/UNIX_SOCKET_SERVER.md` - Server implementation
- `README.md` - Project overview

## Version History

- **v1.0** (2025-11-30)
  - Initial schema creation
  - Rating range: 1-5
  - Score range: 0-100
  - Weight range: 0.0-1.0
  - Strict element ordering
  - All elements required
