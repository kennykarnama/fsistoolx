# Risk Profile Evaluation CLI

## Overview

The `eval_cli` tool orchestrates the complete risk profile evaluation pipeline, from loading XML data through final score calculation and output generation.

## Pipeline Stages

The CLI executes a 5-stage pipeline:

1. **Load XML Files** - Parses all required XML documents
2. **Build Risk Profile Tree** - Creates hierarchical tree structure from risk profiles
3. **Evaluate Risk Profile Tree** - Executes Logic_Risk_Profile_Fx and ThresholdFunction for each node
4. **Apply Rating-to-Score Mapping** - Maps threshold ratings to standardized scores and calculates weighted values
5. **Save Results** - Writes complete evaluation results to output XML file

## Usage

```bash
./eval_cli [OPTIONS]
```

### Required Options

- `--risk-profile <file>` - Risk profile report items XML file containing:
  - RiskProfile nodes with Profile_ID
  - Logic_Risk_Profile_Fx (CDATA sections with C code)
  - ThresholdFunction (CDATA sections with C code)
  - Sample_Bobot (weight values)

- `--sandi-source <file>` - Source data XML file containing:
  - sourceInherentRevampReport elements
  - sandiRevamp nodes with actual data values

- `--rating-to-score <file>` - Rating to score mapping XML file containing:
  - RatingScore elements mapping Rating (1-5) to Score values

- `--output <file>` - Output XML file path where results will be saved

### Optional Options

- `--pic <file>` - Company PIC XML file (defaults to sandi-source if not provided)
- `--help`, `-h` - Show help message

## Example

```bash
./eval_cli \
  --risk-profile data/risk_profile_report_items.xml \
  --sandi-source data/source_inherent_out_fx_tests.xml \
  --rating-to-score data/rating_to_score.xml \
  --output cli_output.xml
```

## Output

The CLI provides progress feedback for each stage:

```
=== Risk Profile Evaluation Pipeline ===
Risk Profile:     data/risk_profile_report_items.xml
Sandi Source:     data/source_inherent_out_fx_tests.xml
Rating to Score:  data/rating_to_score.xml
Output:           cli_output.xml

[1/5] Loading XML files...
   ✓ All XML files loaded successfully

[2/5] Building risk profile tree...
   ✓ Built tree with 217 nodes

[3/5] Evaluating risk profile tree...
   ✓ Risk profile evaluation completed

[4/5] Applying rating-to-score mapping...
   ✓ Rating-to-score mapping completed

[5/5] Saving results to cli_output.xml...
   ✓ Output saved successfully

=== Pipeline Completed Successfully ===
Results saved to: cli_output.xml
```

## Output XML Structure

The output XML contains evaluated RiskProfile nodes with:

```xml
<RiskProfile>
  <Profile_ID>RI0100100000</Profile_ID>
  <risiko_name>Risiko Kredit</risiko_name>
  ...
  
  <!-- Stage 3 Output: Evaluation Results -->
  <riskProfileEvaluationResult>
    <value>36.200000</value>
  </riskProfileEvaluationResult>
  
  <!-- Stage 3 Output: Threshold Rating -->
  <thresholdRating>
    <value>4.0</value>
  </thresholdRating>
  
  <!-- Stage 4 Output: Final Score -->
  <finalScore>
    <value>44.00</value>
  </finalScore>
  
  <!-- Stage 4 Output: Weighted Score -->
  <scoreXweight>
    <value>12.320000</value>
  </scoreXweight>
</RiskProfile>
```

## Exit Codes

- `0` - Success
- `1` - Invalid command-line arguments
- `2` - Failed to parse XML files
- `3` - Failed to build risk profile tree
- `4` - Risk profile evaluation failed
- `5` - Rating-to-score mapping failed
- `6` - Failed to save output file

## How It Works

### 1. Two-Stage Evaluation

For each RiskProfile node:

1. **Stage 1**: Execute `Logic_Risk_Profile_Fx` to calculate a numeric score
2. **Stage 2**: Pass score to `ThresholdFunction` to get rating (1-5)

Both values are stored in the XML.

### 2. Parent Aggregation

Parent nodes can aggregate children's results using XPath queries:

```c
// In Logic_Risk_Profile_Fx for parent node
const xmlChar *xpath = 
    "//RiskProfile[starts-with(Profile_ID, 'RI01001001')]/riskProfileEvaluationResult/value";
xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression(xpath, xpathCtx);
// Sum all children values...
```

Post-order traversal ensures children are evaluated before parents.

### 3. Rating-to-Score Mapping

After evaluation:

1. Read `thresholdRating` from each RiskProfile
2. Lookup corresponding score in `rating_to_score.xml`
3. Read `Sample_Bobot` (weight) from RiskProfile
4. Calculate `finalScore` and `scoreXweight = finalScore × Sample_Bobot`
5. Add both values to output XML

## Integration

The CLI tool orchestrates these library functions:

- `build_risk_profile_tree()` - From `risk_profile_tree.c`
- `evaluate_risk_profile_tree()` - From `eval.c`
- `apply_rating_to_score_mapping()` - From `eval.c`
- `save_risk_profile_result()` - From `eval.c`

All functions use:
- **GLib** for tree structures and utilities
- **libxml2** for XML parsing and XPath queries
- **TCC** for runtime C compilation
- **GSL** for statistical functions

## Testing

Run the test suite to verify the pipeline:

```bash
make eval_tests
./eval_tests
```

All 9 tests should pass, including:
- Basic evaluation
- Parent aggregation
- Rating-to-score mapping
- Null safety checks

## Development

To rebuild the CLI after code changes:

```bash
make eval_cli
```

The Makefile automatically includes all required source files:
- `eval_cli.c` - CLI orchestration
- `eval.c` - Evaluation functions
- `risk_profile_tree.c` - Tree building
- `tcch.c` - TCC compilation helper
- `xmlh.c` - XML helper functions
- `gslh.c` - GSL helper functions
- `glibh.c` - GLib helper functions

## See Also

- `TEST_RISK_PROFILE_WITH_EVALUATION.md` - Detailed evaluation documentation
- `TEST_PARENT_AGGREGATION.md` - Parent-child aggregation patterns
- `RISK_PROFILE_TREE.md` - Tree structure documentation
- `TEST_THRESHOLD_FUNCTION.md` - Threshold function implementation
