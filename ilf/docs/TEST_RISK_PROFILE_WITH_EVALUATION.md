# Risk Profile Tree Evaluation Test - UPDATED

## ✅ All Tests Passing with Actual Function Evaluation (7/7)

### Test Results
```
TAP version 13
1..7
✓ /eval/evaluate_fx_xml
✓ /eval/evaluate_konsolidasi
✓ /eval/evaluate_konsolidasi_empty
✓ /eval/evaluate_risk_profile_tree (NOW WITH REAL EVALUATION!)
✓ /eval/evaluate_risk_profile_tree_null_docs
✓ /eval/evaluate_risk_profile_tree_null_userdata
✓ /eval/evaluate_risk_profile_tree_null_result
```

## 🎯 What Changed

### 1. Added Logic_Risk_Profile_Fx to XML

**File**: `data/risk_profile_report_items.xml`

Added two test functions to demonstrate actual evaluation:

#### Parent Node (RI0100100000)
```xml
<Logic_Risk_Profile_Fx><![CDATA[
#include <glib.h>
#include <libxml/parser.h>
#include <libxml/tree.h>
gdouble fx(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result) {
    gdouble base_score = 77.6;
    gdouble weight = 0.28;
    gdouble calculated = base_score * weight;
    return calculated;  // Returns 21.728
}
]]></Logic_Risk_Profile_Fx>
```

#### Child Node (RI0100100100)
```xml
<Logic_Risk_Profile_Fx><![CDATA[
#include <glib.h>
#include <libxml/parser.h>
#include <libxml/tree.h>
gdouble fx(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result) {
    gdouble score = 76.0;
    gdouble weight = 0.12;
    return score * weight;  // Returns 9.12
}
]]></Logic_Risk_Profile_Fx>
```

### 2. Updated Test to Verify Results

**File**: `test/eval_test1.c`

The test now:
1. ✅ Builds the risk profile tree
2. ✅ Evaluates Logic_Risk_Profile_Fx code with TCC
3. ✅ Verifies evaluation results in XML
4. ✅ Checks parent node result: **21.728**
5. ✅ Checks child node result: **9.120**

### 3. Fixed Result Placement

**File**: `src/eval.c`

- Changed result node placement from `cur` (Logic_Risk_Profile_Fx node) to `rp_data->xml_node` (RiskProfile node)
- Increased precision from `%.2f` to `%.6f` for accurate verification
- Result is now properly added as: `<riskProfileEvaluationResult><value>21.728000</value></riskProfileEvaluationResult>`

### 4. Added Required Header

**File**: `test/eval_test1.c`

Added `#include "../src/risk_profile_tree.h"` to access `RiskProfileData` and `find_node_by_profile_id()`

## Test Output

```
Evaluated Risk Profile Fx: [child code] Result: 9.120000
Evaluated Risk Profile Fx: [parent code] Result: 21.728000

=== Risk Profile Tree Evaluation Test ===
Total nodes in tree: 217
RI0100100000 evaluation result: 21.728
RI0100100100 evaluation result: 9.120
ok 4 /eval/evaluate_risk_profile_tree
```

## What the Test Proves

### ✅ Dynamic Compilation Works
- TCC successfully compiles CDATA C code from XML
- Functions are loaded into memory and executed

### ✅ Tree Traversal Works
- POST_ORDER traversal visits all nodes
- Both parent and child nodes are evaluated

### ✅ Result Storage Works
- Evaluation results are stored in XML
- Results can be retrieved and verified

### ✅ Integration Works
- Risk profile tree + TCC + XML modification all work together
- Test can find nodes and extract their evaluation results

## Verification Flow

```
1. Load risk_profile_report_items.xml (4879 lines, 217 nodes)
2. Build N-ary tree with parent-child relationships
3. Traverse tree in POST_ORDER
4. For each node with Logic_Risk_Profile_Fx:
   a. Extract CDATA C code
   b. Compile with TCC
   c. Execute fx() function
   d. Store result in <riskProfileEvaluationResult>
5. Verify results in XML:
   - RI0100100000: 77.6 * 0.28 = 21.728 ✓
   - RI0100100100: 76.0 * 0.12 = 9.120 ✓
```

## Code Assertions

```c
// Find parent node
GNode *parent_node = find_node_by_profile_id(tree, "RI0100100000");
g_assert_nonnull(parent_node);

// Extract evaluation result from XML
g_assert_true(found_result);
g_assert_cmpfloat_with_epsilon(result_value, 21.728, 0.001);

// Find child node
GNode *child_node = find_node_by_profile_id(tree, "RI0100100100");
g_assert_nonnull(child_node);

// Verify child result
g_assert_cmpfloat_with_epsilon(result_value, 9.12, 0.001);
```

## Real-World Usage Pattern

This test demonstrates the complete workflow for risk profile evaluation:

1. **Load Configuration**: Risk profile XML with evaluation rules
2. **Build Structure**: Create hierarchical tree
3. **Dynamic Evaluation**: Compile and execute custom logic
4. **Store Results**: Save calculations back to XML
5. **Aggregate**: Parent nodes can use child results for aggregation

## Example Real Function

While the test uses simple multiplication, real functions would:

```c
gdouble fx(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result) {
    // Access sandi_source_doc from context
    EvalRiskProfileContext *ctx = (EvalRiskProfileContext *)user_data;
    xmlDocPtr sandi_doc = ctx->sandi_source_doc;
    
    // Query source data
    xmlXPathContextPtr xpath_ctx = xmlXPathNewContext(sandi_doc);
    xmlXPathObjectPtr xpath_obj = xmlXPathEvalExpression(
        (const xmlChar *)"//sourceInherentEvalResult[@sandi='FX000001']/result",
        xpath_ctx
    );
    
    // Calculate risk score
    gdouble score = extract_and_calculate(xpath_obj);
    
    // Apply threshold
    gdouble rating = apply_threshold(score);
    
    // Cleanup
    xmlXPathFreeObject(xpath_obj);
    xmlXPathFreeContext(xpath_ctx);
    
    return rating;
}
```

## Benefits of This Approach

1. **Flexibility**: Risk logic defined in XML, changeable without recompilation
2. **Type Safety**: Still uses C with compile-time checks
3. **Performance**: Compiled code runs at native speed
4. **Testability**: Can verify actual execution and results
5. **Composability**: Can chain evaluations (child → parent aggregation)

## Files Modified

```
src/eval.c                          # Fixed result placement, increased precision
test/eval_test1.c                   # Added result verification
data/risk_profile_report_items.xml  # Added 2 Logic_Risk_Profile_Fx examples
```

## Running the Test

```bash
# Build and run
make eval_tests && ./eval_tests

# Run only risk profile test
./eval_tests -p /eval/evaluate_risk_profile_tree

# Verbose output
./eval_tests -p /eval/evaluate_risk_profile_tree --verbose
```

## Success Metrics

- ✅ TCC compilation succeeds (no errors)
- ✅ Functions execute and return expected values
- ✅ Results stored correctly in XML structure
- ✅ Test can retrieve and verify results
- ✅ Parent and child nodes both evaluated
- ✅ All 7 tests pass

This is now a **complete end-to-end integration test** demonstrating the full risk profile evaluation pipeline!
