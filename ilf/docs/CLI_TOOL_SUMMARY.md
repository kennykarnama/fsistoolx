# CLI Tool Summary

## ✅ Implementation Complete

The `eval_cli` command-line tool has been successfully created to orchestrate the entire risk profile evaluation pipeline.

## What Was Built

### CLI Tool Features

1. **Command-Line Interface** (`src/eval_cli.c`)
   - Clear argument parsing with required and optional parameters
   - Progress reporting for all 5 pipeline stages
   - Comprehensive error handling with meaningful exit codes
   - Help system with usage examples

2. **Pipeline Orchestration**
   - Loads all XML dependencies
   - Builds hierarchical risk profile tree
   - Evaluates Logic_Risk_Profile_Fx and ThresholdFunction
   - Applies rating-to-score mapping
   - Saves results to output XML

3. **Documentation**
   - `docs/CLI_USAGE.md` - Complete CLI reference
   - `README.md` - Project overview and quick start
   - Integrated with existing documentation

## Usage

### Basic Command

```bash
./eval_cli \
  --risk-profile data/risk_profile_report_items.xml \
  --sandi-source data/source_inherent_out_fx_tests.xml \
  --rating-to-score data/rating_to_score.xml \
  --output output.xml
```

### Required Arguments

| Argument | Description |
|----------|-------------|
| `--risk-profile` | Risk profile definitions with evaluation logic |
| `--sandi-source` | Source data for calculations |
| `--rating-to-score` | Rating to score mapping table |
| `--output` | Output file path |

### Optional Arguments

| Argument | Description |
|----------|-------------|
| `--pic` | Company PIC data (defaults to sandi-source) |
| `--help`, `-h` | Show help message |

## Pipeline Stages

```
[1/5] Load XML Files
  ↓
[2/5] Build Risk Profile Tree (217 nodes)
  ↓
[3/5] Evaluate Risk Profile Tree
  • Execute Logic_Risk_Profile_Fx → Score
  • Execute ThresholdFunction(Score) → Rating
  ↓
[4/5] Apply Rating-to-Score Mapping
  • Map Rating → Score (from rating_to_score.xml)
  • Calculate Score × Weight (bobot)
  ↓
[5/5] Save Results to Output XML
```

## Example Output

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
Evaluated Risk Profile Fx for RI0100100300: Result: 8.250000
Evaluated Risk Profile Fx for RI0100100200: Result: 15.500000
Evaluated Risk Profile Fx for RI0100100100: Result: 9.120000
Evaluated Threshold Function for RI0100100100: Score=9.120000, Rating=5.000000
Evaluated Risk Profile Fx for RI0100100400: Result: 3.330000
Evaluated Risk Profile Fx for RI0100100000: Result: 36.200000
Evaluated Threshold Function for RI0100100000: Score=36.200000, Rating=4.000000
   ✓ Risk profile evaluation completed

[4/5] Applying rating-to-score mapping...
Applied mapping: Rating=4 → Score=44, Weight=0.28 → SxW=12.320000
Applied mapping: Rating=5 → Score=28, Weight=0.12 → SxW=3.360000
   ✓ Rating-to-score mapping completed

[5/5] Saving results to cli_output.xml...
Saved risk profile result to: cli_output.xml
   ✓ Output saved successfully

=== Pipeline Completed Successfully ===
Results saved to: cli_output.xml
```

## Results Verification

### Parent Node (RI0100100000)
- **Evaluation Score**: 36.20 (sum of children: 9.12 + 15.5 + 8.25 + 3.33)
- **Threshold Rating**: 4.0
- **Final Score**: 44.00 (from rating_to_score.xml)
- **Weighted Score**: 12.32 (44 × 0.28)

### Child Node (RI0100100100)
- **Evaluation Score**: 9.12
- **Threshold Rating**: 5.0
- **Final Score**: 28.00 (from rating_to_score.xml)
- **Weighted Score**: 3.36 (28 × 0.12)

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | Invalid command-line arguments |
| 2 | Failed to parse XML files |
| 3 | Failed to build risk profile tree |
| 4 | Risk profile evaluation failed |
| 5 | Rating-to-score mapping failed |
| 6 | Failed to save output file |

## Build Instructions

### Compile CLI

```bash
make eval_cli
```

### Compile with Full Dependencies

The Makefile automatically includes all required source files:

```makefile
eval_cli:
	gcc -Wall -Wextra -g \
	  -I src -I test \
	  -I/usr/include/glib-2.0 \
	  -I/usr/lib/x86_64-linux-gnu/glib-2.0/include \
	  -I/usr/include/libxml2 \
	  -o eval_cli \
	  src/eval_cli.c \
	  src/eval.c \
	  src/tcch.c \
	  src/glibh.c \
	  src/xmlh.c \
	  src/gslh.c \
	  src/risk_profile_tree.c \
	  -lglib-2.0 -lxml2 -ltcc -lm -lgsl -lgslcblas
```

## Testing

### Run Test Suite

```bash
make eval_tests
./eval_tests
```

All 9 tests pass, including the complete pipeline test that matches CLI behavior:

```
TAP version 13
1..9
ok 1 /eval/evaluate_fx_xml
ok 2 /eval/evaluate_konsolidasi
ok 3 /eval/evaluate_konsolidasi_empty
ok 4 /eval/evaluate_risk_profile_tree
ok 5 /eval/evaluate_risk_profile_tree_null_docs
ok 6 /eval/evaluate_risk_profile_tree_null_userdata
ok 7 /eval/evaluate_risk_profile_tree_null_result
ok 8 /eval/evaluate_risk_profile_tree_parent_aggregation
ok 9 /eval/apply_rating_to_score_mapping
```

### Test with Sample Data

```bash
./eval_cli \
  --risk-profile data/risk_profile_report_items.xml \
  --sandi-source data/source_inherent_out_fx_tests.xml \
  --rating-to-score data/rating_to_score.xml \
  --output test_output.xml
```

## Integration Points

The CLI orchestrates these library functions:

### From `risk_profile_tree.c`
- `build_risk_profile_tree()` - Builds hierarchical tree from XML

### From `eval.c`
- `evaluate_risk_profile_tree()` - Evaluates all nodes with TCC-compiled functions
- `apply_rating_to_score_mapping()` - Maps ratings to scores and calculates weights
- `save_risk_profile_result()` - Saves XML to file

### Context Structures

```c
// Evaluation context (from eval.h)
typedef struct eval_risk_profile_context_t {
    xmlDocPtr sandi_source_doc;  // Source data
    xmlDocPtr risk_profile_doc;  // Risk profiles
} EvalRiskProfileContext;
```

## File Locations

- **Source**: `src/eval_cli.c`
- **Binary**: `./eval_cli`
- **Documentation**: `docs/CLI_USAGE.md`
- **Examples**: `README.md`

## Key Benefits

1. **Single Command** - Entire pipeline in one invocation
2. **Clear Progress** - Stage-by-stage feedback
3. **Error Handling** - Meaningful error messages and exit codes
4. **Well Documented** - Help system, usage guide, and examples
5. **Production Ready** - Memory management, error recovery, validation

## What's Included

- ✅ Complete CLI implementation
- ✅ Pipeline orchestration
- ✅ Progress reporting
- ✅ Error handling
- ✅ Help system
- ✅ Documentation (CLI_USAGE.md)
- ✅ Project README
- ✅ Build system integration
- ✅ Test verification

## Next Steps

The CLI tool is production-ready. You can now:

1. **Use it with real data**: Point to your production XML files
2. **Integrate into workflows**: Call from scripts or automation
3. **Monitor execution**: Parse output for logging/monitoring
4. **Extend functionality**: Add more options as needed (e.g., --verbose, --quiet)

## Summary

The `eval_cli` tool successfully orchestrates all functions in the risk profile evaluation system, providing a clean command-line interface for enterprise risk management workflows. It handles the complete pipeline from XML loading through final score calculation and output generation, with comprehensive error handling and progress reporting.
