#include "absl/flags/flag.h"
#include "absl/flags/parse.h"
#include "absl/flags/usage.h"
#include "absl/log/log.h"
#include "absl/log/initialize.h"
#include "absl/strings/str_format.h"
#include "riskprofile.hpp"
#include <iostream>
#include <fstream>
#include <filesystem>


ABSL_FLAG(std::string, kpmr_datasource, "", "Path to the KPMR DataSource XML file");
ABSL_FLAG(std::string, kpmr_riskprofile, "", "Path to the KPMR Risk Profile XML file");
ABSL_FLAG(std::string, output_path, "", "Path to the output file (optional)");

int main(int argc, char* argv[]) {
    // Set program usage message
    absl::SetProgramUsageMessage(
        "Usage: riskprofile_cli [options]\n"
        "Evaluate risk profiles using KPMR data sources\n\n"
        "Required flags:\n"
        "  --kpmr_datasource=<path>      Path to KPMR DataSource XML\n"
        "  --kpmr_riskprofile=<path>     Path to KPMR Risk Profile XML\n\n"
        "Optional flags:\n"
        "  --output_path=<path>                    Path to output file (default: riskprofile_output.txt)\n"
    );

    // Parse command-line flags
    std::vector<char*> remaining_args = absl::ParseCommandLine(argc, argv);

    // Get flag values
    std::string kpmr_datasource = absl::GetFlag(FLAGS_kpmr_datasource);
    std::string kpmr_riskprofile = absl::GetFlag(FLAGS_kpmr_riskprofile);
    std::string output_path = absl::GetFlag(FLAGS_output_path);

    // Validate required flags
    bool has_error = false;
    if (kpmr_datasource.empty()) {
        std::cerr << "Error: --kpmr_datasource is required\n";
        has_error = true;
    }
    if (kpmr_riskprofile.empty()) {
        std::cerr << "Error: --kpmr_riskprofile is required\n";
        has_error = true;
    }


    if (has_error) {
        std::cerr << "\nUsage: riskprofile_cli --kpmr_datasource=<path> --kpmr_riskprofile=<path> [--output_path=<path>]\n";
        return 1;
    }

    // Validate that files exist
   
    if (!std::filesystem::exists(kpmr_datasource)) {
        std::cerr << "Error: KPMR DataSource file not found: " << kpmr_datasource << "\n";
        return 1;
    }
   
    if (!std::filesystem::exists(kpmr_riskprofile)) {
        std::cerr << "Error: KPMR Risk Profile file not found: " << kpmr_riskprofile << "\n";
        return 1;
    }

    try {
       
        // Parse XML files with correct namespaces
        LOG(INFO) << "Loading KPMR DataSource from: " << kpmr_datasource;
        std::shared_ptr<kpmr::datasource::ConsolidatedAssessmentType> kpmrDataSources = 
            std::move(kpmr::datasource::data(kpmr_datasource));
       
        LOG(INFO) << "Loading KPMR Risk Profile from: " << kpmr_riskprofile;
            std::shared_ptr<kpmr::riskprofile::kpmr_risk_profile_tree> kpmrRiskProfileTree = 
            std::move(kpmr::riskprofile::kpmr_risk_profile_tree_(kpmr_riskprofile));

        LOG(INFO) << "All data loaded successfully";
        LOG(INFO) << "Number of top-level nodes: " << kpmrRiskProfileTree->node().size();
        
        // Debug: check first node
        if (!kpmrRiskProfileTree->node().empty()) {
            const auto& firstNode = kpmrRiskProfileTree->node()[0];
            LOG(INFO) << "First node profile_id: " << firstNode.profile_id();
            LOG(INFO) << "First node has children: " << (firstNode.children().present() ? "YES" : "NO");
            if (firstNode.children().present()) {
                LOG(INFO) << "Number of children: " << firstNode.children()->node().size();
            }
        }

        // Create evaluator with loaded data
        riskprofile::Evaluator evaluator(
            nullptr,
            kpmrDataSources,
            nullptr,
            kpmrRiskProfileTree
        );

        LOG(INFO) << "Starting risk profile evaluation...";

        // Run evaluation
        OperationStatus status = evaluator.evaluateKPMRRiskProfile();

        if (status == SuccessOperationStatus) {
            LOG(INFO) << "Risk profile evaluation completed successfully";
            std::cout << "Successfully evaluated risk profiles\n";
           

            // Handle output
            if (output_path.empty()) {
                output_path = "riskprofile_output.txt";
            }

            LOG(INFO) << "Writing results to: " << output_path;

 

            // Write evaluated KPMR Risk Profile XML if output path is specified
           
                try {
                    LOG(INFO) << "Writing evaluated KPMR Risk Profile XML to: " << output_path;
                    
                    // Create namespace map for serialization
                    xml_schema::namespace_infomap map;
                    map[""].name = "http://example.com/kpmr";
                    map[""].schema = "./xsd/KPMRRiskProfile.xsd";
                    
                    // Serialize to file
                    std::ofstream xml_ofs(output_path);
                    kpmr::riskprofile::kpmr_risk_profile_tree_(xml_ofs, *kpmrRiskProfileTree, map);
                    xml_ofs.close();
                    
                    LOG(INFO) << "Evaluated KPMR Risk Profile XML written successfully";
                    std::cout << "Evaluated KPMR Risk Profile XML written to: " << output_path << "\n";
                } catch (const xml_schema::exception& e) {
                    LOG(ERROR) << "Failed to write KPMR Risk Profile XML: " << e.what();
                    std::cerr << "Error writing XML: " << e.what() << "\n";
                    // Don't fail the whole program, just log the error
                }
            

            return 0;
        } else {
            LOG(ERROR) << "Risk profile evaluation failed";
            std::cerr << "Error: Risk profile evaluation failed\n";
            return 1;
        }
    } catch (const std::exception& e) {
        LOG(ERROR) << "Error: " << e.what();
        std::cerr << "Error: " << e.what() << "\n";
        return 1;
    }
}
