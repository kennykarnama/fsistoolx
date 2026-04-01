#ifndef ILF_CHAICLI_HPP
#define ILF_CHAICLI_HPP

#include "allheaders.hpp"
#include <chaiscript/chaiscript.hpp>

namespace ChaiClient
{
    class EvalResult {
        public:
         chaiscript::Boxed_Value value;

         OperationStatus status;
    };

    class ChaiCLI
    {
    private:
        std::shared_ptr<chaiscript::ChaiScript> chai;

    public:
        ChaiCLI()
        {
            chai = std::make_shared<chaiscript::ChaiScript>();
        }

        ~ChaiCLI()
        {
            chai.reset();
        }

        std::shared_ptr<chaiscript::ChaiScript> getChai() const
        {
            return chai;
        }

        EvalResult evaluate(const std::string& code)
        {
            EvalResult result;
            result.value = chai->eval(code);
            result.status = SuccessOperationStatus;

            return result;
        }


    };
} // namespace ChaiClient

#endif // ILF_CHAICLI_HPP