# GoFunct - Go Statistical Functions Library

## Overview

`gofunct` is a Go library compiled as a C archive that provides statistical functions callable from C/C++ code. This library includes:

1. **MajorityScoreF64**: Calculate majority score from array of values (1-5 range)
2. **PearsonCorrelationF64**: Calculate Pearson correlation coefficient between two arrays
3. **MinimumScoreF64**: Find minimum value from array of values

The library is designed to be used in C/C++ projects as a drop-in replacement for similar functions from GSL (GNU Scientific Library) or other statistical libraries.

## Available Functions

### 1. MajorityScoreF64

Calculates the **majority score** from an array of numeric values (1-5 range).

**What is Majority Score?**

Majority Score is a value that appears more than 50% of the total data count. The algorithm:
1. Counts the frequency of each value (1-5)
2. Traverses from lowest value (1) to highest (5)
3. Accumulates the frequencies
4. Returns first value where accumulation exceeds half of total data

**Example:**
- Data: `[1, 2, 2, 2, 3]` with 5 elements (half = 2.5)
- Frequencies: 1→1x, 2→3x, 3→1x
- Accumulation: 1→cum=1, 2→cum=4 (>2.5, STOP!)
- Result: 2

### 2. PearsonCorrelationF64

Calculates the **Pearson correlation coefficient** between two arrays.

**What is Pearson Correlation?**

Measures linear relationship between two variables, ranging from -1 to +1:
- **+1**: Perfect positive correlation
- **0**: No linear correlation
- **-1**: Perfect negative correlation

**Example:**
- X: `[1, 2, 3, 4, 5]`
- Y: `[2, 4, 6, 8, 10]`
- Result: 1.0 (perfect positive, Y = 2×X)

### 3. MinimumScoreF64

Finds the **minimum value** from an array of numeric values.

**What is Minimum?**

Returns the smallest value in the array using `stats.Min()` function.

**Example:**
- Data: `[5.0, 2.0, 8.0, 1.0, 9.0]`
- Result: 1.0 (smallest value)

**Features:**
- Supports negative values
- Supports decimal/float values
- Returns 0.0 for empty arrays

## Understanding main.go

The `main.go` file implements all exported functions callable from C/C++ code.

### Key Imports

- `package main`: Required for building executable/library
- `import "C"`: Special package for CGo interoperability with C
- `math`: Used for mathematical operations (rounding, etc.)
- `unsafe`: Used for pointer conversion between Go and C
- `github.com/montanaflynn/stats`: Statistical functions library for correlation

### Function 1: MajorityScoreF64

```c
int MajorityScoreF64(double *values, int length)
```

**Parameters:**
- `values *C.double`: Pointer to C double array (float64)
- `length C.int`: Number of elements in the array

**Returns:**
- `C.int`: The majority score value (1-5), or 0 if no majority exists

**Implementation Details:**
- Zero-copy conversion using `unsafe.Slice`
- Frequency counting for values 1-5
- Cumulative accumulation to find majority
- Time complexity: O(n), Space: O(1)

### Function 2: PearsonCorrelationF64

```c
double PearsonCorrelationF64(double *arr1, double *arr2, int lengthArr)
```

**Parameters:**
- `arr1 *C.double`: Pointer to first C double array (X values)
- `arr2 *C.double`: Pointer to second C double array (Y values)
- `lengthArr C.int`: Number of elements in both arrays (must be equal)

**Returns:**
- `C.double`: Pearson correlation coefficient (-1.0 to +1.0), or 0.0 if error/empty

**Implementation Details:**
- Zero-copy conversion for both arrays
- Uses `stats.Correlation()` for calculation
- Returns 0.0 on error or empty arrays
- Time complexity: O(n), Space: O(1)

### Function 3: MinimumScoreF64

```c
double MinimumScoreF64(double *values, int length)
```

**Parameters:**
- `values *C.double`: Pointer to C double array (float64)
- `length C.int`: Number of elements in the array

**Returns:**
- `C.double`: The minimum value from the array, or 0.0 if empty

**Implementation Details:**
- Zero-copy conversion using `unsafe.Slice`
- Uses `stats.Min()` for finding minimum
- Returns 0.0 on error or empty arrays
- Time complexity: O(n), Space: O(1)

### Internal Helper Functions

- **majorityScoreF64Wrapper**: Go wrapper for testing MajorityScoreF64
- **pearsonCorrelationF64Wrapper**: Go wrapper for testing PearsonCorrelationF64
- **minimumScoreF64Wrapper**: Go wrapper for testing MinimumScoreF64
- **main()**: Empty function (required for main package)

## Build Instructions

### Build Command

From `/home/fsis-api/gofunct/` directory:

```bash
go build -buildmode=c-archive -o gen/libgofunct.a ./main.go
```

### Build Parameters Explained

| Parameter | Description |
|-----------|-------------|
| `-buildmode=c-archive` | Compile as C static library (.a file) |
| `-o gen/libgofunct.a` | Output path and library filename |
| `./main.go` | Source file to be compiled |

### Build Output

After successful build, it generates 2 files in `gen/` directory:

1. **libgofunct.a**: Static library containing compiled code
2. **libgofunct.h**: C header file containing function declarations

### Installation for Local Testing

#### Copy Library to System Path

```bash
sudo cp /home/fsis-api/gofunct/gen/libgofunct.a /usr/local/lib/
```

#### Copy Header File to Project

```bash
cp /home/fsis-api/gofunct/gen/libgofunct.h /home/fsis-api/tools/ilfx/src/
```

### Full Build and Install Script

```bash
#!/bin/bash
# build_and_install.sh

# Build the library
cd /home/fsis-api/gofunct
go build -buildmode=c-archive -o gen/libgofunct.a ./main.go

# Install library
sudo cp gen/libgofunct.a /usr/local/lib/

# Copy header to project
cp gen/libgofunct.h ../tools/ilfx/src/

echo "Build and installation complete!"
echo "Library: /usr/local/lib/libgofunct.a"
echo "Header: /home/fsis-api/tools/ilfx/src/libgofunct.h"
```

## Usage from C/C++

### Include the Header

Include the generated header file in your C/C++ code:

```c
#include "libgofunct.h"
```

### Function Signatures

The header file contains these function declarations:

```c
extern int MajorityScoreF64(double* values, int length);
extern double PearsonCorrelationF64(double* arr1, double* arr2, int lengthArr);
extern double MinimumScoreF64(double* values, int length);
```

### Example Usage in C

```c
#include <stdio.h>
#include "libgofunct.h"

int main() {
    // Example 1: Majority Score
    double scores[] = {1.2, 2.7, 2.3, 2.8, 3.1};
    int majority = MajorityScoreF64(scores, 5);
    printf("Majority Score: %d\n", majority);
    
    // Example 2: Pearson Correlation
    double x[] = {1.0, 2.0, 3.0, 4.0, 5.0};
    double y[] = {2.0, 4.0, 6.0, 8.0, 10.0};
    double corr = PearsonCorrelationF64(x, y, 5);
    printf("Correlation: %.4f\n", corr);
    
    // Example 3: Minimum Score
    double values[] = {5.0, 2.0, 8.0, 1.0, 9.0};
    double min = MinimumScoreF64(values, 5);
    printf("Minimum: %.2f\n", min);
    
    return 0;
}
```

### Compiling Your C/C++ Program

When compiling, link with the library and required dependencies:

```bash
# Using library from system path
gcc -o myapp myapp.c -lgofunct -lpthread -lm

# Or specify library path directly
gcc -o myapp myapp.c /usr/local/lib/libgofunct.a -lpthread -lm
```

**Required linker flags:**
- `-lgofunct` or path to `libgofunct.a`: The Go functions library
- `-lpthread`: Required for Go runtime
- `-lm`: Required for math operations

### For C++ Projects

```bash
g++ -o myapp myapp.cpp -lgofunct -lpthread -lm
```

## Requirements

### Build Requirements

- **Go 1.15 or higher** (for `unsafe.Slice` support)
- **CGo enabled** (default in most Go installations)
- **github.com/montanaflynn/stats** library

### Runtime Requirements (C/C++)

- **GCC or compatible C compiler** (for compiling C/C++ programs)
- **pthread library** (usually available on Linux/Unix systems)
- **math library** (usually available on Linux/Unix systems)

### Installing Go Dependencies

Before building, ensure the stats library is installed:

```bash
cd /home/fsis-api/gofunct
go mod download
# or
go get github.com/montanaflynn/stats
```

## Testing

### Running Go Tests

Test the functions from Go using the test suite:

```bash
cd /home/fsis-api/gofunct
go test -v
```

### Test Coverage

```bash
go test -v -cover
```

## Project Structure

```
gofunct/
├── main.go           # Main library implementation with exported functions
├── main_test.go      # Test suite for all functions
├── readme.md         # This documentation file
└── gen/              # Build output directory
    ├── libgofunct.a  # Compiled static library
    └── libgofunct.h  # C header file with function declarations
```

## Troubleshooting

### Issue: CGo Not Enabled

If you see error about C source files not allowed:

```bash
export CGO_ENABLED=1
go build -buildmode=c-archive -o gen/libgofunct.a ./main.go
```

### Issue: Missing Stats Library

If build fails with missing package error:

```bash
go get github.com/montanaflynn/stats
go build -buildmode=c-archive -o gen/libgofunct.a ./main.go
```

### Issue: Directory Not Found

If the output directory doesn't exist:

```bash
mkdir -p gen
go build -buildmode=c-archive -o gen/libgofunct.a ./main.go
```

### Issue: Permission Denied (Installing to /usr/local/lib)

If you get permission denied when copying to system path:

```bash
sudo cp /home/fsis-api/gofunct/gen/libgofunct.a /usr/local/lib/
```

### Issue: Library Not Found When Compiling C Program

If linker can't find the library:

```bash
# Update library cache
sudo ldconfig

# Or specify library path explicitly
gcc -o myapp myapp.c -L/usr/local/lib -lgofunct -lpthread -lm
```

### Cross-Platform Building

For building on different platforms:

```bash
# Build for Linux AMD64
GOOS=linux GOARCH=amd64 CGO_ENABLED=1 \
  go build -buildmode=c-archive -o libgofunct_linux_amd64.a ./main.go

# Build for Windows AMD64
GOOS=windows GOARCH=amd64 CGO_ENABLED=1 \
  go build -buildmode=c-archive -o libgofunct_windows_amd64.a ./main.go
```

## Performance Characteristics

### MajorityScoreF64
- **Zero-copy operation**: Uses `unsafe.Slice` to avoid data copying
- **Single-pass algorithm**: Only one iteration through data
- **Time complexity**: O(n) - linear with data size
- **Space complexity**: O(1) - constant space (6 integers for counting)

### PearsonCorrelationF64
- **Zero-copy operation**: Direct pointer access to both arrays
- **Single-pass calculation**: Uses optimized stats library
- **Time complexity**: O(n) - linear with data size
- **Space complexity**: O(1) - constant space for temporary variables
- **Accuracy**: 64-bit float precision (same as GSL)

### MinimumScoreF64
- **Zero-copy operation**: Uses `unsafe.Slice` to avoid data copying
- **Single-pass algorithm**: One iteration to find minimum
- **Time complexity**: O(n) - linear with data size
- **Space complexity**: O(1) - constant space
- **Supports**: Negative values, decimals, and mixed ranges

## Important Notes

### For MajorityScoreF64
- Only counts values in range 1-5
- Values outside range are ignored
- Returns 0 if no majority exists
- Requires more than half of values to be the same

### For PearsonCorrelationF64
- Both arrays must have equal length
- Returns 0.0 for empty arrays
- Returns 0.0 on calculation errors
- Result range: -1.0 (negative correlation) to +1.0 (positive correlation)

### For MinimumScoreF64
- Returns 0.0 for empty arrays
- Works with any numeric range (not limited to 1-5)
- Supports negative and decimal values
- Returns exact minimum value found in array

## Integration with FSIS Project

This library is designed to be integrated with the FSIS project at:
- **Library location**: `/usr/local/lib/libgofunct.a`
- **Header location**: `/home/fsis-api/tools/ilfx/src/libgofunct.h`

When building ilfx or other C++ components, link with `-lgofunct -lpthread -lm`.

## License

Follows the main FSIS-API project license.

## Version History

### Version 1.1
- Added MinimumScoreF64: Find minimum value in array using stats.Min
- Updated test coverage for all three functions
- Enhanced documentation

### Version 1.0
- Initial implementation
- MajorityScoreF64: Majority score calculation with cumulative approach
- PearsonCorrelationF64: Pearson correlation using stats library
- Export as C library with CGo
- Full test coverage for both functions
