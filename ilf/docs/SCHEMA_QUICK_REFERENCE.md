# XML Schema Quick Reference

## Generated Schema

**File**: `schema/risk_profile_output.xsd`  
**Size**: 9.3 KB  
**Format**: W3C XML Schema Definition (XSD) 1.0  
**Encoding**: UTF-8  

## Purpose

Validates XML output from ILF Evaluation Server containing risk profile evaluation results with scores, ratings, and weighted calculations.

## Quick Validation

```bash
xmllint --noout --schema schema/risk_profile_output.xsd server_output.xml
```

**Expected Output**: `server_output.xml validates`

## Key Elements

### Root Structure
```xml
<RiskProfiles>
  <RiskProfile>...</RiskProfile>
</RiskProfiles>
```

### Risk Profile Structure
```xml
<RiskProfile>
  <!-- Identification -->
  <Profile_ID>RI0100100000</Profile_ID>
  <risiko_name>Risiko Kredit</risiko_name>
  
  <!-- Evaluation Results -->
  <riskProfileEvaluationResult><value>36.20</value></riskProfileEvaluationResult>
  <thresholdRating><value>4.0</value></thresholdRating>
  <finalScore><value>44.00</value></finalScore>
  <scoreXweight><value>12.32</value></scoreXweight>
</RiskProfile>
```

## Data Types

| Type | Pattern/Range | Example | Notes |
|------|---------------|---------|-------|
| ProfileIDType | `(RI[0-9]{10})?` | RI0100100000 | Can be empty |
| RatingValueType | 1.0 - 5.0 | 4.0 | Double precision |
| OptionalDecimalType | decimal or empty | 0.28 or "" | Supports empty |
| EvaluationResultType | double in <value> | <value>36.2</value> | Complex type |

## Evaluation Results Chain

```
Logic_Risk_Profile_Fx → riskProfileEvaluationResult (score)
                              ↓
                     ThresholdFunction → thresholdRating (1-5)
                              ↓
                    rating_to_score.xml → finalScore (mapped score)
                              ↓
                     finalScore × Sample_Bobot → scoreXweight
```

## Common Use Cases

### 1. Validate Server Output
```bash
./eval_server &
./eval_client evaluate ... --output result.xml
xmllint --noout --schema schema/risk_profile_output.xsd result.xml
```

### 2. Programmatic Validation (Python)
```python
from lxml import etree
schema = etree.XMLSchema(etree.parse('schema/risk_profile_output.xsd'))
xml = etree.parse('server_output.xml')
assert schema.validate(xml), schema.error_log
```

### 3. CI/CD Integration
```yaml
- name: Validate XML Output
  run: |
    xmllint --noout --schema schema/risk_profile_output.xsd output.xml
    if [ $? -eq 0 ]; then echo "✓ Valid"; else echo "✗ Invalid" && exit 1; fi
```

## Features

✅ **Flexible ordering** - Elements can appear in any order (xs:all)  
✅ **Optional elements** - All elements optional (minOccurs="0")  
✅ **Empty value support** - Handles empty strings for Profile_ID and decimals  
✅ **Type constraints** - Rating must be 1.0-5.0, Profile_ID must match pattern  
✅ **CDATA support** - ThresholdFunction and Logic_Risk_Profile_Fx as strings  
✅ **Well documented** - Extensive annotations throughout  

## Validation Success

✓ **Tested against**: `server_output.xml` (205 KB, 217 risk profiles)  
✓ **Result**: All profiles validate successfully  
✓ **Coverage**: All evaluation result types present  

## Files Created

- `schema/risk_profile_output.xsd` - XML Schema Definition
- `docs/SCHEMA_DOCUMENTATION.md` - Complete documentation
- `docs/SCHEMA_QUICK_REFERENCE.md` - This quick reference

## Related Documentation

- [Schema Documentation](SCHEMA_DOCUMENTATION.md) - Complete guide
- [Server Documentation](UNIX_SOCKET_SERVER.md) - Server setup
- [Docker Deployment](DOCKER_DEPLOYMENT.md) - Container deployment

## Rating Scale Reference

| Rating | Risk Level | Score Range | Example |
|--------|-----------|-------------|---------|
| 5.0 | Lowest | ≤ 36 | Well controlled |
| 4.0 | Low | 36 < x ≤ 52 | Acceptable |
| 3.0 | Medium | 52 < x ≤ 68 | Needs attention |
| 2.0 | High | 68 < x ≤ 84 | Concerning |
| 1.0 | Highest | 84 < x ≤ 100 | Critical |

**Note**: Higher rating = Lower risk (inverse relationship)

## Summary

The XML schema provides complete validation for ILF evaluation server output, ensuring data integrity and consistency across the risk profile evaluation pipeline. It's production-ready, well-documented, and integrates seamlessly with validation tools.
