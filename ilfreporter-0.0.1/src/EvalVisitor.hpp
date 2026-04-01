#pragma once
#include <antlr4-runtime.h>
#include "ThresholdBaseVisitor.h"
#include <sstream>
#include <string>
#include <any>

class EvalVisitor : public ThresholdBaseVisitor {
public:
    std::string rating;
    std::string evalExpr;

    antlrcpp::Any visitRuleDecl(ThresholdParser::RuleDeclContext *ctx) override {
        rating = ctx->rating()->INT()->getText();
        evalExpr = std::any_cast<std::string>(visit(ctx->expr()));
        return evalExpr;
    }

    antlrcpp::Any visitExpr(ThresholdParser::ExprContext *ctx) override {
        auto values = ctx->value();   // vector<ValueContext*>
        auto ops    = ctx->op();      // vector<OpContext*>

        std::ostringstream oss;

        // values: v0, v1, v2, ...
        // ops:    o0, o1, ...
        // expression: v0 o0 v1 o1 v2 ...

        for (size_t i = 0; i < ops.size(); i++) {
            std::string left  = values[i]->getText();
            std::string right = values[i+1]->getText();
            std::string op    = ops[i]->getText();

            // Normalize so x is always on the left
            if (right == "x") {
                if (op == "<")  op = ">";
                else if (op == "<=") op = ">=";
                else if (op == ">")  op = "<";
                else if (op == ">=") op = "<=";
                // == stays ==
                std::swap(left, right);
            }

            if (i > 0) oss << " and ";
            oss << "x " << op << " " << right;
        }

        return oss.str();
    }

    antlrcpp::Any visitValue(ThresholdParser::ValueContext *ctx) override {

        return ctx->getText();
    }

};