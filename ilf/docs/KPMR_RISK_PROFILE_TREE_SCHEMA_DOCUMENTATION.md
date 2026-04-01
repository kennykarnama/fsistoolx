# KPMR Risk Profile Tree XSD Schema Documentation

## Overview
This document describes the XSD schema for the KPMR Risk Profile Tree structure (`kpmr_risk_profile_tree.xsd`), which defines the hierarchical representation of risk profiles used in the KPMR (Risk Profile) system.

## Schema Location
- **File**: `schema/kpmr_risk_profile_tree.xsd`
- **Instance Document**: `inherent_risk_profile_tree.xml`
- **Namespace**: Default (no namespace)

## Tree Structure

### Root Element: `<RiskProfileTree>`
The root element that contains the entire risk profile hierarchy.

```xml
<RiskProfileTree>
  <RiskProfileNode>...</RiskProfileNode>
  <RiskProfileNode>...</RiskProfileNode>
  ...
</RiskProfileTree>
```

### Recursive Element: `<RiskProfileNode>`
Represents a node in the risk profile tree. Each node can contain child `<RiskProfileNode>` elements, creating a recursive tree structure.

## Element Structure

### RiskProfileNode Elements

Each `<RiskProfileNode>` contains:

1. **Profile_ID** (required)
   - Type: `ProfileIDType` (string matching pattern `RI\d{10,12}`)
   - Unique identifier for the risk profile
   - Format: `RI` + 10-12 digits
   - Examples: `RI0400000000`, `RI0400100301`

2. **risiko_name** (required)
   - Type: `xs:string`
   - Name of the risk category
   - Examples: "Risiko Operasional", "Risiko Kredit", "Risiko Pasar"

3. **Faktor_Penilaian** (optional)
   - Type: `xs:string`
   - Assessment factor description
   - Contains detailed information about the risk factor being evaluated
   - Typically present in leaf nodes or detailed subcategories

4. **Child RiskProfileNode elements** (0 to unbounded)
   - Recursive structure allowing unlimited nesting depth
   - Represents sub-risks or more specific risk factors

## Profile_ID Format

The Profile_ID follows a specific pattern:

```
RI [Category] [Hierarchy Code]
│  │          │
│  │          └─ Hierarchical position (8-10 digits)
│  └─ Risk category code (2 digits: 01-12)
└─ Risk Identifier prefix
```

### Risk Category Codes

| Code | Risk Category | Indonesian Name |
|------|---------------|-----------------|
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

### Hierarchy Code Examples

- `RI0400000000` = Operational Risk (root level, depth 0)
- `RI0400100000` = Operational Risk - Category 1 (depth 1)
- `RI0400100300` = Operational Risk - Category 1.3 (depth 1)
- `RI0400100301` = Operational Risk - Category 1.3.1 (depth 2)

## Tree Depth Levels

The schema supports arbitrary depth levels:

- **Depth 0**: Main risk categories (direct children of `<RiskProfileTree>`)
  - Example: `RI0400000000` - Risiko Operasional
  
- **Depth 1**: Primary subcategories
  - Example: `RI0400100300` - Corporate action dan pengembangan bisnis baru
  
- **Depth 2**: Secondary subcategories or specific factors
  - Example: `RI0400100301` - Corporate action (specific metric)
  
- **Depth 3+**: Further detailed breakdowns as needed

## XML Example

```xml
<?xml version="1.0" encoding="UTF-8"?>
<RiskProfileTree>
  <!-- Depth 0: Main Category -->
  <RiskProfileNode>
    <Profile_ID>RI0400000000</Profile_ID>
    <risiko_name>Risiko Operasional</risiko_name>
    
    <!-- Depth 1: Subcategory -->
    <RiskProfileNode>
      <Profile_ID>RI0400100300</Profile_ID>
      <risiko_name>Risiko Operasional</risiko_name>
      <Faktor_Penilaian>1.3 Corporate action dan pengembangan bisnis baru</Faktor_Penilaian>
      
      <!-- Depth 2: Specific Factor -->
      <RiskProfileNode>
        <Profile_ID>RI0400100301</Profile_ID>
        <risiko_name>Risiko Operasional</risiko_name>
        <Faktor_Penilaian>1.3.1 Corporate action
(Jumlah corporate action yang terjadi dalam periode penilaian)</Faktor_Penilaian>
      </RiskProfileNode>
    </RiskProfileNode>
  </RiskProfileNode>
</RiskProfileTree>
```

## XPath Query Examples

### 1. Get All Root Level Risks (Depth 0)
```xpath
//RiskProfileTree/RiskProfileNode/risiko_name/text()
```

### 2. Find a Specific Profile by ID
```xpath
//RiskProfileNode[Profile_ID='RI0400100301']
```

### 3. Get All Child Nodes of a Specific Profile
```xpath
//RiskProfileNode[Profile_ID='RI0400000000']/RiskProfileNode
```

### 4. Calculate Depth of a Node
```xpath
count(//RiskProfileNode[Profile_ID='RI0400100301']/ancestor::RiskProfileNode)
```

### 5. Get All Leaf Nodes (No Children)
```xpath
//RiskProfileNode[not(RiskProfileNode)]
```

### 6. Get All Nodes at Specific Depth
For depth 0:
```xpath
//RiskProfileTree/RiskProfileNode
```

For depth 1:
```xpath
//RiskProfileTree/RiskProfileNode/RiskProfileNode
```

### 7. Get All Descendants of a Node
```xpath
//RiskProfileNode[Profile_ID='RI0400000000']//RiskProfileNode
```

### 8. Find Nodes with Specific Faktor_Penilaian
```xpath
//RiskProfileNode[contains(Faktor_Penilaian, 'fraud')]
```

## Validation

To validate an XML file against this schema:

```bash
xmllint --schema schema/kpmr_risk_profile_tree.xsd inherent_risk_profile_tree.xml --noout
```

Expected output if valid:
```
inherent_risk_profile_tree.xml validates
```

## Use Cases

### 1. Risk Hierarchy Navigation
The tree structure allows navigation from broad risk categories down to specific assessment factors.

### 2. Risk Aggregation
Calculate aggregate risk scores by traversing the tree from leaf nodes up to parent categories.

### 3. Risk Profile Queries
Find all related risks within a category by traversing child nodes.

### 4. Depth Analysis
Determine the complexity of risk categories by measuring tree depth.

### 5. Risk Classification
Group risks by category code (first 2 digits of Profile_ID).

## Schema Features

### 1. Recursive Structure
- Unlimited nesting depth
- Self-referential `RiskProfileNode` type
- Flexible hierarchy modeling

### 2. Pattern Validation
- Profile_ID must match `RI\d{10,12}` pattern
- Ensures data consistency

### 3. Optional Elements
- `Faktor_Penilaian` is optional
- Allows both category nodes and detail nodes

### 4. Documentation
- Comprehensive annotations
- XPath examples included
- Usage guidelines

## Tools Available

### 1. Query Profile Depth Script
```bash
./query_profile_depth.sh <Profile_ID>
```
Returns depth and details for a specific Profile_ID.

### 2. Query Risiko by Depth Script
```bash
./query_risiko_by_depth.sh [depth_number]
```
Lists all risiko_name values at a specific depth level.

### 3. XPath Query Guide
See `XPATH_QUERY_GUIDE.md` for comprehensive XPath examples.

## Related Schemas

- `kpmr_risk_profile.xsd` - Edge/relationship schema (not tree structure)
- `inherent_risk_profile.xsd` - Risk profile with scores and ratings
- `kpmr_source.xsd` - Source data for risk calculations

## Notes

1. The tree structure is **recursive** - each `RiskProfileNode` can contain other `RiskProfileNode` elements.

2. **Depth calculation** is based on counting ancestor `RiskProfileNode` elements, not including the `RiskProfileTree` root.

3. Most nodes **inherit** the same `risiko_name` from their parent, with differentiation in `Faktor_Penilaian`.

4. **Leaf nodes** (nodes with no children) typically have detailed `Faktor_Penilaian` descriptions.

5. The schema is **validated** and works with the existing `inherent_risk_profile_tree.xml` file.
