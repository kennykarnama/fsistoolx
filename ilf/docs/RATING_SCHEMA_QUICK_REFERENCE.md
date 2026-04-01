# Rating to Score Schema - Quick Reference

## Quick Validation

```bash
xmllint --noout --schema schema/rating_to_score.xsd data/rating_to_score.xml
```

## Schema Summary

| Component | Description | Values |
|-----------|-------------|--------|
| **Root** | RatingScores | Contains 1+ RatingScore entries |
| **Rating** | Risk rating value | 1-5 (integer) |
| **Score** | Numerical score | 0-100 (integer) |
| **weight** | Weight factor | 0.0-1.0 (decimal) |

## Valid Structure

```xml
<RatingScores>
  <RatingScore>
    <Rating>1-5</Rating>
    <Score>0-100</Score>
    <weight>0.0-1.0</weight>
  </RatingScore>
</RatingScores>
```

## Validation Rules

✅ **Required**
- At least 1 RatingScore entry
- All three elements (Rating, Score, weight) must be present
- Elements must appear in strict order: Rating → Score → weight

✅ **Constraints**
- Rating: Integer from 1 to 5
- Score: Integer from 0 to 100
- weight: Decimal from 0.0 to 1.0

❌ **Invalid**
- Rating < 1 or > 5
- Score < 0 or > 100
- weight < 0.0 or > 1.0
- Wrong element order
- Missing elements

## Example Valid XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<RatingScores>
  <RatingScore>
    <Rating>1</Rating>
    <Score>92</Score>
    <weight>0.28</weight>
  </RatingScore>
  <RatingScore>
    <Rating>4</Rating>
    <Score>44</Score>
    <weight>0.28</weight>
  </RatingScore>
</RatingScores>
```

## Common Errors

| Error Message | Problem | Solution |
|---------------|---------|----------|
| "not a valid value of the atomic type 'RatingValueType'" | Rating out of range | Use 1-5 |
| "not a valid value of the atomic type 'ScoreValueType'" | Score out of range | Use 0-100 |
| "not a valid value of the atomic type 'WeightValueType'" | Weight out of range | Use 0.0-1.0 |
| "This element is not expected" | Wrong element order | Use Rating, Score, weight order |

## Python Validation

```python
from lxml import etree

schema = etree.XMLSchema(file='schema/rating_to_score.xsd')
doc = etree.parse('data/rating_to_score.xml')
print("Valid!" if schema.validate(doc) else "Invalid!")
```

## Files

- **Schema**: `schema/rating_to_score.xsd`
- **Data**: `data/rating_to_score.xml`
- **Full Docs**: `docs/RATING_SCHEMA_DOCUMENTATION.md`

## Data Types

```xml
<!-- Rating: 1-5 -->
<xs:simpleType name="RatingValueType">
  <xs:restriction base="xs:integer">
    <xs:minInclusive value="1"/>
    <xs:maxInclusive value="5"/>
  </xs:restriction>
</xs:simpleType>

<!-- Score: 0-100 -->
<xs:simpleType name="ScoreValueType">
  <xs:restriction base="xs:integer">
    <xs:minInclusive value="0"/>
    <xs:maxInclusive value="100"/>
  </xs:restriction>
</xs:simpleType>

<!-- Weight: 0.0-1.0 -->
<xs:simpleType name="WeightValueType">
  <xs:restriction base="xs:decimal">
    <xs:minInclusive value="0.0"/>
    <xs:maxInclusive value="1.0"/>
  </xs:restriction>
</xs:simpleType>
```

## Integration

This schema validates the rating-to-score mapping used in:
- `src/eval.c` - Evaluation engine
- `src/eval_cli.c` - CLI tool
- `src/eval_server.c` - Unix socket server
- Docker containers

## Pipeline Position

```
Risk Evaluation → Rating (1-5) → [RATING TO SCORE MAPPING] → Score (0-100) → Weighted Score
```
