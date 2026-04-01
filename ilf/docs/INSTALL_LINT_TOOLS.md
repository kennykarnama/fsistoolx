# Installing Code Convention Tools

## Quick Install (Ubuntu/Debian)

```bash
sudo apt-get update
sudo apt-get install clang-format clang-tidy
```

## Verify Installation

```bash
# Check clang-format
clang-format --version

# Check clang-tidy
clang-tidy --version
```

Expected output:
```
clang-format version 14.0.0 (or higher)
LLVM (http://llvm.org/):
  LLVM version 14.0.0
```

## Alternative Installation Methods

### Using LLVM APT Repository (for latest version)

```bash
# Add LLVM repository
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo add-apt-repository "deb http://apt.llvm.org/$(lsb_release -cs)/ llvm-toolchain-$(lsb_release -cs) main"

# Install specific version
sudo apt-get update
sudo apt-get install clang-format-18 clang-tidy-18

# Create symlinks
sudo ln -s /usr/bin/clang-format-18 /usr/bin/clang-format
sudo ln -s /usr/bin/clang-tidy-18 /usr/bin/clang-tidy
```

### macOS (using Homebrew)

```bash
brew install clang-format llvm
```

### From Source (Advanced)

```bash
# Download and build LLVM/Clang
git clone https://github.com/llvm/llvm-project.git
cd llvm-project
mkdir build && cd build
cmake -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra" -G "Unix Makefiles" ../llvm
make -j$(nproc)
sudo make install
```

## Troubleshooting

### Issue: Package not found

**Solution:**
```bash
# Update package list
sudo apt-get update

# Try alternative package names
sudo apt-get install clang-format-14 clang-tidy-14
```

### Issue: Permission denied

**Solution:**
```bash
# Use sudo for system-wide installation
sudo apt-get install clang-format clang-tidy
```

### Issue: Old version installed

**Solution:**
```bash
# Remove old version
sudo apt-get remove clang-format clang-tidy

# Install newer version from LLVM repository (see above)
```

## Testing Installation

After installation, test the Makefile targets:

```bash
# Check if tools are available
make format-check

# Should not show error message if installed correctly
```

## Docker Alternative

If you don't want to install locally, use Docker:

```bash
# Create a Dockerfile
cat > Dockerfile.lint << 'EOF'
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y clang-format clang-tidy
WORKDIR /workspace
EOF

# Build image
docker build -f Dockerfile.lint -t ilf-lint .

# Run formatting in container
docker run --rm -v $(pwd):/workspace ilf-lint make format-check
```

## Continuous Integration

For CI/CD pipelines, add to your workflow:

### GitHub Actions

```yaml
- name: Install tools
  run: |
    sudo apt-get update
    sudo apt-get install -y clang-format clang-tidy

- name: Check formatting
  run: make format-check

- name: Run lint
  run: make lint
```

### GitLab CI

```yaml
lint:
  image: ubuntu:22.04
  before_script:
    - apt-get update
    - apt-get install -y clang-format clang-tidy make
  script:
    - make format-check
    - make lint
```

## Minimum Versions

- **clang-format:** Version 10.0 or higher
- **clang-tidy:** Version 10.0 or higher

Recommended: Version 14.0 or higher for best compatibility with `.clang-format` and `.clang-tidy` configurations.
