#include "absl/flags/flag.h"
#include "absl/flags/parse.h"
#include "absl/flags/usage.h"
#include "absl/log/log.h"
#include "absl/log/initialize.h"
#include "absl/strings/str_format.h"
#include "kpmr_datasource.hpp"
#include <iostream>
#include <fstream>
#include <filesystem>

ABSL_FLAG(std::string, config_path, "", "Path to the KPMR DataSource config XML file");
ABSL_FLAG(std::string, weight_path, "", "Path to the weight configuration file");
ABSL_FLAG(std::string, output_path, "", "Path to the output file (optional)");

int main(int argc, char* argv[]) {
    // Set program usage message
    absl::SetProgramUsageMessage(
        "Usage: kpmr_riskprofile_cli [options]\n"
        "Evaluate KPMR risk profiles\n\n"
        "Required flags:\n"
        "  --config_path=<path>    Path to KPMR DataSource config XML\n"
        "  --weight_path=<path>    Path to weight configuration file\n\n"
        "Optional flags:\n"
        "  --output_path=<path>    Path to output file (default: kpmr_output.txt)"
    );

    // Parse command-line flags
    std::vector<char*> remaining_args = absl::ParseCommandLine(argc, argv);

    // Get flag values
    std::string config_path = absl::GetFlag(FLAGS_config_path);
    std::string weight_path = absl::GetFlag(FLAGS_weight_path);
    std::string output_path = absl::GetFlag(FLAGS_output_path);

    // Validate required flags
    bool has_error = false;
    if (config_path.empty()) {
        std::cerr << "Error: --config_path is required\n";
        has_error = true;
    }
    if (weight_path.empty()) {
        std::cerr << "Error: --weight_path is required\n";
        has_error = true;
    }

    if (has_error) {
        std::cerr << "\nUsage: kpmr_riskprofile_cli --config_path=<path> --weight_path=<path> [--output_path=<path>]\n";
        return 1;
    }

    // Validate that files exist
    if (!std::filesystem::exists(config_path)) {
        std::cerr << "Error: KPMR config file not found: " << config_path << "\n";
        return 1;
    }
    if (!std::filesystem::exists(weight_path)) {
        std::cerr << "Error: Weight config file not found: " << weight_path << "\n";
        return 1;
    }

    try {
        LOG(INFO) << "Loading KPMR DataSource config from: " << config_path;
        LOG(INFO) << "Loading weight config from: " << weight_path;
        
        // Create evaluator with config and weight paths
        kpmr::datasource::Evaluator evaluator(config_path, weight_path);

        LOG(INFO) << "Starting KPMR risk profile evaluation...";

        // Run evaluation
        OperationStatus status = evaluator.evaluate();

        if (status == SuccessOperationStatus) {
            LOG(INFO) << "KPMR risk profile evaluation completed successfully";
            std::cout << "Successfully evaluated KPMR risk profile\n";
            std::cout << "  Config: " << config_path << "\n";
            std::cout << "  Weight: " << weight_path << "\n";

            // Handle output
            if (output_path.empty()) {
                output_path = "kpmr_output.txt";
            }

            LOG(INFO) << "Writing results to: " << output_path;

            std::ofstream ofs(output_path);
            if (!ofs.is_open()) {
                LOG(ERROR) << "Failed to open output file: " << output_path;
                std::cerr << "Error: Failed to open output file: " << output_path << "\n";
                return 1;
            }

            // Write evaluation results
            ofs << "KPMR Risk Profile Evaluation Results\n";
            ofs << "=====================================\n\n";
            ofs << "Input Files:\n";
            ofs << "  Config: " << config_path << "\n";
            ofs << "  Weight: " << weight_path << "\n\n";
            ofs << "Status: SUCCESS\n";
            
            // Write computed inputs
            auto computedInputs = evaluator.getComputedInputs();
            if (!computedInputs.empty()) {
                ofs << "\nComputed Inputs:\n";
                for (const auto& [key, value] : computedInputs) {
                    ofs << "  " << key << ": " << value << "\n";
                }
            }
            
            ofs.close();

            LOG(INFO) << "Results written successfully to: " << output_path;
            std::cout << "\nResults written to: " << output_path << "\n";

            return 0;
        } else {
            LOG(ERROR) << "KPMR risk profile evaluation failed";
            std::cerr << "Error: KPMR risk profile evaluation failed\n";
            return 1;
        }
    } catch (const std::exception& e) {
        LOG(ERROR) << "Error: " << e.what();
        std::cerr << "Error: " << e.what() << "\n";
        return 1;
    }
}
