# Evaluate Risk Profile Tree - Test Documentation

## Overview

Tests for the `evaluate_risk_profile_tree()` function which builds a risk profile tree from XML and evaluates each node using dynamically compiled C code.

## Test Summary

All **7 tests passing**:
- ✅ `/eval/evaluate_fx_xml` - Source inherent evaluation
- ✅ `/eval/evaluate_konsolidasi` - Consolidation evaluation
- ✅ `/eval/evaluate_konsolidasi_empty` - Consolidation with empty data
- ✅ `/eval/evaluate_risk_profile_tree` - Risk profile tree evaluation
- ✅ `/eval/evaluate_risk_profile_tree_null_docs` - NULL document handling
- ✅ `/eval/evaluate_risk_profile_tree_null_userdata` - NULL user data handling
- ✅ `/eval/evaluate_risk_profile_tree_null_result` - NULL result handling

## Function Signature

```c
ilf_status_t evaluate_risk_profile_tree(
    xmlDocPtr doc,           // Risk profile XML document
    gpointer user_data,      // EvalRiskProfileContext*
    gpointer result          // ILFResult*
);
```

## Context Structure

```c
typedef struct eval_risk_profile_context_t {
    xmlDocPtr sandi_source_doc;  // Source inherent data
    xmlDocPtr risk_profile_doc;  // Risk profile items
} EvalRiskProfileContext;
```

## Result Structure

```c
typedef struct ilf_result_t {
    ilf_status_t status;      // ILF_SUCCESS or ILF_ERROR
    char *error_message;      // Error description if status == ILF_ERROR
    void *data;               // GNode* tree root
} ILFResult;
```

## Test Cases

### 1. test_evaluate_risk_profile_tree

**Purpose**: Tests basic functionality of building and evaluating risk profile tree

**Setup**:
- Loads `risk_profile_report_items.xml` (4855 lines, 217 nodes)
- Loads `source_inherent_out_fx_tests.xml` as sandi source
- Creates `EvalRiskProfileContext` with both documents

**Execution**:
- Calls `evaluate_risk_profile_tree()`
- Builds N-ary tree with parent-child relationships
- Traverses tree in POST_ORDER
- Evaluates each node's `Logic_Risk_Profile_Fx` code (if present)

**Validation**:
- Status is `ILF_SUCCESS`
- No error message
- Result data contains valid GNode tree
- Tree has 217 nodes total

**Output**:
```
=== Risk Profile Tree Evaluation Test ===
Total nodes in tree: 217
```

### 2. test_evaluate_risk_profile_tree_null_docs

**Purpose**: Tests error handling when XML documents are NULL in context

**Setup**:
- Creates context with NULL sandi_source_doc and risk_profile_doc
- Dummy doc parameter provided

**Validation**:
- Status is `ILF_ERROR`
- Error message: "User data XML documents are NULL"
- Function returns gracefully without crash

### 3. test_evaluate_risk_profile_tree_null_userdata

**Purpose**: Tests error handling when user_data parameter is NULL

**Setup**:
- Uses subprocess to catch g_error
- Passes NULL as user_data

**Validation**:
- Test subprocess fails (g_error called)
- Stderr contains: "Invalid arguments to evaluate_risk_profile_tree"

### 4. test_evaluate_risk_profile_tree_null_result

**Purpose**: Tests error handling when result parameter is NULL

**Setup**:
- Valid documents and context
- NULL result pointer

**Validation**:
- Test subprocess fails (g_error called)
- Stderr contains: "Invalid arguments to evaluate_risk_profile_tree"

## Implementation Details

### Tree Building

The function uses `build_risk_profile_tree()` from `risk_profile_tree.c`:

1. **XPath Query**: Finds all `<RiskProfile>` elements
2. **Data Extraction**: Extracts Profile_ID, risiko_name, Faktor_Penilaian
3. **Parent-Child Detection**: Uses 2-digit segment analysis:
   - `RI0100100000` → parent (ends with 0000)
   - `RI0100100100` → child (one segment differs)
4. **Tree Construction**: Creates GLib N-ary tree with virtual root

### Tree Traversal

Uses `g_node_traverse()` with:
- **Order**: `G_POST_ORDER` (children before parents)
- **Flags**: `G_TRAVERSE_ALL` (all nodes)
- **Callback**: `_fx_risk_profile()`

### Node Evaluation (_fx_risk_profile)

For each node:
1. **Skip Virtual Root**: Nodes without data are skipped
2. **Find Logic Element**: Searches for `<Logic_Risk_Profile_Fx>` in XML
3. **Compile Code**: Uses TCC to compile CDATA C code
4. **Execute Function**: Calls compiled `fx()` function
5. **Store Result**: Adds `<riskProfileEvaluationResult><value>` to XML
6. **Cleanup**: Frees TCC state and temporary data

## Logic_Risk_Profile_Fx Format

Expected function signature in CDATA:

```c
gdouble fx(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result) {
    // doc: sandi_source_doc from context
    // cur: current XML node
    // user_data: can be used for passing data
    // result: can be used for passing data
    
    // Implementation here
    
    return some_value;
}
```

## XML Structure

### Input (risk_profile_report_items.xml)

```xml
<RiskProfile>
    <risiko_name>Risiko Kredit</risiko_name>
    <Profile_ID>RI0100100000</Profile_ID>
    <Faktor_Penilaian>Komposisi Portofolio Aset</Faktor_Penilaian>
    <Logic_Risk_Profile_Fx><![CDATA[
        // C code here
        gdouble fx(...) { ... }
    ]]></Logic_Risk_Profile_Fx>
</RiskProfile>
```

### Output (after evaluation)

```xml
<RiskProfile>
    ...
    <Logic_Risk_Profile_Fx>...</Logic_Risk_Profile_Fx>
    <riskProfileEvaluationResult>
        <value>2.00</value>
    </riskProfileEvaluationResult>
</RiskProfile>
```

## Running Tests

```bash
# Build tests
make eval_tests

# Run all tests
./eval_tests

# Run with verbose output
./eval_tests --verbose

# Run specific test
./eval_tests -p /eval/evaluate_risk_profile_tree

# List available tests
./eval_tests -l
```

## Error Handling

The function provides multiple levels of error checking:

1. **Parameter Validation**: NULL checks with g_error
2. **Document Validation**: Checks context documents
3. **Tree Building**: Returns error if build_risk_profile_tree fails
4. **Node Traversal**: Skips nodes without data
5. **TCC Compilation**: Handles compilation failures gracefully

## Memory Management

- **Tree Data**: Caller responsible for freeing:
  ```c
  GNode *tree = (GNode *)result.data;
  free_risk_profile_tree_data(tree);
  g_node_destroy(tree);
  ```

- **Documents**: Caller manages xmlDocPtr lifecycle
- **Error Messages**: Caller must free error_message with `free()`

## Integration with Existing Tests

The risk profile tree tests integrate with existing test suite:
- Uses same test framework (GLib Testing)
- Shares helper functions (make_eval_ctx)
- Consistent error handling patterns
- TAP-compliant output format

## Future Enhancements

Potential areas for expansion:
- Tests with actual Logic_Risk_Profile_Fx code in XML
- Verification of evaluation results
- Performance tests with large trees
- Concurrent evaluation tests
- Memory leak detection
