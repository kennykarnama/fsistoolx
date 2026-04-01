//
// Created by kenny on 21/12/25.
//

#include "scoreratingparser.hpp"
#include <ranges>

std::unordered_map<std::string, std::string> ratingToScore(std::string_view input) {
        std::unordered_map<std::string, std::string> map;

        auto trim = [](std::string_view sv) {
            auto is_space = [](char c){ return c == ' ' || c == '\t'; };
            while (!sv.empty() && is_space(sv.front())) sv.remove_prefix(1);
            while (!sv.empty() && is_space(sv.back()))  sv.remove_suffix(1);
            return sv;
        };

        for (auto part : input | std::views::split(',')) {
            std::string_view segment{part.begin(), part.end()};
            auto kv = segment | std::views::split(':');

            auto it = kv.begin();
            if (it == kv.end()) continue;

            std::string_view key{(*it).begin(), (*it).end()};
            ++it;
            if (it == kv.end()) continue;

            std::string_view value{(*it).begin(), (*it).end()};

            key   = trim(key);
            value = trim(value);

            map.emplace(std::string(key), std::string(value));
        }

        return map;
    }
