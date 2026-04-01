# Rating Threshold CLI

A command-line tool to evaluate values against threshold rules and determine ratings.

## Overview

This tool reads threshold rules from a file and evaluates a given value to determine which rating bracket it falls into. It uses the same `ratingByThreshold` logic from the risk profile evaluator.

## Building

The CLI is built as part of the ilfx tools. Ensure you have the necessary dependencies:
- ANTLR4 runtime
- Abseil (for flags and logging)
- ExprTk (for expression evaluation)

## Usage

```bash
./rating_threshold_cli --threshold_file=<path_to_threshold_file> --value=<numeric_value>
```

### Arguments

- `--threshold_file`: Path to a file containing threshold rules (required)
- `--value`: Numeric value to evaluate (required)

## Threshold File Format

Each line in the threshold file should follow this format:

```
rating: expression
```

Where:
- `rating` is an integer representing the rating level
- `expression` is a mathematical expression using the variable `x`

### Example Threshold File

```
1: 0 <= x < 20
2: 20 <= x < 40
3: 40 <= x < 60
4: 60 <= x < 80
5: 80 <= x <= 100
```

### Supported Operators

- Comparison: `<`, `<=`, `>`, `>=`, `==`, `!=`
- Logical: `&&` (AND), `||` (OR)
- Arithmetic: `+`, `-`, `*`, `/`

## Examples

### Example 1: Basic usage

```bash
./rating_threshold_cli --threshold_file=examples/sample_threshold.txt --value=55.5
```

Output:
```
Evaluating rating for value: 55.5 using threshold rules
...
Result: Rating = 3
```

### Example 2: Edge case (lower bound)

```bash
./rating_threshold_cli --threshold_file=examples/sample_threshold.txt --value=20.0
```

Output:
```
Result: Rating = 2
```

### Example 3: Complex threshold rules

Create a file `custom_threshold.txt`:
```
1: x < 10 || x > 90
2: (10 <= x && x < 30) || (70 < x && x <= 90)
3: 30 <= x && x <= 70
```

Run:
```bash
./rating_threshold_cli --threshold_file=custom_threshold.txt --value=45
```

### Example 4: No match

```bash
./rating_threshold_cli --threshold_file=examples/sample_threshold.txt --value=150
```

Output:
```
No matching rule found
Result: Rating = -1
```

Returns exit code 2 when no matching rule is found.

## Exit Codes

- `0`: Success - rating found
- `1`: Error (invalid arguments, file not found, parse error)
- `2`: No matching rating found for the given value

## Integration with Risk Profile

This CLI uses the same `ratingByThreshold` function used in the risk profile evaluator (`riskprofile.hpp`). It can be used to:

- Test threshold rules before deploying them
- Debug rating calculations
- Validate threshold configurations
- Prototype new rating schemes

## Troubleshooting

### File not found
Ensure the threshold file path is correct and the file is readable.

### Parse errors
Check that each line in the threshold file follows the `rating: expression` format. Common issues:
- Missing colon separator
- Invalid expression syntax
- Missing variable `x` in expressions

### No matching rating
If no rule matches, ensure your threshold rules cover the entire expected range of values.
