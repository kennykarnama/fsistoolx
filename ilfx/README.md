# ILFX - Inherent Data Source Evaluator

A C++ application for processing and evaluating XML-based financial data using ChaiScript expressions and Xerces-C for XML parsing.

## Overview

ILFX provides a framework for:
- Loading and parsing XML configuration files
- Evaluating dynamic expressions using ChaiScript
- Processing financial data with FSI (Financial System Integration) rules
- Command-line interface for easy data processing

## Prerequisites

Before building the project, ensure you have the following installed:

### Required Dependencies

- **C++17 or later** compiler (Clang/GCC/MSVC)
- **CMake** 3.10 or later
- **Xerces-C** library (XML parsing)
- **Google Test** (for running tests)
- **Abseil-cpp** (included as submodule)
- **ChaiScript** (included as submodule)

### macOS Installation

```bash
# Install CMake
brew install cmake

# Install Xerces-C
brew install xerces-c

# Install Google Test
brew install googletest
```

### Linux Installation (Ubuntu/Debian)

```bash
# Install build tools
sudo apt-get update
sudo apt-get install build-essential cmake

# Install Xerces-C
sudo apt-get install libxerces-c-dev

# Install Google Test
sudo apt-get install libgtest-dev
```

## Building the Project

### 1. Clone and Setup

```bash
cd /path/to/ilfx
git submodule update --init --recursive
```

### 2. Create Build Directory

```bash
mkdir build
cd build
```

### 3. Configure with CMake

```bash
cmake ..
```

### 4. Build the Project

```bash
make
```

This will build:
- **ilfx_lib** - Core library for XML parsing and evaluation
- **ilfx_cli** - Command-line interface tool
- **inherent_datasource_test** - Unit tests for data source functionality
- **chaicli_test** - Tests for ChaiScript integration

## Project Structure

```
ilfx/
├── CMakeLists.txt              # Build configuration
├── README.md                    # This file
├── src/                         # Source code
│   ├── allheaders.hpp          # Common headers
│   ├── chaicli.hpp             # ChaiScript CLI wrapper
│   ├── chaicli_test.cpp        # ChaiScript tests
│   ├── inherent_datasource.hpp # Main evaluator class
│   ├── inherent_datasource_test.cpp  # Data source tests
│   └── ilfx_cli.cpp            # CLI entry point
├── gen/
│   └── cpp/                     # Auto-generated code from XSD
│       ├── InherentDataSource.cxx
│       └── InherentDataSource.hxx
├── sampledata/
│   └── inherentds.xml          # Sample XML data file
├── xsd/
│   └── InherentDataSource.xsd  # XML Schema Definition
└── thirdparty/
    ├── abseil-cpp/             # Google Abseil library
    └── chaiscript/             # ChaiScript expression engine
```

## Usage

### Command-Line Interface

The `ilfx_cli` tool processes XML data files with FSI rules:

```bash
./build/bin/ilfx_cli --data_path=/path/to/data.xml
```

#### Options

- `--data_path=<path>` (required) - Path to the XML data file
- `--help` - Display help message

#### Examples

Process sample data:
```bash
./build/bin/ilfx_cli --data_path=sampledata/inherentds.xml
```

## Running Tests

Execute all tests:

```bash
cd build
make test
```

Or run individual test suites:

```bash
./bin/inherent_datasource_test
./bin/chaicli_test
```

## Understanding the Code

### Core Components

#### Evaluator Class
Located in [src/inherent_datasource.hpp](src/inherent_datasource.hpp)

The `Evaluator` class is the main entry point:
- Loads XML data from a configuration file
- Manages a ChaiScript instance for expression evaluation
- Evaluates FSI rules for each data item
- Provides access to company data via `companyValuesByCode()`

```cpp
// Create an evaluator with XML config
inherent::datasource::Evaluator evaluator("config.xml");

// Run evaluation
OperationStatus status = evaluator.evaluate();
```

#### ChaiCLI Class
Located in [src/chaicli.hpp](src/chaicli.hpp)

Wrapper around ChaiScript engine:
- Manages the ChaiScript instance
- Evaluates expressions
- Returns results as `Boxed_Value` objects

```cpp
ChaiClient::ChaiCLI cli;
auto result = cli.evaluate("2 + 2");
```

#### Data Structure
Auto-generated from [xsd/InherentDataSource.xsd](xsd/InherentDataSource.xsd)

Provides C++ classes for:
- XML parsing and serialization
- Type-safe access to configuration data
- Integration with Xerces-C

### Workflow

1. **Load XML**: Evaluator reads and parses the XML configuration
2. **Initialize ChaiScript**: Sets up the expression engine
3. **Register Functions**: Adds custom functions like `companyValuesByCode()`
4. **Evaluate Rules**: For each data item, evaluates the FSI rule expression
5. **Return Results**: Returns evaluation status and any output

## Sample XML Format

The XML file should conform to [InherentDataSource.xsd](xsd/InherentDataSource.xsd):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<InherentDataSource>
  <list>
    <item>
      <code>TICKER_CODE</code>
      <detail>
        <row>
          <companyName>Company Name</companyName>
          <value>123.45</value>
        </row>
      </detail>
      <fsiRule>var result = companyValuesByCode("code")</fsiRule>
    </item>
  </list>
</InherentDataSource>
```

## Building from Scratch

If regenerating code from XSD schema (advanced):

```bash
# Generate C++ from XSD
xsd cxx-tree --generate-serialization xsd/InherentDataSource.xsd
```

Note: Generated files are already provided in the `gen/` directory.

## Troubleshooting

### Build Errors

**"Xerces-C not found"**
- Install Xerces-C development headers: `brew install xerces-c` (macOS) or `sudo apt-get install libxerces-c-dev` (Linux)
- Ensure it's in the search path specified in CMakeLists.txt

**"Google Test not found"**
- Install GTest: `brew install googletest` (macOS) or `sudo apt-get install libgtest-dev` (Linux)

### Runtime Issues

**"File not found" error**
- Ensure the XML file path is correct and absolute
- Verify the file exists: `ls -la /path/to/file.xml`

**"Evaluation failed"**
- Check that the FSI rule is valid ChaiScript syntax
- Verify the XML schema matches [xsd/InherentDataSource.xsd](xsd/InherentDataSource.xsd)
- Check logs for detailed error messages

## Development

### Code Style

The project follows C++17 standards with:
- Standard library containers and smart pointers
- RAII principles for resource management
- Namespace organization for module separation

### Adding Features

To add new functionality:

1. Modify [src/inherent_datasource.hpp](src/inherent_datasource.hpp) for data evaluation logic
2. Add new ChaiScript functions via `chai.add()`
3. Update tests in [src/inherent_datasource_test.cpp](src/inherent_datasource_test.cpp)
4. Rebuild: `cd build && make`

### Debugging

Enable detailed logging:
```cpp
LOG(INFO) << "Debug message";
LOG(ERROR) << "Error message";
```

## License

[Add your license information here]

## Contributing

[Add contribution guidelines here]

## Support

For issues or questions:
1. Check the [Troubleshooting](#troubleshooting) section
2. Review test cases for usage examples
3. Examine sample XML data in [sampledata/](sampledata/)
