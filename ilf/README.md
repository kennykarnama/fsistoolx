# ILF - Inherent Likelihood Framework

Enterprise risk profile evaluation system with dynamic function compilation, hierarchical aggregation, and threshold-based rating.

## Quick Start

### Option 1: CLI Tool (One-off evaluations)

```bash
# Build
make eval_cli

# Run
./eval_cli \
  --risk-profile data/risk_profile_report_items.xml \
  --sandi-source data/source_inherent_out_fx_tests.xml \
  --rating-to-score data/rating_to_score.xml \
  --output output.xml
```

### Option 2: Unix Socket Server (Service mode)

```bash
# Build server and client
make eval_server eval_client

# Start server (in background)
./eval_server &

# Use client to submit requests
./eval_client ping
./eval_client evaluate \
  --risk-profile data/risk_profile_report_items.xml \
  --sandi-source data/source_inherent_out_fx_tests.xml \
  --rating-to-score data/rating_to_score.xml \
  --output output.xml

# Shutdown server
./eval_client shutdown
```

### Option 3: Docker Deployment

#### Build Docker Image

```bash
docker build -t ilf-eval-server .
```

#### Run Server in Docker with Unix Socket Access

To allow the host's `eval_client` to connect to the server running in Docker, mount the `/tmp` directory and run with host user permissions:

```bash
# Run server in detached mode with host user permissions
docker run -d \
  --name ilf-server \
  --user $(id -u):$(id -g) \
  -v /tmp:/tmp \
  ilf-eval-server

# Wait for server to start
sleep 2

# Use eval_client from host
./eval_client ping

# Example evaluation
./eval_client evaluate \
  --risk-profile data/risk_profile_report_items.xml \
  --sandi-source data/source_inherent_out_fx_tests.xml \
  --rating-to-score data/rating_to_score.xml \
  --output output.xml

# View server logs
docker logs ilf-server

# Shutdown
./eval_client shutdown
docker stop ilf-server
docker rm ilf-server
```

**Key Points:**
- `--user $(id -u):$(id -g)` runs container with your host user ID (prevents permission issues)
- `-v /tmp:/tmp` mounts host's `/tmp` to container's `/tmp`
- Unix socket at `/tmp/ilf_eval.sock` is accessible from both host and container
- Client runs on host, server runs in Docker

#### Alternative: Run Client Inside Docker

```bash
# Exec into running container
docker exec -it ilf-server bash

# Inside container, build client
make eval_client

# Use client inside container
./eval_client ping
./eval_client evaluate --risk-profile ... --output ...
```

#### Troubleshooting Docker Setup

**Permission Denied Error:**

If you get "Permission denied" when connecting from the client, the socket has wrong permissions. Fix this by:

```bash
# Stop and remove existing container
docker stop ilf-server
docker rm ilf-server

# Clean up old socket
sudo rm -f /tmp/ilf_eval.sock

# Run with host user permissions (IMPORTANT!)
docker run -d \
  --name ilf-server \
  --user $(id -u):$(id -g) \
  -v /tmp:/tmp \
  ilf-eval-server

# Verify socket permissions (should show your username)
ls -la /tmp/ilf_eval.sock

# Test connection
./eval_client ping
```

**Other Issues:**

```bash
# Check if socket exists
ls -la /tmp/ilf_eval.sock

# View server logs
docker logs ilf-server

# Run in foreground to see output
docker run --name ilf-server --user $(id -u):$(id -g) -v /tmp:/tmp ilf-eval-server

# Check if container is running
docker ps | grep ilf-server
```

### Run Tests

```bash
make eval_tests
./eval_tests
```

### Validate Output

```bash
# Validate risk profile output against schema
xmllint --noout --schema schema/risk_profile_output.xsd output.xml

# Validate rating-to-score mapping against schema
xmllint --noout --schema schema/rating_to_score.xsd data/rating_to_score.xml

# Validate source inherent data against schema
xmllint --noout --schema schema/source_inherent_out.xsd data/source_inherent_out.xml

# Validate company PIC data against schema
xmllint --noout --schema schema/company_pic.xsd data/company_pic.xml
```

## Features

### 🔄 Complete Evaluation Pipeline

1. **Dynamic Function Compilation** - Runtime C code compilation using TCC
2. **Hierarchical Tree Structure** - Parent-child risk profile relationships
3. **Two-Stage Evaluation** - Score calculation → Threshold rating
4. **Parent Aggregation** - XPath-based child result aggregation
5. **Rating-to-Score Mapping** - Standardized scoring system
6. **Weighted Calculations** - Final score × weight (bobot)

### 📊 Example Workflow

```
Input Data → Build Tree → Evaluate Scores → Apply Thresholds → Map Ratings → Calculate Weights → Output XML
```

**Example Results:**
- Child (RI0100100100): Score=9.12 → Rating=5 → FinalScore=28 → Weighted=3.36
- Parent (RI0100100000): Aggregated=36.20 → Rating=4 → FinalScore=44 → Weighted=12.32

## Architecture

### Core Components

- **eval.c** - Main evaluation engine with TCC integration
- **risk_profile_tree.c** - Hierarchical tree building and traversal
- **tcch.c** - TCC compilation wrapper
- **xmlh.c** - XML helper functions
- **gslh.c** - GSL (GNU Scientific Library) integration
- **eval_cli.c** - Command-line orchestration tool

### Dependencies

- **GLib 2.0** - N-ary trees, hash tables, utilities
- **libxml2** - XML parsing, XPath queries
- **TCC (Tiny C Compiler)** - Runtime C compilation
- **GSL** - Statistical functions (mean, min, max, sd)

### Key Data Structures

```c
// Risk Profile Context
typedef struct {
    xmlDocPtr sandi_source_doc;  // Source data
    xmlDocPtr risk_profile_doc;  // Risk profiles
} EvalRiskProfileContext;

// Risk Profile Data
typedef struct {
    gchar *profile_id;           // RI0100100000
    gchar *risiko_name;
    gchar *faktor_penilaian;
    xmlNodePtr xml_node;
} RiskProfileData;
```

## Documentation

Comprehensive documentation in `docs/`:

### Getting Started
- **CLI_USAGE.md** - Command-line tool usage guide
- **INSTALL_LINT_TOOLS.md** - Development setup

### Core Concepts
- **RISK_PROFILE_TREE.md** - Tree structure and hierarchy
- **TEST_RISK_PROFILE_WITH_EVALUATION.md** - Evaluation system overview

### Advanced Topics
- **TEST_THRESHOLD_FUNCTION.md** - Threshold implementation details
- **TEST_PARENT_AGGREGATION.md** - Parent-child aggregation patterns
- **CONSOLIDATION_PATTERNS.md** - Konsolidasi evaluation patterns

### Code Standards
- **CODE_CONVENTION.md** - Coding style guide
- **CODE_CONVENTION_SETUP.md** - Setup instructions

## Project Structure

```
ilf/
├── src/                    # Source code
│   ├── eval.c             # Evaluation engine
│   ├── eval_cli.c         # CLI tool
│   ├── risk_profile_tree.c
│   ├── tcch.c             # TCC wrapper
│   ├── xmlh.c             # XML helpers
│   ├── gslh.c             # GSL helpers
│   └── glibh.c            # GLib helpers
├── test/                   # Test suite
│   ├── eval_test1.c       # Evaluation tests
│   └── ...
├── data/                   # Test data
│   ├── risk_profile_report_items.xml
│   ├── rating_to_score.xml
│   └── source_inherent_out_fx_tests.xml
├── docs/                   # Documentation
└── Makefile               # Build system
```

## Testing

The project includes comprehensive test coverage:

```bash
# Run all tests
make all
./eval_tests

# Run specific test
./eval_tests -p /eval/apply_rating_to_score_mapping

# Run with verbose output
./eval_tests --verbose
```

### Test Suite (9 tests)

- ✅ `evaluate_fx_xml` - Basic XML evaluation
- ✅ `evaluate_konsolidasi` - Konsolidasi logic
- ✅ `evaluate_konsolidasi_empty` - Empty data handling
- ✅ `evaluate_risk_profile_tree` - Full tree evaluation
- ✅ `evaluate_risk_profile_tree_null_docs` - Null document handling
- ✅ `evaluate_risk_profile_tree_null_userdata` - Null context handling
- ✅ `evaluate_risk_profile_tree_null_result` - Null result handling
- ✅ `evaluate_risk_profile_tree_parent_aggregation` - Parent aggregation
- ✅ `apply_rating_to_score_mapping` - Rating mapping and weighting

## Build System

### Available Targets

```bash
make all              # Build all test binaries
make eval_cli         # Build CLI tool only
make eval_tests       # Build evaluation tests
make clean            # Remove built binaries
```

### Compilation Example

```bash
gcc -Wall -Wextra -g \
  -I src -I test \
  -I/usr/include/glib-2.0 \
  -I/usr/lib/x86_64-linux-gnu/glib-2.0/include \
  -I/usr/include/libxml2 \
  -o eval_cli \
  src/eval_cli.c src/eval.c src/risk_profile_tree.c \
  src/tcch.c src/xmlh.c src/gslh.c src/glibh.c \
  -lglib-2.0 -lxml2 -ltcc -lm -lgsl -lgslcblas
```

## XML Input Format

### Risk Profile

```xml
<RiskProfile>
  <Profile_ID>RI0100100000</Profile_ID>
  <risiko_name>Risiko Kredit</risiko_name>
  <Sample_Bobot>0.28</Sample_Bobot>
  
  <Logic_Risk_Profile_Fx><![CDATA[
    // C code that returns gdouble
    gdouble fx(xmlDocPtr doc, xmlNodePtr cur, 
               gpointer user_data, gpointer result) {
      // Calculate score...
      return score_value;
    }
  ]]></Logic_Risk_Profile_Fx>
  
  <ThresholdFunction><![CDATA[
    // C code that converts score to rating (1-5)
    gdouble fx(xmlDocPtr doc, xmlNodePtr cur,
               gpointer user_data, gpointer result) {
      gdouble score = *(gdouble *)user_data;
      if (score <= 36.0) return 5.0;
      if (score <= 52.0) return 4.0;
      // ...
    }
  ]]></ThresholdFunction>
</RiskProfile>
```

### Rating to Score Mapping

```xml
<RatingScores>
  <RatingScore>
    <Rating>1</Rating>
    <Score>92</Score>
    <weight>0.28</weight>
  </RatingScore>
  <RatingScore>
    <Rating>5</Rating>
    <Score>28</Score>
    <weight>0.28</weight>
  </RatingScore>
</RatingScores>
```

**Schema**: `schema/rating_to_score.xsd` validates:
- Rating: 1-5 (integer)
- Score: 0-100 (integer)
- weight: 0.0-1.0 (decimal)

## Output Format

```xml
<RiskProfile>
  <Profile_ID>RI0100100000</Profile_ID>
  <risiko_name>Risiko Kredit</risiko_name>
  
  <!-- Evaluation Results -->
  <riskProfileEvaluationResult>
    <value>36.200000</value>
  </riskProfileEvaluationResult>
  
  <!-- Threshold Rating -->
  <thresholdRating>
    <value>4.0</value>
  </thresholdRating>
  
  <!-- Final Score (from rating_to_score.xml) -->
  <finalScore>
    <value>44.00</value>
  </finalScore>
  
  <!-- Weighted Score -->
  <scoreXweight>
    <value>12.320000</value>
  </scoreXweight>
</RiskProfile>
```

## License

MIT License

## Author

Kenny Karnama <kennykarnama@gmail.com>
