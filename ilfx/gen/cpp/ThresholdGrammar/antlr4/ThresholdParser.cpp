
// Generated from antlr4/Threshold.g4 by ANTLR 4.13.2


#include "ThresholdVisitor.h"

#include "ThresholdParser.h"


using namespace antlrcpp;

using namespace antlr4;

namespace {

struct ThresholdParserStaticData final {
  ThresholdParserStaticData(std::vector<std::string> ruleNames,
                        std::vector<std::string> literalNames,
                        std::vector<std::string> symbolicNames)
      : ruleNames(std::move(ruleNames)), literalNames(std::move(literalNames)),
        symbolicNames(std::move(symbolicNames)),
        vocabulary(this->literalNames, this->symbolicNames) {}

  ThresholdParserStaticData(const ThresholdParserStaticData&) = delete;
  ThresholdParserStaticData(ThresholdParserStaticData&&) = delete;
  ThresholdParserStaticData& operator=(const ThresholdParserStaticData&) = delete;
  ThresholdParserStaticData& operator=(ThresholdParserStaticData&&) = delete;

  std::vector<antlr4::dfa::DFA> decisionToDFA;
  antlr4::atn::PredictionContextCache sharedContextCache;
  const std::vector<std::string> ruleNames;
  const std::vector<std::string> literalNames;
  const std::vector<std::string> symbolicNames;
  const antlr4::dfa::Vocabulary vocabulary;
  antlr4::atn::SerializedATNView serializedATN;
  std::unique_ptr<antlr4::atn::ATN> atn;
};

::antlr4::internal::OnceFlag thresholdParserOnceFlag;
#if ANTLR4_USE_THREAD_LOCAL_CACHE
static thread_local
#endif
std::unique_ptr<ThresholdParserStaticData> thresholdParserStaticData = nullptr;

void thresholdParserInitialize() {
#if ANTLR4_USE_THREAD_LOCAL_CACHE
  if (thresholdParserStaticData != nullptr) {
    return;
  }
#else
  assert(thresholdParserStaticData == nullptr);
#endif
  auto staticData = std::make_unique<ThresholdParserStaticData>(
    std::vector<std::string>{
      "ruleFile", "ruleDecl", "rating", "expr", "value", "op"
    },
    std::vector<std::string>{
      "", "':'", "'x'", "'<'", "'<='", "'>'", "'>='", "'=='"
    },
    std::vector<std::string>{
      "", "", "", "", "", "", "", "", "INT", "FLOAT", "WS"
    }
  );
  static const int32_t serializedATNSegment[] = {
  	4,1,10,37,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,1,0,1,0,1,0,
  	1,1,1,1,1,1,1,1,1,2,1,2,1,3,1,3,1,3,1,3,1,3,1,3,5,3,28,8,3,10,3,12,3,
  	31,9,3,1,4,1,4,1,5,1,5,1,5,0,0,6,0,2,4,6,8,10,0,2,2,0,2,2,8,9,1,0,3,7,
  	31,0,12,1,0,0,0,2,15,1,0,0,0,4,19,1,0,0,0,6,21,1,0,0,0,8,32,1,0,0,0,10,
  	34,1,0,0,0,12,13,3,2,1,0,13,14,5,0,0,1,14,1,1,0,0,0,15,16,3,4,2,0,16,
  	17,5,1,0,0,17,18,3,6,3,0,18,3,1,0,0,0,19,20,5,8,0,0,20,5,1,0,0,0,21,22,
  	3,8,4,0,22,23,3,10,5,0,23,29,3,8,4,0,24,25,3,10,5,0,25,26,3,8,4,0,26,
  	28,1,0,0,0,27,24,1,0,0,0,28,31,1,0,0,0,29,27,1,0,0,0,29,30,1,0,0,0,30,
  	7,1,0,0,0,31,29,1,0,0,0,32,33,7,0,0,0,33,9,1,0,0,0,34,35,7,1,0,0,35,11,
  	1,0,0,0,1,29
  };
  staticData->serializedATN = antlr4::atn::SerializedATNView(serializedATNSegment, sizeof(serializedATNSegment) / sizeof(serializedATNSegment[0]));

  antlr4::atn::ATNDeserializer deserializer;
  staticData->atn = deserializer.deserialize(staticData->serializedATN);

  const size_t count = staticData->atn->getNumberOfDecisions();
  staticData->decisionToDFA.reserve(count);
  for (size_t i = 0; i < count; i++) { 
    staticData->decisionToDFA.emplace_back(staticData->atn->getDecisionState(i), i);
  }
  thresholdParserStaticData = std::move(staticData);
}

}

ThresholdParser::ThresholdParser(TokenStream *input) : ThresholdParser(input, antlr4::atn::ParserATNSimulatorOptions()) {}

ThresholdParser::ThresholdParser(TokenStream *input, const antlr4::atn::ParserATNSimulatorOptions &options) : Parser(input) {
  ThresholdParser::initialize();
  _interpreter = new atn::ParserATNSimulator(this, *thresholdParserStaticData->atn, thresholdParserStaticData->decisionToDFA, thresholdParserStaticData->sharedContextCache, options);
}

ThresholdParser::~ThresholdParser() {
  delete _interpreter;
}

const atn::ATN& ThresholdParser::getATN() const {
  return *thresholdParserStaticData->atn;
}

std::string ThresholdParser::getGrammarFileName() const {
  return "Threshold.g4";
}

const std::vector<std::string>& ThresholdParser::getRuleNames() const {
  return thresholdParserStaticData->ruleNames;
}

const dfa::Vocabulary& ThresholdParser::getVocabulary() const {
  return thresholdParserStaticData->vocabulary;
}

antlr4::atn::SerializedATNView ThresholdParser::getSerializedATN() const {
  return thresholdParserStaticData->serializedATN;
}


//----------------- RuleFileContext ------------------------------------------------------------------

ThresholdParser::RuleFileContext::RuleFileContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

ThresholdParser::RuleDeclContext* ThresholdParser::RuleFileContext::ruleDecl() {
  return getRuleContext<ThresholdParser::RuleDeclContext>(0);
}

tree::TerminalNode* ThresholdParser::RuleFileContext::EOF() {
  return getToken(ThresholdParser::EOF, 0);
}


size_t ThresholdParser::RuleFileContext::getRuleIndex() const {
  return ThresholdParser::RuleRuleFile;
}


std::any ThresholdParser::RuleFileContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<ThresholdVisitor*>(visitor))
    return parserVisitor->visitRuleFile(this);
  else
    return visitor->visitChildren(this);
}

ThresholdParser::RuleFileContext* ThresholdParser::ruleFile() {
  RuleFileContext *_localctx = _tracker.createInstance<RuleFileContext>(_ctx, getState());
  enterRule(_localctx, 0, ThresholdParser::RuleRuleFile);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(12);
    ruleDecl();
    setState(13);
    match(ThresholdParser::EOF);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- RuleDeclContext ------------------------------------------------------------------

ThresholdParser::RuleDeclContext::RuleDeclContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

ThresholdParser::RatingContext* ThresholdParser::RuleDeclContext::rating() {
  return getRuleContext<ThresholdParser::RatingContext>(0);
}

ThresholdParser::ExprContext* ThresholdParser::RuleDeclContext::expr() {
  return getRuleContext<ThresholdParser::ExprContext>(0);
}


size_t ThresholdParser::RuleDeclContext::getRuleIndex() const {
  return ThresholdParser::RuleRuleDecl;
}


std::any ThresholdParser::RuleDeclContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<ThresholdVisitor*>(visitor))
    return parserVisitor->visitRuleDecl(this);
  else
    return visitor->visitChildren(this);
}

ThresholdParser::RuleDeclContext* ThresholdParser::ruleDecl() {
  RuleDeclContext *_localctx = _tracker.createInstance<RuleDeclContext>(_ctx, getState());
  enterRule(_localctx, 2, ThresholdParser::RuleRuleDecl);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(15);
    rating();
    setState(16);
    match(ThresholdParser::T__0);
    setState(17);
    expr();
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- RatingContext ------------------------------------------------------------------

ThresholdParser::RatingContext::RatingContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* ThresholdParser::RatingContext::INT() {
  return getToken(ThresholdParser::INT, 0);
}


size_t ThresholdParser::RatingContext::getRuleIndex() const {
  return ThresholdParser::RuleRating;
}


std::any ThresholdParser::RatingContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<ThresholdVisitor*>(visitor))
    return parserVisitor->visitRating(this);
  else
    return visitor->visitChildren(this);
}

ThresholdParser::RatingContext* ThresholdParser::rating() {
  RatingContext *_localctx = _tracker.createInstance<RatingContext>(_ctx, getState());
  enterRule(_localctx, 4, ThresholdParser::RuleRating);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(19);
    match(ThresholdParser::INT);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ExprContext ------------------------------------------------------------------

ThresholdParser::ExprContext::ExprContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

std::vector<ThresholdParser::ValueContext *> ThresholdParser::ExprContext::value() {
  return getRuleContexts<ThresholdParser::ValueContext>();
}

ThresholdParser::ValueContext* ThresholdParser::ExprContext::value(size_t i) {
  return getRuleContext<ThresholdParser::ValueContext>(i);
}

std::vector<ThresholdParser::OpContext *> ThresholdParser::ExprContext::op() {
  return getRuleContexts<ThresholdParser::OpContext>();
}

ThresholdParser::OpContext* ThresholdParser::ExprContext::op(size_t i) {
  return getRuleContext<ThresholdParser::OpContext>(i);
}


size_t ThresholdParser::ExprContext::getRuleIndex() const {
  return ThresholdParser::RuleExpr;
}


std::any ThresholdParser::ExprContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<ThresholdVisitor*>(visitor))
    return parserVisitor->visitExpr(this);
  else
    return visitor->visitChildren(this);
}

ThresholdParser::ExprContext* ThresholdParser::expr() {
  ExprContext *_localctx = _tracker.createInstance<ExprContext>(_ctx, getState());
  enterRule(_localctx, 6, ThresholdParser::RuleExpr);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(21);
    value();
    setState(22);
    op();
    setState(23);
    value();
    setState(29);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while ((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & 248) != 0)) {
      setState(24);
      op();
      setState(25);
      value();
      setState(31);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ValueContext ------------------------------------------------------------------

ThresholdParser::ValueContext::ValueContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* ThresholdParser::ValueContext::INT() {
  return getToken(ThresholdParser::INT, 0);
}

tree::TerminalNode* ThresholdParser::ValueContext::FLOAT() {
  return getToken(ThresholdParser::FLOAT, 0);
}


size_t ThresholdParser::ValueContext::getRuleIndex() const {
  return ThresholdParser::RuleValue;
}


std::any ThresholdParser::ValueContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<ThresholdVisitor*>(visitor))
    return parserVisitor->visitValue(this);
  else
    return visitor->visitChildren(this);
}

ThresholdParser::ValueContext* ThresholdParser::value() {
  ValueContext *_localctx = _tracker.createInstance<ValueContext>(_ctx, getState());
  enterRule(_localctx, 8, ThresholdParser::RuleValue);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(32);
    _la = _input->LA(1);
    if (!((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & 772) != 0))) {
    _errHandler->recoverInline(this);
    }
    else {
      _errHandler->reportMatch(this);
      consume();
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- OpContext ------------------------------------------------------------------

ThresholdParser::OpContext::OpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t ThresholdParser::OpContext::getRuleIndex() const {
  return ThresholdParser::RuleOp;
}


std::any ThresholdParser::OpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<ThresholdVisitor*>(visitor))
    return parserVisitor->visitOp(this);
  else
    return visitor->visitChildren(this);
}

ThresholdParser::OpContext* ThresholdParser::op() {
  OpContext *_localctx = _tracker.createInstance<OpContext>(_ctx, getState());
  enterRule(_localctx, 10, ThresholdParser::RuleOp);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(34);
    _la = _input->LA(1);
    if (!((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & 248) != 0))) {
    _errHandler->recoverInline(this);
    }
    else {
      _errHandler->reportMatch(this);
      consume();
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

void ThresholdParser::initialize() {
#if ANTLR4_USE_THREAD_LOCAL_CACHE
  thresholdParserInitialize();
#else
  ::antlr4::internal::call_once(thresholdParserOnceFlag, thresholdParserInitialize);
#endif
}
