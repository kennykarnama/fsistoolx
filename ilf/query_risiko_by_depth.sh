#!/bin/bash

# Script to query risiko_name grouped by depth
# Usage: ./query_risiko_by_depth.sh [depth_number]
# If no depth is specified, shows all risiko_name at depth 0 (closest to root)

XML_FILE="/home/kenny/go/src/gitlab.banksinarmas.com/risk-project/fsis-api/tools/ilf/inherent_risk_profile_tree.xml"

if [ ! -f "$XML_FILE" ]; then
    echo "Error: XML file not found at $XML_FILE"
    exit 1
fi

# Default to depth 0 (closest to root)
TARGET_DEPTH=${1:-0}

echo "=========================================="
echo "Risiko Name at Depth $TARGET_DEPTH (from root)"
echo "=========================================="

# Use Python for more flexible parsing
python3 - <<EOF
import xml.etree.ElementTree as ET

tree = ET.parse('$XML_FILE')
root = tree.getroot()

def get_depth(element, root):
    """Calculate depth by counting ancestor RiskProfileNode elements"""
    depth = 0
    parent_map = {c: p for p in root.iter() for c in p}
    
    current = element
    while current is not None:
        parent = parent_map.get(current)
        if parent is not None and parent.tag == "RiskProfileNode":
            depth += 1
        current = parent
        if parent is not None and parent.tag == "RiskProfileTree":
            break
    
    return depth

results = []
for node in root.iter("RiskProfileNode"):
    profile_id_elem = node.find("Profile_ID")
    risiko_name_elem = node.find("risiko_name")
    
    if profile_id_elem is not None and risiko_name_elem is not None:
        depth = get_depth(node, root)
        
        if depth == $TARGET_DEPTH:
            results.append({
                'profile_id': profile_id_elem.text,
                'risiko_name': risiko_name_elem.text,
                'depth': depth
            })

# Sort by risiko_name
results.sort(key=lambda x: x['risiko_name'])

print(f"{'Profile_ID':<15} {'Risiko Name'}")
print("=" * 60)
for r in results:
    print(f"{r['profile_id']:<15} {r['risiko_name']}")

print(f"\nTotal: {len(results)} entries at depth $TARGET_DEPTH")
EOF
