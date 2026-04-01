// Example usage of ratingByThreshold function in riskprofile.hpp

#include "riskprofile.hpp"
#include <iostream>

int main() {
    // Example threshold rules (one per line)
    // Format: rating: condition
    std::string threshold = 
        "1: x < 10\n"
        "2: 10 <= x < 20\n"
        "3: 20 <= x < 30\n"
        "4: 30 <= x < 40\n"
        "5: x >= 40";
    
    // Create evaluator (you would normally pass real data sources)
    riskprofile::Evaluator evaluator(nullptr, nullptr, nullptr, nullptr);
    
    // Test with different values
    double value1 = 5.0;
    int rating1 = evaluator.ratingByThreshold(threshold, value1);
    std::cout << "Value " << value1 << " has rating: " << rating1 << std::endl;
    
    double value2 = 25.0;
    int rating2 = evaluator.ratingByThreshold(threshold, value2);
    std::cout << "Value " << value2 << " has rating: " << rating2 << std::endl;
    
    double value3 = 45.0;
    int rating3 = evaluator.ratingByThreshold(threshold, value3);
    std::cout << "Value " << value3 << " has rating: " << rating3 << std::endl;
    
    return 0;
}
