# Risk Profile ThresholdFunction - Visual Architecture

## Complete System Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                    evaluate_risk_profile_tree()                      │
│                                                                       │
│  1. Load risk_profile_report_items.xml                              │
│  2. Build GNode tree (217 nodes)                                    │
│  3. Traverse tree (G_POST_ORDER)                                    │
│  4. For each node: call _fx_risk_profile()                          │
└────────────────────────────┬────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────────────┐
│                      _fx_risk_profile(node)                          │
│                     [Callback for each node]                         │
└─────────────────────────────────────────────────────────────────────┘
                             ↓
                ┌────────────┴────────────┐
                ↓                         ↓
    ┌───────────────────────┐   ┌─────────────────────┐
    │   STAGE 1: SCORE      │   │  STAGE 2: RATING    │
    │  Logic_Risk_Profile_Fx│   │  ThresholdFunction  │
    └───────────────────────┘   └─────────────────────┘
                │                         │
                ↓                         ↓

┌─────────────────────────────────────────────────────────────────────┐
│                          STAGE 1: SCORE CALCULATION                  │
├─────────────────────────────────────────────────────────────────────┤
│                                                                       │
│  1. Find <Logic_Risk_Profile_Fx> in XML node                        │
│     ↓                                                                │
│  2. Extract CDATA C code                                            │
│     │  Example:                                                      │
│     │  gdouble fx(...) {                                            │
│     │      return 77.6 * 0.28;  // = 21.728                        │
│     │  }                                                             │
│     ↓                                                                │
│  3. Create TCC state: tcc_new()                                     │
│     ↓                                                                │
│  4. Compile code: tcch_compile_code()                               │
│     ↓                                                                │
│  5. Get function pointer: (*f)(...)                                 │
│     ↓                                                                │
│  6. Execute function:                                               │
│     score_value = f(sandi_source_doc, cur, NULL, NULL)             │
│     ↓                                                                │
│  7. Store in XML:                                                   │
│     <riskProfileEvaluationResult>                                   │
│       <value>21.728000</value>                                      │
│     </riskProfileEvaluationResult>                                  │
│     ↓                                                                │
│  8. Cleanup TCC state: tcc_delete()                                 │
│                                                                       │
└────────────────────────────┬────────────────────────────────────────┘
                             ↓
                    [score_value = 21.728]
                             ↓
┌─────────────────────────────────────────────────────────────────────┐
│                      STAGE 2: RATING DETERMINATION                   │
├─────────────────────────────────────────────────────────────────────┤
│                                                                       │
│  1. Find <ThresholdFunction> in XML node                            │
│     ↓                                                                │
│  2. Extract CDATA C code                                            │
│     │  Example:                                                      │
│     │  gdouble fx(..., gpointer user_data, ...) {                  │
│     │      gdouble score = *(gdouble*)user_data;                   │
│     │      if (score <= 36.0) return 5.0;                          │
│     │      else if (score <= 52.0) return 4.0;                     │
│     │      // ...                                                   │
│     │  }                                                             │
│     ↓                                                                │
│  3. Create TCC state: tcc_new()                                     │
│     ↓                                                                │
│  4. Compile code: tcch_compile_code()                               │
│     ↓                                                                │
│  5. Get function pointer: (*threshold_f)(...)                       │
│     ↓                                                                │
│  6. Pass score as pointer:                                          │
│     rating_value = threshold_f(sandi_source_doc, cur,              │
│                                &score_value, NULL)                  │
│     ↓                                                                │
│  7. Store in XML:                                                   │
│     <thresholdRating>                                               │
│       <value>5.0</value>                                            │
│     </thresholdRating>                                              │
│     ↓                                                                │
│  8. Cleanup TCC state: tcc_delete()                                 │
│                                                                       │
└─────────────────────────────────────────────────────────────────────┘

## Data Flow Diagram

```
XML File                 Memory              TCC Compiler         Results
─────────               ───────              ────────────         ────────

risk_profile_          
report_items.xml       
     │                 
     ├─ <RiskProfile>  
     │   │             
     │   ├─ Profile_ID ──────→ RiskProfileData
     │   │                         │
     │   ├─ Logic_Risk_            │
     │   │  Profile_Fx ──→ CDATA ──┼──→ tcc_compile ──→ fx() ──→ 21.728
     │   │              C code     │         │                      │
     │   │                         │         ↓                      │
     │   │                         │    function ptr               │
     │   │                         │                                │
     │   │                         │    Store score                 │
     │   │  <riskProfile... ←──────┼────────────────────────────────┘
     │   │                         │
     │   │                         │
     │   ├─ ThresholdFunc ─→ CDATA─┼──→ tcc_compile ──→ fx() ──→ 5.0
     │   │                C code   │         │            ↑         │
     │   │                         │         ↓            │         │
     │   │                         │    function ptr      │         │
     │   │                         │         │            │         │
     │   │                         │         └────────────┘         │
     │   │                         │       user_data = &score       │
     │   │                         │                                │
     │   │                         │    Store rating                │
     │   │  <thresholdRating ←─────┼────────────────────────────────┘
     │   │                         │
     │   └─ ... other fields       │
     │                              │
     └─ Next node ──────────────────┘
                (217 total)

```

## Memory Layout During Evaluation

```
Stack Frame: _fx_risk_profile()
┌────────────────────────────────────────┐
│ ctx: EvalRiskProfileContext*           │
│   ├─ sandi_source_doc: xmlDocPtr      │
│   └─ risk_profile_doc: xmlDocPtr      │
│                                        │
│ rp_data: RiskProfileData*              │
│   ├─ profile_id: "RI0100100000"       │
│   ├─ xml_node: xmlNodePtr             │
│   └─ ...                               │
│                                        │
│ score_value: gdouble = 21.728         │◄─── Stage 1 output
│ has_score: gboolean = TRUE             │
│                                        │
│ tcc_state: TCCState* ──────┐          │
│                            ↓           │
│ ┌─────────────────────────────────┐   │
│ │   TCC Compiler State            │   │
│ │   ├─ compiled_code: void*       │   │
│ │   ├─ symbols: hash_table        │   │
│ │   └─ function_ptr: gdouble(*)() │   │
│ └─────────────────────────────────┘   │
│                                        │
│ rating_value: gdouble = 5.0           │◄─── Stage 2 output
│                                        │
└────────────────────────────────────────┘

Heap:
┌────────────────────────────────────────┐
│ Tree Structure: GNode*                 │
│   Root (virtual)                       │
│     ├─ RI0100100000                    │
│     │    ├─ RI0100100100               │
│     │    ├─ RI0100100200               │
│     │    └─ ...                         │
│     ├─ RI0200000000                    │
│     └─ ...                              │
│   (217 nodes total)                    │
└────────────────────────────────────────┘

XML Document:
┌────────────────────────────────────────┐
│ risk_profile_doc: xmlDocPtr            │
│   <RiskProfiles>                       │
│     <RiskProfile>                      │
│       ... (before evaluation)          │
│       [Results added here]             │◄─── Modified in-place
│     </RiskProfile>                     │
│   </RiskProfiles>                      │
└────────────────────────────────────────┘
```

## Function Call Chain

```
main()
  └─ g_test_run()
      └─ test_evaluate_risk_profile_tree()
          ├─ xmlReadFile("risk_profile_report_items.xml")
          ├─ xmlReadFile("source_inherent_out_fx_tests.xml")
          ├─ make_risk_profile_ctx()
          │
          └─ evaluate_risk_profile_tree()
              ├─ build_risk_profile_tree()
              │   ├─ xmlXPathEvalExpression("//RiskProfile")
              │   ├─ Create GHashTable for lookups
              │   └─ Build parent-child relationships
              │
              └─ g_node_traverse(G_POST_ORDER, _fx_risk_profile)
                  │
                  ├─ [Node 217] _fx_risk_profile()
                  │   ├─ tcch_compile_code(Logic_Risk_Profile_Fx)
                  │   ├─ fx() → score
                  │   ├─ xmlNewChild(riskProfileEvaluationResult)
                  │   ├─ tcch_compile_code(ThresholdFunction)
                  │   ├─ fx(&score) → rating
                  │   └─ xmlNewChild(thresholdRating)
                  │
                  ├─ [Node 216] _fx_risk_profile()
                  │   └─ ... (same process)
                  │
                  └─ ... (all 217 nodes)
```

## Complexity Breakdown

| Component               | Operations per Node | Total (217 nodes) |
|------------------------|---------------------|-------------------|
| XML Parsing            | 1                   | 217               |
| TCC Compilations       | 2 (score + rating)  | 434               |
| Function Executions    | 2 (score + rating)  | 434               |
| XML Node Creations     | 2 (results)         | 434               |
| Memory Allocations     | ~10                 | ~2,170            |
| String Operations      | ~5                  | ~1,085            |
| **Total Operations**   | **~20**             | **~4,340**        |

**Time Complexity**: O(n) where n = number of nodes
**Space Complexity**: O(n) for tree + O(1) per evaluation
**Actual Runtime**: < 1 second for 217 nodes

## Error Handling Flow

```
_fx_risk_profile()
    │
    ├─ Check ctx validity ────────┐
    │                              ↓
    ├─ Check rp_data ──────────────┼─→ return FALSE (skip node)
    │                              │
    ├─ Extract Logic_Fx CDATA ─────┤
    │   └─ NULL? ───────────────────┤
    │                              │
    ├─ Create TCC state ───────────┤
    │   └─ Failed? ─────────────────┼─→ g_error() + cleanup
    │                              │
    ├─ Compile code ───────────────┤
    │   └─ Failed? ─────────────────┤
    │                              │
    ├─ Execute function ───────────┤
    │   └─ Returns score            │
    │                              │
    ├─ Extract Threshold CDATA ────┤
    │   └─ NULL? ───────────────────┼─→ Skip threshold (OK)
    │                              │
    ├─ Create TCC state ───────────┤
    │   └─ Failed? ─────────────────┤
    │                              │
    ├─ Compile code ───────────────┤
    │   └─ Failed? ─────────────────┤
    │                              │
    ├─ Execute with &score ────────┤
    │   └─ Returns rating           │
    │                              │
    └─ return FALSE (continue) ────┘
```

## Why This Is Complex

1. **Multi-Language Integration**: C ↔ XML ↔ TCC ↔ GLib
2. **Runtime Code Generation**: Compiling C code on-the-fly
3. **Memory Management**: Manual allocation/deallocation across layers
4. **Pointer Juggling**: Function pointers, data pointers, XML pointers
5. **State Management**: TCC state, tree state, XML state
6. **Error Propagation**: Through multiple layers
7. **Type Conversions**: String → Double → Pointer → Double → String
8. **Tree Traversal**: Recursive post-order with callbacks
9. **XML Manipulation**: Reading CDATA, creating nodes
10. **Testing Verification**: Extracting and validating nested XML results

But hey, it works! 🎉 And it's flexible, powerful, and maintainable!
