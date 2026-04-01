# Code Convention and Style Guide

## Overview

This project uses **clang-format** for code formatting and **clang-tidy** for static analysis and linting.

## Prerequisites

Install the required tools:

```bash
# On Ubuntu/Debian
sudo apt-get install clang-format clang-tidy

# On macOS with Homebrew
brew install clang-format llvm
```

## Makefile Targets

### Code Formatting

#### `make format`
Automatically format all C source and header files according to the project's `.clang-format` configuration.

```bash
make format
```

**What it does:**
- Finds all `.c` and `.h` files in `src/` and `test/` directories
- Applies clang-format in-place (modifies files)
- Uses the `.clang-format` configuration file

**When to use:**
- Before committing code
- After writing new functions
- When updating existing code

#### `make format-check`
Check if code formatting is correct without modifying files.

```bash
make format-check
```

**What it does:**
- Runs clang-format in dry-run mode
- Reports formatting issues without changing files
- Exits with error if formatting is incorrect

**When to use:**
- In CI/CD pipelines
- Before running `make format` to see what will change
- As a pre-commit check

### Static Analysis

#### `make lint`
Run clang-tidy static analysis on source files.

```bash
make lint
```

**What it does:**
- Analyzes all `.c` files in `src/` directory
- Checks for common bugs, performance issues, and code smells
- Reports warnings and suggestions
- Uses the `.clang-tidy` configuration file

**Checks include:**
- Memory leaks and null pointer dereferences
- Unused variables and functions
- Performance issues
- Code readability problems
- Best practice violations

**When to use:**
- Before committing major changes
- During code review
- When debugging difficult issues

#### `make lint-fix`
Run clang-tidy with automatic fixes applied.

```bash
make lint-fix
```

**What it does:**
- Same as `make lint` but applies automatic fixes
- Modifies source files to fix detected issues
- Only applies fixes that are considered safe

**Warning:** Review changes after running this command!

**When to use:**
- To quickly fix simple issues
- After understanding the warnings from `make lint`

## Configuration Files

### `.clang-format`

Defines code formatting rules:
- **IndentWidth:** 4 spaces
- **ColumnLimit:** 100 characters
- **BreakBeforeBraces:** Linux style (opening brace on same line for functions)
- **PointerAlignment:** Right (e.g., `char *ptr`)
- **TabWidth:** 4 spaces, no tabs

Key style choices:
```c
// Function declarations
void my_function(int arg)
{
    // Linux-style braces
}

// Control structures
if (condition) {
    // Same-line opening brace
}

// Pointer alignment
char *str;
int *ptr;
```

### `.clang-tidy`

Defines static analysis rules:

**Enabled checks:**
- `clang-diagnostic-*` - Compiler warnings
- `clang-analyzer-*` - Static analyzer checks
- `bugprone-*` - Bug-prone code patterns
- `cert-*` - CERT secure coding guidelines
- `cppcoreguidelines-*` - C++ core guidelines (applicable to C)
- `misc-*` - Miscellaneous checks
- `performance-*` - Performance optimizations
- `portability-*` - Portability issues
- `readability-*` - Code readability

**Disabled checks:**
- `readability-identifier-length` - Short variable names allowed
- `readability-magic-numbers` - Magic numbers allowed
- `cert-err33-c` - Not enforcing return value checks everywhere
- `misc-unused-parameters` - Unused parameters allowed (common in callbacks)

## Workflow Examples

### Before Committing

```bash
# Format code
make format

# Check for issues
make lint

# Run tests
make test

# Commit changes
git add .
git commit -m "Your commit message"
```

### CI/CD Integration

```bash
# Check formatting without modifying
make format-check

# Run static analysis
make lint

# Build and test
make all
make test
```

### Fixing Code Issues

```bash
# See what needs fixing
make lint

# Apply automatic fixes (review after!)
make lint-fix

# Format the code
make format

# Verify everything works
make test
```

## Common Issues and Solutions

### Issue: clang-format not installed

**Solution:**
```bash
sudo apt-get install clang-format
```

### Issue: clang-tidy not found

**Solution:**
```bash
sudo apt-get install clang-tidy
```

### Issue: Too many lint warnings

**Solution:**
- Fix issues incrementally
- Adjust `.clang-tidy` to disable specific checks
- Focus on high-priority warnings first

### Issue: Formatting conflicts with personal style

**Solution:**
- Discuss with team
- Update `.clang-format` configuration
- Use `// clang-format off` and `// clang-format on` for specific sections

## Ignoring Specific Code Sections

### Disable clang-format for a section

```c
// clang-format off
int matrix[3][3] = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};
// clang-format on
```

### Disable clang-tidy for a line

```c
// NOLINTNEXTLINE(cert-err33-c)
printf("This won't check return value\n");
```

### Disable clang-tidy for a file

Add to top of file:
```c
// NOLINTBEGIN
// ... your code ...
// NOLINTEND
```

## Integration with Editors

### VS Code

Install extensions:
- C/C++ Extension (Microsoft)
- clang-format Extension

Settings (`.vscode/settings.json`):
```json
{
    "C_Cpp.clang_format_path": "/usr/bin/clang-format",
    "C_Cpp.clang_format_style": "file",
    "editor.formatOnSave": true
}
```

### Vim/Neovim

Add to `.vimrc`:
```vim
" Format on save
autocmd BufWritePre *.c,*.h silent! execute '!clang-format -i %'
```

### Emacs

Install clang-format package and add to config:
```elisp
(require 'clang-format)
(global-set-key (kbd "C-c f") 'clang-format-buffer)
```

## Best Practices

1. **Run `make format` before every commit**
2. **Run `make lint` on major changes**
3. **Fix warnings incrementally** - don't try to fix everything at once
4. **Review `make lint-fix` changes** - automatic fixes can be wrong
5. **Update configurations** as project standards evolve
6. **Document exceptions** when disabling checks
7. **Use in CI/CD** to enforce standards automatically

## References

- [clang-format documentation](https://clang.llvm.org/docs/ClangFormat.html)
- [clang-tidy documentation](https://clang.llvm.org/extra/clang-tidy/)
- [clang-format style options](https://clang.llvm.org/docs/ClangFormatStyleOptions.html)
- [clang-tidy checks list](https://clang.llvm.org/extra/clang-tidy/checks/list.html)
