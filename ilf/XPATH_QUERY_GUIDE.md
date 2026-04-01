# XPath Query Guide for Inherent Risk Profile Tree

## Overview
This document explains how to query the `inherent_risk_profile_tree.xml` file to find Profile_IDs and their depth in the tree structure.

## Tree Structure
- **Root**: `<RiskProfileTree>`
- **Nodes**: `<RiskProfileNode>` (can be nested)
- **Each Node Contains**:
  - `<Profile_ID>`: Unique identifier (e.g., RI0400000000)
  - `<risiko_name>`: Risk name (e.g., "Risiko Operasional")
  - `<Faktor_Penilaian>`: Assessment factor (optional)

## Depth Levels
- **Depth 0**: Direct children of `<RiskProfileTree>` (closest to root)
- **Depth 1**: Children of depth 0 nodes
- **Depth 2**: Children of depth 1 nodes
- And so on...

## XPath Queries

### 1. Find All Risiko Names at Root Level (Depth 0)
```bash
xmllint --xpath "//RiskProfileTree/RiskProfileNode/risiko_name/text()" inherent_risk_profile_tree.xml
```

**Result**: 
- Risiko Asuransi
- Risiko Hukum
- Risiko Imbal Hasil
- Risiko Intragrup
- Risiko Investasi
- Risiko Kepatuhan
- Risiko Kredit
- Risiko Likuiditas
- Risiko Operasional
- Risiko Pasar
- Risiko Reputasi
- Risiko Stratejik

### 2. Find a Specific Profile_ID
```bash
xmllint --xpath "//RiskProfileNode[Profile_ID='RI0400100301']/Profile_ID/text()" inherent_risk_profile_tree.xml
```

### 3. Calculate Depth for a Specific Profile_ID
```bash
# Count ancestor RiskProfileNode elements
xmllint --xpath "count(//RiskProfileNode[Profile_ID='RI0400100301']/ancestor::RiskProfileNode)" inherent_risk_profile_tree.xml
```

**Example**: `RI0400100301` has depth = 2 (2 ancestor RiskProfileNode elements)

### 4. Get All Information for a Profile_ID
```bash
xmllint --xpath "//RiskProfileNode[Profile_ID='RI0400100301']" inherent_risk_profile_tree.xml
```

### 5. Find All Profile_IDs at Root Level
```bash
xmllint --xpath "//RiskProfileTree/RiskProfileNode/Profile_ID/text()" inherent_risk_profile_tree.xml
```

## Using the Helper Scripts

### 1. Query Profile Depth (Bash)
```bash
./query_profile_depth.sh <Profile_ID>

# Example:
./query_profile_depth.sh RI0400100301
```

**Output**:
```
==========================================
Profile_ID: RI0400100301
Depth: 2
Risiko Name: Risiko Operasional
Faktor Penilaian: 1.3.1 Corporate action...
==========================================
```

### 2. Query Risiko by Depth (Bash)
```bash
./query_risiko_by_depth.sh [depth_number]

# Examples:
./query_risiko_by_depth.sh 0    # Root level (default)
./query_risiko_by_depth.sh 1    # First level
./query_risiko_by_depth.sh 2    # Second level
```

**Output for Depth 0**:
```
Profile_ID      Risiko Name
============================================================
RI0400000000    Risiko Operasional
RI0100000000    Risiko Kredit
RI0200000000    Risiko Pasar
...
Total: 19 entries at depth 0
```

## Common Use Cases

### Find the Main Risk Categories (Closest to Root)
```bash
./query_risiko_by_depth.sh 0
```

This shows all 12 main risk categories:
1. Risiko Asuransi (Insurance Risk)
2. Risiko Hukum (Legal Risk)
3. Risiko Imbal Hasil (Yield Risk)
4. Risiko Intragrup (Intragroup Risk)
5. Risiko Investasi (Investment Risk)
6. Risiko Kepatuhan (Compliance Risk)
7. Risiko Kredit (Credit Risk)
8. Risiko Likuiditas (Liquidity Risk)
9. Risiko Operasional (Operational Risk)
10. Risiko Pasar (Market Risk)
11. Risiko Reputasi (Reputation Risk)
12. Risiko Stratejik (Strategic Risk)

### Find Details of a Specific Profile
```bash
./query_profile_depth.sh RI0400000000
```

### Find All Sub-risks (Depth 1)
```bash
./query_risiko_by_depth.sh 1
```

## XPath Syntax Reference

- `//` - Select nodes anywhere in the document
- `/` - Select direct children
- `[condition]` - Filter by condition
- `text()` - Get text content
- `count()` - Count nodes
- `ancestor::` - Select all ancestors
- `Profile_ID='value'` - Filter by Profile_ID value

## Examples with Results

### Example 1: Root Node
```bash
./query_profile_depth.sh RI0400000000
```
**Result**: Depth = 0 (root level)

### Example 2: Second Level Node
```bash
./query_profile_depth.sh RI0400100301
```
**Result**: Depth = 2 (two levels deep)

### Example 3: First Level Node
```bash
./query_profile_depth.sh RI0400100300
```
**Result**: Depth = 1 (one level deep)
