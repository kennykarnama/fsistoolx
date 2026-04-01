#include <iostream>
#include <memory>
#include <string>

#include "absl/flags/flag.h"
#include "absl/flags/parse.h"
#include "absl/flags/usage.h"

#include <xercesc/util/PlatformUtils.hpp>
#include <xqilla/xqilla-dom3.hpp>

#include "InherentRiskProfile.hxx"
#include "riskprofile.hpp"

ABSL_FLAG(std::string, input_profile, "", "Path to risk profile XML file");
ABSL_FLAG(std::string, xpath, "", "XPath expression to evaluate on the risk profile");

int main(int argc, char** argv)
{
    absl::SetProgramUsageMessage("xpath_cli --input_profile=<profile.xml> --xpath=<expression>");
    absl::ParseCommandLine(argc, argv);

    const std::string profile_path = absl::GetFlag(FLAGS_input_profile);
    const std::string xpath_expr = absl::GetFlag(FLAGS_xpath);

    if (profile_path.empty() || xpath_expr.empty())
    {
        std::cerr << "Both --input_profile and --xpath are required." << std::endl;
        return 1;
    }

    try
    {
        xercesc::XMLPlatformUtils::Initialize();
        XQillaPlatformUtils::initialize();
    }
    catch (const xercesc::XMLException& e)
    {
        char* msg = xercesc::XMLString::transcode(e.getMessage());
        std::cerr << "Failed to initialize XML platform: " << (msg ? msg : "<null>") << std::endl;
        xercesc::XMLString::release(&msg);
        return 1;
    }

    int status = 0;
    try
    {
        auto tree_unique = RiskProfileTree_(profile_path, xml_schema::flags::keep_dom);
        std::shared_ptr<RiskProfileTree> tree(tree_unique.release());
        riskprofile::InherentReportGenerator gen(tree, nullptr);

        auto nodes = gen.filterRiskProfileNodeXPath(xpath_expr);
        std::cout << "Matched " << nodes.size() << " nodes for xpath: " << xpath_expr << std::endl;
        for (const auto& n : nodes)
        {
            std::cout << " - risiko_name: " << n.risiko_name().get() << std::endl;
        }
    }
    catch (const std::exception& e)
    {
        std::cerr << "Failed to evaluate XPath: " << e.what() << std::endl;
        status = 1;
    }

    XQillaPlatformUtils::terminate();
    xercesc::XMLPlatformUtils::Terminate();

    return status;
}