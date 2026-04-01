#include "absl/flags/flag.h"
#include "absl/flags/parse.h"
#include "absl/flags/usage.h"
#include "absl/log/log.h"
#include "absl/log/initialize.h"
#include "absl/strings/str_format.h"
#include "inherent_datasource.hpp"
#include <iostream>
#include <fstream>
#include <filesystem>

ABSL_FLAG(std::string, data_path, "", "Path to the XML data file");
ABSL_FLAG(std::string, weight_path, "", "Path to the Weight XML file");
ABSL_FLAG(std::string, output_path, "", "Path to the output XML file (default: input_output.xml)");

int main(int argc, char* argv[]) {
    // Initialize absl logging
    //absl::InitializeLog();

    // Set program usage message
    absl::SetProgramUsageMessage("Usage: ilfx_cli [options] <command>");

    // Parse command-line flags
    std::vector<char*> remaining_args = absl::ParseCommandLine(argc, argv);

    // Get the data path
    std::string data_path = absl::GetFlag(FLAGS_data_path);
    std::string weight_path = absl::GetFlag(FLAGS_weight_path);

    // Validate that data_path is provided
    if (data_path.empty()) {
        std::cerr << "Error: --data_path is required\n";
        std::cerr << "Usage: ilfx_cli --data_path=<path>\n";
        return 1;
    }

    // Validate that the file exists
    if (!std::filesystem::exists(data_path)) {
        std::cerr << "Error: File not found: " << data_path << "\n";
        return 1;
    }

    // Check if the file has a .xml extension
    if (std::filesystem::path(data_path).extension() != ".xml") {
        std::cerr << "Warning: File does not have .xml extension\n";
    }

    try {
        LOG(INFO) << "Loading data from: " << data_path;
        
        // Create an Evaluator instance with the provided XML path
        inherent::datasource::Evaluator evaluator(data_path, weight_path);
        
        LOG(INFO) << "Data loaded successfully";
        
        // Run evaluation
        OperationStatus status = evaluator.evaluate();
        
        if (status == SuccessOperationStatus) {
            LOG(INFO) << "Evaluation completed successfully";
            std::cout << "Successfully processed: " << data_path << "\n";

            LOG(INFO) << "Computed Inputs:";

            auto computedInputs = evaluator.getComputedInputs();
            for (const auto& [company, value] : computedInputs) {
                LOG(INFO) << "  " << company << ": " << value;
            }

            LOG(INFO) << "Data Sources write to:";

            auto datasources = evaluator.getDataSources();

            // Get output path from flag or generate default
            std::string output_path = absl::GetFlag(FLAGS_output_path);
            if (output_path.empty()) {
                // Prepare default output file path (add _output suffix before extension)
                std::filesystem::path input_path(data_path);
                output_path = input_path.parent_path().string() + "/" + 
                             input_path.stem().string() + "_output" + 
                             input_path.extension().string();
            }

            LOG(INFO) << "Writing results to: " << output_path;

            xml_schema::namespace_infomap map;
            map[""].name = "http://example.com/inherent";
            map[""].schema = "./xsd/InherentDataSource.xsd";

            // Serialize the data to XML file
            std::ofstream ofs(output_path);
            if (!ofs.is_open()) {
                LOG(ERROR) << "Failed to open output file: " << output_path;
                std::cerr << "Error: Failed to open output file: " << output_path << "\n";
                return 1;
            }

            data(ofs, *datasources, map);
            ofs.close();

            std::cout << "Results written to: " << output_path << "\n";

            return 0;
        } else {
            LOG(ERROR) << "Evaluation failed";
            std::cerr << "Evaluation failed\n";
            return 1;
        }
    } catch (const std::exception& e) {
        LOG(ERROR) << "Exception occurred: " << e.what();
        std::cerr << "Error: " << e.what() << "\n";
        return 1;
    }
}
