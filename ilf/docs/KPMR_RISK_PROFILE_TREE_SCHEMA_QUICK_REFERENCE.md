# KPMR Risk Profile Tree Schema - Quick Reference

## Schema File
`schema/kpmr_risk_profile_tree.xsd`

## XML Structure

```xml
<RiskProfileTree>
  <RiskProfileNode>
    <Profile_ID>RI0400000000</Profile_ID>
    <risiko_name>Risiko Operasional</risiko_name>
    <Faktor_Penilaian>...</Faktor_Penilaian>  <!-- Optional -->
    <RiskProfileNode>
      <!-- Nested child nodes -->
    </RiskProfileNode>
  </RiskProfileNode>
</RiskProfileTree>
```

## Elements

| Element | Type | Required | Description |
|---------|------|----------|-------------|
| `RiskProfileTree` | Complex | Yes | Root element |
| `RiskProfileNode` | Complex | No (0+) | Risk node (recursive) |
| `Profile_ID` | String | Yes | Pattern: `RI\d{10,12}` |
| `risiko_name` | String | Yes | Risk category name |
| `Faktor_Penilaian` | String | No | Assessment factor |

## Profile_ID Format

```
RI [CC] [HHHHHHHHHH]
   ││   │
   ││   └─ Hierarchy code (8-10 digits)
   │└─ Category code (2 digits: 01-12)
   └─ Prefix
```

## Risk Categories (CC)

| Code | Risk Type | Indonesian |
|------|-----------|-----------|
| 01 | Credit | Risiko Kredit |
| 02 | Market | Risiko Pasar |
| 03 | Liquidity | Risiko Likuiditas |
| 04 | Operational | Risiko Operasional |
| 05 | Legal | Risiko Hukum |
| 06 | Reputation | Risiko Reputasi |
| 07 | Strategic | Risiko Stratejik |
| 08 | Compliance | Risiko Kepatuhan |
| 09 | Intragroup | Risiko Intragrup |
| 10 | Insurance | Risiko Asuransi |
| 11 | Investment | Risiko Investasi |
| 12 | Yield | Risiko Imbal Hasil |

## Common XPath Queries

### Get all root risks (depth 0)
```xpath
//RiskProfileTree/RiskProfileNode/risiko_name/text()
```

### Find specific Profile_ID
```xpath
//RiskProfileNode[Profile_ID='RI0400100301']
```

### Calculate node depth
```xpath
count(//RiskProfileNode[Profile_ID='RI0400100301']/ancestor::RiskProfileNode)
```

### Get all children of a node
```xpath
//RiskProfileNode[Profile_ID='RI0400000000']/RiskProfileNode
```

### Get all leaf nodes
```xpath
//RiskProfileNode[not(RiskProfileNode)]
```

### Find nodes by keyword
```xpath
//RiskProfileNode[contains(Faktor_Penilaian, 'fraud')]
```

## Command Line Tools

### Validate XML
```bash
xmllint --schema schema/kpmr_risk_profile_tree.xsd \
        inherent_risk_profile_tree.xml --noout
```

### Query Profile Depth
```bash
./query_profile_depth.sh RI0400100301
```

### List Risks by Depth
```bash
./query_risiko_by_depth.sh 0  # Root level
./query_risiko_by_depth.sh 1  # First level
./query_risiko_by_depth.sh 2  # Second level
```

### Extract All Root Risks
```bash
xmllint --xpath "//RiskProfileTree/RiskProfileNode/risiko_name/text()" \
        inherent_risk_profile_tree.xml | sort -u
```

## Depth Examples

```
Depth 0: RI0400000000 (Risiko Operasional)
    │
    ├─ Depth 1: RI0400100300 (Corporate action)
    │       │
    │       ├─ Depth 2: RI0400100301 (Corporate action count)
    │       └─ Depth 2: RI0400100302 (New business development)
    │
    └─ Depth 1: RI0400200100 (SDM management)
            │
            ├─ Depth 2: RI0400200101 (Training costs)
            └─ Depth 2: RI0400200102 (Employee turnover)
```

## Key Features

✓ **Recursive structure** - unlimited nesting depth  
✓ **Pattern validation** - Profile_ID format enforced  
✓ **Optional fields** - Faktor_Penilaian not always required  
✓ **Self-documenting** - comprehensive annotations  
✓ **XPath friendly** - optimized for queries  

## Validation Status

✅ Schema validates against `inherent_risk_profile_tree.xml`

## See Also

- Full documentation: `docs/KPMR_RISK_PROFILE_TREE_SCHEMA_DOCUMENTATION.md`
- XPath guide: `XPATH_QUERY_GUIDE.md`
- Query tools: `query_profile_depth.sh`, `query_risiko_by_depth.sh`
