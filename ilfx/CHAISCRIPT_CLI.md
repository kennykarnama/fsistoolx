# ChaiScript CLI

A command-line tool for executing ChaiScript files and running an interactive REPL.

## Usage

### Execute a ChaiScript File

```bash
./build/bin/chaiscript_cli --script=path/to/script.chai
```

Example:
```bash
./build/bin/chaiscript_cli --script=sampledata/example.chai
```

### Interactive Mode (REPL)

```bash
./build/bin/chaiscript_cli --interactive
```

In interactive mode, you can:
- Type ChaiScript expressions and see immediate results
- Define functions and variables
- Type `help` for available commands
- Type `exit` or `quit` to exit

Example interactive session:
```
chai> var x = 42
[Execution completed]
chai> x * 2
84
chai> def greet(name) { return "Hello, " + name; }
[Execution completed]
chai> greet("World")
Hello, World
chai> exit
Goodbye!
```

## Features

- **File Execution**: Run ChaiScript files with full language support
- **Interactive REPL**: Test expressions and functions interactively
- **Error Reporting**: Clear error messages with stack traces
- **Logging**: Built-in logging using Abseil
- **Help System**: Built-in help in interactive mode

## ChaiScript Language Features

ChaiScript supports:
- Variables and functions
- Control flow (if/else, while, for)
- Collections (arrays, maps)
- Lambdas and closures
- Exception handling
- Object-oriented programming
- And much more!

See the [ChaiScript documentation](http://chaiscript.com/) for full language reference.

## Example Scripts

### Basic Arithmetic
```chaiscript
var a = 10;
var b = 20;
print("Sum: " + to_string(a + b));
```

### Functions
```chaiscript
def factorial(n) {
    if (n <= 1) {
        return 1;
    }
    return n * factorial(n - 1);
}

print("5! = " + to_string(factorial(5)));
```

### Collections
```chaiscript
var numbers = [1, 2, 3, 4, 5];
var doubled = numbers.map(fun(x) { return x * 2; });
print(doubled);
```

## Command-Line Options

- `--script=<path>` - Path to ChaiScript file to execute
- `--interactive` - Run in interactive REPL mode
- `--help` - Show help message
