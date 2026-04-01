# KPMR Risk Profile Tree Schema - Generation Summary

## What Was Created

### 1. XSD Schema File
**File**: `schema/kpmr_risk_profile_tree.xsd`

A comprehensive XML Schema Definition that defines the hierarchical tree structure for KPMR Risk Profiles.

**Key Features**:
- ✅ Recursive `RiskProfileNode` structure for unlimited depth
- ✅ Pattern validation for `Profile_ID` format (`RI\d{10,12}`)
- ✅ Comprehensive documentation with XPath examples
- ✅ Support for 12 risk categories (01-12)
- ✅ Validated against existing `inherent_risk_profile_tree.xml`

### 2. Documentation Files

#### Full Documentation
**File**: `docs/KPMR_RISK_PROFILE_TREE_SCHEMA_DOCUMENTATION.md`

Complete reference including:
- Schema overview and structure
- Element descriptions
- Profile_ID format specification
- Risk category codes (01-12)
- Tree depth explanations
- 8 XPath query examples
- Validation instructions
- Use cases and tools

#### Quick Reference
**File**: `docs/KPMR_RISK_PROFILE_TREE_SCHEMA_QUICK_REFERENCE.md`

One-page cheat sheet with:
- XML structure diagram
- Element table
- Profile_ID format breakdown
- Risk category codes
- Common XPath queries
- Command-line examples
- Depth visualization

## Schema Structure

```
RiskProfileTree (root)
└── RiskProfileNode (0+, recursive)
    ├── Profile_ID (required, pattern: RI\d{10,12})
    ├── risiko_name (required)
    ├── Faktor_Penilaian (optional)
    └── RiskProfileNode (0+, recursive children)
```

## Risk Categories Supported

| Code | Risk Type | Indonesian Name |
|------|-----------|-----------------|
| 01 | Credit Risk | Risiko Kredit |
| 02 | Market Risk | Risiko Pasar |
| 03 | Liquidity Risk | Risiko Likuiditas |
| 04 | Operational Risk | Risiko Operasional |
| 05 | Legal Risk | Risiko Hukum |
| 06 | Reputation Risk | Risiko Reputasi |
| 07 | Strategic Risk | Risiko Stratejik |
| 08 | Compliance Risk | Risiko Kepatuhan |
| 09 | Intragroup Risk | Risiko Intragrup |
| 10 | Insurance Risk | Risiko Asuransi |
| 11 | Investment Risk | Risiko Investasi |
| 12 | Yield Risk | Risiko Imbal Hasil |

## Validation

The schema has been validated successfully:

```bash
$ xmllint --schema schema/kpmr_risk_profile_tree.xsd \
          inherent_risk_profile_tree.xml --noout
inherent_risk_profile_tree.xml validates
```

## Usage Examples

### 1. Validate an XML File
```bash
xmllint --schema schema/kpmr_risk_profile_tree.xsd your_file.xml --noout
```

### 2. Query Root Risks (Depth 0)
```bash
xmllint --xpath "//RiskProfileTree/RiskProfileNode/risiko_name/text()" \
        inherent_risk_profile_tree.xml | sort -u
```

### 3. Find Specific Profile and Calculate Depth
```bash
# Find node
xmllint --xpath "//RiskProfileNode[Profile_ID='RI0400100301']" \
        inherent_risk_profile_tree.xml

# Calculate depth
xmllint --xpath "count(//RiskProfileNode[Profile_ID='RI0400100301']/ancestor::RiskProfileNode)" \
        inherent_risk_profile_tree.xml
```

### 4. Use Helper Scripts
```bash
# Query specific profile
./query_profile_depth.sh RI0400100301

# List all risks at depth 0
./query_risiko_by_depth.sh 0
```

## Key Design Decisions

### 1. Recursive Structure
- Chosen to support arbitrary depth hierarchy
- Allows flexible risk categorization
- No hardcoded depth limits

### 2. Optional Faktor_Penilaian
- Not all nodes require assessment factors
- Category nodes may only have ID and name
- Leaf nodes typically have detailed factors

### 3. Pattern Validation
- Profile_ID enforced as `RI\d{10,12}`
- Prevents invalid IDs
- Supports both 10 and 12 digit codes

### 4. Comprehensive Documentation
- Inline XSD annotations
- Separate documentation files
- XPath examples included
- Usage patterns documented

## Integration with Existing Tools

The schema works with existing query tools:

1. **query_profile_depth.sh** - Queries specific Profile_ID and returns depth
2. **query_risiko_by_depth.sh** - Lists all risks at a given depth
3. **XPATH_QUERY_GUIDE.md** - XPath query examples and patterns

## Files Modified/Created

```
✓ Created: schema/kpmr_risk_profile_tree.xsd
✓ Created: docs/KPMR_RISK_PROFILE_TREE_SCHEMA_DOCUMENTATION.md
✓ Created: docs/KPMR_RISK_PROFILE_TREE_SCHEMA_QUICK_REFERENCE.md
✓ Created: docs/KPMR_RISK_PROFILE_TREE_SCHEMA_GENERATION_SUMMARY.md
```

## XPath Query Capabilities

The schema is optimized for XPath queries:

1. ✅ Find nodes by Profile_ID
2. ✅ Calculate node depth
3. ✅ Get all children/descendants
4. ✅ Find leaf nodes
5. ✅ Search by risk name
6. ✅ Search by assessment factor
7. ✅ Get nodes at specific depth
8. ✅ Navigate parent-child relationships

## Testing Results

### Schema Validation
```
✅ PASS - XML validates against XSD
✅ PASS - All Profile_ID patterns valid
✅ PASS - Recursive structure works
✅ PASS - Optional elements handled correctly
```

### XPath Query Testing
```
✅ PASS - Root level queries (depth 0)
✅ PASS - Specific Profile_ID lookup
✅ PASS - Depth calculation
✅ PASS - Child node navigation
✅ PASS - Leaf node identification
```

## Next Steps

The schema is ready for use. You can now:

1. Validate any risk profile tree XML files
2. Generate new XML files conforming to the schema
3. Use XPath queries for risk analysis
4. Integrate with risk profile processing tools
5. Build applications that consume this format

## Support

For questions or issues:
- See full documentation: `docs/KPMR_RISK_PROFILE_TREE_SCHEMA_DOCUMENTATION.md`
- See quick reference: `docs/KPMR_RISK_PROFILE_TREE_SCHEMA_QUICK_REFERENCE.md`
- See XPath guide: `XPATH_QUERY_GUIDE.md`
- Use helper scripts: `query_profile_depth.sh`, `query_risiko_by_depth.sh`

## Summary

✅ **Complete XSD schema** for KPMR Risk Profile Tree  
✅ **Validated** against existing XML data  
✅ **Documented** with comprehensive guides  
✅ **XPath optimized** for queries  
✅ **12 risk categories** supported  
✅ **Unlimited depth** hierarchy  
✅ **Pattern validation** enforced  
✅ **Ready for production** use
