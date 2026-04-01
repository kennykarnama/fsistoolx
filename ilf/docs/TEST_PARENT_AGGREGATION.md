# Parent-Child Aggregation in Risk Profile Tree

## Overview

The risk profile tree evaluation now supports **hierarchical aggregation** where parent nodes can derive their values from their children's evaluation results. This demonstrates the power of post-order traversal combined with XPath queries to enable bottom-up risk calculations.

## How It Works

### Post-Order Traversal
The tree is traversed in **G_POST_ORDER** (children before parents), ensuring:
1. All children are evaluated first
2. Children results are stored in XML (`<riskProfileEvaluationResult>`)
3. Parent can query these results using XPath
4. Parent calculates its own score based on children

### Evaluation Flow

```
Step 1: Evaluate Children (Leaf Nodes)
  RI0100100100 → 9.12    (stored in XML)
  RI0100100200 → 15.50   (stored in XML)
  RI0100100300 → 8.25    (stored in XML)
  RI0100100400 → 3.33    (stored in XML)
                ↓
Step 2: Evaluate Parent (Aggregates Children)
  RI0100100000 queries XML document
               finds children results
               sums: 9.12 + 15.5 + 8.25 + 3.33
               returns 36.20
                ↓
Step 3: Apply Threshold
  RI0100100000 score=36.20 → rating=4.0 (36 < score ≤ 52)
```

## Implementation

### Parent Node: RI0100100000

**Logic_Risk_Profile_Fx** (Aggregation Logic):

```c
#include <glib.h>
#include <libxml/parser.h>
#include <libxml/tree.h>
#include <libxml/xpath.h>

gdouble fx(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result) {
    if (!doc) return 0.0;
    
    // Create XPath context to search the document
    xmlXPathContextPtr xpathCtx = xmlXPathNewContext(doc);
    if (!xpathCtx) return 0.0;
    
    // Find all children RiskProfile nodes that have been evaluated
    // Children: RI01001001**, RI01001002**, RI01001003**, RI01001004**
    const xmlChar *xpath = (const xmlChar *)
        "//RiskProfile[starts-with(Profile_ID, 'RI01001001') or "
        "starts-with(Profile_ID, 'RI01001002') or "
        "starts-with(Profile_ID, 'RI01001003') or "
        "starts-with(Profile_ID, 'RI01001004')]/riskProfileEvaluationResult/value";
    
    xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression(xpath, xpathCtx);
    
    if (!xpathObj || !xpathObj->nodesetval) {
        if (xpathObj) xmlXPathFreeObject(xpathObj);
        xmlXPathFreeContext(xpathCtx);
        return 0.0;
    }
    
    // Sum all children values
    gdouble sum = 0.0;
    xmlNodeSetPtr nodeset = xpathObj->nodesetval;
    
    for (int i = 0; i < nodeset->nodeNr; i++) {
        xmlNodePtr node = nodeset->nodeTab[i];
        xmlChar *content = xmlNodeGetContent(node);
        if (content) {
            sum += g_ascii_strtod((const char *)content, NULL);
            xmlFree(content);
        }
    }
    
    xmlXPathFreeObject(xpathObj);
    xmlXPathFreeContext(xpathCtx);
    
    return sum;  // Return sum of children
}
```

### Child Nodes

**RI0100100100** (Child 1):
```c
gdouble fx(...) {
    return 76.0 * 0.12;  // 9.12
}
```

**RI0100100200** (Child 2):
```c
gdouble fx(...) {
    return 15.5;  // Fixed value for testing
}
```

**RI0100100300** (Child 3):
```c
gdouble fx(...) {
    return 8.25;  // Fixed value for testing
}
```

**RI0100100400** (Child 4):
```c
gdouble fx(...) {
    return 3.33;  // Fixed value for testing
}
```

## Test Case

### Test: Parent Aggregation

```c
void test_evaluate_risk_profile_tree_parent_aggregation(void) {
    // 1. Evaluate entire tree
    evaluate_risk_profile_tree(risk_profile_doc, ctx, &res);
    
    // 2. Verify each child has its individual score
    verify_child("RI0100100100", 9.12);
    verify_child("RI0100100200", 15.50);
    verify_child("RI0100100300", 8.25);
    verify_child("RI0100100400", 3.33);
    
    // 3. Verify parent has sum of children
    verify_parent("RI0100100000", 36.20);  // 9.12 + 15.5 + 8.25 + 3.33
}
```

### Test Output

```
=== Parent Aggregation Test ===
Child RI0100100100 evaluation result: 9.12
Child RI0100100200 evaluation result: 15.50
Child RI0100100300 evaluation result: 8.25
Child RI0100100400 evaluation result: 3.33
Parent RI0100100000 aggregated result: 36.20
Expected sum: 36.20
ok 8 /eval/evaluate_risk_profile_tree_parent_aggregation
```

## XML Structure

### Before Evaluation

```xml
<RiskProfile>
    <Profile_ID>RI0100100000</Profile_ID>
    <Logic_Risk_Profile_Fx><![CDATA[
        /* XPath query to sum children */
    ]]></Logic_Risk_Profile_Fx>
</RiskProfile>

<RiskProfile>
    <Profile_ID>RI0100100100</Profile_ID>
    <Logic_Risk_Profile_Fx><![CDATA[
        /* Return 9.12 */
    ]]></Logic_Risk_Profile_Fx>
</RiskProfile>
<!-- ... other children ... -->
```

### After Evaluation (Post-Order)

```xml
<RiskProfile>
    <Profile_ID>RI0100100100</Profile_ID>
    <riskProfileEvaluationResult><value>9.120000</value></riskProfileEvaluationResult>
    <thresholdRating><value>5.0</value></thresholdRating>
</RiskProfile>

<RiskProfile>
    <Profile_ID>RI0100100200</Profile_ID>
    <riskProfileEvaluationResult><value>15.500000</value></riskProfileEvaluationResult>
</RiskProfile>

<RiskProfile>
    <Profile_ID>RI0100100300</Profile_ID>
    <riskProfileEvaluationResult><value>8.250000</value></riskProfileEvaluationResult>
</RiskProfile>

<RiskProfile>
    <Profile_ID>RI0100100400</Profile_ID>
    <riskProfileEvaluationResult><value>3.330000</value></riskProfileEvaluationResult>
</RiskProfile>

<!-- Parent evaluated AFTER children -->
<RiskProfile>
    <Profile_ID>RI0100100000</Profile_ID>
    <riskProfileEvaluationResult><value>36.200000</value></riskProfileEvaluationResult>
    <thresholdRating><value>4.0</value></thresholdRating>
</RiskProfile>
```

## Key Changes

### 1. Modified `_fx_risk_profile()` in eval.c

Changed the `doc` parameter passed to `fx()` functions:

**Before:**
```c
score_value = f(ctx->sandi_source_doc, temp_cur, NULL, NULL);
```

**After:**
```c
score_value = f(ctx->risk_profile_doc, temp_cur, NULL, NULL);
```

**Reason:** Parent nodes need to query the risk_profile_doc to find children's riskProfileEvaluationResult nodes that were added during traversal.

### 2. Updated Test Expectations

The original `test_evaluate_risk_profile_tree()` expected RI0100100000 to return 21.728 (hardcoded). Now it returns 36.20 (sum of children), so expectations were updated:

```c
// Old expectation
g_assert_cmpfloat_with_epsilon(result_value, 21.728, 0.001);
g_assert_cmpfloat_with_epsilon(rating_value, 5.0, 0.01);

// New expectation
gdouble expected_sum = 9.12 + 15.5 + 8.25 + 3.33;  // 36.20
g_assert_cmpfloat_with_epsilon(result_value, expected_sum, 0.01);
g_assert_cmpfloat_with_epsilon(rating_value, 4.0, 0.01);  // 36 < 36.20 <= 52
```

## Aggregation Patterns

### Pattern 1: Sum (Current Implementation)
```c
// Sum all children
for (int i = 0; i < nodeset->nodeNr; i++) {
    sum += get_value(nodeset->nodeTab[i]);
}
return sum;
```

### Pattern 2: Weighted Average
```c
// Weighted average of children
gdouble sum = 0.0;
gdouble total_weight = 0.0;

for (int i = 0; i < nodeset->nodeNr; i++) {
    gdouble value = get_value(nodeset->nodeTab[i]);
    gdouble weight = get_weight_for_child(i);
    sum += value * weight;
    total_weight += weight;
}

return sum / total_weight;
```

### Pattern 3: Maximum
```c
// Find maximum child value
gdouble max_value = -INFINITY;

for (int i = 0; i < nodeset->nodeNr; i++) {
    gdouble value = get_value(nodeset->nodeTab[i]);
    if (value > max_value) {
        max_value = value;
    }
}

return max_value;
```

### Pattern 4: Minimum
```c
// Find minimum child value
gdouble min_value = INFINITY;

for (int i = 0; i < nodeset->nodeNr; i++) {
    gdouble value = get_value(nodeset->nodeTab[i]);
    if (value < min_value) {
        min_value = value;
    }
}

return min_value;
```

### Pattern 5: Conditional Aggregation
```c
// Sum only children that meet criteria
gdouble sum = 0.0;

for (int i = 0; i < nodeset->nodeNr; i++) {
    gdouble value = get_value(nodeset->nodeTab[i]);
    
    // Only include values above threshold
    if (value > 10.0) {
        sum += value;
    }
}

return sum;
```

## Advantages

1. **Flexible Hierarchy**: Define any level of aggregation
2. **Bottom-Up Calculation**: Natural risk roll-up from detailed to summary
3. **Runtime Logic**: Change aggregation formula without recompiling
4. **XPath Power**: Complex queries for selective aggregation
5. **Consistent Storage**: All results stored uniformly in XML

## Use Cases

### Corporate Risk Aggregation
```
Company Total Risk (RI0000000000)
  ├─ Business Unit A (RI0100000000) ← Sum of departments
  │   ├─ Department 1 (RI0100100000) ← Sum of factors
  │   │   ├─ Factor 1.1 (RI0100100100) ← Calculated
  │   │   ├─ Factor 1.2 (RI0100100200) ← Calculated
  │   │   └─ Factor 1.3 (RI0100100300) ← Calculated
  │   └─ Department 2 (RI0100200000)
  └─ Business Unit B (RI0200000000)
```

### Regulatory Reporting
- **Pillar 1 Risks** = Credit Risk + Market Risk + Operational Risk
- **Credit Risk** = Retail + Corporate + Sovereign
- **Retail** = Mortgage + Consumer + SME

### Portfolio Analysis
- **Total Portfolio** = Sum(Sub-Portfolios)
- **Sub-Portfolio** = Weighted Average(Individual Assets)
- **Individual Asset** = Calculated from market data

## Performance

- **XPath Queries**: O(n) where n = number of children
- **Post-Order Traversal**: O(nodes) single pass
- **Memory**: Results stored in XML (in-place modification)
- **217 Nodes**: < 1 second total evaluation time

## Debugging

### Verify Post-Order Execution
Look for evaluation order in output:
```
Evaluated Risk Profile Fx for RI0100100300: Result: 8.250000  ← Child
Evaluated Risk Profile Fx for RI0100100200: Result: 15.500000 ← Child
Evaluated Risk Profile Fx for RI0100100100: Result: 9.120000  ← Child
Evaluated Risk Profile Fx for RI0100100400: Result: 3.330000  ← Child
Evaluated Risk Profile Fx for RI0100100000: Result: 36.200000 ← Parent (last!)
```

### Test XPath Query
Test the XPath expression manually:
```bash
xmllint --xpath "//RiskProfile[starts-with(Profile_ID, 'RI01001001')]/Profile_ID/text()" \
    data/risk_profile_report_items.xml
```

### Verify Results in XML
After evaluation, check XML contains results:
```bash
xmllint --xpath "//RiskProfile[Profile_ID='RI0100100000']/riskProfileEvaluationResult/value/text()" \
    data/risk_profile_report_items.xml
```

## Summary

**All 8 tests passing:**
- ✅ evaluate_fx_xml
- ✅ evaluate_konsolidasi
- ✅ evaluate_konsolidasi_empty
- ✅ evaluate_risk_profile_tree (updated for aggregation)
- ✅ evaluate_risk_profile_tree_null_docs
- ✅ evaluate_risk_profile_tree_null_userdata
- ✅ evaluate_risk_profile_tree_null_result
- ✅ **evaluate_risk_profile_tree_parent_aggregation** (NEW!)

The system now supports complete hierarchical risk evaluation with parent nodes deriving values from children through XPath-based aggregation!
