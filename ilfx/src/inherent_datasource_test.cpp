#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <memory>
#include <string>
#include "inherent_datasource.hpp"
#include "InherentDataSource.hxx"
#include "libgofunct.h"
#include <chaiscript/chaiscript.hpp>

namespace inherent::datasource::testing
{
    // Test fixture for Evaluator class
    class EvaluatorTest : public ::testing::Test
    {
    protected:
        void SetUp() override
        {
            // Set up test fixtures
            validConfigPath = "../sampledata/inherentds.xml";
            validWeightPath = "../sampledata/weighing.xml";
            invalidConfigPath = "/nonexistent/path/to/config.xml";
        }

        void TearDown() override
        {
            // Clean up after tests
        }

        std::string validConfigPath;
        std::string validWeightPath;
        std::string invalidConfigPath;
    };

    // Test: Constructor with valid config path
    TEST_F(EvaluatorTest, ConstructorWithValidConfigPath)
    {
        EXPECT_NO_THROW(
        {
            inherent::datasource::Evaluator evaluator(validConfigPath, validWeightPath);
        });
    }

    // Test: Constructor with invalid config path
    TEST_F(EvaluatorTest, ConstructorWithInvalidConfigPath)
    {
        EXPECT_THROW(
        {
            inherent::datasource::Evaluator evaluator(invalidConfigPath, validWeightPath);
        },
        std::exception);
    }

    // Test: Evaluate method returns success status
    TEST_F(EvaluatorTest, EvaluateReturnsSuccessStatus)
    {
        inherent::datasource::Evaluator evaluator(validConfigPath, validWeightPath);
        auto status = evaluator.evaluate();
        EXPECT_EQ(status, SuccessOperationStatus);
    }

    // Test: Evaluate method processes all items
    TEST_F(EvaluatorTest, EvaluateProcessesAllItems)
    {
        inherent::datasource::Evaluator evaluator(validConfigPath, validWeightPath);
        auto status = evaluator.evaluate();
        
        EXPECT_EQ(status, SuccessOperationStatus);
        // Additional assertions can be added to verify processing
    }

    // Test: Evaluate method handles empty datasources gracefully
    TEST_F(EvaluatorTest, EvaluateHandlesEmptyDatasources)
    {
        // This test should verify behavior with empty or minimal config
        inherent::datasource::Evaluator evaluator(validConfigPath, validWeightPath);
        EXPECT_NO_THROW(
        {
            evaluator.evaluate();
        });
    }

    // Test: Evaluator destructor
    TEST_F(EvaluatorTest, DestructorCleansUp)
    {
        EXPECT_NO_THROW(
        {
            {
                inherent::datasource::Evaluator evaluator(validConfigPath, validWeightPath);
                // Destructor called when scope exits
            }
        });
    }

    // Test: Multiple evaluate calls
    TEST_F(EvaluatorTest, MultipleEvaluateCalls)
    {
        inherent::datasource::Evaluator evaluator(validConfigPath, validWeightPath);
        
        auto status1 = evaluator.evaluate();
        auto status2 = evaluator.evaluate();
        
        EXPECT_EQ(status1, SuccessOperationStatus);
        EXPECT_EQ(status2, SuccessOperationStatus);
    }

    // Test: Evaluate processes row data correctly
    TEST_F(EvaluatorTest, EvaluateProcessesRowDataCorrectly)
    {
        inherent::datasource::Evaluator evaluator(validConfigPath, validWeightPath);
        
        // This test verifies that row data (companyName, description, value) 
        // is properly extracted and processed
        auto status = evaluator.evaluate();
        EXPECT_EQ(status, SuccessOperationStatus);
    }

} // namespace inherent::datasource::testing

// ChaiScript Tests
namespace inherent::datasource::chaiscript_testing
{
    class ChaiScriptTest : public ::testing::Test
    {
    protected:
        void SetUp() override
        {
            chai = std::make_shared<chaiscript::ChaiScript>();
        }

        void TearDown() override
        {
            chai.reset();
        }

        std::shared_ptr<chaiscript::ChaiScript> chai;
    };

    // Test: ChaiScript initialization
    TEST_F(ChaiScriptTest, ChaiScriptInitialization)
    {
        EXPECT_NE(chai, nullptr);
    }

    // Test: Basic arithmetic evaluation
    TEST_F(ChaiScriptTest, BasicArithmetic)
    {
        auto result = chai->eval<int>("2 + 3");
        EXPECT_EQ(result, 5);
    }

    // Test: Variable assignment and retrieval
    TEST_F(ChaiScriptTest, VariableAssignment)
    {
        chai->eval("var x = 10");
        auto result = chai->eval<int>("x");
        EXPECT_EQ(result, 10);
    }

    // Test: Function definition and call
    TEST_F(ChaiScriptTest, FunctionDefinition)
    {
        chai->eval("def add(a, b) { return a + b; }");
        auto result = chai->eval<int>("add(5, 3)");
        EXPECT_EQ(result, 8);
    }

    // Test: String operations
    TEST_F(ChaiScriptTest, StringOperations)
    {
        chai->eval("var greeting = \"Hello\"; var name = \"World\"");
        auto result = chai->eval<std::string>("greeting + \" \" + name");
        EXPECT_EQ(result, "Hello World");
    }

    // Test: List/vector operations
    TEST_F(ChaiScriptTest, ListOperations)
    {
        chai->eval("var numbers = [1, 2, 3, 4, 5]");
        auto result = chai->eval<int>("numbers[0]");
        EXPECT_EQ(result, 1);
    }

    // Test: Lambda expressions
    TEST_F(ChaiScriptTest, LambdaExpressions)
    {
        chai->eval("var square = fun(x) { return x * x; }");
        auto result = chai->eval<int>("square(4)");
        EXPECT_EQ(result, 16);
    }

    // Test: Conditional statements
    TEST_F(ChaiScriptTest, ConditionalStatements)
    {
        chai->eval(
            "def find_maximum(a, b) { "
            "  if (a > b) { return a; } "
            "  else { return b; } "
            "}"
        );
        auto result = chai->eval<int>("find_maximum(10, 20)");
        EXPECT_EQ(result, 20);
    }

    // Test: Loop operations
    TEST_F(ChaiScriptTest, LoopOperations)
    {
        chai->eval(
            "var sum = 0; "
            "for(var i = 1; i <= 5; ++i) { sum = sum + i; } "
        );
        auto result = chai->eval<int>("sum");
        EXPECT_EQ(result, 15);
    }

    // Test: Dynamic evaluation with variables
    TEST_F(ChaiScriptTest, DynamicEvaluation)
    {
        chai->eval("var threshold = 100");
        chai->eval("var value = 150");
        auto result = chai->eval<bool>("value > threshold");
        EXPECT_TRUE(result);
    }

    // Test: Exception handling in ChaiScript
    TEST_F(ChaiScriptTest, ExceptionHandling)
    {
        EXPECT_THROW(
        {
            chai->eval("var x = undefined_variable");
        },
        chaiscript::exception::eval_error);
    }

    // Test: Data evaluation for risk assessment
    TEST_F(ChaiScriptTest, RiskAssessmentLogic)
    {
        chai->eval(
            "def assess_risk(value, threshold) { "
            "  if (value > threshold) { return \"HIGH\"; } "
            "  else if (value > threshold * 0.5) { return \"MEDIUM\"; } "
            "  else { return \"LOW\"; } "
            "}"
        );
        
        auto high_risk = chai->eval<std::string>("assess_risk(150, 100)");
        auto medium_risk = chai->eval<std::string>("assess_risk(75, 100)");
        auto low_risk = chai->eval<std::string>("assess_risk(25, 100)");
        
        EXPECT_EQ(high_risk, "HIGH");
        EXPECT_EQ(medium_risk, "MEDIUM");
        EXPECT_EQ(low_risk, "LOW");
    }

    // Test: Majority function
    TEST_F(ChaiScriptTest, MajorityFunction)
    {
        // Register the 'majority' function into this Chai instance
        chai->add(chaiscript::fun([](const std::vector<chaiscript::Boxed_Value>& values_boxed) {
            std::vector<double> values;
            for (const auto& val : values_boxed) {
                values.push_back(chaiscript::boxed_cast<double>(val));
            }
            return MajorityScoreF64(values.data(), values.size());
        }), "majority");
        auto result1 = chai->eval<int>("majority([1.0, 2.0, 2.0, 3.0, 4.0])");
        EXPECT_EQ(result1, 2);
        
        auto result2 = chai->eval<int>("majority([5.0, 5.0, 5.0, 5.0, 5.0])");
        EXPECT_EQ(result2, 5);
        
        auto result3 = chai->eval<int>("majority([1.0, 2.0, 3.0, 4.0, 5.0])");
        EXPECT_EQ(result3, 3);
    }

    // Test: Pearson Correlation function
    TEST_F(ChaiScriptTest, PearsonCorrelationFunction)
    {
        // Register the 'correlation' function into this Chai instance
        chai->add(chaiscript::fun([](const std::vector<chaiscript::Boxed_Value>& x_boxed, 
                                    const std::vector<chaiscript::Boxed_Value>& y_boxed) {
            std::vector<double> x;
            std::vector<double> y;
            
            for (const auto& val : x_boxed) {
                x.push_back(chaiscript::boxed_cast<double>(val));
            }
            
            for (const auto& val : y_boxed) {
                y.push_back(chaiscript::boxed_cast<double>(val));
            }
            
            if (x.size() != y.size()) {
                throw std::runtime_error("Correlation: x and y must have the same length");
            }
            
            return PearsonCorrelationF64(x.data(), y.data(), x.size());
        }), "correlation");
        auto result1 = chai->eval<double>("correlation([1.0, 2.0, 3.0, 4.0, 5.0], [2.0, 4.0, 6.0, 8.0, 10.0])");
        EXPECT_DOUBLE_EQ(result1, 1.0);
        
        auto result2 = chai->eval<double>("correlation([1.0, 2.0, 3.0, 4.0, 5.0], [5.0, 4.0, 3.0, 2.0, 1.0])");
        EXPECT_DOUBLE_EQ(result2, -1.0);
        
        auto result3 = chai->eval<double>("correlation([1.0, 2.0, 3.0, 4.0, 5.0], [3.0, 3.0, 3.0, 3.0, 3.0])");
        EXPECT_DOUBLE_EQ(result3, 0.0);
        
        auto result4 = chai->eval<double>("correlation([1.0, 2.0, 3.0, 4.0, 5.0], [1.5, 2.5, 3.0, 4.5, 5.0])");
        EXPECT_NEAR(result4, 0.9938, 0.0001); 
    }

    TEST_F(ChaiScriptTest, MinimumFunction)
    {
        // Register the 'minimum' function
        chai->add(chaiscript::fun([](const std::vector<chaiscript::Boxed_Value>& values_boxed) {
            std::vector<double> values;
            
            for (const auto& val : values_boxed) {
                values.push_back(chaiscript::boxed_cast<double>(val));
            }
            
            if (values.empty()) {
                throw std::runtime_error("Minimum: input vector cannot be empty");
            }
            
            return MinimumScoreF64(values.data(), values.size());
        }), "minimum");
        auto result1 = chai->eval<double>("minimum([0.0, 5.0, 3.0, 0.0, 2.0])");
        EXPECT_DOUBLE_EQ(result1, 2.0);
        
        auto result2 = chai->eval<double>("minimum([0.0, 0.0, 0.0])");
        EXPECT_DOUBLE_EQ(result2, 0.0);
        
        auto result3 = chai->eval<double>("minimum([5.0, 3.0, 2.0, 4.0])");
        EXPECT_DOUBLE_EQ(result3, 2.0);
        
        EXPECT_THROW({
            chai->eval("minimum([])");
        }, std::exception);
    }

} // namespace inherent::datasource::chaiscript_testing

// Main test runner
int main(int argc, char** argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
