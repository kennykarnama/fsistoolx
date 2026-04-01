//
// Created by kenny on 21/12/25.
//

#include <iostream>

#include "exprtk/exprtk.hpp"

bool evalExprWithX(double x, const std::string& expr) {
    typedef double T;

    exprtk::symbol_table<T> symbol_table;
    symbol_table.add_variable("x", x); // TODO: dynamic variable discovery
    symbol_table.add_constants();

    exprtk::expression<T> expression;
    expression.register_symbol_table(symbol_table);

    exprtk::parser<T> parser;
    if (!parser.compile(expr, expression))
    {
        // You can log parser.error() here if needed
        std::cerr << "Error compiling expression: " << expr << " error: " << parser.error() << std::endl;

        return false;
    }

    return expression.value();
}

