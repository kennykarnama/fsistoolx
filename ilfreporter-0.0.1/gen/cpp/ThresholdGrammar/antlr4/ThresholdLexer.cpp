
// Generated from antlr4/Threshold.g4 by ANTLR 4.13.2


#include "ThresholdLexer.h"


using namespace antlr4;



using namespace antlr4;

namespace {

struct ThresholdLexerStaticData final {
  ThresholdLexerStaticData(std::vector<std::string> ruleNames,
                          std::vector<std::string> channelNames,
                          std::vector<std::string> modeNames,
                          std::vector<std::string> literalNames,
                          std::vector<std::string> symbolicNames)
      : ruleNames(std::move(ruleNames)), channelNames(std::move(channelNames)),
        modeNames(std::move(modeNames)), literalNames(std::move(literalNames)),
        symbolicNames(std::move(symbolicNames)),
        vocabulary(this->literalNames, this->symbolicNames) {}

  ThresholdLexerStaticData(const ThresholdLexerStaticData&) = delete;
  ThresholdLexerStaticData(ThresholdLexerStaticData&&) = delete;
  ThresholdLexerStaticData& operator=(const ThresholdLexerStaticData&) = delete;
  ThresholdLexerStaticData& operator=(ThresholdLexerStaticData&&) = delete;

  std::vector<antlr4::dfa::DFA> decisionToDFA;
  antlr4::atn::PredictionContextCache sharedContextCache;
  const std::vector<std::string> ruleNames;
  const std::vector<std::string> channelNames;
  const std::vector<std::string> modeNames;
  const std::vector<std::string> literalNames;
  const std::vector<std::string> symbolicNames;
  const antlr4::dfa::Vocabulary vocabulary;
  antlr4::atn::SerializedATNView serializedATN;
  std::unique_ptr<antlr4::atn::ATN> atn;
};

::antlr4::internal::OnceFlag thresholdlexerLexerOnceFlag;
#if ANTLR4_USE_THREAD_LOCAL_CACHE
static thread_local
#endif
std::unique_ptr<ThresholdLexerStaticData> thresholdlexerLexerStaticData = nullptr;

void thresholdlexerLexerInitialize() {
#if ANTLR4_USE_THREAD_LOCAL_CACHE
  if (thresholdlexerLexerStaticData != nullptr) {
    return;
  }
#else
  assert(thresholdlexerLexerStaticData == nullptr);
#endif
  auto staticData = std::make_unique<ThresholdLexerStaticData>(
    std::vector<std::string>{
      "T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "INT", "FLOAT", 
      "WS"
    },
    std::vector<std::string>{
      "DEFAULT_TOKEN_CHANNEL", "HIDDEN"
    },
    std::vector<std::string>{
      "DEFAULT_MODE"
    },
    std::vector<std::string>{
      "", "':'", "'x'", "'<'", "'<='", "'>'", "'>='", "'=='"
    },
    std::vector<std::string>{
      "", "", "", "", "", "", "", "", "INT", "FLOAT", "WS"
    }
  );
  static const int32_t serializedATNSegment[] = {
  	4,0,10,61,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
  	6,2,7,7,7,2,8,7,8,2,9,7,9,1,0,1,0,1,1,1,1,1,2,1,2,1,3,1,3,1,3,1,4,1,4,
  	1,5,1,5,1,5,1,6,1,6,1,6,1,7,4,7,40,8,7,11,7,12,7,41,1,8,4,8,45,8,8,11,
  	8,12,8,46,1,8,1,8,4,8,51,8,8,11,8,12,8,52,1,9,4,9,56,8,9,11,9,12,9,57,
  	1,9,1,9,0,0,10,1,1,3,2,5,3,7,4,9,5,11,6,13,7,15,8,17,9,19,10,1,0,2,1,
  	0,48,57,3,0,9,10,13,13,32,32,64,0,1,1,0,0,0,0,3,1,0,0,0,0,5,1,0,0,0,0,
  	7,1,0,0,0,0,9,1,0,0,0,0,11,1,0,0,0,0,13,1,0,0,0,0,15,1,0,0,0,0,17,1,0,
  	0,0,0,19,1,0,0,0,1,21,1,0,0,0,3,23,1,0,0,0,5,25,1,0,0,0,7,27,1,0,0,0,
  	9,30,1,0,0,0,11,32,1,0,0,0,13,35,1,0,0,0,15,39,1,0,0,0,17,44,1,0,0,0,
  	19,55,1,0,0,0,21,22,5,58,0,0,22,2,1,0,0,0,23,24,5,120,0,0,24,4,1,0,0,
  	0,25,26,5,60,0,0,26,6,1,0,0,0,27,28,5,60,0,0,28,29,5,61,0,0,29,8,1,0,
  	0,0,30,31,5,62,0,0,31,10,1,0,0,0,32,33,5,62,0,0,33,34,5,61,0,0,34,12,
  	1,0,0,0,35,36,5,61,0,0,36,37,5,61,0,0,37,14,1,0,0,0,38,40,7,0,0,0,39,
  	38,1,0,0,0,40,41,1,0,0,0,41,39,1,0,0,0,41,42,1,0,0,0,42,16,1,0,0,0,43,
  	45,7,0,0,0,44,43,1,0,0,0,45,46,1,0,0,0,46,44,1,0,0,0,46,47,1,0,0,0,47,
  	48,1,0,0,0,48,50,5,46,0,0,49,51,7,0,0,0,50,49,1,0,0,0,51,52,1,0,0,0,52,
  	50,1,0,0,0,52,53,1,0,0,0,53,18,1,0,0,0,54,56,7,1,0,0,55,54,1,0,0,0,56,
  	57,1,0,0,0,57,55,1,0,0,0,57,58,1,0,0,0,58,59,1,0,0,0,59,60,6,9,0,0,60,
  	20,1,0,0,0,5,0,41,46,52,57,1,6,0,0
  };
  staticData->serializedATN = antlr4::atn::SerializedATNView(serializedATNSegment, sizeof(serializedATNSegment) / sizeof(serializedATNSegment[0]));

  antlr4::atn::ATNDeserializer deserializer;
  staticData->atn = deserializer.deserialize(staticData->serializedATN);

  const size_t count = staticData->atn->getNumberOfDecisions();
  staticData->decisionToDFA.reserve(count);
  for (size_t i = 0; i < count; i++) { 
    staticData->decisionToDFA.emplace_back(staticData->atn->getDecisionState(i), i);
  }
  thresholdlexerLexerStaticData = std::move(staticData);
}

}

ThresholdLexer::ThresholdLexer(CharStream *input) : Lexer(input) {
  ThresholdLexer::initialize();
  _interpreter = new atn::LexerATNSimulator(this, *thresholdlexerLexerStaticData->atn, thresholdlexerLexerStaticData->decisionToDFA, thresholdlexerLexerStaticData->sharedContextCache);
}

ThresholdLexer::~ThresholdLexer() {
  delete _interpreter;
}

std::string ThresholdLexer::getGrammarFileName() const {
  return "Threshold.g4";
}

const std::vector<std::string>& ThresholdLexer::getRuleNames() const {
  return thresholdlexerLexerStaticData->ruleNames;
}

const std::vector<std::string>& ThresholdLexer::getChannelNames() const {
  return thresholdlexerLexerStaticData->channelNames;
}

const std::vector<std::string>& ThresholdLexer::getModeNames() const {
  return thresholdlexerLexerStaticData->modeNames;
}

const dfa::Vocabulary& ThresholdLexer::getVocabulary() const {
  return thresholdlexerLexerStaticData->vocabulary;
}

antlr4::atn::SerializedATNView ThresholdLexer::getSerializedATN() const {
  return thresholdlexerLexerStaticData->serializedATN;
}

const atn::ATN& ThresholdLexer::getATN() const {
  return *thresholdlexerLexerStaticData->atn;
}




void ThresholdLexer::initialize() {
#if ANTLR4_USE_THREAD_LOCAL_CACHE
  thresholdlexerLexerInitialize();
#else
  ::antlr4::internal::call_once(thresholdlexerLexerOnceFlag, thresholdlexerLexerInitialize);
#endif
}
