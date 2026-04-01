#include <stdio.h>
#include <string.h>
#include <libxml/xmlmemory.h>
#include <libxml/debugXML.h>
#include <libxml/HTMLtree.h>
#include <libxml/xmlIO.h>
#include <libxml/xinclude.h>
#include <libxml/catalog.h>
#include <libxslt/xslt.h>
#include <libxslt/xsltInternals.h>
#include <libxslt/transform.h>
#include <libxslt/xsltutils.h>

extern int xmlLoadExtDtdDefaultValue;

static void usage(const char *name) {
    printf("Usage: %s [options] stylesheet file [file ...]\n", name);
    printf("      --param name value : pass a (parameter,value) pair\n");
    printf("      -o, --output file  : specify output file (default: stdout)\n");

}

int
main(int argc, char **argv) {
	int i;
	const char *params[16 + 1];
	int nbparams = 0;
	xsltStylesheetPtr cur = NULL;
	xmlDocPtr doc, res;
	const char *output = NULL;
	FILE *out = NULL;

	if (argc <= 1) {
		usage(argv[0]);
		return(1);
	}
	

 for (i = 1; i < argc; i++) {
        if (argv[i][0] != '-')
            break;
	if ((!strcmp(argv[i], "-param")) ||
                   (!strcmp(argv[i], "--param"))) {
		i++;
		params[nbparams++] = argv[i++];
		params[nbparams++] = argv[i];
		if (nbparams >= 16) {
			fprintf(stderr, "too many params\n");
			return (1);
		}
	} else if ((!strcmp(argv[i], "-o")) ||
                   (!strcmp(argv[i], "--output"))) {
		i++;
		output = argv[i];
        }  else {
            fprintf(stderr, "Unknown option %s\n", argv[i]);
            usage(argv[0]);
            return (1);
        }
    }

	params[nbparams] = NULL;
	xmlSubstituteEntitiesDefault(1);
	xmlLoadExtDtdDefaultValue = 1;
	cur = xsltParseStylesheetFile((const xmlChar *)argv[i]);
	i++;
	doc = xmlParseFile(argv[i]);
	res = xsltApplyStylesheet(cur, doc, params);
	
	// Handle output file
	if (output != NULL) {
		out = fopen(output, "w");
		if (out == NULL) {
			fprintf(stderr, "Cannot open output file: %s\n", output);
			return (1);
		}
	} else {
		out = stdout;
	}
	
	xsltSaveResultToFile(out, res, cur);
	
	// Close output file if it was opened
	if (output != NULL && out != NULL) {
		fclose(out);
	}

	xsltFreeStylesheet(cur);
	xmlFreeDoc(res);
	xmlFreeDoc(doc);

        xsltCleanupGlobals();
        xmlCleanupParser();
	return(0);

}