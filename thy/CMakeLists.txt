cmake_minimum_required(VERSION 3.5)
project(score_parser CXX C)

find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)

FLEX_TARGET(LEXER lexer.l ${CMAKE_CURRENT_BINARY_DIR}/lexer.c)
BISON_TARGET(PARSER parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.cpp
             COMPILE_FLAGS -d)

ADD_FLEX_BISON_DEPENDENCY(LEXER PARSER)

add_executable(score_parser
    ${FLEX_LEXER_OUTPUTS}
    ${BISON_PARSER_OUTPUTS}
    main.cpp
)

target_include_directories(score_parser PRIVATE ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR})
set_target_properties(score_parser PROPERTIES CXX_STANDARD 11)