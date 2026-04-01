#include <iostream>
#include <fstream>
#include <string>
#include "scoreratingparser.hpp"
#include "absl/flags/flag.h"
#include "absl/flags/parse.h"
#include "absl/log/log.h"
#include "absl/log/initialize.h"

ABSL_FLAG(std::string, input, "", "Rating to score mapping (e.g., '1:Low, 2:Medium, 3:High')");
ABSL_FLAG(std::string, file, "", "File containing rating to score mapping");
ABSL_FLAG(std::string, lookup, "", "Rating key to lookup in the map");

int main(int argc, char* argv[]) {
    absl::ParseCommandLine(argc, argv);
    absl::InitializeLog();

    std::string input = absl::GetFlag(FLAGS_input);
    std::string file = absl::GetFlag(FLAGS_file);
    std::string lookup = absl::GetFlag(FLAGS_lookup);

    if (input.empty() && file.empty()) {
        LOG(ERROR) << "Either --input or --file must be specified";
        std::cerr << "Usage: " << argv[0] << " --input='1:Low, 2:Medium, 3:High'" << std::endl;
        std::cerr << "   or: " << argv[0] << " --file=rating_map.txt" << std::endl;
        std::cerr << "\nOptional: --lookup=2 (to lookup a specific rating)" << std::endl;
        return 1;
    }

    std::string mappingStr;
    if (!file.empty()) {
        std::ifstream inputFile(file);
        if (!inputFile.is_open()) {
            LOG(ERROR) << "Failed to open file: " << file;
            return 1;
        }
        std::getline(inputFile, mappingStr);
        inputFile.close();
    } else {
        mappingStr = input;
    }

    LOG(INFO) << "Parsing rating to score mapping: " << mappingStr;

    try {
        auto ratingMap = ratingToScore(mappingStr);
        
        if (ratingMap.empty()) {
            LOG(WARNING) << "No mappings found";
            std::cout << "No mappings found in input" << std::endl;
            return 1;
        }

        std::cout << "Rating to Score Mapping:" << std::endl;
        std::cout << "========================" << std::endl;
        
        for (const auto& [rating, score] : ratingMap) {
            std::cout << "Rating " << rating << " -> Score: " << score << std::endl;
        }
        
        if (!lookup.empty()) {
            std::cout << "\nLookup Result:" << std::endl;
            std::cout << "==============" << std::endl;
            
            auto it = ratingMap.find(lookup);
            if (it != ratingMap.end()) {
                std::cout << "Rating " << lookup << " has score: " << it->second << std::endl;
            } else {
                std::cout << "Rating " << lookup << " not found in mapping" << std::endl;
                return 1;
            }
        }
        
        LOG(INFO) << "Successfully parsed rating mapping with " << ratingMap.size() << " entries";
        return 0;
        
    } catch (const std::exception& e) {
        LOG(ERROR) << "Error parsing mapping: " << e.what();
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
}
