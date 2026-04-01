-- Generated UPDATE statements for kpmr_risk_profile_edge
-- Generated from kpmr_riskpro.xml

BEGIN;

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var child_0 = findConsolidateByCode("SK11001000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK11000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK11000000"), r);
      return s;
$$,
    rating_rule = $$
var child_0 = findConsolidateByCode("SK11001000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK11000000"), consolidateValue);
      return r;
$$,
    value_rule = $$
var child_0 = findConsolidateByCode("SK11001000");
      var consolidateValue = (child_0) / 1;
      return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11000000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK11001001");
          var r1 = ratingByThreshold(thresholdByCode("RK11000000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK11000000"), r1);
          var w1 = weightByCode("RK11001001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK11001002");
          var r2 = ratingByThreshold(thresholdByCode("RK11000000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK11000000"), r2);
          var w2 = weightByCode("RK11001002");
          var sxb2 = s2 * w2 * 1.0;
          
          var total = sxb1 + sxb2;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK11001001");
          var r1 = ratingByThreshold(thresholdByCode("RK11000000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK11000000"), r1);
          var w1 = weightByCode("RK11001001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK11001002");
          var r2 = ratingByThreshold(thresholdByCode("RK11000000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK11000000"), r2);
          var w2 = weightByCode("RK11001002");
          var sxb2 = s2 * w2 * 1.0;
          
          var total = sxb1 + sxb2;
          var r = ratingByThreshold(thresholdByCode("RK11000000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11001000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK11001001");
              var r = ratingByThreshold(thresholdByCode("RK11000000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK11000000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK11001001");
              var r = ratingByThreshold(thresholdByCode("RK11000000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK11001001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11001001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK11001002");
              var r = ratingByThreshold(thresholdByCode("RK11001002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK11001002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK11001002");
              var r = ratingByThreshold(thresholdByCode("RK11001002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK11001002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11001002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK11003001");
          var r1 = ratingByThreshold(thresholdByCode("RK11003000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK11003000"), r1);
          var w1 = weightByCode("RK11003001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK11003002");
          var r2 = ratingByThreshold(thresholdByCode("RK11003000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK11003000"), r2);
          var w2 = weightByCode("RK11003002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK11003003");
          var r3 = ratingByThreshold(thresholdByCode("RK11003000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK11003000"), r3);
          var w3 = weightByCode("RK11003003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK11003001");
          var r1 = ratingByThreshold(thresholdByCode("RK11003000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK11003000"), r1);
          var w1 = weightByCode("RK11003001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK11003002");
          var r2 = ratingByThreshold(thresholdByCode("RK11003000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK11003000"), r2);
          var w2 = weightByCode("RK11003002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK11003003");
          var r3 = ratingByThreshold(thresholdByCode("RK11003000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK11003000"), r3);
          var w3 = weightByCode("RK11003003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          var r = ratingByThreshold(thresholdByCode("RK11003000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11003000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK11003002");
              var r = ratingByThreshold(thresholdByCode("RK11003000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK11003000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK11003002");
              var r = ratingByThreshold(thresholdByCode("RK11003000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK11003002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11003001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK11003003");
              var r = ratingByThreshold(thresholdByCode("RK11003002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK11003002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK11003003");
              var r = ratingByThreshold(thresholdByCode("RK11003002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK11003003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11003002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK11003003");
      var r = ratingByThreshold(thresholdByCode("RK11003003"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK11003003"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK11003003");
      var r = ratingByThreshold(thresholdByCode("RK11003003"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11003003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK11004001");
          var r1 = ratingByThreshold(thresholdByCode("RK11004000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK11004000"), r1);
          var w1 = weightByCode("RK11004001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK11004002");
          var r2 = ratingByThreshold(thresholdByCode("RK11004000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK11004000"), r2);
          var w2 = weightByCode("RK11004002");
          var sxb2 = s2 * w2 * 1.0;
          
          var total = sxb1 + sxb2;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK11004001");
          var r1 = ratingByThreshold(thresholdByCode("RK11004000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK11004000"), r1);
          var w1 = weightByCode("RK11004001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK11004002");
          var r2 = ratingByThreshold(thresholdByCode("RK11004000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK11004000"), r2);
          var w2 = weightByCode("RK11004002");
          var sxb2 = s2 * w2 * 1.0;
          
          var total = sxb1 + sxb2;
          var r = ratingByThreshold(thresholdByCode("RK11004000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11004000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK11004002");
              var r = ratingByThreshold(thresholdByCode("RK11004000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK11004000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK11004002");
              var r = ratingByThreshold(thresholdByCode("RK11004000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK11004002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11004001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK11004002");
      var r = ratingByThreshold(thresholdByCode("RK11004002"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK11004002"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK11004002");
      var r = ratingByThreshold(thresholdByCode("RK11004002"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11004002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK11002001");
          var r1 = ratingByThreshold(thresholdByCode("RK11002000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK11002000"), r1);
          var w1 = weightByCode("RK11002001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK11002002");
          var r2 = ratingByThreshold(thresholdByCode("RK11002000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK11002000"), r2);
          var w2 = weightByCode("RK11002002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK11002003");
          var r3 = ratingByThreshold(thresholdByCode("RK11002000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK11002000"), r3);
          var w3 = weightByCode("RK11002003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK11002001");
          var r1 = ratingByThreshold(thresholdByCode("RK11002000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK11002000"), r1);
          var w1 = weightByCode("RK11002001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK11002002");
          var r2 = ratingByThreshold(thresholdByCode("RK11002000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK11002000"), r2);
          var w2 = weightByCode("RK11002002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK11002003");
          var r3 = ratingByThreshold(thresholdByCode("RK11002000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK11002000"), r3);
          var w3 = weightByCode("RK11002003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          var r = ratingByThreshold(thresholdByCode("RK11002000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11002000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK11002002");
              var r = ratingByThreshold(thresholdByCode("RK11002000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK11002000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK11002002");
              var r = ratingByThreshold(thresholdByCode("RK11002000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK11002002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11002001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK11002003");
              var r = ratingByThreshold(thresholdByCode("RK11002002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK11002002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK11002003");
              var r = ratingByThreshold(thresholdByCode("RK11002002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK11002003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11002002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK11002003");
              var r = ratingByThreshold(thresholdByCode("RK11002003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK11002003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK11002003");
              var r = ratingByThreshold(thresholdByCode("RK11002003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK11002003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK11002003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var child_0 = findConsolidateByCode("SK07002000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK07000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK07000000"), r);
      return s;
$$,
    rating_rule = $$
var child_0 = findConsolidateByCode("SK07002000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK07000000"), consolidateValue);
      return r;
$$,
    value_rule = $$
var child_0 = findConsolidateByCode("SK07002000");
      var consolidateValue = (child_0) / 1;
      return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07000000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07002000");
      var r = ratingByThreshold(thresholdByCode("RK07000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK07000000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07002000");
      var r = ratingByThreshold(thresholdByCode("RK07000000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07002000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07002001");
              var r = ratingByThreshold(thresholdByCode("RK07000000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07000000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07002001");
              var r = ratingByThreshold(thresholdByCode("RK07000000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07002001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07002001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07002002");
              var r = ratingByThreshold(thresholdByCode("RK07002002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07002002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07002002");
              var r = ratingByThreshold(thresholdByCode("RK07002002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07002002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07002002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07002003");
              var r = ratingByThreshold(thresholdByCode("RK07002003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07002003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07002003");
              var r = ratingByThreshold(thresholdByCode("RK07002003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07002003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07002003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07003000");
      var r = ratingByThreshold(thresholdByCode("RK07003000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK07003000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07003000");
      var r = ratingByThreshold(thresholdByCode("RK07003000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07003000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07003001");
              var r = ratingByThreshold(thresholdByCode("RK07003000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07003000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07003001");
              var r = ratingByThreshold(thresholdByCode("RK07003000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07003001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07003001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07003002");
              var r = ratingByThreshold(thresholdByCode("RK07003002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07003002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07003002");
              var r = ratingByThreshold(thresholdByCode("RK07003002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07003002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07003002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07003003");
              var r = ratingByThreshold(thresholdByCode("RK07003003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07003003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07003003");
              var r = ratingByThreshold(thresholdByCode("RK07003003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07003003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07003003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07004000");
      var r = ratingByThreshold(thresholdByCode("RK07004000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK07004000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07004000");
      var r = ratingByThreshold(thresholdByCode("RK07004000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07004000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07004001");
              var r = ratingByThreshold(thresholdByCode("RK07004000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07004000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07004001");
              var r = ratingByThreshold(thresholdByCode("RK07004000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07004001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07004001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07004002");
              var r = ratingByThreshold(thresholdByCode("RK07004002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07004002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07004002");
              var r = ratingByThreshold(thresholdByCode("RK07004002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07004002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07004002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07004004");
              var r = ratingByThreshold(thresholdByCode("RK07004004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07004004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07004004");
              var r = ratingByThreshold(thresholdByCode("RK07004004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07004004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07004004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07004003");
              var r = ratingByThreshold(thresholdByCode("RK07004003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07004003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07004003");
              var r = ratingByThreshold(thresholdByCode("RK07004003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07004003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07004003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07001000");
      var r = ratingByThreshold(thresholdByCode("RK07001000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK07001000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07001000");
      var r = ratingByThreshold(thresholdByCode("RK07001000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07001000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07001003");
              var r = ratingByThreshold(thresholdByCode("RK07001000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07001000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07001003");
              var r = ratingByThreshold(thresholdByCode("RK07001000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07001003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07001003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07001004");
              var r = ratingByThreshold(thresholdByCode("RK07001004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07001004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07001004");
              var r = ratingByThreshold(thresholdByCode("RK07001004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07001004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07001004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07001001");
              var r = ratingByThreshold(thresholdByCode("RK07001001"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07001001"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07001001");
              var r = ratingByThreshold(thresholdByCode("RK07001001"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07001001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07001001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK07001002");
              var r = ratingByThreshold(thresholdByCode("RK07001002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK07001002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK07001002");
              var r = ratingByThreshold(thresholdByCode("RK07001002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK07001002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK07001002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var child_0 = findConsolidateByCode("SK01001000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK01000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK01000000"), r);
      return s;
$$,
    rating_rule = $$
var child_0 = findConsolidateByCode("SK01001000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK01000000"), consolidateValue);
      return r;
$$,
    value_rule = $$
var child_0 = findConsolidateByCode("SK01001000");
      var consolidateValue = (child_0) / 1;
      return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01000000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01001000");
      var r = ratingByThreshold(thresholdByCode("RK01000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK01000000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01001000");
      var r = ratingByThreshold(thresholdByCode("RK01000000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01001000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01001001");
              var r = ratingByThreshold(thresholdByCode("RK01000000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01000000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01001001");
              var r = ratingByThreshold(thresholdByCode("RK01000000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01001001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01001001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01001002");
              var r = ratingByThreshold(thresholdByCode("RK01001002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01001002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01001002");
              var r = ratingByThreshold(thresholdByCode("RK01001002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01001002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01001002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01001003");
              var r = ratingByThreshold(thresholdByCode("RK01001003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01001003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01001003");
              var r = ratingByThreshold(thresholdByCode("RK01001003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01001003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01001003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01001004");
              var r = ratingByThreshold(thresholdByCode("RK01001004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01001004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01001004");
              var r = ratingByThreshold(thresholdByCode("RK01001004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01001004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01001004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01002000");
      var r = ratingByThreshold(thresholdByCode("RK01002000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK01002000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01002000");
      var r = ratingByThreshold(thresholdByCode("RK01002000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01002000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01002002");
              var r = ratingByThreshold(thresholdByCode("RK01002000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01002000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01002002");
              var r = ratingByThreshold(thresholdByCode("RK01002000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01002002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01002002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01002001");
              var r = ratingByThreshold(thresholdByCode("RK01002001"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01002001"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01002001");
              var r = ratingByThreshold(thresholdByCode("RK01002001"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01002001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01002001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01002003");
              var r = ratingByThreshold(thresholdByCode("RK01002003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01002003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01002003");
              var r = ratingByThreshold(thresholdByCode("RK01002003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01002003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01002003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01003000");
      var r = ratingByThreshold(thresholdByCode("RK01003000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK01003000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01003000");
      var r = ratingByThreshold(thresholdByCode("RK01003000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01003000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01003001");
              var r = ratingByThreshold(thresholdByCode("RK01003000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01003000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01003001");
              var r = ratingByThreshold(thresholdByCode("RK01003000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01003001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01003001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01003002");
              var r = ratingByThreshold(thresholdByCode("RK01003002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01003002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01003002");
              var r = ratingByThreshold(thresholdByCode("RK01003002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01003002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01003002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01003003");
              var r = ratingByThreshold(thresholdByCode("RK01003003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01003003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01003003");
              var r = ratingByThreshold(thresholdByCode("RK01003003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01003003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01003003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01003004");
              var r = ratingByThreshold(thresholdByCode("RK01003004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01003004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01003004");
              var r = ratingByThreshold(thresholdByCode("RK01003004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01003004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01003004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01003005");
              var r = ratingByThreshold(thresholdByCode("RK01003005"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01003005"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01003005");
              var r = ratingByThreshold(thresholdByCode("RK01003005"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01003005");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01003005';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01004000");
      var r = ratingByThreshold(thresholdByCode("RK01004000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK01004000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01004000");
      var r = ratingByThreshold(thresholdByCode("RK01004000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01004000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01004004");
              var r = ratingByThreshold(thresholdByCode("RK01004000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01004000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01004004");
              var r = ratingByThreshold(thresholdByCode("RK01004000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01004004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01004004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01004001");
              var r = ratingByThreshold(thresholdByCode("RK01004001"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01004001"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01004001");
              var r = ratingByThreshold(thresholdByCode("RK01004001"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01004001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01004001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01004002");
              var r = ratingByThreshold(thresholdByCode("RK01004002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01004002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01004002");
              var r = ratingByThreshold(thresholdByCode("RK01004002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01004002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01004002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK01004003");
              var r = ratingByThreshold(thresholdByCode("RK01004003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK01004003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK01004003");
              var r = ratingByThreshold(thresholdByCode("RK01004003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK01004003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK01004003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var child_0 = findConsolidateByCode("SK02001000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK02000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK02000000"), r);
      return s;
$$,
    rating_rule = $$
var child_0 = findConsolidateByCode("SK02001000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK02000000"), consolidateValue);
      return r;
$$,
    value_rule = $$
var child_0 = findConsolidateByCode("SK02001000");
      var consolidateValue = (child_0) / 1;
      return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02000000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02001000");
      var r = ratingByThreshold(thresholdByCode("RK02000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK02000000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02001000");
      var r = ratingByThreshold(thresholdByCode("RK02000000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02001000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02001001");
              var r = ratingByThreshold(thresholdByCode("RK02000000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02000000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02001001");
              var r = ratingByThreshold(thresholdByCode("RK02000000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02001001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02001001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02001002");
              var r = ratingByThreshold(thresholdByCode("RK02001002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02001002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02001002");
              var r = ratingByThreshold(thresholdByCode("RK02001002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02001002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02001002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02001003");
              var r = ratingByThreshold(thresholdByCode("RK02001003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02001003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02001003");
              var r = ratingByThreshold(thresholdByCode("RK02001003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02001003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02001003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02001004");
              var r = ratingByThreshold(thresholdByCode("RK02001004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02001004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02001004");
              var r = ratingByThreshold(thresholdByCode("RK02001004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02001004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02001004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02003000");
      var r = ratingByThreshold(thresholdByCode("RK02003000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK02003000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02003000");
      var r = ratingByThreshold(thresholdByCode("RK02003000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02003000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02003001");
              var r = ratingByThreshold(thresholdByCode("RK02003000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02003000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02003001");
              var r = ratingByThreshold(thresholdByCode("RK02003000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02003001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02003001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02003002");
              var r = ratingByThreshold(thresholdByCode("RK02003002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02003002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02003002");
              var r = ratingByThreshold(thresholdByCode("RK02003002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02003002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02003002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02003003");
              var r = ratingByThreshold(thresholdByCode("RK02003003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02003003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02003003");
              var r = ratingByThreshold(thresholdByCode("RK02003003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02003003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02003003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02004000");
      var r = ratingByThreshold(thresholdByCode("RK02004000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK02004000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02004000");
      var r = ratingByThreshold(thresholdByCode("RK02004000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02004000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02004001");
              var r = ratingByThreshold(thresholdByCode("RK02004000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02004000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02004001");
              var r = ratingByThreshold(thresholdByCode("RK02004000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02004001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02004001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02004002");
              var r = ratingByThreshold(thresholdByCode("RK02004002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02004002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02004002");
              var r = ratingByThreshold(thresholdByCode("RK02004002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02004002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02004002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02004003");
              var r = ratingByThreshold(thresholdByCode("RK02004003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02004003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02004003");
              var r = ratingByThreshold(thresholdByCode("RK02004003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02004003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02004003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02004004");
              var r = ratingByThreshold(thresholdByCode("RK02004004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02004004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02004004");
              var r = ratingByThreshold(thresholdByCode("RK02004004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02004004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02004004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02002000");
      var r = ratingByThreshold(thresholdByCode("RK02002000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK02002000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02002000");
      var r = ratingByThreshold(thresholdByCode("RK02002000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02002000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02002003");
              var r = ratingByThreshold(thresholdByCode("RK02002000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02002000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02002003");
              var r = ratingByThreshold(thresholdByCode("RK02002000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02002003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02002003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02002001");
              var r = ratingByThreshold(thresholdByCode("RK02002001"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02002001"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02002001");
              var r = ratingByThreshold(thresholdByCode("RK02002001"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02002001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02002001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK02002002");
              var r = ratingByThreshold(thresholdByCode("RK02002002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK02002002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK02002002");
              var r = ratingByThreshold(thresholdByCode("RK02002002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK02002002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK02002002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var child_0 = findConsolidateByCode("SK04001000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK04000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK04000000"), r);
      return s;
$$,
    rating_rule = $$
var child_0 = findConsolidateByCode("SK04001000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK04000000"), consolidateValue);
      return r;
$$,
    value_rule = $$
var child_0 = findConsolidateByCode("SK04001000");
      var consolidateValue = (child_0) / 1;
      return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04000000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04001000");
      var r = ratingByThreshold(thresholdByCode("RK04000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK04000000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04001000");
      var r = ratingByThreshold(thresholdByCode("RK04000000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04001000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04001001");
              var r = ratingByThreshold(thresholdByCode("RK04000000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04000000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04001001");
              var r = ratingByThreshold(thresholdByCode("RK04000000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04001001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04001001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04001002");
              var r = ratingByThreshold(thresholdByCode("RK04001002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04001002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04001002");
              var r = ratingByThreshold(thresholdByCode("RK04001002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04001002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04001002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04001003");
              var r = ratingByThreshold(thresholdByCode("RK04001003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04001003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04001003");
              var r = ratingByThreshold(thresholdByCode("RK04001003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04001003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04001003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04001004");
              var r = ratingByThreshold(thresholdByCode("RK04001004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04001004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04001004");
              var r = ratingByThreshold(thresholdByCode("RK04001004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04001004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04001004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04003000");
      var r = ratingByThreshold(thresholdByCode("RK04003000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK04003000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04003000");
      var r = ratingByThreshold(thresholdByCode("RK04003000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04003000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04003001");
              var r = ratingByThreshold(thresholdByCode("RK04003000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04003000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04003001");
              var r = ratingByThreshold(thresholdByCode("RK04003000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04003001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04003001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04003002");
              var r = ratingByThreshold(thresholdByCode("RK04003002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04003002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04003002");
              var r = ratingByThreshold(thresholdByCode("RK04003002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04003002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04003002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04003003");
              var r = ratingByThreshold(thresholdByCode("RK04003003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04003003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04003003");
              var r = ratingByThreshold(thresholdByCode("RK04003003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04003003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04003003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04003004");
              var r = ratingByThreshold(thresholdByCode("RK04003004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04003004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04003004");
              var r = ratingByThreshold(thresholdByCode("RK04003004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04003004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04003004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04004000");
      var r = ratingByThreshold(thresholdByCode("RK04004000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK04004000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04004000");
      var r = ratingByThreshold(thresholdByCode("RK04004000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04004000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04004001");
              var r = ratingByThreshold(thresholdByCode("RK04004000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04004000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04004001");
              var r = ratingByThreshold(thresholdByCode("RK04004000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04004001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04004001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04004002");
              var r = ratingByThreshold(thresholdByCode("RK04004002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04004002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04004002");
              var r = ratingByThreshold(thresholdByCode("RK04004002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04004002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04004002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04004003");
              var r = ratingByThreshold(thresholdByCode("RK04004003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04004003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04004003");
              var r = ratingByThreshold(thresholdByCode("RK04004003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04004003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04004003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04004004");
              var r = ratingByThreshold(thresholdByCode("RK04004004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04004004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04004004");
              var r = ratingByThreshold(thresholdByCode("RK04004004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04004004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04004004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04002000");
      var r = ratingByThreshold(thresholdByCode("RK04002000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK04002000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04002000");
      var r = ratingByThreshold(thresholdByCode("RK04002000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04002000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04002001");
              var r = ratingByThreshold(thresholdByCode("RK04002000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04002000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04002001");
              var r = ratingByThreshold(thresholdByCode("RK04002000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04002001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04002001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04002002");
              var r = ratingByThreshold(thresholdByCode("RK04002002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04002002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04002002");
              var r = ratingByThreshold(thresholdByCode("RK04002002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04002002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04002002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK04002003");
              var r = ratingByThreshold(thresholdByCode("RK04002003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK04002003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK04002003");
              var r = ratingByThreshold(thresholdByCode("RK04002003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK04002003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK04002003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var child_0 = findConsolidateByCode("SK05004000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK05000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK05000000"), r);
      return s;
$$,
    rating_rule = $$
var child_0 = findConsolidateByCode("SK05004000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK05000000"), consolidateValue);
      return r;
$$,
    value_rule = $$
var child_0 = findConsolidateByCode("SK05004000");
      var consolidateValue = (child_0) / 1;
      return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK05000000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK05004001");
          var r1 = ratingByThreshold(thresholdByCode("RK05000000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK05000000"), r1);
          var w1 = weightByCode("RK05004001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK05004002");
          var r2 = ratingByThreshold(thresholdByCode("RK05000000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK05000000"), r2);
          var w2 = weightByCode("RK05004002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK05004003");
          var r3 = ratingByThreshold(thresholdByCode("RK05000000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK05000000"), r3);
          var w3 = weightByCode("RK05004003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK05004004");
          var r4 = ratingByThreshold(thresholdByCode("RK05000000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK05000000"), r4);
          var w4 = weightByCode("RK05004004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK05004001");
          var r1 = ratingByThreshold(thresholdByCode("RK05000000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK05000000"), r1);
          var w1 = weightByCode("RK05004001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK05004002");
          var r2 = ratingByThreshold(thresholdByCode("RK05000000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK05000000"), r2);
          var w2 = weightByCode("RK05004002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK05004003");
          var r3 = ratingByThreshold(thresholdByCode("RK05000000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK05000000"), r3);
          var w3 = weightByCode("RK05004003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK05004004");
          var r4 = ratingByThreshold(thresholdByCode("RK05000000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK05000000"), r4);
          var w4 = weightByCode("RK05004004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          var r = ratingByThreshold(thresholdByCode("RK05000000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK05004000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05004001");
              
              var r = ratingByThreshold(thresholdByCode("RK05000000"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05000000"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05004001");
              
              var r = ratingByThreshold(thresholdByCode("RK05000000"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05004001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05004001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05004002");
              
              var r = ratingByThreshold(thresholdByCode("RK05004002"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05004002"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05004002");
              
              var r = ratingByThreshold(thresholdByCode("RK05004002"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05004002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05004002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05004003");
              
              var r = ratingByThreshold(thresholdByCode("RK05004003"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05004003"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05004003");
              
              var r = ratingByThreshold(thresholdByCode("RK05004003"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05004003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05004003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05004004");
              
              var r = ratingByThreshold(thresholdByCode("RK05004004"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05004004"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05004004");
              
              var r = ratingByThreshold(thresholdByCode("RK05004004"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05004004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05004004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK05002001");
          var r1 = ratingByThreshold(thresholdByCode("RK05002000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK05002000"), r1);
          var w1 = weightByCode("RK05002001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK05002002");
          var r2 = ratingByThreshold(thresholdByCode("RK05002000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK05002000"), r2);
          var w2 = weightByCode("RK05002002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK05002003");
          var r3 = ratingByThreshold(thresholdByCode("RK05002000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK05002000"), r3);
          var w3 = weightByCode("RK05002003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK05002001");
          var r1 = ratingByThreshold(thresholdByCode("RK05002000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK05002000"), r1);
          var w1 = weightByCode("RK05002001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK05002002");
          var r2 = ratingByThreshold(thresholdByCode("RK05002000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK05002000"), r2);
          var w2 = weightByCode("RK05002002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK05002003");
          var r3 = ratingByThreshold(thresholdByCode("RK05002000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK05002000"), r3);
          var w3 = weightByCode("RK05002003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          var r = ratingByThreshold(thresholdByCode("RK05002000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK05002000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05002001");
              
              var r = ratingByThreshold(thresholdByCode("RK05002000"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05002000"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05002001");
              
              var r = ratingByThreshold(thresholdByCode("RK05002000"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05002001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05002001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05002002");
              
              var r = ratingByThreshold(thresholdByCode("RK05002002"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05002002"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05002002");
              
              var r = ratingByThreshold(thresholdByCode("RK05002002"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05002002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05002002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05002003");
              
              var r = ratingByThreshold(thresholdByCode("RK05002003"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05002003"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05002003");
              
              var r = ratingByThreshold(thresholdByCode("RK05002003"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05002003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05002003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK05001001");
          var r1 = ratingByThreshold(thresholdByCode("RK05001000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK05001000"), r1);
          var w1 = weightByCode("RK05001001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK05001002");
          var r2 = ratingByThreshold(thresholdByCode("RK05001000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK05001000"), r2);
          var w2 = weightByCode("RK05001002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK05001003");
          var r3 = ratingByThreshold(thresholdByCode("RK05001000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK05001000"), r3);
          var w3 = weightByCode("RK05001003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK05001004");
          var r4 = ratingByThreshold(thresholdByCode("RK05001000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK05001000"), r4);
          var w4 = weightByCode("RK05001004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK05001001");
          var r1 = ratingByThreshold(thresholdByCode("RK05001000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK05001000"), r1);
          var w1 = weightByCode("RK05001001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK05001002");
          var r2 = ratingByThreshold(thresholdByCode("RK05001000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK05001000"), r2);
          var w2 = weightByCode("RK05001002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK05001003");
          var r3 = ratingByThreshold(thresholdByCode("RK05001000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK05001000"), r3);
          var w3 = weightByCode("RK05001003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK05001004");
          var r4 = ratingByThreshold(thresholdByCode("RK05001000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK05001000"), r4);
          var w4 = weightByCode("RK05001004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          var r = ratingByThreshold(thresholdByCode("RK05001000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK05001000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05001004");
              
              var r = ratingByThreshold(thresholdByCode("RK05001000"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05001000"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05001004");
              
              var r = ratingByThreshold(thresholdByCode("RK05001000"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05001004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05001004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05001001");
              
              var r = ratingByThreshold(thresholdByCode("RK05001001"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05001001"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05001001");
              
              var r = ratingByThreshold(thresholdByCode("RK05001001"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05001001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05001001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05001002");
              
              var r = ratingByThreshold(thresholdByCode("RK05001002"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05001002"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05001002");
              
              var r = ratingByThreshold(thresholdByCode("RK05001002"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05001002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05001002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05001003");
              
              var r = ratingByThreshold(thresholdByCode("RK05001003"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05001003"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05001003");
              
              var r = ratingByThreshold(thresholdByCode("RK05001003"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05001003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05001003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK05003001");
          var r1 = ratingByThreshold(thresholdByCode("RK05003000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK05003000"), r1);
          var w1 = weightByCode("RK05003001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK05003002");
          var r2 = ratingByThreshold(thresholdByCode("RK05003000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK05003000"), r2);
          var w2 = weightByCode("RK05003002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK05003003");
          var r3 = ratingByThreshold(thresholdByCode("RK05003000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK05003000"), r3);
          var w3 = weightByCode("RK05003003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK05003004");
          var r4 = ratingByThreshold(thresholdByCode("RK05003000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK05003000"), r4);
          var w4 = weightByCode("RK05003004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK05003001");
          var r1 = ratingByThreshold(thresholdByCode("RK05003000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK05003000"), r1);
          var w1 = weightByCode("RK05003001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK05003002");
          var r2 = ratingByThreshold(thresholdByCode("RK05003000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK05003000"), r2);
          var w2 = weightByCode("RK05003002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK05003003");
          var r3 = ratingByThreshold(thresholdByCode("RK05003000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK05003000"), r3);
          var w3 = weightByCode("RK05003003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK05003004");
          var r4 = ratingByThreshold(thresholdByCode("RK05003000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK05003000"), r4);
          var w4 = weightByCode("RK05003004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          var r = ratingByThreshold(thresholdByCode("RK05003000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK05003000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05003001");
              
              var r = ratingByThreshold(thresholdByCode("RK05003000"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05003000"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05003001");
              
              var r = ratingByThreshold(thresholdByCode("RK05003000"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05003001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05003001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05003002");
              
              var r = ratingByThreshold(thresholdByCode("RK05003002"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05003002"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05003002");
              
              var r = ratingByThreshold(thresholdByCode("RK05003002"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05003002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05003002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05003003");
              
              var r = ratingByThreshold(thresholdByCode("RK05003003"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05003003"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05003003");
              
              var r = ratingByThreshold(thresholdByCode("RK05003003"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05003003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05003003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK05003004");
              
              var r = ratingByThreshold(thresholdByCode("RK05003004"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK05003004"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK05003004");
              
              var r = ratingByThreshold(thresholdByCode("RK05003004"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK05003004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK05003004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var child_0 = findConsolidateByCode("SK06001000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK06000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK06000000"), r);
      return s;
$$,
    rating_rule = $$
var child_0 = findConsolidateByCode("SK06001000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK06000000"), consolidateValue);
      return r;
$$,
    value_rule = $$
var child_0 = findConsolidateByCode("SK06001000");
      var consolidateValue = (child_0) / 1;
      return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06000000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06001000");
      var r = ratingByThreshold(thresholdByCode("RK06000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK06000000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06001000");
      var r = ratingByThreshold(thresholdByCode("RK06000000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06001000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06001002");
              var r = ratingByThreshold(thresholdByCode("RK06000000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06000000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06001002");
              var r = ratingByThreshold(thresholdByCode("RK06000000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06001002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06001002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06001001");
              var r = ratingByThreshold(thresholdByCode("RK06001001"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06001001"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06001001");
              var r = ratingByThreshold(thresholdByCode("RK06001001"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06001001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06001001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06001003");
              var r = ratingByThreshold(thresholdByCode("RK06001003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06001003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06001003");
              var r = ratingByThreshold(thresholdByCode("RK06001003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06001003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06001003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06001004");
              var r = ratingByThreshold(thresholdByCode("RK06001004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06001004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06001004");
              var r = ratingByThreshold(thresholdByCode("RK06001004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06001004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06001004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06002000");
      var r = ratingByThreshold(thresholdByCode("RK06002000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK06002000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06002000");
      var r = ratingByThreshold(thresholdByCode("RK06002000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06002000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06002001");
              var r = ratingByThreshold(thresholdByCode("RK06002000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06002000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06002001");
              var r = ratingByThreshold(thresholdByCode("RK06002000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06002001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06002001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06002002");
              var r = ratingByThreshold(thresholdByCode("RK06002002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06002002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06002002");
              var r = ratingByThreshold(thresholdByCode("RK06002002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06002002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06002002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06002003");
              var r = ratingByThreshold(thresholdByCode("RK06002003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06002003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06002003");
              var r = ratingByThreshold(thresholdByCode("RK06002003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06002003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06002003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06003000");
      var r = ratingByThreshold(thresholdByCode("RK06003000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK06003000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06003000");
      var r = ratingByThreshold(thresholdByCode("RK06003000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06003000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06003001");
              var r = ratingByThreshold(thresholdByCode("RK06003000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06003000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06003001");
              var r = ratingByThreshold(thresholdByCode("RK06003000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06003001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06003001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06003002");
              var r = ratingByThreshold(thresholdByCode("RK06003002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06003002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06003002");
              var r = ratingByThreshold(thresholdByCode("RK06003002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06003002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06003002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06003003");
              var r = ratingByThreshold(thresholdByCode("RK06003003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06003003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06003003");
              var r = ratingByThreshold(thresholdByCode("RK06003003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06003003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06003003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06004000");
      var r = ratingByThreshold(thresholdByCode("RK06004000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK06004000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06004000");
      var r = ratingByThreshold(thresholdByCode("RK06004000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06004000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06004001");
              var r = ratingByThreshold(thresholdByCode("RK06004000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06004000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06004001");
              var r = ratingByThreshold(thresholdByCode("RK06004000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06004001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06004001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06004002");
              var r = ratingByThreshold(thresholdByCode("RK06004002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06004002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06004002");
              var r = ratingByThreshold(thresholdByCode("RK06004002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06004002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06004002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06004003");
              var r = ratingByThreshold(thresholdByCode("RK06004003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06004003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06004003");
              var r = ratingByThreshold(thresholdByCode("RK06004003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06004003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06004003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK06004004");
              var r = ratingByThreshold(thresholdByCode("RK06004004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK06004004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK06004004");
              var r = ratingByThreshold(thresholdByCode("RK06004004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK06004004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK06004004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var child_0 = findConsolidateByCode("SK03002000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK03000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK03000000"), r);
      return s;
$$,
    rating_rule = $$
var child_0 = findConsolidateByCode("SK03002000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK03000000"), consolidateValue);
      return r;
$$,
    value_rule = $$
var child_0 = findConsolidateByCode("SK03002000");
      var consolidateValue = (child_0) / 1;
      return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03000000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03002000");
      var r = ratingByThreshold(thresholdByCode("RK03000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK03000000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03002000");
      var r = ratingByThreshold(thresholdByCode("RK03000000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03002000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03002001");
              var r = ratingByThreshold(thresholdByCode("RK03000000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03000000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03002001");
              var r = ratingByThreshold(thresholdByCode("RK03000000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03002001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03002001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03002002");
              var r = ratingByThreshold(thresholdByCode("RK03002002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03002002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03002002");
              var r = ratingByThreshold(thresholdByCode("RK03002002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03002002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03002002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03002003");
              var r = ratingByThreshold(thresholdByCode("RK03002003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03002003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03002003");
              var r = ratingByThreshold(thresholdByCode("RK03002003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03002003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03002003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03003000");
      var r = ratingByThreshold(thresholdByCode("RK03003000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK03003000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03003000");
      var r = ratingByThreshold(thresholdByCode("RK03003000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03003000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03003001");
              var r = ratingByThreshold(thresholdByCode("RK03003000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03003000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03003001");
              var r = ratingByThreshold(thresholdByCode("RK03003000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03003001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03003001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03003002");
              var r = ratingByThreshold(thresholdByCode("RK03003002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03003002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03003002");
              var r = ratingByThreshold(thresholdByCode("RK03003002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03003002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03003002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03003003");
              var r = ratingByThreshold(thresholdByCode("RK03003003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03003003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03003003");
              var r = ratingByThreshold(thresholdByCode("RK03003003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03003003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03003003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03004000");
      var r = ratingByThreshold(thresholdByCode("RK03004000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK03004000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03004000");
      var r = ratingByThreshold(thresholdByCode("RK03004000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03004000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03004001");
              var r = ratingByThreshold(thresholdByCode("RK03004000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03004000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03004001");
              var r = ratingByThreshold(thresholdByCode("RK03004000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03004001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03004001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03004002");
              var r = ratingByThreshold(thresholdByCode("RK03004002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03004002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03004002");
              var r = ratingByThreshold(thresholdByCode("RK03004002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03004002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03004002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03004003");
              var r = ratingByThreshold(thresholdByCode("RK03004003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03004003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03004003");
              var r = ratingByThreshold(thresholdByCode("RK03004003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03004003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03004003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03004004");
              var r = ratingByThreshold(thresholdByCode("RK03004004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03004004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03004004");
              var r = ratingByThreshold(thresholdByCode("RK03004004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03004004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03004004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03001000");
      var r = ratingByThreshold(thresholdByCode("RK03001000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK03001000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03001000");
      var r = ratingByThreshold(thresholdByCode("RK03001000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03001000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03001004");
              var r = ratingByThreshold(thresholdByCode("RK03001000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03001000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03001004");
              var r = ratingByThreshold(thresholdByCode("RK03001000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03001004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03001004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03001001");
              var r = ratingByThreshold(thresholdByCode("RK03001001"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03001001"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03001001");
              var r = ratingByThreshold(thresholdByCode("RK03001001"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03001001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03001001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03001002");
              var r = ratingByThreshold(thresholdByCode("RK03001002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03001002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03001002");
              var r = ratingByThreshold(thresholdByCode("RK03001002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03001002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03001002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK03001003");
              var r = ratingByThreshold(thresholdByCode("RK03001003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK03001003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK03001003");
              var r = ratingByThreshold(thresholdByCode("RK03001003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK03001003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK03001003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var child_0 = findConsolidateByCode("SK08004000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK08000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK08000000"), r);
      return s;
$$,
    rating_rule = $$
var child_0 = findConsolidateByCode("SK08004000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK08000000"), consolidateValue);
      return r;
$$,
    value_rule = $$
var child_0 = findConsolidateByCode("SK08004000");
      var consolidateValue = (child_0) / 1;
      return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08000000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08004000");
      var r = ratingByThreshold(thresholdByCode("RK08000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK08000000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08004000");
      var r = ratingByThreshold(thresholdByCode("RK08000000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08004000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08004001");
              var r = ratingByThreshold(thresholdByCode("RK08000000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08000000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08004001");
              var r = ratingByThreshold(thresholdByCode("RK08000000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08004001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08004001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08004002");
              var r = ratingByThreshold(thresholdByCode("RK08004002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08004002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08004002");
              var r = ratingByThreshold(thresholdByCode("RK08004002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08004002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08004002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08004003");
              var r = ratingByThreshold(thresholdByCode("RK08004003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08004003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08004003");
              var r = ratingByThreshold(thresholdByCode("RK08004003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08004003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08004003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08004004");
              var r = ratingByThreshold(thresholdByCode("RK08004004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08004004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08004004");
              var r = ratingByThreshold(thresholdByCode("RK08004004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08004004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08004004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08002000");
      var r = ratingByThreshold(thresholdByCode("RK08002000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK08002000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08002000");
      var r = ratingByThreshold(thresholdByCode("RK08002000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08002000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08002001");
              var r = ratingByThreshold(thresholdByCode("RK08002000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08002000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08002001");
              var r = ratingByThreshold(thresholdByCode("RK08002000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08002001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08002001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08002002");
              var r = ratingByThreshold(thresholdByCode("RK08002002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08002002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08002002");
              var r = ratingByThreshold(thresholdByCode("RK08002002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08002002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08002002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08002003");
              var r = ratingByThreshold(thresholdByCode("RK08002003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08002003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08002003");
              var r = ratingByThreshold(thresholdByCode("RK08002003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08002003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08002003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08003000");
      var r = ratingByThreshold(thresholdByCode("RK08003000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK08003000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08003000");
      var r = ratingByThreshold(thresholdByCode("RK08003000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08003000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08003001");
              var r = ratingByThreshold(thresholdByCode("RK08003000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08003000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08003001");
              var r = ratingByThreshold(thresholdByCode("RK08003000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08003001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08003001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08003002");
              var r = ratingByThreshold(thresholdByCode("RK08003002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08003002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08003002");
              var r = ratingByThreshold(thresholdByCode("RK08003002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08003002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08003002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08003003");
              var r = ratingByThreshold(thresholdByCode("RK08003003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08003003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08003003");
              var r = ratingByThreshold(thresholdByCode("RK08003003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08003003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08003003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08001000");
      var r = ratingByThreshold(thresholdByCode("RK08001000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK08001000"), r);
      return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08001000");
      var r = ratingByThreshold(thresholdByCode("RK08001000"), consolidateValue);
      return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08001000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08001001");
              var r = ratingByThreshold(thresholdByCode("RK08001000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08001000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08001001");
              var r = ratingByThreshold(thresholdByCode("RK08001000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08001001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08001001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08001002");
              var r = ratingByThreshold(thresholdByCode("RK08001002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08001002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08001002");
              var r = ratingByThreshold(thresholdByCode("RK08001002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08001002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08001002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08001003");
              var r = ratingByThreshold(thresholdByCode("RK08001003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08001003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08001003");
              var r = ratingByThreshold(thresholdByCode("RK08001003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08001003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08001003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK08001004");
              var r = ratingByThreshold(thresholdByCode("RK08001004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK08001004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK08001004");
              var r = ratingByThreshold(thresholdByCode("RK08001004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK08001004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK08001004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var child_0 = findConsolidateByCode("SK10001000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK10000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK10000000"), r);
      return s;
$$,
    rating_rule = $$
var child_0 = findConsolidateByCode("SK10001000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK10000000"), consolidateValue);
      return r;
$$,
    value_rule = $$
var child_0 = findConsolidateByCode("SK10001000");
      var consolidateValue = (child_0) / 1;
      return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK10000000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK10001001");
          var r1 = ratingByThreshold(thresholdByCode("RK10000000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK10000000"), r1);
          var w1 = weightByCode("RK10001001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK10001002");
          var r2 = ratingByThreshold(thresholdByCode("RK10000000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK10000000"), r2);
          var w2 = weightByCode("RK10001002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK10001003");
          var r3 = ratingByThreshold(thresholdByCode("RK10000000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK10000000"), r3);
          var w3 = weightByCode("RK10001003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK10001004");
          var r4 = ratingByThreshold(thresholdByCode("RK10000000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK10000000"), r4);
          var w4 = weightByCode("RK10001004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK10001001");
          var r1 = ratingByThreshold(thresholdByCode("RK10000000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK10000000"), r1);
          var w1 = weightByCode("RK10001001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK10001002");
          var r2 = ratingByThreshold(thresholdByCode("RK10000000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK10000000"), r2);
          var w2 = weightByCode("RK10001002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK10001003");
          var r3 = ratingByThreshold(thresholdByCode("RK10000000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK10000000"), r3);
          var w3 = weightByCode("RK10001003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK10001004");
          var r4 = ratingByThreshold(thresholdByCode("RK10000000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK10000000"), r4);
          var w4 = weightByCode("RK10001004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          var r = ratingByThreshold(thresholdByCode("RK10000000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK10001000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10001002");
              
              var r = ratingByThreshold(thresholdByCode("RK10000000"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10000000"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10001002");
              
              var r = ratingByThreshold(thresholdByCode("RK10000000"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10001002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10001002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10001001");
              
              var r = ratingByThreshold(thresholdByCode("RK10001001"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10001001"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10001001");
              
              var r = ratingByThreshold(thresholdByCode("RK10001001"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10001001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10001001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10001003");
              
              var r = ratingByThreshold(thresholdByCode("RK10001003"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10001003"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10001003");
              
              var r = ratingByThreshold(thresholdByCode("RK10001003"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10001003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10001003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10001004");
              
              var r = ratingByThreshold(thresholdByCode("RK10001004"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10001004"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10001004");
              
              var r = ratingByThreshold(thresholdByCode("RK10001004"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10001004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10001004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
// RK10002001
          var consolidateValue1 = findConsolidateByCode("SK10002001");
          var r1 = ratingByThreshold(thresholdByCode("RK10002000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK10002000"), r1);
          var w1 = weightByCode("RK10002001");
          var sxb1 = s1 * w1 * 1.0;
          
          // RK10002002
          var consolidateValue2 = findConsolidateByCode("SK10002002");
          var r2 = ratingByThreshold(thresholdByCode("RK10002000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK10002000"), r2);
          var w2 = weightByCode("RK10002002");
          var sxb2 = s2 * w2 * 1.0;
          
          // RK10002003
          var consolidateValue3 = findConsolidateByCode("SK10002003");
          var r3 = ratingByThreshold(thresholdByCode("RK10002000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK10002000"), r3);
          var w3 = weightByCode("RK10002003");
          var sxb3 = s3 * w3 * 1.0;
          
          // RK10002004
          var consolidateValue4 = findConsolidateByCode("SK10002004");
          var r4 = ratingByThreshold(thresholdByCode("RK10002000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK10002000"), r4);
          var w4 = weightByCode("RK10002004");
          var sxb4 = s4 * w4 * 1.0;
          
          // RK10002000 total
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK10002001");
          var r1 = ratingByThreshold(thresholdByCode("RK10002000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK10002000"), r1);
          var w1 = weightByCode("RK10002001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK10002002");
          var r2 = ratingByThreshold(thresholdByCode("RK10002000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK10002000"), r2);
          var w2 = weightByCode("RK10002002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK10002003");
          var r3 = ratingByThreshold(thresholdByCode("RK10002000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK10002000"), r3);
          var w3 = weightByCode("RK10002003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK10002004");
          var r4 = ratingByThreshold(thresholdByCode("RK10002000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK10002000"), r4);
          var w4 = weightByCode("RK10002004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          var r = ratingByThreshold(thresholdByCode("RK10002000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK10002000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10002001");
              
              var r = ratingByThreshold(thresholdByCode("RK10002000"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10002000"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10002001");
              
              var r = ratingByThreshold(thresholdByCode("RK10002000"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10002001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10002001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10002002");
              
              var r = ratingByThreshold(thresholdByCode("RK10002002"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10002002"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10002002");
              
              var r = ratingByThreshold(thresholdByCode("RK10002002"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10002002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10002002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10002003");
              
              var r = ratingByThreshold(thresholdByCode("RK10002003"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10002003"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10002003");
              
              var r = ratingByThreshold(thresholdByCode("RK10002003"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10002003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10002003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10002004");
              
              var r = ratingByThreshold(thresholdByCode("RK10002004"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10002004"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10002004");
              
              var r = ratingByThreshold(thresholdByCode("RK10002004"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10002004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10002004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
// RK10003001
          var consolidateValue1 = findConsolidateByCode("SK10003001");
          var r1 = ratingByThreshold(thresholdByCode("RK10003000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK10003000"), r1);
          var w1 = weightByCode("RK10003001");
          var sxb1 = s1 * w1 * 1.0;
          
          // RK10003002
          var consolidateValue2 = findConsolidateByCode("SK10003002");
          var r2 = ratingByThreshold(thresholdByCode("RK10003000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK10003000"), r2);
          var w2 = weightByCode("RK10003002");
          var sxb2 = s2 * w2 * 1.0;
          
          // RK10003003
          var consolidateValue3 = findConsolidateByCode("SK10003003");
          var r3 = ratingByThreshold(thresholdByCode("RK10003000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK10003000"), r3);
          var w3 = weightByCode("RK10003003");
          var sxb3 = s3 * w3 * 1.0;
          
          // RK10003000 total
          var total = sxb1 + sxb2 + sxb3;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK10003001");
          var r1 = ratingByThreshold(thresholdByCode("RK10003000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK10003000"), r1);
          var w1 = weightByCode("RK10003001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK10003002");
          var r2 = ratingByThreshold(thresholdByCode("RK10003000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK10003000"), r2);
          var w2 = weightByCode("RK10003002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK10003003");
          var r3 = ratingByThreshold(thresholdByCode("RK10003000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK10003000"), r3);
          var w3 = weightByCode("RK10003003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          var r = ratingByThreshold(thresholdByCode("RK10003000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK10003000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10003001");
              
              var r = ratingByThreshold(thresholdByCode("RK10003000"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10003000"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10003001");
              
              var r = ratingByThreshold(thresholdByCode("RK10003000"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10003001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10003001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10003002");
              
              var r = ratingByThreshold(thresholdByCode("RK10003002"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10003002"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10003002");
              
              var r = ratingByThreshold(thresholdByCode("RK10003002"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10003002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10003002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10003003");
              
              var r = ratingByThreshold(thresholdByCode("RK10003003"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10003003"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10003003");
              
              var r = ratingByThreshold(thresholdByCode("RK10003003"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10003003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10003003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK10004001");
          var r1 = ratingByThreshold(thresholdByCode("RK10004000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK10004000"), r1);
          var w1 = weightByCode("RK10004001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK10004002");
          var r2 = ratingByThreshold(thresholdByCode("RK10004000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK10004000"), r2);
          var w2 = weightByCode("RK10004002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK10004003");
          var r3 = ratingByThreshold(thresholdByCode("RK10004000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK10004000"), r3);
          var w3 = weightByCode("RK10004003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK10004004");
          var r4 = ratingByThreshold(thresholdByCode("RK10004000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK10004000"), r4);
          var w4 = weightByCode("RK10004004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK10004001");
          var r1 = ratingByThreshold(thresholdByCode("RK10004000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK10004000"), r1);
          var w1 = weightByCode("RK10004001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK10004002");
          var r2 = ratingByThreshold(thresholdByCode("RK10004000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK10004000"), r2);
          var w2 = weightByCode("RK10004002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK10004003");
          var r3 = ratingByThreshold(thresholdByCode("RK10004000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK10004000"), r3);
          var w3 = weightByCode("RK10004003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK10004004");
          var r4 = ratingByThreshold(thresholdByCode("RK10004000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK10004000"), r4);
          var w4 = weightByCode("RK10004004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          var r = ratingByThreshold(thresholdByCode("RK10004000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK10004000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10004001");
              
              var r = ratingByThreshold(thresholdByCode("RK10004000"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10004000"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10004001");
              
              var r = ratingByThreshold(thresholdByCode("RK10004000"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10004001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10004001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10004002");
              
              var r = ratingByThreshold(thresholdByCode("RK10004002"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10004002"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10004002");
              
              var r = ratingByThreshold(thresholdByCode("RK10004002"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10004002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10004002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10004003");
              
              var r = ratingByThreshold(thresholdByCode("RK10004003"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10004003"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10004003");
              
              var r = ratingByThreshold(thresholdByCode("RK10004003"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10004003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10004003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK10004004");
              
              var r = ratingByThreshold(thresholdByCode("RK10004004"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK10004004"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK10004004");
              
              var r = ratingByThreshold(thresholdByCode("RK10004004"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK10004004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK10004004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var child_0 = findConsolidateByCode("SK12002000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK12000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK12000000"), r);
      return s;
$$,
    rating_rule = $$
var child_0 = findConsolidateByCode("SK12002000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK12000000"), consolidateValue);
      return r;
$$,
    value_rule = $$
var child_0 = findConsolidateByCode("SK12002000");
      var consolidateValue = (child_0) / 1;
      return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK12000000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK12002001");
          var r1 = ratingByThreshold(thresholdByCode("RK12000000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK12000000"), r1);
          var w1 = weightByCode("RK12002001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK12002002");
          var r2 = ratingByThreshold(thresholdByCode("RK12000000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK12000000"), r2);
          var w2 = weightByCode("RK12002002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK12002003");
          var r3 = ratingByThreshold(thresholdByCode("RK12000000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK12000000"), r3);
          var w3 = weightByCode("RK12002003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK12002001");
          var r1 = ratingByThreshold(thresholdByCode("RK12000000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK12000000"), r1);
          var w1 = weightByCode("RK12002001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK12002002");
          var r2 = ratingByThreshold(thresholdByCode("RK12000000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK12000000"), r2);
          var w2 = weightByCode("RK12002002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK12002003");
          var r3 = ratingByThreshold(thresholdByCode("RK12000000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK12000000"), r3);
          var w3 = weightByCode("RK12002003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          var r = ratingByThreshold(thresholdByCode("RK12000000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK12002000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK12002001");
              
              var r = ratingByThreshold(thresholdByCode("RK12000000"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK12000000"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK12002001");
              
              var r = ratingByThreshold(thresholdByCode("RK12000000"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK12002001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK12002001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK12002002");
              
              var r = ratingByThreshold(thresholdByCode("RK12002002"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK12002002"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK12002002");
              
              var r = ratingByThreshold(thresholdByCode("RK12002002"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK12002002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK12002002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK12002003");
              
              var r = ratingByThreshold(thresholdByCode("RK12002003"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK12002003"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK12002003");
              
              var r = ratingByThreshold(thresholdByCode("RK12002003"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK12002003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK12002003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK12003001");
          var r1 = ratingByThreshold(thresholdByCode("RK12003000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK12003000"), r1);
          var w1 = weightByCode("RK12003001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK12003002");
          var r2 = ratingByThreshold(thresholdByCode("RK12003000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK12003000"), r2);
          var w2 = weightByCode("RK12003002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK12003003");
          var r3 = ratingByThreshold(thresholdByCode("RK12003000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK12003000"), r3);
          var w3 = weightByCode("RK12003003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK12003001");
          var r1 = ratingByThreshold(thresholdByCode("RK12003000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK12003000"), r1);
          var w1 = weightByCode("RK12003001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK12003002");
          var r2 = ratingByThreshold(thresholdByCode("RK12003000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK12003000"), r2);
          var w2 = weightByCode("RK12003002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK12003003");
          var r3 = ratingByThreshold(thresholdByCode("RK12003000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK12003000"), r3);
          var w3 = weightByCode("RK12003003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          var r = ratingByThreshold(thresholdByCode("RK12003000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK12003000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK12003001");
              
              var r = ratingByThreshold(thresholdByCode("RK12003000"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK12003000"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK12003001");
              
              var r = ratingByThreshold(thresholdByCode("RK12003000"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK12003001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK12003001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK12003002");
              
              var r = ratingByThreshold(thresholdByCode("RK12003002"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK12003002"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK12003002");
              
              var r = ratingByThreshold(thresholdByCode("RK12003002"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK12003002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK12003002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK12003003");
              
              var r = ratingByThreshold(thresholdByCode("RK12003003"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK12003003"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK12003003");
              
              var r = ratingByThreshold(thresholdByCode("RK12003003"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK12003003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK12003003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK12004001");
          var r1 = ratingByThreshold(thresholdByCode("RK12004000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK12004000"), r1);
          var w1 = weightByCode("RK12004001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK12004002");
          var r2 = ratingByThreshold(thresholdByCode("RK12004000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK12004000"), r2);
          var w2 = weightByCode("RK12004002");
          var sxb2 = s2 * w2 * 1.0;
          
          var total = sxb1 + sxb2;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK12004001");
          var r1 = ratingByThreshold(thresholdByCode("RK12004000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK12004000"), r1);
          var w1 = weightByCode("RK12004001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK12004002");
          var r2 = ratingByThreshold(thresholdByCode("RK12004000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK12004000"), r2);
          var w2 = weightByCode("RK12004002");
          var sxb2 = s2 * w2 * 1.0;
          
          var total = sxb1 + sxb2;
          var r = ratingByThreshold(thresholdByCode("RK12004000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK12004000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK12004001");
              
              var r = ratingByThreshold(thresholdByCode("RK12004000"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK12004000"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK12004001");
              
              var r = ratingByThreshold(thresholdByCode("RK12004000"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK12004001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK12004001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK12004002");
              
              var r = ratingByThreshold(thresholdByCode("RK12004002"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK12004002"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK12004002");
              
              var r = ratingByThreshold(thresholdByCode("RK12004002"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK12004002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK12004002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
// RK12001001
          var consolidateValue1 = findConsolidateByCode("SK12001001");
          var r1 = ratingByThreshold(thresholdByCode("RK12001000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK12001000"), r1);
          var w1 = weightByCode("RK12001001");
          var sxb1 = s1 * w1 * 1.0;
          
          // RK12001002
          var consolidateValue2 = findConsolidateByCode("SK12001002");
          var r2 = ratingByThreshold(thresholdByCode("RK12001000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK12001000"), r2);
          var w2 = weightByCode("RK12001002");
          var sxb2 = s2 * w2 * 1.0;
          
          // RK12001000 total
          var total = sxb1 + sxb2;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK12001001");
          var r1 = ratingByThreshold(thresholdByCode("RK12001000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK12001000"), r1);
          var w1 = weightByCode("RK12001001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK12001002");
          var r2 = ratingByThreshold(thresholdByCode("RK12001000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK12001000"), r2);
          var w2 = weightByCode("RK12001002");
          var sxb2 = s2 * w2 * 1.0;
          
          var total = sxb1 + sxb2;
          var r = ratingByThreshold(thresholdByCode("RK12001000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK12001000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK12001001");
              
              var r = ratingByThreshold(thresholdByCode("RK12001000"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK12001000"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK12001001");
              
              var r = ratingByThreshold(thresholdByCode("RK12001000"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK12001001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK12001001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK12001002");
              
              var r = ratingByThreshold(thresholdByCode("RK12001002"), consolidateValue);
              
              var s = scoreByRating(scoreFormulaByCode("RK12001002"), r);
              
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK12001002");
              
              var r = ratingByThreshold(thresholdByCode("RK12001002"), consolidateValue);
              
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK12001002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RK12001002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var child_0 = findConsolidateByCode("SK09002000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK09000000"), consolidateValue);
      var s = scoreByRating(scoreFormulaByCode("RK09000000"), r);
      return s;
$$,
    rating_rule = $$
var child_0 = findConsolidateByCode("SK09002000");
      var consolidateValue = (child_0) / 1;
      var r = ratingByThreshold(thresholdByCode("RK09000000"), consolidateValue);
      return r;
$$,
    value_rule = $$
var child_0 = findConsolidateByCode("SK09002000");
      var consolidateValue = (child_0) / 1;
      return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09000000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK09002001");
          var r1 = ratingByThreshold(thresholdByCode("RK09000000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK09000000"), r1);
          var w1 = weightByCode("RK09002001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK09002002");
          var r2 = ratingByThreshold(thresholdByCode("RK09000000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK09000000"), r2);
          var w2 = weightByCode("RK09002002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK09002003");
          var r3 = ratingByThreshold(thresholdByCode("RK09000000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK09000000"), r3);
          var w3 = weightByCode("RK09002003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK09002001");
          var r1 = ratingByThreshold(thresholdByCode("RK09000000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK09000000"), r1);
          var w1 = weightByCode("RK09002001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK09002002");
          var r2 = ratingByThreshold(thresholdByCode("RK09000000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK09000000"), r2);
          var w2 = weightByCode("RK09002002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK09002003");
          var r3 = ratingByThreshold(thresholdByCode("RK09000000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK09000000"), r3);
          var w3 = weightByCode("RK09002003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          var r = ratingByThreshold(thresholdByCode("RK09000000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09002000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09002001");
              var r = ratingByThreshold(thresholdByCode("RK09000000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09000000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09002001");
              var r = ratingByThreshold(thresholdByCode("RK09000000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09002001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09002001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09002002");
              var r = ratingByThreshold(thresholdByCode("RK09002002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09002002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09002002");
              var r = ratingByThreshold(thresholdByCode("RK09002002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09002002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09002002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09002003");
              var r = ratingByThreshold(thresholdByCode("RK09002003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09002003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09002003");
              var r = ratingByThreshold(thresholdByCode("RK09002003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09002003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09002003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK09001001");
          var r1 = ratingByThreshold(thresholdByCode("RK09001000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK09001000"), r1);
          var w1 = weightByCode("RK09001001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK09001002");
          var r2 = ratingByThreshold(thresholdByCode("RK09001000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK09001000"), r2);
          var w2 = weightByCode("RK09001002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK09001003");
          var r3 = ratingByThreshold(thresholdByCode("RK09001000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK09001000"), r3);
          var w3 = weightByCode("RK09001003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK09001004");
          var r4 = ratingByThreshold(thresholdByCode("RK09001000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK09001000"), r4);
          var w4 = weightByCode("RK09001004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK09001001");
          var r1 = ratingByThreshold(thresholdByCode("RK09001000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK09001000"), r1);
          var w1 = weightByCode("RK09001001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK09001002");
          var r2 = ratingByThreshold(thresholdByCode("RK09001000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK09001000"), r2);
          var w2 = weightByCode("RK09001002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK09001003");
          var r3 = ratingByThreshold(thresholdByCode("RK09001000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK09001000"), r3);
          var w3 = weightByCode("RK09001003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK09001004");
          var r4 = ratingByThreshold(thresholdByCode("RK09001000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK09001000"), r4);
          var w4 = weightByCode("RK09001004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          var r = ratingByThreshold(thresholdByCode("RK09001000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09001000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09001001");
              var r = ratingByThreshold(thresholdByCode("RK09001000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09001000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09001001");
              var r = ratingByThreshold(thresholdByCode("RK09001000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09001001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09001001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09001002");
              var r = ratingByThreshold(thresholdByCode("RK09001002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09001002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09001002");
              var r = ratingByThreshold(thresholdByCode("RK09001002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09001002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09001002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09001003");
              var r = ratingByThreshold(thresholdByCode("RK09001003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09001003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09001003");
              var r = ratingByThreshold(thresholdByCode("RK09001003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09001003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09001003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09001004");
              var r = ratingByThreshold(thresholdByCode("RK09001004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09001004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09001004");
              var r = ratingByThreshold(thresholdByCode("RK09001004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09001004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09001004';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK09003001");
          var r1 = ratingByThreshold(thresholdByCode("RK09003000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK09003000"), r1);
          var w1 = weightByCode("RK09003001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK09003002");
          var r2 = ratingByThreshold(thresholdByCode("RK09003000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK09003000"), r2);
          var w2 = weightByCode("RK09003002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK09003003");
          var r3 = ratingByThreshold(thresholdByCode("RK09003000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK09003000"), r3);
          var w3 = weightByCode("RK09003003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK09003001");
          var r1 = ratingByThreshold(thresholdByCode("RK09003000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK09003000"), r1);
          var w1 = weightByCode("RK09003001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK09003002");
          var r2 = ratingByThreshold(thresholdByCode("RK09003000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK09003000"), r2);
          var w2 = weightByCode("RK09003002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK09003003");
          var r3 = ratingByThreshold(thresholdByCode("RK09003000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK09003000"), r3);
          var w3 = weightByCode("RK09003003");
          var sxb3 = s3 * w3 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3;
          var r = ratingByThreshold(thresholdByCode("RK09003000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09003000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09003001");
              var r = ratingByThreshold(thresholdByCode("RK09003000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09003000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09003001");
              var r = ratingByThreshold(thresholdByCode("RK09003000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09003001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09003001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09003002");
              var r = ratingByThreshold(thresholdByCode("RK09003002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09003002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09003002");
              var r = ratingByThreshold(thresholdByCode("RK09003002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09003002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09003002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09003003");
              var r = ratingByThreshold(thresholdByCode("RK09003003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09003003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09003003");
              var r = ratingByThreshold(thresholdByCode("RK09003003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09003003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09003003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue1 = findConsolidateByCode("SK09004001");
          var r1 = ratingByThreshold(thresholdByCode("RK09004000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK09004000"), r1);
          var w1 = weightByCode("RK09004001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK09004002");
          var r2 = ratingByThreshold(thresholdByCode("RK09004000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK09004000"), r2);
          var w2 = weightByCode("RK09004002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK09004003");
          var r3 = ratingByThreshold(thresholdByCode("RK09004000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK09004000"), r3);
          var w3 = weightByCode("RK09004003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK09004004");
          var r4 = ratingByThreshold(thresholdByCode("RK09004000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK09004000"), r4);
          var w4 = weightByCode("RK09004004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          return total;
$$,
    rating_rule = $$
var consolidateValue1 = findConsolidateByCode("SK09004001");
          var r1 = ratingByThreshold(thresholdByCode("RK09004000"), consolidateValue1);
          var s1 = scoreByRating(scoreFormulaByCode("RK09004000"), r1);
          var w1 = weightByCode("RK09004001");
          var sxb1 = s1 * w1 * 1.0;
          
          var consolidateValue2 = findConsolidateByCode("SK09004002");
          var r2 = ratingByThreshold(thresholdByCode("RK09004000"), consolidateValue2);
          var s2 = scoreByRating(scoreFormulaByCode("RK09004000"), r2);
          var w2 = weightByCode("RK09004002");
          var sxb2 = s2 * w2 * 1.0;
          
          var consolidateValue3 = findConsolidateByCode("SK09004003");
          var r3 = ratingByThreshold(thresholdByCode("RK09004000"), consolidateValue3);
          var s3 = scoreByRating(scoreFormulaByCode("RK09004000"), r3);
          var w3 = weightByCode("RK09004003");
          var sxb3 = s3 * w3 * 1.0;
          
          var consolidateValue4 = findConsolidateByCode("SK09004004");
          var r4 = ratingByThreshold(thresholdByCode("RK09004000"), consolidateValue4);
          var s4 = scoreByRating(scoreFormulaByCode("RK09004000"), r4);
          var w4 = weightByCode("RK09004004");
          var sxb4 = s4 * w4 * 1.0;
          
          var total = sxb1 + sxb2 + sxb3 + sxb4;
          var r = ratingByThreshold(thresholdByCode("RK09004000"), total);
          return r;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09004000';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09004001");
              var r = ratingByThreshold(thresholdByCode("RK09004000"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09004000"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09004001");
              var r = ratingByThreshold(thresholdByCode("RK09004000"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09004001");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09004001';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09004002");
              var r = ratingByThreshold(thresholdByCode("RK09004002"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09004002"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09004002");
              var r = ratingByThreshold(thresholdByCode("RK09004002"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09004002");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09004002';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09004003");
              var r = ratingByThreshold(thresholdByCode("RK09004003"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09004003"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09004003");
              var r = ratingByThreshold(thresholdByCode("RK09004003"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09004003");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09004003';

UPDATE kpmr_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SK09004004");
              var r = ratingByThreshold(thresholdByCode("RK09004004"), consolidateValue);
              var s = scoreByRating(scoreFormulaByCode("RK09004004"), r);
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SK09004004");
              var r = ratingByThreshold(thresholdByCode("RK09004004"), consolidateValue);
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SK09004004");
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92, 2:76, 3:60, 4:44, 5:28
$$
WHERE profile_id = 'RK09004004';

COMMIT;
