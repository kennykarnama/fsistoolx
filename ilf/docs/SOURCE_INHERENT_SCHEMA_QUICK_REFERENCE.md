# Source Inherent Schema - Quick Reference

## Quick Validation

```bash
xmllint --noout --schema schema/source_inherent_out.xsd data/source_inherent_out.xml
```

## Schema Summary

| Component | Description | Values/Pattern |
|-----------|-------------|----------------|
| **Root** | sourceInherentRevampReport | Contains 0+ record entries |
| **risiko** | Risk category | 12 types (see below) |
| **sandiBefore** | Previous code | Any string |
| **sandiRevamp** | New code | SI + 8 digits (e.g., SI01001000) |
| **permintaanData** | Data request | Any string |
| **pic** | Person in charge | Any string |
| **petunjukPengisian** | Instructions | Any string |
| **kualitatifKuantitatif** | Data type | kualitatif OR kuantitatif |
| **inputType** | Input method | input, threshold, sistem, system |
| **logicLjk** | Institution logic | Any string (formulas) |
| **logicKonsolidasi** | Consolidation logic | Any non-empty string |

## Risk Categories (risiko)

| Value | Description |
|-------|-------------|
| Kredit | Credit risk |
| Pasar | Market risk |
| Likuiditas | Liquidity risk |
| Operasional | Operational risk |
| Hukum | Legal risk |
| Reputasi | Reputation risk |
| Stratejik | Strategic risk |
| Kepatuhan | Compliance risk |
| Intragrup | Intragroup risk |
| Asuransi | Insurance risk |
| Investasi | Investment risk |
| Imbal Hasil | Return/Yield risk |

## Valid Structure

```xml
<sourceInherentRevampReport>
  <record>
    <risiko>Kredit|Pasar|...</risiko>
    <sandiBefore>string</sandiBefore>
    <sandiRevamp>SI########</sandiRevamp>
    <permintaanData>string</permintaanData>
    <pic>string</pic>
    <petunjukPengisian>string</petunjukPengisian>
    <kualitatifKuantitatif>kualitatif|kuantitatif</kualitatifKuantitatif>
    <inputType>input|threshold|sistem|system</inputType>
    <logicLjk>formula</logicLjk>
    <logicKonsolidasi>formula</logicKonsolidasi>
  </record>
</sourceInherentRevampReport>
```

## Validation Rules

✅ **Allowed**
- All elements optional
- Empty records
- Any number of records (0+)
- Flexible formulas in logicKonsolidasi and logicLjk
- Case variations (input/Input, sistem/Sistem/system)

✅ **Required**
- Elements in strict order (risiko → sandiBefore → ... → logicKonsolidasi)
- sandiRevamp must match pattern SI + 8 digits
- risiko must be one of 12 predefined types
- kualitatifKuantitatif must be kualitatif or kuantitatif
- logicKonsolidasi must be non-empty string (if present)

❌ **Invalid**
- Wrong element order
- sandiRevamp with wrong pattern (e.g., SI123, SI0100100000)
- risiko not in enumeration
- kualitatifKuantitatif with other values
- inputType not in enumeration

## Example Valid Records

### Input Record
```xml
<record>
  <risiko>Kredit</risiko>
  <sandiBefore>001</sandiBefore>
  <sandiRevamp>SI01001000</sandiRevamp>
  <permintaanData>Total Aset</permintaanData>
  <pic>All LJK</pic>
  <petunjukPengisian>Diisi Nominal Total Aset</petunjukPengisian>
  <kualitatifKuantitatif>kuantitatif</kualitatifKuantitatif>
  <inputType>input</inputType>
  <logicKonsolidasi>sum</logicKonsolidasi>
</record>
```

### Calculated Record
```xml
<record>
  <risiko>Pasar</risiko>
  <sandiRevamp>SI02023000</sandiRevamp>
  <permintaanData>Rasio Konsentrasi</permintaanData>
  <inputType>sistem</inputType>
  <logicLjk>( SI01023001 + SI01023002 ) / SI01001000</logicLjk>
  <logicKonsolidasi>AVERAGE</logicKonsolidasi>
</record>
```

### Threshold Record
```xml
<record>
  <risiko>Operasional</risiko>
  <sandiRevamp>SI04018000</sandiRevamp>
  <permintaanData>Proses penyediaan dana</permintaanData>
  <kualitatifKuantitatif>kualitatif</kualitatifKuantitatif>
  <inputType>threshold</inputType>
  <petunjukPengisian>Pilih angka 1-5 sesuai kondisi</petunjukPengisian>
</record>
```

### Empty Record (Valid)
```xml
<record>
</record>
```

## Common Errors

| Error Message | Problem | Solution |
|---------------|---------|----------|
| "[facet 'pattern'] The value 'SI123' is not accepted" | sandiRevamp too short | Use SI + 8 digits: SI00000123 |
| "[facet 'pattern'] The value 'SI0100100000' is not accepted" | sandiRevamp too long | Use exactly 8 digits: SI01001000 |
| "[facet 'enumeration'] The value 'Technology' is not an element" | Invalid risiko | Use: Kredit, Pasar, Operasional, etc. |
| "Element 'sandiRevamp': This element is not expected" | Wrong order | Follow: risiko → sandiBefore → sandiRevamp → ... |
| "[facet 'minLength'] The value '' has a length of '0'" | Empty logicKonsolidasi | Provide non-empty value or remove element |

## Python Validation

```python
from lxml import etree

schema = etree.XMLSchema(file='schema/source_inherent_out.xsd')
doc = etree.parse('data/source_inherent_out.xml')
print("Valid!" if schema.validate(doc) else "Invalid!")
```

## Data Types Summary

```xml
<!-- Risk category: enumeration of 12 types -->
<xs:simpleType name="RisikoType">
  <xs:restriction base="xs:string">
    <xs:enumeration value="Kredit|Pasar|Likuiditas|..."/>
  </xs:restriction>
</xs:simpleType>

<!-- Revamped code: SI + 8 digits -->
<xs:simpleType name="SandiRevampType">
  <xs:restriction base="xs:string">
    <xs:pattern value="SI[0-9]{8}"/>
  </xs:restriction>
</xs:simpleType>

<!-- Data classification -->
<xs:simpleType name="KualitatifKuantitatifType">
  <xs:restriction base="xs:string">
    <xs:enumeration value="kualitatif|kuantitatif"/>
  </xs:restriction>
</xs:simpleType>

<!-- Input method -->
<xs:simpleType name="InputTypeType">
  <xs:restriction base="xs:string">
    <xs:enumeration value="input|Input|threshold|Threshold|sistem|Sistem|system"/>
  </xs:restriction>
</xs:simpleType>

<!-- Consolidation logic: flexible -->
<xs:simpleType name="LogicKonsolidasiType">
  <xs:restriction base="xs:string">
    <xs:minLength value="1"/>
  </xs:restriction>
</xs:simpleType>
```

## Record Types

| Type | inputType | Characteristics |
|------|-----------|-----------------|
| **Input** | input/Input | Manual data entry, has petunjukPengisian |
| **Calculated** | sistem/Sistem/system | Has logicLjk formula, auto-calculated |
| **Threshold** | threshold/Threshold | Qualitative assessment, rating 1-5 |
| **Empty** | (none) | Placeholder/section marker |

## Integration

This schema validates source data used in:
- `src/eval.c` - Evaluation engine
- `src/xmlh.c` - XML parsing
- XPath queries: `/sourceInherentRevampReport/record`
- Code lookups by sandiRevamp

## Files

- **Schema**: `schema/source_inherent_out.xsd`
- **Data**: `data/source_inherent_out.xml` (399 records)
- **Test Data**: `data/source_inherent_out_fx_tests.xml`
- **Full Docs**: `docs/SOURCE_INHERENT_SCHEMA_DOCUMENTATION.md`

## Statistics

- **Total Records**: 399
- **Risk Categories**: 12
- **File Size**: ~615 KB
- **Validation**: ✅ Passes

## Pattern Examples

| Pattern | Valid | Invalid |
|---------|-------|---------|
| SI[0-9]{8} | SI01001000, SI99999999 | SI123, SI0100100000, 01001000 |

## Quick Tips

1. ✅ sandiRevamp always SI + exactly 8 digits
2. ✅ All elements optional, use as needed
3. ✅ Keep element order: risiko first, logicKonsolidasi last
4. ✅ logicKonsolidasi accepts any formula (sum, AVERAGE, custom expressions)
5. ✅ Empty records allowed
6. ⚠️ Validate after every edit
