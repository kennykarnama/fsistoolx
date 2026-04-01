/*
 * ExprTk CLI - Command-line expression evaluator
 * Evaluates mathematical expressions using the ExprTk library
 *
 * Usage: evaltk_cli [--validate|-v] "expression" [var1=val1 var2=val2 ...]
 * Example: evaltk_cli "a + b * 4" a=2 b=3
 *          evaltk_cli --validate "a + b * 4" a=2 b=3
 *
 * SPDX-License-Identifier: MIT
 * Author: Kenny Karnama <kennykarnama@gmail.com>
 */

#include <iostream>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <sstream>
#include "exprtk.hpp"

void print_usage(const char* prog) {
    std::cerr << "ExprTk Expression Evaluator\n";
    std::cerr << "============================\n\n";
    std::cerr << "Usage: " << prog << " [--validate|-v] \"expression\" [var1=val1 var2=val2 ...]\n\n";
    std::cerr << "Examples:\n";
    std::cerr << "  " << prog << " \"2 + 3 * 4\"\n";
    std::cerr << "  " << prog << " \"sin(pi / 4)\"\n";
    std::cerr << "  " << prog << " \"sqrt(16) + pow(2, 3)\"\n";
    std::cerr << "  " << prog << " \"max(10, 20, 30)\"\n";
    std::cerr << "  " << prog << " \"if(5 > 3, 100, 200)\"\n";
    std::cerr << "  " << prog << " \"a + b * c\" a=2 b=3 c=4\n";
    std::cerr << "  " << prog << " --validate \"a + b * c\" a=2 b=3 c=4\n\n";
    std::cerr << "Supported operations:\n";
    std::cerr << "  - Arithmetic: +, -, *, /, ^\n";
    std::cerr << "  - Functions: sin, cos, tan, sqrt, pow, log, exp, abs, min, max\n";
    std::cerr << "  - Constants: pi, e\n";
    std::cerr << "  - Conditionals: if(condition, true_value, false_value)\n";
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        print_usage(argv[0]);
        return 1;
    }

    bool validate_only = false;
    int expr_index = 1;

    if (std::string(argv[1]) == "--validate" || std::string(argv[1]) == "-v") {
        validate_only = true;
        expr_index = 2;
    }

    if (expr_index >= argc) {
        print_usage(argv[0]);
        return 1;
    }

    std::string expression_str = argv[expr_index];

    // Check for help flag
    if (expression_str == "-h" || expression_str == "--help") {
        print_usage(argv[0]);
        return 0;
    }

    // Setup ExprTk
    typedef exprtk::symbol_table<double> symbol_table_t;
    typedef exprtk::expression<double> expression_t;
    typedef exprtk::parser<double> parser_t;

    symbol_table_t symbol_table;
    expression_t expression;
    parser_t parser;

    // Add constants and user variables
    symbol_table.add_constants();

    // Parse var=value pairs from argv[2..]
    std::unordered_map<std::string, double> variables;
    for (int i = expr_index + 1; i < argc; ++i) {
        std::string arg = argv[i];
        std::size_t eq_pos = arg.find('=');
        if (eq_pos == std::string::npos || eq_pos == 0 || eq_pos == arg.size() - 1) {
            std::cerr << "Invalid variable format: " << arg << " (expected name=value)\n";
            return 1;
        }

        std::string name = arg.substr(0, eq_pos);
        std::string value_str = arg.substr(eq_pos + 1);

        try {
            double value = std::stod(value_str);
            double &slot = variables[name];
            slot = value;
            symbol_table.add_variable(name, slot);
        } catch (const std::exception &e) {
            std::cerr << "Invalid numeric value for " << name << ": " << value_str << "\n";
            return 1;
        }
    }

    // When validating only, allow expressions that reference variables not yet provided
    // by pre-registering missing identifiers as dummy variables (value 0).
    if (validate_only) {
        std::unordered_set<std::string> builtins = {
            "pi", "e",
            "sin", "cos", "tan", "asin", "acos", "atan",
            "sinh", "cosh", "tanh",
            "log", "ln", "exp", "sqrt", "pow", "abs",
            "min", "max", "if"
        };

        std::unordered_set<std::string> declared;
        for (const auto &kv : variables) {
            declared.insert(kv.first);
        }

        // Simple identifier scan: [A-Za-z_][A-Za-z0-9_]*
        for (std::size_t i = 0; i < expression_str.size(); ++i) {
            if (!(std::isalpha(static_cast<unsigned char>(expression_str[i])) || expression_str[i] == '_')) {
                continue;
            }
            std::size_t start = i;
            ++i;
            while (i < expression_str.size() &&
                   (std::isalnum(static_cast<unsigned char>(expression_str[i])) || expression_str[i] == '_')) {
                ++i;
            }
            std::string ident = expression_str.substr(start, i - start);

            if (builtins.count(ident) || declared.count(ident)) {
                --i; // adjust for loop increment
                continue;
            }

            double &slot = variables[ident];
            slot = 0.0;
            declared.insert(ident);
            symbol_table.add_variable(ident, slot);
            --i; // adjust for loop increment
        }
    }

    expression.register_symbol_table(symbol_table);
    

    // Compile the expression
    if (!parser.compile(expression_str, expression)) {
        std::cerr << "Error: Failed to parse expression\n";
        std::cerr << "Expression: " << expression_str << "\n";
        
        // Print detailed error information
        for (std::size_t i = 0; i < parser.error_count(); ++i) {
            typedef exprtk::parser_error::type error_t;
            error_t error = parser.get_error(i);
            std::cerr << "Error " << (i + 1) << ": " << error.diagnostic << "\n";
        }
        
        return 1;
    }

    if (validate_only) {
        std::cout << "valid" << std::endl;
        return 0;
    }

    // Evaluate the expression
    double result = expression.value();

    // Output the result
    std::cout << result << std::endl;

    return 0;
}
