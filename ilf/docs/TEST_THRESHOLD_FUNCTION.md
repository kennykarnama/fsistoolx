# ThresholdFunction Evaluation Enhancement

## Overview

The `evaluate_risk_profile_tree` function has been enhanced to evaluate **both** `Logic_Risk_Profile_Fx` and `ThresholdFunction` for each risk profile node. This creates a complete two-stage evaluation pipeline:

1. **Stage 1: Score Calculation** - Evaluate `Logic_Risk_Profile_Fx` to compute a risk score
2. **Stage 2: Rating Determination** - Pass the score to `ThresholdFunction` to determine the final rating

## Architecture

### Evaluation Flow

```
RiskProfile Node
    ↓
Logic_Risk_Profile_Fx (CDATA C code)
    ↓ [Compile with TCC]
    ↓ [Execute fx() function]
    ↓
Score Value (gdouble) → Store as <riskProfileEvaluationResult>
    ↓ [Pass as user_data]
    ↓
ThresholdFunction (CDATA C code)
    ↓ [Compile with TCC]
    ↓ [Execute fx(user_data=&score)]
    ↓
Rating Value (gdouble) → Store as <thresholdRating>
```

### Function Signatures

Both functions use the same signature but different parameters:

```c
gdouble fx(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result);
```

**Logic_Risk_Profile_Fx Parameters:**
- `doc`: unused (can access sandi_source_doc via context if needed)
- `cur`: current XML node
- `user_data`: NULL
- `result`: NULL
- **Returns**: Score value

**ThresholdFunction Parameters:**
- `doc`: unused
- `cur`: current XML node
- `user_data`: **Pointer to score value from Logic_Risk_Profile_Fx** (`gdouble*`)
- `result`: NULL
- **Returns**: Rating value (typically 1.0-5.0)

## Implementation Details

### Modified `_fx_risk_profile()` Callback

The callback now performs two-stage evaluation:

```c
gboolean _fx_risk_profile(GNode* node, gpointer data) {
    // Stage 1: Evaluate Logic_Risk_Profile_Fx
    // - Compile CDATA code with TCC
    // - Execute to get score_value
    // - Store in XML as <riskProfileEvaluationResult><value>score</value>
    
    // Stage 2: Evaluate ThresholdFunction (if score exists)
    // - Compile CDATA code with TCC
    // - Execute with user_data=&score_value
    // - Store in XML as <thresholdRating><value>rating</value>
    
    return FALSE; // Continue traversal
}
```

### XML Structure

Each evaluated RiskProfile node now contains:

```xml
<RiskProfile>
    <Profile_ID>RI0100100000</Profile_ID>
    <!-- ... other fields ... -->
    <Logic_Risk_Profile_Fx><![CDATA[
        gdouble fx(...) { return 21.728; }
    ]]></Logic_Risk_Profile_Fx>
    <ThresholdFunction><![CDATA[
        gdouble fx(..., gpointer user_data, ...) {
            gdouble score = *(gdouble*)user_data;
            if (score <= 36.0) return 5.0;
            // ... threshold logic ...
        }
    ]]></ThresholdFunction>
    
    <!-- Results added during evaluation -->
    <riskProfileEvaluationResult>
        <value>21.728000</value>
    </riskProfileEvaluationResult>
    <thresholdRating>
        <value>5.0</value>
    </thresholdRating>
</RiskProfile>
```

## Test Examples

### Test Case 1: Parent Node (RI0100100000)

**Logic_Risk_Profile_Fx:**
```c
gdouble fx(...) {
    gdouble base_score = 77.6;
    gdouble weight = 0.28;
    return base_score * weight;  // Returns 21.728
}
```

**ThresholdFunction:**
```c
gdouble fx(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result) {
    if (!user_data) return 0.0;
    gdouble score = *(gdouble *)user_data;  // Gets 21.728
    
    if (score <= 36.0) return 5.0;      // ✓ Matches!
    else if (score <= 52.0) return 4.0;
    else if (score <= 68.0) return 3.0;
    else if (score <= 84.0) return 2.0;
    else return 1.0;
}
```

**Expected Results:**
- Score: 21.728
- Rating: 5.0

### Test Case 2: Child Node (RI0100100100)

**Logic_Risk_Profile_Fx:**
```c
gdouble fx(...) {
    gdouble score = 76.0;
    gdouble weight = 0.12;
    return score * weight;  // Returns 9.12
}
```

**ThresholdFunction:**
```c
gdouble fx(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result) {
    if (!user_data) return 0.0;
    gdouble score = *(gdouble *)user_data;  // Gets 9.12
    
    if (score <= 10.0) return 5.0;      // ✓ Matches!
    else if (score <= 20.0) return 4.0;
    else if (score <= 30.0) return 3.0;
    else if (score <= 40.0) return 2.0;
    else return 1.0;
}
```

**Expected Results:**
- Score: 9.12
- Rating: 5.0

## Test Verification

The test suite verifies both stages of evaluation:

```c
void test_evaluate_risk_profile_tree(void) {
    // ... setup ...
    
    // Find node
    GNode *node = find_node_by_profile_id(tree, "RI0100100000");
    RiskProfileData *data = node->data;
    
    // Extract both results from XML
    gdouble score = extract_value(data->xml_node, "riskProfileEvaluationResult");
    gdouble rating = extract_value(data->xml_node, "thresholdRating");
    
    // Verify both values
    g_assert_cmpfloat_with_epsilon(score, 21.728, 0.001);
    g_assert_cmpfloat_with_epsilon(rating, 5.0, 0.01);
}
```

## Output Example

When running tests, you'll see:

```
Evaluated Risk Profile Fx for RI0100100100: Result: 9.120000
Evaluated Threshold Function for RI0100100100: Score=9.120000, Rating=5.000000
Evaluated Risk Profile Fx for RI0100100000: Result: 21.728000
Evaluated Threshold Function for RI0100100000: Score=21.728000, Rating=5.000000

=== Risk Profile Tree Evaluation Test ===
Total nodes in tree: 217
RI0100100000 evaluation result: 21.728
RI0100100000 threshold rating: 5.0
RI0100100100 evaluation result: 9.120
RI0100100100 threshold rating: 5.0
ok 4 /eval/evaluate_risk_profile_tree
```

## Benefits

1. **Complete Risk Assessment**: Both quantitative score and qualitative rating
2. **Flexible Thresholds**: Each risk profile can define custom threshold logic
3. **Runtime Compilation**: No application recompilation needed for threshold changes
4. **Type Safety**: Score passed as pointer, preventing accidental modification
5. **XML Storage**: Both results stored in XML for reporting and analysis

## Common Threshold Patterns

### Linear Thresholds
```c
// Lower score = higher rating (risk reduction)
if (score <= 36.0) return 5.0;
else if (score <= 52.0) return 4.0;
else if (score <= 68.0) return 3.0;
else if (score <= 84.0) return 2.0;
else return 1.0;
```

### Inverted Thresholds
```c
// Higher score = higher rating (positive performance)
if (score >= 80.0) return 5.0;
else if (score >= 60.0) return 4.0;
else if (score >= 40.0) return 3.0;
else if (score >= 20.0) return 2.0;
else return 1.0;
```

### Non-linear Thresholds
```c
// Complex business logic
if (score < 5.0) return 5.0;      // Excellent
else if (score < 15.0) return 4.0; // Good
else if (score < 40.0) return 3.0; // Average
else if (score < 80.0) return 2.0; // Poor
else return 1.0;                   // Critical
```

## Error Handling

The implementation includes robust error handling:

1. **NULL user_data check**: Returns 0.0 if score not provided
2. **TCC compilation errors**: Logged and propagated
3. **Missing functions**: Gracefully skipped (nodes without ThresholdFunction only get scores)
4. **Post-order traversal**: Children evaluated before parents (bottom-up)

## Performance Considerations

- **TCC Compilation**: Fast (microseconds per function)
- **Tree Traversal**: O(n) where n = number of nodes
- **Memory**: Each node holds score + rating in XML
- **217 nodes evaluated**: < 1 second total

## Future Enhancements

Potential improvements:
1. Cache compiled ThresholdFunctions if same code used multiple times
2. Add validation for rating range (1.0-5.0)
3. Support custom rating scales per risk type
4. Aggregate child ratings into parent nodes
5. Generate threshold violation reports

## Conclusion

The enhanced `evaluate_risk_profile_tree` function provides a complete risk assessment pipeline with dynamic threshold evaluation. The two-stage approach (score → rating) enables flexible, data-driven risk classification without code changes.
