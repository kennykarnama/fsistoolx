#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <antlr4-runtime.h>
#include "ThresholdLexer.h"
#include "ThresholdParser.h"
#include "EvalVisitor.hpp"
#include "absl/flags/flag.h"
#include "absl/flags/parse.h"
#include "absl/log/log.h"
#include "absl/log/initialize.h"

ABSL_FLAG(std::string, threshold_file, "", "Input file containing threshold rules (one per line, format: rating:expression)");
ABSL_FLAG(double, value, 0.0, "Value to evaluate against the threshold rules");

// Forward declaration - implemented in exprtkevaluator.cpp
bool evalExprWithX(double x, const std::string& expr);

int ratingByThreshold(const std::string& threshold, double value) {
    std::cout << "Evaluating rating for value: " << value << " using threshold rules" << std::endl;
    std::cout << "Threshold content:" << std::endl;
    std::cout << threshold << std::endl;
    std::cout << "---" << std::endl;
    
    // Split threshold by \n
    std::istringstream stream(threshold);
    std::string line;
    
    while (std::getline(stream, line)) {
        // Trim leading and trailing whitespace
        line.erase(0, line.find_first_not_of(" \t\r\n"));
        line.erase(line.find_last_not_of(" \t\r\n") + 1);
        
        if (line.empty()) continue;
        
        try {
            // Remove extra spaces around colon
            size_t colonPos = line.find(':');
            if (colonPos == std::string::npos) continue;
            
            std::string ratingStr = line.substr(0, colonPos);
            std::string exprStr = line.substr(colonPos + 1);
            
            // Trim the expression
            exprStr.erase(0, exprStr.find_first_not_of(" \t"));
            exprStr.erase(exprStr.find_last_not_of(" \t") + 1);
            
            std::cout << "  Parsing rating: '" << ratingStr << "' with expr: '" << exprStr << "'" << std::endl;
            
            // Parse with ANTLR
            antlr4::ANTLRInputStream inputStream(exprStr);
            ThresholdLexer lexer(&inputStream);
            antlr4::CommonTokenStream tokens(&lexer);
            ThresholdParser parser(&tokens);
            
            // Parse as expression directly
            ThresholdParser::ExprContext* tree = parser.expr();
            
            // Extract expression from parse tree
            EvalVisitor visitor;
            std::string compiledExpr = std::any_cast<std::string>(visitor.visitExpr(tree));
            
            std::cout << "  Compiled expression: '" << compiledExpr << "'" << std::endl;
            
            // Evaluate the expression with the given value
            if (evalExprWithX(value, compiledExpr)) {
                // Return the rating if the expression matches
                int rating = std::stoi(ratingStr);
                std::cout << "  ✓ Rating matched: " << rating << std::endl;
                return rating;
            } else {
                std::cout << "  ✗ Expression did not match" << std::endl;
            }
        } catch (const std::exception& e) {
            std::cerr << "Error parsing threshold line: '" << line << "' - " << e.what() << std::endl;
            continue;
        }
    }
    
    // No matching rule found
    std::cout << "No matching rule found" << std::endl;
    return -1;
}

int main(int argc, char* argv[]) {
    absl::ParseCommandLine(argc, argv);
    absl::InitializeLog();

    std::string thresholdFile = absl::GetFlag(FLAGS_threshold_file);
    double value = absl::GetFlag(FLAGS_value);

    if (thresholdFile.empty()) {
        LOG(ERROR) << "Threshold file must be specified";
        std::cerr << "Usage: " << argv[0] << " --threshold_file=threshold.txt --value=50.5" << std::endl;
        std::cerr << std::endl;
        std::cerr << "Example threshold file format:" << std::endl;
        std::cerr << "  1: 0 <= x < 20" << std::endl;
        std::cerr << "  2: 20 <= x < 40" << std::endl;
        std::cerr << "  3: 40 <= x < 60" << std::endl;
        std::cerr << "  4: 60 <= x < 80" << std::endl;
        std::cerr << "  5: 80 <= x <= 100" << std::endl;
        return 1;
    }

    // Read the threshold file
    std::ifstream inputFile(thresholdFile);
    if (!inputFile.is_open()) {
        LOG(ERROR) << "Failed to open threshold file: " << thresholdFile;
        std::cerr << "Error: Cannot open file '" << thresholdFile << "'" << std::endl;
        return 1;
    }

    std::stringstream buffer;
    buffer << inputFile.rdbuf();
    std::string thresholdContent = buffer.str();
    inputFile.close();

    LOG(INFO) << "Processing threshold file: " << thresholdFile;
    LOG(INFO) << "Evaluating value: " << value;

    try {
        int rating = ratingByThreshold(thresholdContent, value);
        
        std::cout << std::endl;
        std::cout << "================================" << std::endl;
        std::cout << "Result: Rating = " << rating << std::endl;
        std::cout << "================================" << std::endl;
        
        if (rating == -1) {
            LOG(WARNING) << "No matching rating found for value " << value;
            return 2;
        }
        
        LOG(INFO) << "Successfully evaluated rating: " << rating;
        return 0;
        
    } catch (const std::exception& e) {
        LOG(ERROR) << "Error evaluating threshold: " << e.what();
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
}
