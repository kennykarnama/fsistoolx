//
// Created by kenny on 21/12/25.
//

#ifndef FX_SCORERATINGPARSER_H
#define FX_SCORERATINGPARSER_H

#include <unordered_map>
#include <string>
#include <string_view>

std::unordered_map<std::string, std::string>
ratingToScore(std::string_view input);


#endif //FX_SCORERATINGPARSER_H