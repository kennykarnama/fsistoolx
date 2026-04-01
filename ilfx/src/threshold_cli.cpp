#include <iostream>
#include <fstream>
#include <string>
#include <antlr4-runtime.h>
#include "ThresholdLexer.h"
#include "ThresholdParser.h"
#include "EvalVisitor.hpp"
#include "absl/flags/flag.h"
#include "absl/flags/parse.h"
#include "absl/log/log.h"
#include "absl/log/initialize.h"

ABSL_FLAG(std::string, input, "", "Input threshold expression (e.g., '3: 0 <= x < 10')");
ABSL_FLAG(std::string, file, "", "Input file containing threshold expression");

int main(int argc, char* argv[]) {
    absl::ParseCommandLine(argc, argv);
    absl::InitializeLog();

    std::string input = absl::GetFlag(FLAGS_input);
    std::string file = absl::GetFlag(FLAGS_file);

    if (input.empty() && file.empty()) {
        LOG(ERROR) << "Either --input or --file must be specified";
        std::cerr << "Usage: " << argv[0] << " --input='3: 0 <= x < 10'" << std::endl;
        std::cerr << "   or: " << argv[0] << " --file=threshold.txt" << std::endl;
        return 1;
    }

    std::string expression;
    if (!file.empty()) {
        std::ifstream inputFile(file);
        if (!inputFile.is_open()) {
            LOG(ERROR) << "Failed to open file: " << file;
            return 1;
        }
        std::getline(inputFile, expression);
        inputFile.close();
    } else {
        expression = input;
    }

    LOG(INFO) << "Parsing threshold expression: " << expression;

    try {
        // Create input stream from string
        antlr4::ANTLRInputStream inputStream(expression);
        
        // Create lexer
        ThresholdLexer lexer(&inputStream);
        
        // Create token stream
        antlr4::CommonTokenStream tokens(&lexer);
        
        // Create parser
        ThresholdParser parser(&tokens);
        
        // Parse the input
        ThresholdParser::RuleFileContext* tree = parser.ruleFile();
        
        // Check for parse errors
        if (parser.getNumberOfSyntaxErrors() > 0) {
            LOG(ERROR) << "Failed to parse expression: " << parser.getNumberOfSyntaxErrors() << " syntax error(s)";
            return 1;
        }
        
        // Create visitor and visit the tree
        EvalVisitor visitor;
        visitor.visit(tree);
        
        // Output results
        std::cout << "Rating: " << visitor.rating << std::endl;
        std::cout << "Normalized Expression: " << visitor.evalExpr << std::endl;
        
        LOG(INFO) << "Successfully parsed threshold expression";
        return 0;
        
    } catch (const std::exception& e) {
        LOG(ERROR) << "Error parsing expression: " << e.what();
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
}
