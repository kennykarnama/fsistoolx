#include <glib.h>
#include <libxml/parser.h>
#include <libxml/tree.h>
#include <libxml/xpath.h>
#include <gsl/gsl_vector.h>
#include <gsl/gsl_statistics_double.h>
#include "xmlh.h"
#include "gslh.h"
#include "eval.h"

// SI02029001 / SI02029002
// input data: worksheet_detail
gdouble fx(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result) {
  if (!user_data) return 0.0;
  
  EvalContext *ctx = (EvalContext *)user_data;
  xmlDocPtr worksheet_detail = ctx->worksheet_detail;
  if (!worksheet_detail) return 0.0;

  // Use XPath to find all sourceInherentEvalResult nodes
  xmlXPathContextPtr xpathCtx = xmlXPathNewContext(worksheet_detail);
  if (!xpathCtx) return 0.0;
  
   
  // Cleanup
  for (guint i = 0; i < str_array->len; i++) {
    g_free(g_array_index(str_array, gchar *, i));
  }
  g_array_free(str_array, TRUE);
  g_array_free(double_array, TRUE);
  gsl_vector_free(vec);
  xmlXPathFreeObject(xpathObj);
  xmlXPathFreeContext(xpathCtx);
  
  return mean;
}

int main() {
    // call the function along with proper xmldoc
    return 0;
}