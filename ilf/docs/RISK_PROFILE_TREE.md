# Risk Profile Tree Builder

This module provides functions to build a GLib N-ary tree from risk profile XML data based on hierarchical Profile_ID relationships.

## Profile_ID Hierarchy

Profile_IDs follow a hierarchical structure using 2-digit segments:

```
RI0100100000  (parent - ends with 0000)
├── RI0100100100  (child - one segment differs)
├── RI0100100200  (child - one segment differs)
└── RI0100100300  (child - one segment differs)

RI0100300000  (parent)
├── RI0100300100  (child)
│   ├── RI0100300101  (grandchild - child of RI0100300100)
│   └── RI0100300102  (grandchild - child of RI0100300100)
└── RI0100300200  (child)
```

## Parent-Child Relation Rules

A direct parent-child relationship exists when:
1. Both Profile_IDs have the same length (typically 12 characters)
2. They differ in exactly ONE 2-digit segment
3. The differing segment is "00" in the parent
4. The differing segment is non-"00" in the child

Examples:
- `RI0100100000` → `RI0100100100`: Segment 4 changes from "00" to "01" ✓
- `RI0100300100` → `RI0100300101`: Segment 5 changes from "00" to "01" ✓
- `RI0100100000` → `RI0100200100`: Different branch (segment 2) ✗
- `RI0100300000` → `RI0100300101`: Two segments differ (not direct) ✗

## Usage Example

```c
#include "risk_profile_tree.h"

int main() {
    // Load XML document
    xmlDocPtr doc = xmlReadFile("data/risk_profile_report_items.xml", NULL, XML_PARSE_NOBLANKS);
    
    // Build the tree
    GNode *root = build_risk_profile_tree(doc);
    
    // Print the tree structure
    print_risk_profile_tree(root, 0);
    
    // Find a specific node
    GNode *node = find_node_by_profile_id(root, "RI0100100000");
    if (node && node->data) {
        RiskProfileData *data = (RiskProfileData *)node->data;
        g_print("Found: %s - %s\n", data->profile_id, data->faktor_penilaian);
        
        // Get number of children
        guint n_children = g_node_n_children(node);
        g_print("Has %u children\n", n_children);
        
        // Access XML node if needed
        xmlNodePtr xml_node = data->xml_node;
        // ... process XML node
    }
    
    // Cleanup
    free_risk_profile_tree_data(root);
    g_node_destroy(root);
    xmlFreeDoc(doc);
    
    return 0;
}
```

## Data Structure

Each tree node contains a `RiskProfileData` structure:

```c
typedef struct {
    gchar *profile_id;         // Profile_ID from XML
    gchar *risiko_name;        // risiko_name from XML
    gchar *faktor_penilaian;   // Faktor_Penilaian from XML
    xmlNodePtr xml_node;       // Reference to original XML node
} RiskProfileData;
```

## API Functions

### Tree Building
- `build_risk_profile_tree(xmlDocPtr doc)` - Build tree from XML document
- `free_risk_profile_tree_data(GNode *root)` - Free all node data
- `g_node_destroy(root)` - Free tree structure (GLib function)

### Tree Operations
- `find_node_by_profile_id(GNode *root, const gchar *profile_id)` - Find node by ID
- `print_risk_profile_tree(GNode *node, gint depth)` - Print tree structure
- `is_parent_child_relation(const gchar *parent_id, const gchar *child_id)` - Check relation

### Data Management
- `risk_profile_data_new(...)` - Create new RiskProfileData
- `risk_profile_data_free(RiskProfileData *data)` - Free RiskProfileData

### GLib Tree Functions
You can also use standard GLib tree functions:
- `g_node_n_children(node)` - Count children
- `g_node_n_nodes(root, G_TRAVERSE_ALL)` - Count all nodes
- `g_node_traverse(root, order, flags, max_depth, func, data)` - Traverse tree
- `g_node_prepend/append(parent, child)` - Add children

## Orphaned Nodes

If a Profile_ID doesn't have a parent in the XML (e.g., `RI0400400201` without `RI0400400200`), it will be treated as a root node. This handles incomplete data gracefully.

## Building and Testing

```bash
# Build the test
make risk_profile_tree_tests

# Run the test
./risk_profile_tree_tests

# See the full tree structure
./risk_profile_tree_tests 2>&1 | less
```

## Example Output

```
(virtual root)
  [RI0100100000] Risiko Kredit - Komposisi Portofolio Aset dan Tingkat Konsentrasi
    [RI0100100100] Risiko Kredit - 1.1 Aset per Akun Neraca / Total Aset
    [RI0100100200] Risiko Kredit - 1.2 Kredit atau Pembiayaan kepada Debitur Inti
    [RI0100100300] Risiko Kredit - 1.3 Kredit atau Pembiayaan per Sektor Ekonomi
  [RI0100200000] Risiko Kredit - Kualitas Aset
    [RI0100200100] Risiko Kredit - 2.1 Non Performing Loan (NPL)
    [RI0100200200] Risiko Kredit - 2.2 Cadangan Kerugian Penurunan Nilai
```

## Notes

- The virtual root node has `data = NULL` and contains all actual root nodes as children
- Total of 217 nodes in the current XML
- Profile_IDs are 12 characters long, composed of 6 two-digit segments
- The tree preserves references to the original XML nodes for further processing
