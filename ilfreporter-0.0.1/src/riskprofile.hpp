#ifndef ILFREPORTER_RISK_PROFILE_HPP
#define ILFREPORTER_RISK_PROFILE_HPP

#include <memory>
#include <string>
#include <vector>

#include "absl/status/status.h"
#include "InherentRiskProfile.hxx"
#include "InherentRiskProfileConf.hxx"
#include "KPMRRiskProfile.hxx"
#include "KPMRRiskProfileConf.hxx"
#include "chaiscript/chaiscript.hpp"
#include <antlr4-runtime.h>
#include "ThresholdLexer.h"
#include "ThresholdParser.h"
#include "EvalVisitor.hpp"
#include "exprtkevaluator.h"
#include <xercesc/dom/DOM.hpp>
#include <xqilla/xqilla-dom3.hpp>

namespace chaiscript
{
    class ChaiScript;
}

namespace riskprofile
{

    class InherentReportGenerator
    {
    private:
        std::shared_ptr<RiskProfileTree> riskProfileTree;
        std::shared_ptr<inherent::conf::InherentRiskProfileConf> riskProfileConf;

        void setupChaiScriptEvaluator(chaiscript::ChaiScript &chai);

        int ratingByThreshold(const std::string &threshold, double value)
        {
            std::cout << "Evaluating rating for value: " << value << " using threshold: " << threshold << std::endl;
            // Split threshold by \n
            std::istringstream stream(threshold);
            std::string line;

            while (std::getline(stream, line))
            {
                // Trim leading and trailing whitespace
                line.erase(0, line.find_first_not_of(" \t\r\n"));
                line.erase(line.find_last_not_of(" \t\r\n") + 1);

                if (line.empty())
                    continue;

                try
                {
                    // Remove extra spaces around colon
                    size_t colonPos = line.find(':');
                    if (colonPos == std::string::npos)
                        continue;

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
                    ThresholdParser::ExprContext *tree = parser.expr();

                    // Extract expression from parse tree
                    EvalVisitor visitor;
                    std::string compiledExpr = std::any_cast<std::string>(visitor.visitExpr(tree));

                    std::cout << "  Compiled expression: '" << compiledExpr << "'" << std::endl;

                    // Evaluate the expression with the given value
                    if (evalExprWithX(value, compiledExpr))
                    {
                        // Return the rating if the expression matches
                        int rating = std::stoi(ratingStr);
                        std::cout << "  Rating matched: " << rating << std::endl;
                        return rating;
                    }
                }
                catch (const std::exception &e)
                {
                    std::cerr << "Error parsing threshold line: '" << line << "' - " << e.what() << std::endl;
                    continue;
                }
            }

            // No matching rule found
            return -1;
        };

    public:
        InherentReportGenerator();
        InherentReportGenerator(std::shared_ptr<RiskProfileTree> rpt,
                                std::shared_ptr<inherent::conf::InherentRiskProfileConf> conf) : riskProfileTree(rpt), riskProfileConf(conf) {}
        ~InherentReportGenerator();

        void setRiskProfileTree(std::shared_ptr<RiskProfileTree> rpt)
        {
            riskProfileTree = rpt;
        }

        std::vector<RiskProfileNodeType> filterRiskProfileNodeXPath(
            const std::string &xpathExpr);
        absl::Status generateReport();
        absl::Status writeInherentRiskProfileConf(const std::string &outputPath);

        std::vector<chaiscript::Boxed_Value> riskProfileNodeTypeAsChaiVar(std::vector<RiskProfileNodeType> nodes);
    };

    class KPMRReportGenerator
    {
    private:
        std::shared_ptr<kpmr::riskprofile::kpmr_risk_profile_tree> kpmrRiskProfileTree;
        std::shared_ptr<kpmr::conf::riskprofile::RiskProfileConf> kpmrRiskProfileConf;

        void setupChaiScriptEvaluator(chaiscript::ChaiScript &chai);

        int ratingByThreshold(const std::string &threshold, double value)
        {
            std::cout << "Evaluating rating for value: " << value << " using threshold: " << threshold << std::endl;
            // Split threshold by \n
            std::istringstream stream(threshold);
            std::string line;

            while (std::getline(stream, line))
            {
                // Trim leading and trailing whitespace
                line.erase(0, line.find_first_not_of(" \t\r\n"));
                line.erase(line.find_last_not_of(" \t\r\n") + 1);

                if (line.empty())
                    continue;

                try
                {
                    // Remove extra spaces around colon
                    size_t colonPos = line.find(':');
                    if (colonPos == std::string::npos)
                        continue;

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
                    ThresholdParser::ExprContext *tree = parser.expr();

                    // Extract expression from parse tree
                    EvalVisitor visitor;
                    std::string compiledExpr = std::any_cast<std::string>(visitor.visitExpr(tree));

                    std::cout << "  Compiled expression: '" << compiledExpr << "'" << std::endl;

                    // Evaluate the expression with the given value
                    if (evalExprWithX(value, compiledExpr))
                    {
                        // Return the rating if the expression matches
                        int rating = std::stoi(ratingStr);
                        std::cout << "  Rating matched: " << rating << std::endl;
                        return rating;
                    }
                }
                catch (const std::exception &e)
                {
                    std::cerr << "Error parsing threshold line: '" << line << "' - " << e.what() << std::endl;
                    continue;
                }
            }

            // No matching rule found
            return -1;
        };

    public:
        KPMRReportGenerator();
        KPMRReportGenerator(std::shared_ptr<kpmr::riskprofile::kpmr_risk_profile_tree> rpt, 
            std::shared_ptr<kpmr::conf::riskprofile::RiskProfileConf> conf) : kpmrRiskProfileTree(rpt), kpmrRiskProfileConf(conf) {}
        ~KPMRReportGenerator();

        void setKPMRRiskProfileTree(std::shared_ptr<kpmr::riskprofile::kpmr_risk_profile_tree> rpt)
        {
            kpmrRiskProfileTree = rpt;
        }

        std::vector<kpmr::riskprofile::NodeType> filterKPMRRiskProfileNodeXPath(
            const std::string &xpathExpr);

        absl::Status generateKPMRReport();
        absl::Status writeKPMRRiskProfileConf(const std::string &outputPath);

        std::vector<chaiscript::Boxed_Value> kpmrNodeTypeAsChaiVar(std::vector<kpmr::riskprofile::NodeType> nodes);
    };

} // namespace riskprofile

#endif // ILFREPORTER_RISK_PROFILE_HPP