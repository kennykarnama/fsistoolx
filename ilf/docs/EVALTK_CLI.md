# ExprTk CLI Setup

The `evaltk_cli` requires the ExprTk header-only library.

## Installing ExprTk

ExprTk is a header-only library. Download it from:
https://github.com/ArashPartow/exprtk

Or install via:

```bash
# Create include directory if it doesn't exist
mkdir -p /Users/kenny/go/src/github.com/kennykarnama/ilf/include

# Download exprtk.hpp
curl -L https://raw.githubusercontent.com/ArashPartow/exprtk/master/exprtk.hpp \
  -o /Users/kenny/go/src/github.com/kennykarnama/ilf/include/exprtk.hpp
```

## Building

```bash
make evaltk_cli
```

## Usage

```bash
./evaltk_cli "2 + 3 * 4"
./evaltk_cli "sin(pi / 4)"
./evaltk_cli "sqrt(16) + pow(2, 3)"
./evaltk_cli "max(10, 20, 30)"
./evaltk_cli "if(5 > 3, 100, 200)"
```
