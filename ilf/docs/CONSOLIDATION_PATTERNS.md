# Logic Consolidation Patterns

This document describes the consolidation logic patterns implemented in `source_inherent_out_fx_tests.xml` that demonstrate using xmlh and gslh functions with GSL statistics.

## Overview

All consolidation functions follow this general pattern:

1. **Get EvalContext** - Access `pic_doc` from user_data
2. **XPath Query** - Find all `//sourceInherentEvalResult` nodes
3. **Extract Values** - Use `nodeset_to_array_str()` to get result values
4. **Convert to GSL** - Convert string array → double array → GSL vector
5. **Perform Analysis** - Use GSL statistics functions
6. **Cleanup** - Free all allocated memory

## Record 1: FX000001 - Sum Rule

**Purpose**: Calculate the sum of all sourceInherentEvalResult/result values

**Key Functions**:
- `nodeset_to_array_str()` - Extract result values from XML
- `garraydouble_gsl_vector()` - Convert to GSL vector
- Manual loop to sum: `sum += gsl_vector_get(vec, i)`

**Usage Pattern**:
```c
gdouble sum = 0.0;
for (size_t i = 0; i < vec->size; i++) {
    sum += gsl_vector_get(vec, i);
}
return sum;
```

## Record 2: FX000002 - Mean (Average)

**Purpose**: Calculate the mean of all sourceInherentEvalResult/result values

**Key Functions**:
- `gsl_stats_mean()` - Calculate arithmetic mean

**Usage Pattern**:
```c
gdouble mean = gsl_stats_mean(vec->data, vec->stride, vec->size);
return mean;
```

**Note**: This is more efficient and accurate than manual sum/count calculation.

## Record 3: FX000003 - Maximum Value

**Purpose**: Find the maximum value from all sourceInherentEvalResult/result values

**Implementation**: Manual loop (can also use `gsl_stats_max()`)

**Usage Pattern**:
```c
gdouble max_val = -INFINITY;
for (guint i = 0; i < str_array->len; i++) {
    gchar *str = g_array_index(str_array, gchar *, i);
    gdouble val = g_ascii_strtod(str, NULL);
    if (val > max_val) max_val = val;
}
return max_val;
```

## Record 4: FX000004 - Minimum Value

**Purpose**: Find the minimum value from all sourceInherentEvalResult/result values

**Key Functions**:
- `gsl_stats_min()` - Find minimum value in dataset

**Usage Pattern**:
```c
gdouble min_val = gsl_stats_min(vec->data, vec->stride, vec->size);
return min_val;
```

## Record 5: FX000005 - Standard Deviation

**Purpose**: Calculate the standard deviation of all sourceInherentEvalResult/result values

**Key Functions**:
- `gsl_stats_mean()` - Calculate mean first
- `gsl_stats_sd_m()` - Calculate standard deviation given mean

**Usage Pattern**:
```c
gdouble mean = gsl_stats_mean(vec->data, vec->stride, vec->size);
gdouble sd = gsl_stats_sd_m(vec->data, vec->stride, vec->size, mean);
return sd;
```

## Required Headers

All consolidation functions need these includes:

```c
#include <glib.h>
#include <libxml/parser.h>
#include <libxml/tree.h>
#include <libxml/xpath.h>
#include <gsl/gsl_vector.h>
#include <gsl/gsl_statistics_double.h>
#include "xmlh.h"
#include "gslh.h"
#include "eval.h"
```

## Memory Management Pattern

Always follow this cleanup sequence:

```c
// 1. Free string array elements
for (guint i = 0; i < str_array->len; i++) {
    g_free(g_array_index(str_array, gchar *, i));
}

// 2. Free arrays
g_array_free(str_array, TRUE);
g_array_free(double_array, TRUE);

// 3. Free GSL vector (if created)
gsl_vector_free(vec);

// 4. Free XPath objects
xmlXPathFreeObject(xpathObj);
xmlXPathFreeContext(xpathCtx);
```

## Additional GSL Statistics Functions Available

The GSL library provides many other statistical functions that can be used:

- `gsl_stats_max()` - Maximum value
- `gsl_stats_variance()` - Variance
- `gsl_stats_variance_m()` - Variance with known mean
- `gsl_stats_sd()` - Standard deviation
- `gsl_stats_median()` - Median value
- `gsl_stats_quantile()` - Quantile/percentile
- `gsl_stats_absdev()` - Absolute deviation
- `gsl_stats_skew()` - Skewness
- `gsl_stats_kurtosis()` - Kurtosis

See GSL documentation for complete list: https://www.gnu.org/software/gsl/doc/html/statistics.html

## Error Handling

All patterns include proper error checking:

1. Check if `user_data` and `pic_doc` are valid
2. Check if XPath context/object creation succeeds
3. Check if `nodeset_to_array_str()` returns ILF_SUCCESS
4. Check if array is non-empty before processing
5. Clean up and return 0.0 on any error

## Testing Strategy

To test these consolidation functions:

1. Run `evaluate_src_inherent` first to populate `updated_pic.xml` with sourceInherentEvalResult nodes
2. Run `evaluate_konsolidasi_inherent` which will read those results and compute aggregations
3. Verify the consolidation results make sense given the source data

## Notes

- The `pic` field determines which DATA_RECORD nodes get the results injected
- "Bank" maps to `type="BANK"`
- "All LJK" maps to all DATA_RECORD nodes (`type=*`)
- Each consolidation can produce different aggregate values based on the statistical operation chosen
