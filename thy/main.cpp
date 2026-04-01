#include <iostream>
#include <algorithm>
#include <sstream>
#include <vector>
#include <string>
#include "item.h"

extern "C" int yyparse();

static std::string formatNumber(double v) {
    if (static_cast<long long>(v) == v) {
        return std::to_string(static_cast<long long>(v));
    }
    std::ostringstream ss;
    ss << v;
    return ss.str();
}

int main() {
    // parse stdin
    if (yyparse() != 0) {
        std::cerr << "Parsing failed\n";
        return 1;
    }

    if (records.empty()) {
        std::cerr << "No records parsed\n";
        return 1;
    }

    // sort by upper bound ascending
    std::sort(records.begin(), records.end(),
              [](const Item& a, const Item& b){ return a.upper < b.upper; });

    // build nested ternary expression
    std::ostringstream oss;
    const std::string var = "score";
    for (size_t i = 0; i + 1 < records.size(); ++i) {
        oss << "(" << var << " <= " << formatNumber(records[i].upper) << ") ? "
            << records[i].label << " : ";
    }
    oss << records.back().label;

    std::cout << oss.str() << std::endl;

    // output key:value pairs
    for (const auto& kv : keyvalues) {
        std::cout << "key=" << kv.key << std::endl;
        std::cout << "value=" << kv.value << std::endl;
    }

    return 0;
}