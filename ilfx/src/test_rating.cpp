#include <iostream>
#include "riskprofile.hpp"

int main() {
    // Create a threshold string with multiple rules
    std::string threshold = 
        "1: x < 10\n"
        "2: 10 <= x < 20\n"
        "3: 20 <= x < 30\n"
        "4: 30 <= x < 40\n"
        "5: x >= 40";
    
    // Create a minimal evaluator (using nullptr for dependencies we don't need for this test)
    riskprofile::Evaluator evaluator(nullptr, nullptr, nullptr, nullptr);
    
    // Test various values
    std::cout << "Testing ratingByThreshold function:\n" << std::endl;
    
    double testValues[] = {5, 15, 25, 35, 45};
    int expectedRatings[] = {1, 2, 3, 4, 5};
    
    for (int i = 0; i < 5; i++) {
        double value = testValues[i];
        int rating = evaluator.ratingByThreshold(threshold, value);
        int expected = expectedRatings[i];
        
        std::cout << "Value: " << value << " -> Rating: " << rating;
        if (rating == expected) {
            std::cout << " ✓" << std::endl;
        } else {
            std::cout << " ✗ (expected " << expected << ")" << std::endl;
        }
    }
    
    // Test edge case - no match
    int rating = evaluator.ratingByThreshold("1: x > 100", 50);
    std::cout << "\nEdge case - no match: Value: 50 -> Rating: " << rating;
    if (rating == -1) {
        std::cout << " ✓ (correctly returns -1)" << std::endl;
    } else {
        std::cout << " ✗ (expected -1)" << std::endl;
    }
    
    return 0;
}
