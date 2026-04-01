# XPath Expressions for Querying Risiko Name by Depth

## Key XPath Expressions

### 1. Get all risiko_name at ROOT level (depth 0 - closest to root)
```xpath
//RiskProfileTree/RiskProfileNode/risiko_name
```

**Command:**
```bash
xmllint --xpath "//RiskProfileTree/RiskProfileNode/risiko_name/text()" inherent_risk_profile_tree.xml
```

---

### 2. Get all Profile_ID at ROOT level (depth 0)
```xpath
//RiskProfileTree/RiskProfileNode/Profile_ID
```

**Command:**
```bash
xmllint --xpath "//RiskProfileTree/RiskProfileNode/Profile_ID/text()" inherent_risk_profile_tree.xml
```

---

### 3. Get the entire RiskProfileNode at ROOT level
```xpath
//RiskProfileTree/RiskProfileNode
```

**Command:**
```bash
xmllint --xpath "//RiskProfileTree/RiskProfileNode" inherent_risk_profile_tree.xml
```

---

### 4. Get risiko_name for a specific Profile_ID
```xpath
//RiskProfileNode[Profile_ID='RI0400000000']/risiko_name
```

**Command:**
```bash
xmllint --xpath "//RiskProfileNode[Profile_ID='RI0400000000']/risiko_name/text()" inherent_risk_profile_tree.xml
```

---

### 5. Calculate depth (count ancestors) for a specific Profile_ID
```xpath
count(//RiskProfileNode[Profile_ID='RI0400100301']/ancestor::RiskProfileNode)
```

**Command:**
```bash
xmllint --xpath "count(//RiskProfileNode[Profile_ID='RI0400100301']/ancestor::RiskProfileNode)" inherent_risk_profile_tree.xml
```

---

### 6. Get all RiskProfileNode elements that have NO RiskProfileNode parent (depth 0)
```xpath
//RiskProfileNode[not(parent::RiskProfileNode)]
```

**Command:**
```bash
xmllint --xpath "//RiskProfileNode[not(parent::RiskProfileNode)]/risiko_name/text()" inherent_risk_profile_tree.xml
```

---

### 7. Get all RiskProfileNode with exactly 0 RiskProfileNode ancestors
```xpath
//RiskProfileNode[count(ancestor::RiskProfileNode)=0]
```

**Command:**
```bash
xmllint --xpath "//RiskProfileNode[count(ancestor::RiskProfileNode)=0]/risiko_name/text()" inherent_risk_profile_tree.xml
```

---

### 8. Get all RiskProfileNode with exactly 1 RiskProfileNode ancestor (depth 1)
```xpath
//RiskProfileNode[count(ancestor::RiskProfileNode)=1]
```

**Command:**
```bash
xmllint --xpath "//RiskProfileNode[count(ancestor::RiskProfileNode)=1]/risiko_name/text()" inherent_risk_profile_tree.xml
```

---

### 9. Get risiko_name with depth 2
```xpath
//RiskProfileNode[count(ancestor::RiskProfileNode)=2]/risiko_name
```

**Command:**
```bash
xmllint --xpath "//RiskProfileNode[count(ancestor::RiskProfileNode)=2]/risiko_name/text()" inherent_risk_profile_tree.xml
```

---

## XPath Syntax Breakdown

### Path Separators:
- `/` = Direct child
- `//` = Any descendant

### Examples:
- `//RiskProfileTree/RiskProfileNode` = Direct children of RiskProfileTree only
- `//RiskProfileNode` = All RiskProfileNode elements anywhere in document

### Predicates (filters):
- `[Profile_ID='value']` = Filter by Profile_ID value
- `[count(ancestor::RiskProfileNode)=0]` = Filter by depth
- `[not(parent::RiskProfileNode)]` = No RiskProfileNode parent

### Functions:
- `count()` = Count nodes
- `text()` = Get text content
- `ancestor::` = All ancestor nodes
- `parent::` = Direct parent node

---

## Practical Examples with Results

### Example 1: Get all risiko_name at depth 0 (ROOT level)
```bash
xmllint --xpath "//RiskProfileTree/RiskProfileNode/risiko_name/text()" inherent_risk_profile_tree.xml
```

**Results:**
- Risiko Operasional
- Risiko Stratejik
- Risiko Investasi
- Risiko Imbal Hasil
- Risiko Likuiditas
- Risiko Reputasi
- Risiko Intragrup
- Risiko Asuransi
- Risiko Kredit
- Risiko Pasar
- Risiko Hukum
- Risiko Kepatuhan

### Example 2: Count how many nodes are at depth 0
```bash
xmllint --xpath "count(//RiskProfileTree/RiskProfileNode)" inherent_risk_profile_tree.xml
```

### Example 3: Get specific node depth
```bash
xmllint --xpath "count(//RiskProfileNode[Profile_ID='RI0400100301']/ancestor::RiskProfileNode)" inherent_risk_profile_tree.xml
```
**Result:** 2 (meaning depth = 2)

### Example 4: Filter by depth using predicate
```bash
# Get all Profile_IDs at depth 0
xmllint --xpath "//RiskProfileNode[count(ancestor::RiskProfileNode)=0]/Profile_ID/text()" inherent_risk_profile_tree.xml

# Get all Profile_IDs at depth 1
xmllint --xpath "//RiskProfileNode[count(ancestor::RiskProfileNode)=1]/Profile_ID/text()" inherent_risk_profile_tree.xml

# Get all Profile_IDs at depth 2
xmllint --xpath "//RiskProfileNode[count(ancestor::RiskProfileNode)=2]/Profile_ID/text()" inherent_risk_profile_tree.xml
```

---

## Summary

**To get risiko_name closest to root (depth 0), use any of these XPath expressions:**

1. `//RiskProfileTree/RiskProfileNode/risiko_name/text()`
2. `//RiskProfileNode[not(parent::RiskProfileNode)]/risiko_name/text()`
3. `//RiskProfileNode[count(ancestor::RiskProfileNode)=0]/risiko_name/text()`

All three expressions will give you the same result: the risiko_name values at the root level (depth 0).
