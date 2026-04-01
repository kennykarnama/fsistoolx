#include <iostream>
#include <fstream>
#include <string>
#include "absl/flags/flag.h"
#include "absl/flags/parse.h"
#include "absl/log/log.h"
#include "absl/log/initialize.h"

// Forward declaration from exprtkevaluator.cpp
bool evalExprWithX(double x, const std::string& expr);

ABSL_FLAG(std::string, expr, "", "Expression to evaluate (e.g., 'x >= 0 and x < 10')");
ABSL_FLAG(double, x, 0.0, "Value of variable x");
ABSL_FLAG(std::string, file, "", "File containing the expression");

int main(int argc, char* argv[]) {
    absl::ParseCommandLine(argc, argv);
    absl::InitializeLog();

    std::string expr = absl::GetFlag(FLAGS_expr);
    std::string file = absl::GetFlag(FLAGS_file);
    double x = absl::GetFlag(FLAGS_x);

    if (expr.empty() && file.empty()) {
        LOG(ERROR) << "Either --expr or --file must be specified";
        std::cerr << "Usage: " << argv[0] << " --expr='x >= 0 and x < 10' --x=5" << std::endl;
        std::cerr << "   or: " << argv[0] << " --file=expression.txt --x=5" << std::endl;
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
        expression = expr;
    }

    LOG(INFO) << "Evaluating expression: " << expression;
    LOG(INFO) << "With x = " << x;

    try {
        bool result = evalExprWithX(x, expression);
        
        std::cout << "Expression: " << expression << std::endl;
        std::cout << "x = " << x << std::endl;
        std::cout << "Result: " << (result ? "true" : "false") << std::endl;
        
        LOG(INFO) << "Successfully evaluated expression";
        return result ? 0 : 1;
        
    } catch (const std::exception& e) {
        LOG(ERROR) << "Error evaluating expression: " << e.what();
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
}
