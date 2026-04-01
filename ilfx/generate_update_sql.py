#!/usr/bin/env python3
"""
Generate PostgreSQL UPDATE statements for FSI and consolidation rules from XML files.
"""

import os
import re
import glob

def extract_cdata(text):
    """Extract content from CDATA section."""
    if not text:
        return None
    match = re.search(r'<!\[CDATA\[(.*?)\]\]>', text, re.DOTALL)
    if match:
        return match.group(1).strip()
    return None

def escape_sql_string(s):
    """Escape string for PostgreSQL using dollar-quoted strings."""
    if s is None:
        return 'NULL'
    # Use dollar-quoted strings to avoid escaping issues
    # This handles single quotes, newlines, and other special chars
    return f"$$\n{s}\n$$"

def process_xml_file(filepath, table_name='risk_items'):
    """Process XML file and generate UPDATE statements."""
    with open(filepath, 'r') as f:
        content = f.read()
    
    updates = []
    
    # Find all <item> blocks
    item_pattern = r'<item>(.*?)</item>'
    items = re.findall(item_pattern, content, re.DOTALL)
    
    for item in items:
        # Extract code
        code_match = re.search(r'<code>(\w+)</code>', item)
        if not code_match:
            continue
        code = code_match.group(1)
        
        # Extract FSI rule
        fsi_match = re.search(r'<fsiRule>(.*?)</fsiRule>', item, re.DOTALL)
        fsi_rule = extract_cdata(fsi_match.group(1)) if fsi_match else None
        
        # Extract consolidation rule
        consol_match = re.search(r'<consolidationRule>(.*?)</consolidationRule>', item, re.DOTALL)
        consolidate_rule = extract_cdata(consol_match.group(1)) if consol_match else None
        
        # Skip if no rules to update
        if fsi_rule is None and consolidate_rule is None:
            continue
        
        # Build UPDATE statement
        set_clauses = []
        if fsi_rule is not None:
            set_clauses.append(f"fsi_rule = {escape_sql_string(fsi_rule)}")
        if consolidate_rule is not None:
            set_clauses.append(f"consolidate_rule = {escape_sql_string(consolidate_rule)}")
        
        if set_clauses:
            update_sql = f"UPDATE {table_name}\nSET {', '.join(set_clauses)}\nWHERE code = '{code}';\n"
            updates.append(update_sql)
    
    return updates

def main():
    # Process both inherent and KPMR data files
    xml_patterns = [
        ('testdata/inherentds_*.xml', 'inherent_source'),
        ('testdata/kpmrds_*.xml', 'kpmr_source')
    ]
    
    all_updates = []
    
    for pattern, table_name in xml_patterns:
        files = sorted(glob.glob(pattern))
        for filepath in files:
            basename = os.path.basename(filepath)
            print(f"-- Processing {basename}", file=open('update_rules.sql', 'a'))
            updates = process_xml_file(filepath, table_name=table_name)
            all_updates.extend(updates)
    
    # Write to SQL file
    with open('update_rules.sql', 'w') as f:
        f.write("-- Generated UPDATE statements for FSI and consolidation rules\n")
        f.write("-- Generated from XML test data files\n\n")
        f.write("BEGIN;\n\n")
        
        for update in all_updates:
            f.write(update)
            f.write("\n")
        
        f.write("COMMIT;\n")
    
    print(f"Generated {len(all_updates)} UPDATE statements in update_rules.sql")

if __name__ == '__main__':
    main()
