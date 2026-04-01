-- Generated UPDATE statements for inherent_risk_profile_edge
-- Generated from inherent_riskpro.xml

BEGIN;

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0700100100 children
      // RI0700100101
 var consolidateValue1 = findConsolidateByCode("SI07001000");
 var r1 = ratingByThreshold(thresholdByCode("RI0700100101"), consolidateValue1);
 var s1 = scoreByRating(scoreFormulaByCode("RI0700100101"), r1);
 var w1 = weightByCode("RI0700100101");
 var sxb1 = s1 * w1 * 1.0;

// RI0700100102
 var consolidateValue2 = findConsolidateByCode("SI07002000");
 var r2 = ratingByThreshold(thresholdByCode("RI0700100102"), consolidateValue2);
 var s2 = scoreByRating(scoreFormulaByCode("RI0700100102"), r2);
 var w2 = weightByCode("RI0700100102");
 var sxb2 = s2 * w2 * 1.0;

// RI0700100103
var consolidateValue3 = findConsolidateByCode("SI07003000");
var r3 = ratingByThreshold(thresholdByCode("RI0700100103"), consolidateValue3);
var s3 = scoreByRating(scoreFormulaByCode("RI0700100103"), r3);
var w3 = weightByCode("RI0700100103");
var sxb3 = s3 * w3 * 1.0;

// RI0700100100 total
var total_RI0700100100 = sxb1 + sxb2 + sxb3;
var w_RI0700100100 = weightByCode("RI0700100100");
var sxb_RI0700100100 = total_RI0700100100 * w_RI0700100100 * 1.0;

// RI0700100200 children
// RI0700100201
 var consolidateValue4 = findConsolidateByCode("SI07009000");
 var r4 = ratingByThreshold(thresholdByCode("RI0700100201"), consolidateValue4);
 var s4 = scoreByRating(scoreFormulaByCode("RI0700100201"), r4);
 var w4 = weightByCode("RI0700100201");
 var sxb4 = s4 * w4 * 1.0;

// RI0700100202
 var consolidateValue5 = findConsolidateByCode("SI07010000");
 var r5 = ratingByThreshold(thresholdByCode("RI0700100202"), consolidateValue5);
 var s5 = scoreByRating(scoreFormulaByCode("RI0700100202"), r5);
 var w5 = weightByCode("RI0700100202");
 var sxb5 = s5 * w5 * 1.0;

// RI0700100200 total
var total_RI0700100200 = sxb4 + sxb5;
var w_RI0700100200 = weightByCode("RI0700100200");
var sxb_RI0700100200 = total_RI0700100200 * w_RI0700100200 * 1.0;

// RI0700100000 total
var total = sxb_RI0700100100 + sxb_RI0700100200;
return total;
$$
WHERE profile_id = 'RI0700100000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07006000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700100000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07006000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07006000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700100107';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07007000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100108"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700100108"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07007000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100108"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07007000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700100108';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07008000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100109"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700100109"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07008000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100109"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07008000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700100109';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0700100201
 var consolidateValue1 = findConsolidateByCode("SI07009000");           var r1 = ratingByThreshold(thresholdByCode("RI0700100200"), consolidateValue1);           var s1 = scoreByRating(scoreFormulaByCode("RI0700100200"), r1);

 var w1 = weightByCode("RI0700100201");

 var sxb1 = s1 * w1 * 1.0;

// RI0700100202


  var consolidateValue2 = findConsolidateByCode("SI07010000");                  var r2 = ratingByThreshold(thresholdByCode("RI0700100200"), consolidateValue2);                  var s2 = scoreByRating(scoreFormulaByCode("RI0700100200"), r2);             var w2 = weightByCode("RI0700100202");



 var sxb2 = s2 * w2 * 1.0;     

var total = sxb1 + sxb2;        return total;
$$
WHERE profile_id = 'RI0700100200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07009000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100201"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700100201"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07009000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100201"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07009000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700100201';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07010000");
        
            var r = ratingByThreshold(thresholdByCode("RI0700100202"), consolidateValue);
            
            var s = scoreByRating(scoreFormulaByCode("RI0700100202"), r);
            
            return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07010000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100202"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07010000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700100202';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0700100101
 var consolidateValue1 = findConsolidateByCode("SI07001000");
 var r1 = ratingByThreshold(thresholdByCode("RI0700100101"), consolidateValue1);
 var s1 = scoreByRating(scoreFormulaByCode("RI0700100101"), r1);
 var w1 = weightByCode("RI0700100101");
 var sxb1 = s1 * w1 * 1.0;

// RI0700100102
 var consolidateValue2 = findConsolidateByCode("SI07002000");
 var r2 = ratingByThreshold(thresholdByCode("RI0700100102"), consolidateValue2);
 var s2 = scoreByRating(scoreFormulaByCode("RI0700100102"), r2);
 var w2 = weightByCode("RI0700100102");
 var sxb2 = s2 * w2 * 1.0;

 // RI0700100103
var consolidateValue3 = findConsolidateByCode("SI07003000");
var r3 = ratingByThreshold(thresholdByCode("RI0700100103"), consolidateValue3);
var s3 = scoreByRating(scoreFormulaByCode("RI0700100103"), r3);
var w3 = weightByCode("RI0700100103");
var sxb3 = s3 * w3 * 1.0;

var total = sxb1 + sxb2 + sxb3;
return total;
$$
WHERE profile_id = 'RI0700100100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07001000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100101"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700100101"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07001000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100101"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07001000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700100101';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07002000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100102"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700100102"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07002000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100102"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07002000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700100102';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07003000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100103"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700100103"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07003000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100103"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07003000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700100103';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0700100105
 var consolidateValue1 = findConsolidateByCode("SI07004000");           var r1 = ratingByThreshold(thresholdByCode("RI0700100104"), consolidateValue1);           var s1 = scoreByRating(scoreFormulaByCode("RI0700100104"), r1);

 var w1 = weightByCode("RI0700100105");

 var sxb1 = s1 * w1 * 1.0;

// RI0700100106


  var consolidateValue2 = findConsolidateByCode("SI07005000");                  var r2 = ratingByThreshold(thresholdByCode("RI0700100104"), consolidateValue2);                  var s2 = scoreByRating(scoreFormulaByCode("RI0700100104"), r2);             var w2 = weightByCode("RI0700100106");



 var sxb2 = s2 * w2 * 1.0;     

 // RI0700100107

var consolidateValue3 = findConsolidateByCode("SI07006000");                  var r3 = ratingByThreshold(thresholdByCode("RI0700100104"), consolidateValue3);                  var s3 = scoreByRating(scoreFormulaByCode("RI0700100104"), r3);

var w3 = weightByCode("RI0700100107");         
var sxb3 = s3 * w3 * 1.0;  

// RI0700100108

var consolidateValue4 = findConsolidateByCode("SI07007000");                  var r4 = ratingByThreshold(thresholdByCode("RI0700100104"), consolidateValue4);                  var s4 = scoreByRating(scoreFormulaByCode("RI0700100104"), r4);

var w4 = weightByCode("RI0700100108");         
var sxb4 = s4 * w4 * 1.0;  

// RI0700100109

var consolidateValue5 = findConsolidateByCode("SI07008000");                  var r5 = ratingByThreshold(thresholdByCode("RI0700100104"), consolidateValue5);                  var s5 = scoreByRating(scoreFormulaByCode("RI0700100104"), r5);

var w5 = weightByCode("RI0700100109");         
var sxb5 = s5 * w5 * 1.0;  

var total = sxb1 + sxb2 + sxb3 + sxb4 + sxb5;        return total;
$$
WHERE profile_id = 'RI0700100104';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07004000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100105"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700100105"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07004000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100105"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07004000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700100105';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07005000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100106"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700100106"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07005000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700100106"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07005000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700100106';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0300400100: SI03015000
      var consolidateValue1 = findConsolidateByCode("SI03015000");
      var r1 = ratingByThreshold(thresholdByCode("RI0300400000"), consolidateValue1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0300400000"), r1);
      var w1 = weightByCode("RI0300400100");
      var sxb1 = s1 * w1 * 1.0;
      
      var totalScore = sxb1;
      
      return totalScore;
$$
WHERE profile_id = 'RI0300400000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI03015000");
        
        var r = ratingByThreshold(thresholdByCode("RI0300400000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0300400000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI03015000");
        
        var r = ratingByThreshold(thresholdByCode("RI0300400000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI03015000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0300400100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0600400200
      var consolidateValue1 = findConsolidateByCode("SI06010000");
      var r1 = ratingByThreshold(thresholdByCode("RI0600400000"), consolidateValue1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0600400000"), r1);
      var w1 = weightByCode("RI0600400200");
      var sxb1 = s1 * w1 * 1.0;

      // RI0600400101
      var consolidateValue2 = findConsolidateByCode("SI06008000");
      var r2 = ratingByThreshold(thresholdByCode("RI0600400000"), consolidateValue2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0600400000"), r2);
      var w2 = weightByCode("RI0600400101");
      var sxb2 = s2 * w2 * 1.0;

      // RI0600400102
      var numerator3 = findConsolidateByCode("SI06009000");
      var denominator3 = findConsolidateByCode("SI06007000");
      if (denominator3 == 0) { denominator3 = 1; }
      var result3 = numerator3 / denominator3;
      var r3 = ratingByThreshold(thresholdByCode("RI0600400000"), result3);
      var s3 = scoreByRating(scoreFormulaByCode("RI0600400000"), r3);
      var w3 = weightByCode("RI0600400102");
      var sxb3 = s3 * w3 * 1.0;

      var total = sxb1 + sxb2 + sxb3;
      return total;
$$
WHERE profile_id = 'RI0600400000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI06010000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600400000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0600400000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI06010000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600400000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI06010000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0600400200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI06008000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600400101"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0600400101"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI06008000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600400101"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI06008000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0600400101';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI06009000");
        var denominator = findConsolidateByCode("SI06007000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        var r = ratingByThreshold(thresholdByCode("RI0600400102"), result);
        
        var s = scoreByRating(scoreFormulaByCode("RI0600400102"), r);
        
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI06009000");
        var denominator = findConsolidateByCode("SI06007000");
        if (denominator == 0) { return 0; }
        
        var result = numerator / denominator;
        
        var r = ratingByThreshold(thresholdByCode("RI0600400102"), result);
        
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI06009000");
        var denominator = findConsolidateByCode("SI06007000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0600400102';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI1100100100
      var numerator1 = findConsolidateByCode("SI10001000");
      var denominator1 = findConsolidateByCode("SI10002000");
      if (denominator1 == 0) { denominator1 = 1; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI1100100000"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI1100100000"), r1);
      var w1 = weightByCode("RI1100100100");
      var sxb1 = s1 * w1 * 1.0;

      // RI1100100200
      var numerator2 = findConsolidateByCode("SI10003000");
      var denominator2 = findConsolidateByCode("SI10002000");
      if (denominator2 == 0) { denominator2 = 1; }
      var result2 = numerator2 / denominator2;
      var r2 = ratingByThreshold(thresholdByCode("RI1100100000"), result2);
      var s2 = scoreByRating(scoreFormulaByCode("RI1100100000"), r2);
      var w2 = weightByCode("RI1100100200");
      var sxb2 = s2 * w2 * 1.0;

      var total = sxb1 + sxb2;
      return total;
$$
WHERE profile_id = 'RI1100100000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI10003000");
        var denominator = findConsolidateByCode("SI10002000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1100100000"), result);
        var s = scoreByRating(scoreFormulaByCode("RI1100100000"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI10003000");
        var denominator = findConsolidateByCode("SI10002000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1100100000"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI10003000");
        var denominator = findConsolidateByCode("SI10002000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1100100200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI10001000");
        var denominator = findConsolidateByCode("SI10002000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1100100100"), result);
        var s = scoreByRating(scoreFormulaByCode("RI1100100100"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI10001000");
        var denominator = findConsolidateByCode("SI10002000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1100100100"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI10001000");
        var denominator = findConsolidateByCode("SI10002000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1100100100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0300300100: SI03020000 / SI03021000
      var numerator1 = findConsolidateByCode("SI03020000");
      var denominator1 = findConsolidateByCode("SI03021000");
      if (denominator1 == 0) { denominator1 = 1; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI0300300000"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0300300000"), r1);
      var w1 = weightByCode("RI0300300100");
      var sxb1 = s1 * w1 * 1.0;
      
      var totalScore = sxb1;
      
      return totalScore;
$$
WHERE profile_id = 'RI0300300000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI03020000");
        var denominator = findConsolidateByCode("SI03021000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300300100"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0300300100"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI03020000");
        var denominator = findConsolidateByCode("SI03021000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300300100"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI03020000");
        var denominator = findConsolidateByCode("SI03021000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0300300100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0600300200
      var numerator1 = findConsolidateByCode("SI06006000");
      var denominator1 = findConsolidateByCode("SI06007000");
      if (denominator1 == 0) { denominator1 = 1; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI0600300000"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0600300000"), r1);
      var w1 = weightByCode("RI0600300200");
      var sxb1 = s1 * w1 * 1.0;

      // RI0600300100
      var consolidateValue2 = findConsolidateByCode("SI06005000");
      var r2 = ratingByThreshold(thresholdByCode("RI0600300000"), consolidateValue2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0600300000"), r2);
      var w2 = weightByCode("RI0600300100");
      var sxb2 = s2 * w2 * 1.0;

      var total = sxb1 + sxb2;
      return total;
$$
WHERE profile_id = 'RI0600300000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI06006000");
        var denominator = findConsolidateByCode("SI06007000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        var r = ratingByThreshold(thresholdByCode("RI0600300000"), result);
        
        var s = scoreByRating(scoreFormulaByCode("RI0600300000"), r);
        
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI06006000");
        var denominator = findConsolidateByCode("SI06007000");
        if (denominator == 0) { return 0; }
        
        var result = numerator / denominator;
        
        var r = ratingByThreshold(thresholdByCode("RI0600300000"), result);
        
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI06006000");
        var denominator = findConsolidateByCode("SI06007000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0600300200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI06005000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600300100"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0600300100"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI06005000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600300100"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI06005000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0600300100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0900300100
      var consolidateValue1 = findConsolidateByCode("SI09019000");
      var r1 = ratingByThreshold(thresholdByCode("RI0900300000"), consolidateValue1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0900300000"), r1);
      var w1 = weightByCode("RI0900300100");
      var sxb1 = s1 * w1 * 1.0;

      // RI0900300200
      var consolidateValue2 = findConsolidateByCode("SI09020000");
      var r2 = ratingByThreshold(thresholdByCode("RI0900300000"), consolidateValue2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0900300000"), r2);
      var w2 = weightByCode("RI0900300200");
      var sxb2 = s2 * w2 * 1.0;

      // RI0900300300
      var consolidateValue3 = findConsolidateByCode("SI09021000");
      var r3 = ratingByThreshold(thresholdByCode("RI0900300000"), consolidateValue3);
      var s3 = scoreByRating(scoreFormulaByCode("RI0900300000"), r3);
      var w3 = weightByCode("RI0900300300");
      var sxb3 = s3 * w3 * 1.0;

      // RI0900300400
      var consolidateValue4 = findConsolidateByCode("SI09022000");
      var r4 = ratingByThreshold(thresholdByCode("RI0900300000"), consolidateValue4);
      var s4 = scoreByRating(scoreFormulaByCode("RI0900300000"), r4);
      var w4 = weightByCode("RI0900300400");
      var sxb4 = s4 * w4 * 1.0;

      // RI0900300500
      var consolidateValue5 = findConsolidateByCode("SI09023000");
      var r5 = ratingByThreshold(thresholdByCode("RI0900300000"), consolidateValue5);
      var s5 = scoreByRating(scoreFormulaByCode("RI0900300000"), r5);
      var w5 = weightByCode("RI0900300500");
      var sxb5 = s5 * w5 * 1.0;

      var total = sxb1 + sxb2 + sxb3 + sxb4 + sxb5;
      return total;
$$
WHERE profile_id = 'RI0900300000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI09022000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900300000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0900300000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI09022000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900300000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI09022000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900300400';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI09021000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900300300"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0900300300"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI09021000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900300300"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI09021000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900300300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI09020000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900300200"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0900300200"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI09020000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900300200"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI09020000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900300200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI09023000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900300500"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0900300500"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI09023000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900300500"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI09023000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900300500';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI09019000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900300100"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0900300100"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI09019000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900300100"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI09019000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900300100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0300200100: SI03011000 / SI03003000
      var numerator1 = findConsolidateByCode("SI03011000");
      var denominator1 = findConsolidateByCode("SI03003000");
      if (denominator1 == 0) { denominator1 = 1; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI0300200000"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0300200000"), r1);
      var w1 = weightByCode("RI0300200100");
      var sxb1 = s1 * w1 * 1.0;
      
      // RI0300200200: SI03012000 / SI03013000
      var numerator2 = findConsolidateByCode("SI03012000");
      var denominator2 = findConsolidateByCode("SI03013000");
      if (denominator2 == 0) { denominator2 = 1; }
      var result2 = numerator2 / denominator2;
      var r2 = ratingByThreshold(thresholdByCode("RI0300200000"), result2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0300200000"), r2);
      var w2 = weightByCode("RI0300200200");
      var sxb2 = s2 * w2 * 1.0;
      
      var totalScore = sxb1 + sxb2;
      
      return totalScore;
$$
WHERE profile_id = 'RI0300200000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI03012000");
        var denominator = findConsolidateByCode("SI03013000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300200000"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0300200000"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI03012000");
        var denominator = findConsolidateByCode("SI03013000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300200000"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI03012000");
        var denominator = findConsolidateByCode("SI03013000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0300200200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI03011000");
        var denominator = findConsolidateByCode("SI03003000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300200100"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0300200100"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI03011000");
        var denominator = findConsolidateByCode("SI03003000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300200100"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI03011000");
        var denominator = findConsolidateByCode("SI03003000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0300200100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0600200200
      var consolidateValue1 = findConsolidateByCode("SI06004000");
      var r1 = ratingByThreshold(thresholdByCode("RI0600200000"), consolidateValue1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0600200000"), r1);
      var w1 = weightByCode("RI0600200200");
      var sxb1 = s1 * w1 * 1.0;

      // RI0600200100
      var consolidateValue2 = findConsolidateByCode("SI06003000");
      var r2 = ratingByThreshold(thresholdByCode("RI0600200000"), consolidateValue2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0600200000"), r2);
      var w2 = weightByCode("RI0600200100");
      var sxb2 = s2 * w2 * 1.0;

      var total = sxb1 + sxb2;
      return total;
$$
WHERE profile_id = 'RI0600200000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI06004000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600200000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0600200000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI06004000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600200000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI06004000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0600200200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI06003000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600200100"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0600200100"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI06003000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600200100"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI06003000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0600200100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0900200100
      var consolidateValue1 = findConsolidateByCode("SI09016000");
      var r1 = ratingByThreshold(thresholdByCode("RI0900200000"), consolidateValue1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0900200000"), r1);
      var w1 = weightByCode("RI0900200100");
      var sxb1 = s1 * w1 * 1.0;

      // RI0900200200
      var consolidateValue2 = findConsolidateByCode("SI09017000");
      var r2 = ratingByThreshold(thresholdByCode("RI0900200000"), consolidateValue2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0900200000"), r2);
      var w2 = weightByCode("RI0900200200");
      var sxb2 = s2 * w2 * 1.0;

      // RI0900200300
      var consolidateValue3 = findConsolidateByCode("SI09018000");
      var r3 = ratingByThreshold(thresholdByCode("RI0900200000"), consolidateValue3);
      var s3 = scoreByRating(scoreFormulaByCode("RI0900200000"), r3);
      var w3 = weightByCode("RI0900200300");
      var sxb3 = s3 * w3 * 1.0;

      var total = sxb1 + sxb2 + sxb3;
      return total;
$$
WHERE profile_id = 'RI0900200000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI09018000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900200000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0900200000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI09018000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900200000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI09018000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900200300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI09017000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900200200"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0900200200"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI09017000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900200200"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI09017000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900200200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI09016000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900200100"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0900200100"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI09016000");
        
        var r = ratingByThreshold(thresholdByCode("RI0900200100"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI09016000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900200100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0300100100: (SI03001000 + SI03002000) / SI03003000
      var a1 = findConsolidateByCode("SI03001000");
      var b1 = findConsolidateByCode("SI03002000");
      var c1 = findConsolidateByCode("SI03003000");
      var numerator1 = a1 + b1;
      var denominator1 = c1;
      if (denominator1 == 0) { denominator1 = 1; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI0300100000"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0300100000"), r1);
      var w1 = weightByCode("RI0300100100");
      var sxb1 = s1 * w1 * 1.0;
      
      // RI0300100200: (SI03001000 + SI03002000) / SI03004000
      var a2 = findConsolidateByCode("SI03001000");
      var b2 = findConsolidateByCode("SI03002000");
      var c2 = findConsolidateByCode("SI03004000");
      var numerator2 = a2 + b2;
      var denominator2 = c2;
      if (denominator2 == 0) { denominator2 = 1; }
      var result2 = numerator2 / denominator2;
      var r2 = ratingByThreshold(thresholdByCode("RI0300100000"), result2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0300100000"), r2);
      var w2 = weightByCode("RI0300100200");
      var sxb2 = s2 * w2 * 1.0;
      
      // RI0300100300: (SI03001000 + SI03002000) / SI03005000
      var a3 = findConsolidateByCode("SI03001000");
      var b3 = findConsolidateByCode("SI03002000");
      var c3 = findConsolidateByCode("SI03005000");
      var numerator3 = a3 + b3;
      var denominator3 = c3;
      if (denominator3 == 0) { denominator3 = 1; }
      var result3 = numerator3 / denominator3;
      var r3 = ratingByThreshold(thresholdByCode("RI0300100000"), result3);
      var s3 = scoreByRating(scoreFormulaByCode("RI0300100000"), r3);
      var w3 = weightByCode("RI0300100300");
      var sxb3 = s3 * w3 * 1.0;
      
      // RI0300100400: SI03001000 / SI03006000
      var numerator4 = findConsolidateByCode("SI03001000");
      var denominator4 = findConsolidateByCode("SI03006000");
      if (denominator4 == 0) { denominator4 = 1; }
      var result4 = numerator4 / denominator4;
      var r4 = ratingByThreshold(thresholdByCode("RI0300100000"), result4);
      var s4 = scoreByRating(scoreFormulaByCode("RI0300100000"), r4);
      var w4 = weightByCode("RI0300100400");
      var sxb4 = s4 * w4 * 1.0;
      
      // RI0300100500: SI03005000 / SI03007000
      var numerator5 = findConsolidateByCode("SI03005000");
      var denominator5 = findConsolidateByCode("SI03007000");
      if (denominator5 == 0) { denominator5 = 1; }
      var result5 = numerator5 / denominator5;
      var r5 = ratingByThreshold(thresholdByCode("RI0300100000"), result5);
      var s5 = scoreByRating(scoreFormulaByCode("RI0300100000"), r5);
      var w5 = weightByCode("RI0300100500");
      var sxb5 = s5 * w5 * 1.0;
      
      // RI0300100600: ((SI03005000 - (SI03001000 + SI03002000)) / (SI03008000 - (SI03001000 + SI03002000))
      var a6 = findConsolidateByCode("SI03005000");
      var b6 = findConsolidateByCode("SI03001000");
      var c6 = findConsolidateByCode("SI03002000");
      var d6 = findConsolidateByCode("SI03008000");
      var asetLikuid6 = b6 + c6;
      var numerator6 = a6 - asetLikuid6;
      var denominator6 = d6 - asetLikuid6;
      if (denominator6 == 0) { denominator6 = 1; }
      var result6 = numerator6 / denominator6;
      var r6 = ratingByThreshold(thresholdByCode("RI0300100000"), result6);
      var s6 = scoreByRating(scoreFormulaByCode("RI0300100000"), r6);
      var w6 = weightByCode("RI0300100600");
      var sxb6 = s6 * w6 * 1.0;
      
      // RI0300100700: (SI03009000 + SI03010000) / (SI03001000 + SI03002000)
      var a7 = findConsolidateByCode("SI03009000");
      var b7 = findConsolidateByCode("SI03010000");
      var c7 = findConsolidateByCode("SI03001000");
      var d7 = findConsolidateByCode("SI03002000");
      var numerator7 = a7 + b7;
      var denominator7 = c7 + d7;
      if (denominator7 == 0) { denominator7 = 1; }
      var result7 = numerator7 / denominator7;
      var r7 = ratingByThreshold(thresholdByCode("RI0300100000"), result7);
      var s7 = scoreByRating(scoreFormulaByCode("RI0300100000"), r7);
      var w7 = weightByCode("RI0300100700");
      var sxb7 = s7 * w7 * 1.0;
      
      var totalScore = sxb1 + sxb2 + sxb3 + sxb4 + sxb5 + sxb6 + sxb7;
      
      return totalScore;
$$
WHERE profile_id = 'RI0300100000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var a = findConsolidateByCode("SI03001000");
        var b = findConsolidateByCode("SI03002000");
        var c = findConsolidateByCode("SI03003000");
        var numerator = a + b;
        var denominator = c;
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100000"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0300100000"), r);
        return s;
$$,
    rating_rule = $$
var a = findConsolidateByCode("SI03001000");
        var b = findConsolidateByCode("SI03002000");
        var c = findConsolidateByCode("SI03003000");
        var numerator = a + b;
        var denominator = c;
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100000"), result);
        return r;
$$,
    value_rule = $$
var a = findConsolidateByCode("SI03001000");
        var b = findConsolidateByCode("SI03002000");
        var c = findConsolidateByCode("SI03003000");
        var numerator = a + b;
        var denominator = c;
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0300100100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI03001000");
        var denominator = findConsolidateByCode("SI03006000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100400"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0300100400"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI03001000");
        var denominator = findConsolidateByCode("SI03006000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100400"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI03001000");
        var denominator = findConsolidateByCode("SI03006000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0300100400';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var a = findConsolidateByCode("SI03009000");
        var b = findConsolidateByCode("SI03010000");
        var c = findConsolidateByCode("SI03001000");
        var d = findConsolidateByCode("SI03002000");
        var numerator = a + b;
        var denominator = c + d;
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100700"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0300100700"), r);
        return s;
$$,
    rating_rule = $$
var a = findConsolidateByCode("SI03009000");
        var b = findConsolidateByCode("SI03010000");
        var c = findConsolidateByCode("SI03001000");
        var d = findConsolidateByCode("SI03002000");
        var numerator = a + b;
        var denominator = c + d;
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100700"), result);
        return r;
$$,
    value_rule = $$
var a = findConsolidateByCode("SI03009000");
        var b = findConsolidateByCode("SI03010000");
        var c = findConsolidateByCode("SI03001000");
        var d = findConsolidateByCode("SI03002000");
        var numerator = a + b;
        var denominator = c + d;
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0300100700';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var a = findConsolidateByCode("SI03001000");
        var b = findConsolidateByCode("SI03002000");
        var c = findConsolidateByCode("SI03005000");
        var numerator = a + b;
        var denominator = c;
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100300"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0300100300"), r);
        return s;
$$,
    rating_rule = $$
var a = findConsolidateByCode("SI03001000");
        var b = findConsolidateByCode("SI03002000");
        var c = findConsolidateByCode("SI03005000");
        var numerator = a + b;
        var denominator = c;
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100300"), result);
        return r;
$$,
    value_rule = $$
var a = findConsolidateByCode("SI03001000");
        var b = findConsolidateByCode("SI03002000");
        var c = findConsolidateByCode("SI03005000");
        var numerator = a + b;
        var denominator = c;
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0300100300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var a = findConsolidateByCode("SI03005000");
        var b = findConsolidateByCode("SI03001000");
        var c = findConsolidateByCode("SI03002000");
        var d = findConsolidateByCode("SI03008000");
        var asetLikuid = b + c;
        var numerator = a - asetLikuid;
        var denominator = d - asetLikuid;
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100600"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0300100600"), r);
        return s;
$$,
    rating_rule = $$
var a = findConsolidateByCode("SI03005000");
        var b = findConsolidateByCode("SI03001000");
        var c = findConsolidateByCode("SI03002000");
        var d = findConsolidateByCode("SI03008000");
        var asetLikuid = b + c;
        var numerator = a - asetLikuid;
        var denominator = d - asetLikuid;
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100600"), result);
        return r;
$$,
    value_rule = $$
var a = findConsolidateByCode("SI03005000");
        var b = findConsolidateByCode("SI03001000");
        var c = findConsolidateByCode("SI03002000");
        var d = findConsolidateByCode("SI03008000");
        var asetLikuid = b + c;
        var numerator = a - asetLikuid;
        var denominator = d - asetLikuid;
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0300100600';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var a = findConsolidateByCode("SI03001000");
        var b = findConsolidateByCode("SI03002000");
        var c = findConsolidateByCode("SI03004000");
        var numerator = a + b;
        var denominator = c;
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100200"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0300100200"), r);
        return s;
$$,
    rating_rule = $$
var a = findConsolidateByCode("SI03001000");
        var b = findConsolidateByCode("SI03002000");
        var c = findConsolidateByCode("SI03004000");
        var numerator = a + b;
        var denominator = c;
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100200"), result);
        return r;
$$,
    value_rule = $$
var a = findConsolidateByCode("SI03001000");
        var b = findConsolidateByCode("SI03002000");
        var c = findConsolidateByCode("SI03004000");
        var numerator = a + b;
        var denominator = c;
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0300100200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI03005000");
        var denominator = findConsolidateByCode("SI03007000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100500"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0300100500"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI03005000");
        var denominator = findConsolidateByCode("SI03007000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0300100500"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI03005000");
        var denominator = findConsolidateByCode("SI03007000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0300100500';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0600100100
      var consolidateValue1 = findConsolidateByCode("SI06001000");
      var r1 = ratingByThreshold(thresholdByCode("RI0600100000"), consolidateValue1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0600100000"), r1);
      var w1 = weightByCode("RI0600100100");
      var sxb1 = s1 * w1 * 1.0;

      // RI0600100200
      var consolidateValue2 = findConsolidateByCode("SI06002000");
      var r2 = ratingByThreshold(thresholdByCode("RI0600100000"), consolidateValue2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0600100000"), r2);
      var w2 = weightByCode("RI0600100200");
      var sxb2 = s2 * w2 * 1.0;

      var total = sxb1 + sxb2;
      return total;
$$
WHERE profile_id = 'RI0600100000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI06001000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600100000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0600100000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI06001000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600100000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI06001000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0600100100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI06002000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600100200"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0600100200"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI06002000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600100200"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI06002000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0600100200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0900100100
      var numerator1 = findConsolidateByCode("SI09001000");
      var denominator1 = findConsolidateByCode("SI09002000");
      if (denominator1 == 0) { denominator1 = 1; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI0900100000"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0900100000"), r1);
      var w1 = weightByCode("RI0900100100");
      var sxb1 = s1 * w1 * 1.0;

      // RI0900100200
      var numerator2 = findConsolidateByCode("SI09003000");
      var denominator2 = findConsolidateByCode("SI09004000");
      if (denominator2 == 0) { denominator2 = 1; }
      var result2 = numerator2 / denominator2;
      var r2 = ratingByThreshold(thresholdByCode("RI0900100000"), result2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0900100000"), r2);
      var w2 = weightByCode("RI0900100200");
      var sxb2 = s2 * w2 * 1.0;

      // RI0900100300
      var numerator3 = findConsolidateByCode("SI09005000");
      var denominator3 = findConsolidateByCode("SI09002000");
      if (denominator3 == 0) { denominator3 = 1; }
      var result3 = numerator3 / denominator3;
      var r3 = ratingByThreshold(thresholdByCode("RI0900100000"), result3);
      var s3 = scoreByRating(scoreFormulaByCode("RI0900100000"), r3);
      var w3 = weightByCode("RI0900100300");
      var sxb3 = s3 * w3 * 1.0;

      // RI0900100400
      var numerator4 = findConsolidateByCode("SI09006000");
      var denominator4 = findConsolidateByCode("SI09002000");
      if (denominator4 == 0) { denominator4 = 1; }
      var result4 = numerator4 / denominator4;
      var r4 = ratingByThreshold(thresholdByCode("RI0900100000"), result4);
      var s4 = scoreByRating(scoreFormulaByCode("RI0900100000"), r4);
      var w4 = weightByCode("RI0900100400");
      var sxb4 = s4 * w4 * 1.0;

      // RI0900100500
      var numerator5 = findConsolidateByCode("SI09007000");
      var denominator5 = findConsolidateByCode("SI09008000");
      if (denominator5 == 0) { denominator5 = 1; }
      var result5 = numerator5 / denominator5;
      var r5 = ratingByThreshold(thresholdByCode("RI0900100000"), result5);
      var s5 = scoreByRating(scoreFormulaByCode("RI0900100000"), r5);
      var w5 = weightByCode("RI0900100500");
      var sxb5 = s5 * w5 * 1.0;

      // RI0900100600
      var numerator6 = findConsolidateByCode("SI09009000");
      var denominator6 = findConsolidateByCode("SI09008000");
      if (denominator6 == 0) { denominator6 = 1; }
      var result6 = numerator6 / denominator6;
      var r6 = ratingByThreshold(thresholdByCode("RI0900100000"), result6);
      var s6 = scoreByRating(scoreFormulaByCode("RI0900100000"), r6);
      var w6 = weightByCode("RI0900100600");
      var sxb6 = s6 * w6 * 1.0;

      // RI0900100700
      var numerator7 = findConsolidateByCode("SI09014000") + findConsolidateByCode("SI09010000") + findConsolidateByCode("SI09011000") + findConsolidateByCode("SI09012000") + findConsolidateByCode("SI09013000");
      var denominator7 = findConsolidateByCode("SI09003000");
      if (denominator7 == 0) { denominator7 = 1; }
      var result7 = numerator7 / denominator7;
      var r7 = ratingByThreshold(thresholdByCode("RI0900100000"), result7);
      var s7 = scoreByRating(scoreFormulaByCode("RI0900100000"), r7);
      var w7 = weightByCode("RI0900100700");
      var sxb7 = s7 * w7 * 1.0;

      // RI0900100800
      var consolidateValue8 = findConsolidateByCode("SI09015000");
      var r8 = ratingByThreshold(thresholdByCode("RI0900100000"), consolidateValue8);
      var s8 = scoreByRating(scoreFormulaByCode("RI0900100000"), r8);
      var w8 = weightByCode("RI0900100800");
      var sxb8 = s8 * w8 * 1.0;

      var total = sxb1 + sxb2 + sxb3 + sxb4 + sxb5 + sxb6 + sxb7 + sxb8;
      return total;
$$
WHERE profile_id = 'RI0900100000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI09001000");
        var denominator = findConsolidateByCode("SI09002000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100000"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0900100000"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI09001000");
        var denominator = findConsolidateByCode("SI09002000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100000"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI09001000");
        var denominator = findConsolidateByCode("SI09002000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900100100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0600200200
        var consolidateValue1 = findConsolidateByCode("SI06004000");
        var r1 = ratingByThreshold(thresholdByCode("RI0900100800"), consolidateValue1);
        var s1 = scoreByRating(scoreFormulaByCode("RI0900100800"), r1);
        var w1 = weightByCode("RI0600200200");
        var sxb1 = s1 * w1 * 1.0;

        // RI0600200100
        var consolidateValue2 = findConsolidateByCode("SI06003000");
        var r2 = ratingByThreshold(thresholdByCode("RI0900100800"), consolidateValue2);
        var s2 = scoreByRating(scoreFormulaByCode("RI0900100800"), r2);
        var w2 = weightByCode("RI0600200100");
        var sxb2 = s2 * w2 * 1.0;

        var total = sxb1 + sxb2;
        return total;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI09015000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900100800';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI09006000");
        var denominator = findConsolidateByCode("SI09002000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100400"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0900100400"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI09006000");
        var denominator = findConsolidateByCode("SI09002000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100400"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI09006000");
        var denominator = findConsolidateByCode("SI09002000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900100400';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI09014000") + findConsolidateByCode("SI09010000") + findConsolidateByCode("SI09011000") + findConsolidateByCode("SI09012000") + findConsolidateByCode("SI09013000");
        var denominator = findConsolidateByCode("SI09003000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100700"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0900100700"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI09014000") + findConsolidateByCode("SI09010000") + findConsolidateByCode("SI09011000") + findConsolidateByCode("SI09012000") + findConsolidateByCode("SI09013000");
        var denominator = findConsolidateByCode("SI09003000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100700"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI09014000") + findConsolidateByCode("SI09010000") + findConsolidateByCode("SI09011000") + findConsolidateByCode("SI09012000") + findConsolidateByCode("SI09013000");
        var denominator = findConsolidateByCode("SI09003000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900100700';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI09005000");
        var denominator = findConsolidateByCode("SI09002000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100300"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0900100300"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI09005000");
        var denominator = findConsolidateByCode("SI09002000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100300"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI09005000");
        var denominator = findConsolidateByCode("SI09002000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900100300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI09009000");
        var denominator = findConsolidateByCode("SI09008000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100600"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0900100600"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI09009000");
        var denominator = findConsolidateByCode("SI09008000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100600"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI09009000");
        var denominator = findConsolidateByCode("SI09008000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900100600';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI09003000");
        var denominator = findConsolidateByCode("SI09004000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100200"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0900100200"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI09003000");
        var denominator = findConsolidateByCode("SI09004000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100200"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI09003000");
        var denominator = findConsolidateByCode("SI09004000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900100200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI09007000");
        var denominator = findConsolidateByCode("SI09008000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100500"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0900100500"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI09007000");
        var denominator = findConsolidateByCode("SI09008000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0900100500"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI09007000");
        var denominator = findConsolidateByCode("SI09008000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0900100500';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI1000100100
 var consolidateValue1 = findConsolidateByCode("SI10009000");
 var r1 = ratingByThreshold(thresholdByCode("RI1000100000"), consolidateValue1);
 var s1 = scoreByRating(scoreFormulaByCode("RI1000100000"), r1);
 var w1 = weightByCode("RI1000100100");
 var sxb1 = s1 * w1 * 1.0;

// RI1000100200 children
// RI1000100201
 var consolidateValue2 = findConsolidateByCode("SI10010000");
 var r2 = ratingByThreshold(thresholdByCode("RI1000100000"), consolidateValue2);
 var s2 = scoreByRating(scoreFormulaByCode("RI1000100000"), r2);
 var w2 = weightByCode("RI1000100201");
 var sxb2 = s2 * w2 * 1.0;

// RI1000100202
 var consolidateValue3 = findConsolidateByCode("SI10011000");
 var r3 = ratingByThreshold(thresholdByCode("RI1000100000"), consolidateValue3);
 var s3 = scoreByRating(scoreFormulaByCode("RI1000100000"), r3);
 var w3 = weightByCode("RI1000100202");
 var sxb3 = s3 * w3 * 1.0;

// RI1000100200 total
var total_RI1000100200 = sxb2 + sxb3;
var w_RI1000100200 = weightByCode("RI1000100200");
var sxb_RI1000100200 = total_RI1000100200 * w_RI1000100200 * 1.0;

// RI1000100300
 var consolidateValue4 = findConsolidateByCode("SI10012000");
 var r4 = ratingByThreshold(thresholdByCode("RI1000100000"), consolidateValue4);
 var s4 = scoreByRating(scoreFormulaByCode("RI1000100000"), r4);
 var w4 = weightByCode("RI1000100300");
 var sxb4 = s4 * w4 * 1.0;

// RI1000100400
 var consolidateValue5 = findConsolidateByCode("SI10013000");
 var r5 = ratingByThreshold(thresholdByCode("RI1000100000"), consolidateValue5);
 var s5 = scoreByRating(scoreFormulaByCode("RI1000100000"), r5);
 var w5 = weightByCode("RI1000100400");
 var sxb5 = s5 * w5 * 1.0;

// RI1000100000 total
var total = sxb1 + sxb_RI1000100200 + sxb4 + sxb5;
return total;
$$
WHERE profile_id = 'RI1000100000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI10009000");
        
        var r = ratingByThreshold(thresholdByCode("RI1000100000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI1000100000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI10009000");
        
        var r = ratingByThreshold(thresholdByCode("RI1000100000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI10009000");
        
        return consolidateValue * 1.0;
$$
WHERE profile_id = 'RI1000100100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI10013000");
        
        var r = ratingByThreshold(thresholdByCode("RI1000100400"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI1000100400"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI10013000");
        
        var r = ratingByThreshold(thresholdByCode("RI1000100400"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI10013000");
        
        return consolidateValue * 1.0;
$$
WHERE profile_id = 'RI1000100400';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI10012000");
        
        var r = ratingByThreshold(thresholdByCode("RI1000100300"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI1000100300"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI10012000");
        
        var r = ratingByThreshold(thresholdByCode("RI1000100300"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI10012000");
        
        return consolidateValue * 1.0;
$$
WHERE profile_id = 'RI1000100300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI1000100201
 var consolidateValue1 = findConsolidateByCode("SI10010000");
 var r1 = ratingByThreshold(thresholdByCode("RI1000100200"), consolidateValue1);
 var s1 = scoreByRating(scoreFormulaByCode("RI1000100200"), r1);
 var w1 = weightByCode("RI1000100201");
 var sxb1 = s1 * w1 * 1.0;

// RI1000100202
 var consolidateValue2 = findConsolidateByCode("SI10011000");
 var r2 = ratingByThreshold(thresholdByCode("RI1000100200"), consolidateValue2);
 var s2 = scoreByRating(scoreFormulaByCode("RI1000100200"), r2);
 var w2 = weightByCode("RI1000100202");
 var sxb2 = s2 * w2 * 1.0;

var total = sxb1 + sxb2;
return total;
$$
WHERE profile_id = 'RI1000100200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI10010000");
        
        var r = ratingByThreshold(thresholdByCode("RI1000100201"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI1000100201"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI10010000");
        
        var r = ratingByThreshold(thresholdByCode("RI1000100201"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI10010000");
        
        return consolidateValue * 1.0;
$$
WHERE profile_id = 'RI1000100201';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI10011000");
        
        var r = ratingByThreshold(thresholdByCode("RI1000100202"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI1000100202"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI10011000");
        
        var r = ratingByThreshold(thresholdByCode("RI1000100202"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI10011000");
        
        return consolidateValue * 1.0;
$$
WHERE profile_id = 'RI1000100202';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0600300200
      var numerator1 = findConsolidateByCode("SI06006000");
      var denominator1 = findConsolidateByCode("SI06007000");
      if (denominator1 == 0) { denominator1 = 1; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI0500300000"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0500300000"), r1);
      var w1 = weightByCode("RI0600300200");
      var sxb1 = s1 * w1 * 1.0;

      // RI0600300100
      var consolidateValue2 = findConsolidateByCode("SI06005000");
      var r2 = ratingByThreshold(thresholdByCode("RI0500300000"), consolidateValue2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0500300000"), r2);
      var w2 = weightByCode("RI0600300100");
      var sxb2 = s2 * w2 * 1.0;

      var total = sxb1 + sxb2;
      return total;
$$
WHERE profile_id = 'RI0500300000';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var numerator = findConsolidateByCode("SI05018000");
          var denominator = findConsolidateByCode("SI05019000");
          if (denominator == 0) { return 0; }
          var result = numerator / denominator;
          var r = ratingByThreshold(thresholdByCode("RI0500300000"), result);
          return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI05018000");
          var denominator = findConsolidateByCode("SI05019000");
          
          if (denominator == 0) {
          return 0.0;
        }
          
          var result = numerator / denominator;
          
          return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500300101';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var consolidateValue = findConsolidateByCode("SI05015000");
          var r = ratingByThreshold(thresholdByCode("RI0500300102"), consolidateValue);
          return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI05015000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500300102';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var consolidateValue = findConsolidateByCode("SI05016000");
        var r = ratingByThreshold(thresholdByCode("RI0500300200"), consolidateValue);
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI05016000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500300200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0800300100
      var consolidateValue1 = findConsolidateByCode("SI08007000");
      var r1 = ratingByThreshold(thresholdByCode("RI0800300000"), consolidateValue1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0800300000"), r1);
      var w1 = weightByCode("RI0800300100");
      var sxb1 = s1 * w1 * 1.0;

      var total = sxb1;
      return total;
$$
WHERE profile_id = 'RI0800300000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI08007000");
        
        var r = ratingByThreshold(thresholdByCode("RI0800300000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0800300000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI08007000");
        
        var r = ratingByThreshold(thresholdByCode("RI0800300000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI08007000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0800300100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0600400200
      var consolidateValue1 = findConsolidateByCode("SI06010000");
      var r1 = ratingByThreshold(thresholdByCode("RI1200300000"), consolidateValue1);
      var s1 = scoreByRating(scoreFormulaByCode("RI1200300000"), r1);
      var w1 = weightByCode("RI0600400200");
      var sxb1 = s1 * w1 * 1.0;

      // RI0600400101
      var consolidateValue2 = findConsolidateByCode("SI06008000");
      var r2 = ratingByThreshold(thresholdByCode("RI1200300000"), consolidateValue2);
      var s2 = scoreByRating(scoreFormulaByCode("RI1200300000"), r2);
      var w2 = weightByCode("RI0600400101");
      var sxb2 = s2 * w2 * 1.0;

      // RI0600400102
      var numerator3 = findConsolidateByCode("SI06009000");
      var denominator3 = findConsolidateByCode("SI06007000");
      if (denominator3 == 0) { denominator3 = 1; }
      var result3 = numerator3 / denominator3;
      var r3 = ratingByThreshold(thresholdByCode("RI1200300000"), result3);
      var s3 = scoreByRating(scoreFormulaByCode("RI1200300000"), r3);
      var w3 = weightByCode("RI0600400102");
      var sxb3 = s3 * w3 * 1.0;

      var total = sxb1 + sxb2 + sxb3;
      return total;
$$
WHERE profile_id = 'RI1200300000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI12011000");
        var denominator = findConsolidateByCode("SI12012000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200300000"), result);
        var s = scoreByRating(scoreFormulaByCode("RI1200300000"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI12011000");
        var denominator = findConsolidateByCode("SI12012000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200300000"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI12011000");
        var denominator = findConsolidateByCode("SI12012000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1200300200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI12009000");
        var denominator = findConsolidateByCode("SI12010000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200300100"), result);
        var s = scoreByRating(scoreFormulaByCode("RI1200300100"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI12009000");
        var denominator = findConsolidateByCode("SI12010000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200300100"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI12009000");
        var denominator = findConsolidateByCode("SI12010000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1200300100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI12013000");
        var denominator = findConsolidateByCode("SI12014000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200300300"), result);
        var s = scoreByRating(scoreFormulaByCode("RI1200300300"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI12013000");
        var denominator = findConsolidateByCode("SI12014000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200300300"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI12013000");
        var denominator = findConsolidateByCode("SI12014000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1200300300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0200200100: SI02020000
      var cv1 = findConsolidateByCode("SI02020000");
      var r1 = ratingByThreshold(thresholdByCode("RI0200200000"), cv1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0200200000"), r1);
      var w1 = weightByCode("RI0200200100");
      var res1 = s1 * w1 * 1.0;

      // RI0200200200: SI02021000
      var cv2 = findConsolidateByCode("SI02021000");
      var r2 = ratingByThreshold(thresholdByCode("RI0200200000"), cv2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0200200000"), r2);
      var w2 = weightByCode("RI0200200200");
      var res2 = s2 * w2 * 1.0;

      // RI0200200300: SI02022000 / SI02023000
      var n3 = findConsolidateByCode("SI02022000");
      var d3 = findConsolidateByCode("SI02023000");
      if (d3 == 0) { d3 = 1; }
      var r3val = n3 / d3;
      var r3 = ratingByThreshold(thresholdByCode("RI0200200000"), r3val);
      var s3 = scoreByRating(scoreFormulaByCode("RI0200200000"), r3);
      var w3 = weightByCode("RI0200200300");
      var res3 = s3 * w3 * 1.0;

      // RI0200200400: SI02025000
      var cv4 = findConsolidateByCode("SI02025000");
      var r4 = ratingByThreshold(thresholdByCode("RI0200200000"), cv4);
      var s4 = scoreByRating(scoreFormulaByCode("RI0200200000"), r4);
      var w4 = weightByCode("RI0200200400");
      var res4 = s4 * w4 * 1.0;

      // RI0200200500: SI02026000 / SI02001000
      var n5 = findConsolidateByCode("SI02026000");
      var d5 = findConsolidateByCode("SI02001000");
      if (d5 == 0) { d5 = 1; }
      var r5val = n5 / d5;
      var r5 = ratingByThreshold(thresholdByCode("RI0200200000"), r5val);
      var s5 = scoreByRating(scoreFormulaByCode("RI0200200000"), r5);
      var w5 = weightByCode("RI0200200500");
      var res5 = s5 * w5 * 1.0;

      // RI0200200600: SI02026000 / SI02027000
      var n6 = findConsolidateByCode("SI02026000");
      var d6 = findConsolidateByCode("SI02027000");
      if (d6 == 0) { d6 = 1; }
      var r6val = n6 / d6;
      var r6 = ratingByThreshold(thresholdByCode("RI0200200000"), r6val);
      var s6 = scoreByRating(scoreFormulaByCode("RI0200200000"), r6);
      var w6 = weightByCode("RI0200200600");
      var res6 = s6 * w6 * 1.0;

      // RI0200200700: SI02028000 / SI02001000
      var n7 = findConsolidateByCode("SI02028000");
      var d7 = findConsolidateByCode("SI02001000");
      if (d7 == 0) { d7 = 1; }
      var r7val = n7 / d7;
      var r7 = ratingByThreshold(thresholdByCode("RI0200200000"), r7val);
      var s7 = scoreByRating(scoreFormulaByCode("RI0200200000"), r7);
      var w7 = weightByCode("RI0200200700");
      var res7 = s7 * w7 * 1.0;

      // RI0200200800: SI02029000
      var cv8 = findConsolidateByCode("SI02029000");
      var r8 = ratingByThreshold(thresholdByCode("RI0200200000"), cv8);
      var s8 = scoreByRating(scoreFormulaByCode("RI0200200000"), r8);
      var w8 = weightByCode("RI0200200800");
      var res8 = s8 * w8 * 1.0;

      // RI0200200900: SI02028000 / SI02027000
      var n9 = findConsolidateByCode("SI02028000");
      var d9 = findConsolidateByCode("SI02027000");
      if (d9 == 0) { d9 = 1; }
      var r9val = n9 / d9;
      var r9 = ratingByThreshold(thresholdByCode("RI0200200000"), r9val);
      var s9 = scoreByRating(scoreFormulaByCode("RI0200200000"), r9);
      var w9 = weightByCode("RI0200200900");
      var res9 = s9 * w9 * 1.0;

      // RI0200201000: SI02030000 / SI02008000
      var n10 = findConsolidateByCode("SI02030000");
      var d10 = findConsolidateByCode("SI02008000");
      if (d10 == 0) { d10 = 1; }
      var r10val = n10 / d10;
      var r10 = ratingByThreshold(thresholdByCode("RI0200200000"), r10val);
      var s10 = scoreByRating(scoreFormulaByCode("RI0200200000"), r10);
      var w10 = weightByCode("RI0200201000");
      var res10 = s10 * w10 * 1.0;

      // RI0200201100: SI02031000 / SI02032000
      var n11 = findConsolidateByCode("SI02031000");
      var d11 = findConsolidateByCode("SI02032000");
      if (d11 == 0) { d11 = 1; }
      var r11val = n11 / d11;
      var r11 = ratingByThreshold(thresholdByCode("RI0200200000"), r11val);
      var s11 = scoreByRating(scoreFormulaByCode("RI0200200000"), r11);
      var w11 = weightByCode("RI0200201100");
      var res11 = s11 * w11 * 1.0;

      // RI0200201200: SI02033000 / SI02030000
      var n12 = findConsolidateByCode("SI02033000");
      var d12 = findConsolidateByCode("SI02030000");
      if (d12 == 0) { d12 = 1; }
      var r12val = n12 / d12;
      var r12 = ratingByThreshold(thresholdByCode("RI0200200000"), r12val);
      var s12 = scoreByRating(scoreFormulaByCode("RI0200200000"), r12);
      var w12 = weightByCode("RI0200201200");
      var res12 = s12 * w12 * 1.0;

      // RI0200201300: (SI02023000 - SI02024000) / SI02024000
      var a13 = findConsolidateByCode("SI02023000");
      var b13 = findConsolidateByCode("SI02024000");
      var d13 = b13;
      if (d13 == 0) { d13 = 1; }
      var r13val = (a13 - b13) / d13;
      var r13 = ratingByThreshold(thresholdByCode("RI0200200000"), r13val);
      var s13 = scoreByRating(scoreFormulaByCode("RI0200200000"), r13);
      var w13 = weightByCode("RI0200201300");
      var res13 = s13 * w13 * 1.0;

      var total = res1 + res2 + res3 + res4 + res5 + res6 + res7 + res8 + res9 + res10 + res11 + res12 + res13;
      return total;
$$
WHERE profile_id = 'RI0200200000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI02028000");
            var denominator = findConsolidateByCode("SI02027000");
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200200900"), consolidateValue);
        
            var s = scoreByRating(scoreFormulaByCode("RI0200200900"), r);
        
            return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI02028000");
            var denominator = findConsolidateByCode("SI02027000");
        
            if (denominator == 0) {
          return 0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200200900"), consolidateValue);
        
            return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI02028000");
            var denominator = findConsolidateByCode("SI02027000");
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
    2:76
    3:60
    4:44
    5:28
$$
WHERE profile_id = 'RI0200200900';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI02026000");
            var denominator = findConsolidateByCode("SI02027000");
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200200600"), consolidateValue);
        
            var s = scoreByRating(scoreFormulaByCode("RI0200200600"), r);
        
            return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI02026000");
            var denominator = findConsolidateByCode("SI02027000");
        
            if (denominator == 0) {
          return 0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200200600"), consolidateValue);
        
            return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI02026000");
            var denominator = findConsolidateByCode("SI02027000");
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
    2:76
    3:60
    4:44
    5:28
$$
WHERE profile_id = 'RI0200200600';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI02020000");
        
              var r = ratingByThreshold(thresholdByCode("RI0200200100"), consolidateValue);
        
              var s = scoreByRating(scoreFormulaByCode("RI0200200100"), r);
        
              return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI02020000");
        
              var r = ratingByThreshold(thresholdByCode("RI0200200100"), consolidateValue);
        
              return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI02020000");
        
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RI0200200100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI02030000");
            var denominator = findConsolidateByCode("SI02008000");
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200201000"), consolidateValue);
        
            var s = scoreByRating(scoreFormulaByCode("RI0200201000"), r);
        
            return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI02030000");
            var denominator = findConsolidateByCode("SI02008000");
        
            if (denominator == 0) {
          return 0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200201000"), consolidateValue);
        
            return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI02030000");
            var denominator = findConsolidateByCode("SI02008000");
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
    2:76
    3:60
    4:44
    5:28
$$
WHERE profile_id = 'RI0200201000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI02028000");
              var denominator = findConsolidateByCode("SI02001000");
        
              if (denominator == 0) {
          return 0.0;
        }
        
              var consolidateValue = numerator / denominator;
        
              var r = ratingByThreshold(thresholdByCode("RI0200200700"), consolidateValue);
        
              var s = scoreByRating(scoreFormulaByCode("RI0200200700"), r);
        
              return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI02028000");
              var denominator = findConsolidateByCode("SI02001000");
        
              if (denominator == 0) {
          return 0;
        }
        
              var consolidateValue = numerator / denominator;
        
              var r = ratingByThreshold(thresholdByCode("RI0200200700"), consolidateValue);
        
              return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI02028000");
              var denominator = findConsolidateByCode("SI02001000");
        
              if (denominator == 0) {
          return 0.0;
        }
        
              var consolidateValue = numerator / denominator;
        
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RI0200200700';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI02022000");
            var denominator = findConsolidateByCode("SI02023000");
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200200300"), consolidateValue);
        
            var s = scoreByRating(scoreFormulaByCode("RI0200200300"), r);
        
            return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI02022000");
            var denominator = findConsolidateByCode("SI02023000");
        
            if (denominator == 0) {
          return 0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200200300"), consolidateValue);
        
            return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI02022000");
            var denominator = findConsolidateByCode("SI02023000");
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
    2:76
    3:60
    4:44
    5:28
$$
WHERE profile_id = 'RI0200200300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var a = findConsolidateByCode("SI02023000");
            var b = findConsolidateByCode("SI02024000");
        
            var numerator = a - b;
            var denominator = b;
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200201300"), consolidateValue);
        
            var s = scoreByRating(scoreFormulaByCode("RI0200201300"), r);
        
            return s;
$$,
    rating_rule = $$
var a = findConsolidateByCode("SI02023000");
            var b = findConsolidateByCode("SI02024000");
        
            var numerator = a - b;
            var denominator = b;
        
            if (denominator == 0) {
          return 0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200201300"), consolidateValue);
        
            return r;
$$,
    value_rule = $$
var a = findConsolidateByCode("SI02023000");
            var b = findConsolidateByCode("SI02024000");
        
            var numerator = a - b;
            var denominator = b;
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
    2:76
    3:60
    4:44
    5:28
$$
WHERE profile_id = 'RI0200201300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI02033000");
            var denominator = findConsolidateByCode("SI02030000");
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200201200"), consolidateValue);
        
            var s = scoreByRating(scoreFormulaByCode("RI0200201200"), r);
        
            return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI02033000");
            var denominator = findConsolidateByCode("SI02030000");
        
            if (denominator == 0) {
          return 0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200201200"), consolidateValue);
        
            return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI02033000");
            var denominator = findConsolidateByCode("SI02030000");
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
    2:76
    3:60
    4:44
    5:28
$$
WHERE profile_id = 'RI0200201200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0500200200
 var consolidateValue1 = findConsolidateByCode("SI05008000");
 var r1 = ratingByThreshold(thresholdByCode("RI0500200000"), consolidateValue1);
 var s1 = scoreByRating(scoreFormulaByCode("RI0500200000"), r1);
 var w1 = weightByCode("RI0500200200");
 var sxb1 = s1 * w1 * 1.0;

// RI0500200500
 var consolidateValue2 = findConsolidateByCode("SI05011000");
 var r2 = ratingByThreshold(thresholdByCode("RI0500200000"), consolidateValue2);
 var s2 = scoreByRating(scoreFormulaByCode("RI0500200000"), r2);
 var w2 = weightByCode("RI0500200500");
 var sxb2 = s2 * w2 * 1.0;

// RI0500200100
 var consolidateValue3 = findConsolidateByCode("SI05007000");
 var r3 = ratingByThreshold(thresholdByCode("RI0500200000"), consolidateValue3);
 var s3 = scoreByRating(scoreFormulaByCode("RI0500200000"), r3);
 var w3 = weightByCode("RI0500200100");
 var sxb3 = s3 * w3 * 1.0;

// RI0500200800
 var consolidateValue4 = findConsolidateByCode("SI05014000");
 var r4 = ratingByThreshold(thresholdByCode("RI0500200000"), consolidateValue4);
 var s4 = scoreByRating(scoreFormulaByCode("RI0500200000"), r4);
 var w4 = weightByCode("RI0500200800");
 var sxb4 = s4 * w4 * 1.0;

// RI0500200400
 var consolidateValue5 = findConsolidateByCode("SI05010000");
 var r5 = ratingByThreshold(thresholdByCode("RI0500200000"), consolidateValue5);
 var s5 = scoreByRating(scoreFormulaByCode("RI0500200000"), r5);
 var w5 = weightByCode("RI0500200400");
 var sxb5 = s5 * w5 * 1.0;

// RI0500200700
 var consolidateValue6 = findConsolidateByCode("SI05013000");
 var r6 = ratingByThreshold(thresholdByCode("RI0500200000"), consolidateValue6);
 var s6 = scoreByRating(scoreFormulaByCode("RI0500200000"), r6);
 var w6 = weightByCode("RI0500200700");
 var sxb6 = s6 * w6 * 1.0;

// RI0500200300
 var consolidateValue7 = findConsolidateByCode("SI05009000");
 var r7 = ratingByThreshold(thresholdByCode("RI0500200000"), consolidateValue7);
 var s7 = scoreByRating(scoreFormulaByCode("RI0500200000"), r7);
 var w7 = weightByCode("RI0500200300");
 var sxb7 = s7 * w7 * 1.0;

// RI0500200600
 var consolidateValue8 = findConsolidateByCode("SI05012000");
 var r8 = ratingByThreshold(thresholdByCode("RI0500200000"), consolidateValue8);
 var s8 = scoreByRating(scoreFormulaByCode("RI0500200000"), r8);
 var w8 = weightByCode("RI0500200600");
 var sxb8 = s8 * w8 * 1.0;

// RI0500200000 total
var total = sxb1 + sxb2 + sxb3 + sxb4 + sxb5 + sxb6 + sxb7 + sxb8;
return total;
$$
WHERE profile_id = 'RI0500200000';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var consolidateValue = findConsolidateByCode("SI05008000");
        var r = ratingByThreshold(thresholdByCode("RI0500200000"), consolidateValue);
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI05008000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500200200';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var consolidateValue = findConsolidateByCode("SI05011000");
        var r = ratingByThreshold(thresholdByCode("RI0500200500"), consolidateValue);
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI05011000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500200500';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var consolidateValue = findConsolidateByCode("SI05007000");
        var r = ratingByThreshold(thresholdByCode("RI0500200100"), consolidateValue);
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI05007000");

        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500200100';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var consolidateValue = findConsolidateByCode("SI05014000");
        var r = ratingByThreshold(thresholdByCode("RI0500200800"), consolidateValue);
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI05014000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500200800';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var consolidateValue = findConsolidateByCode("SI05010000");
        var r = ratingByThreshold(thresholdByCode("RI0500200400"), consolidateValue);
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI05010000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500200400';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var consolidateValue = findConsolidateByCode("SI05013000");
        var r = ratingByThreshold(thresholdByCode("RI0500200700"), consolidateValue);
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI05013000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500200700';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var consolidateValue = findConsolidateByCode("SI05009000");
        var r = ratingByThreshold(thresholdByCode("RI0500200300"), consolidateValue);
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI05009000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500200300';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var consolidateValue = findConsolidateByCode("SI05012000");
        var r = ratingByThreshold(thresholdByCode("RI0500200600"), consolidateValue);
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI05012000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500200600';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0800200100
      var consolidateValue1 = findConsolidateByCode("SI08005000");
      var r1 = ratingByThreshold(thresholdByCode("RI0800200000"), consolidateValue1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0800200000"), r1);
      var w1 = weightByCode("RI0800200100");
      var sxb1 = s1 * w1 * 1.0;

      // RI0800200200
      var consolidateValue2 = findConsolidateByCode("SI08006000");
      var r2 = ratingByThreshold(thresholdByCode("RI0800200000"), consolidateValue2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0800200000"), r2);
      var w2 = weightByCode("RI0800200200");
      var sxb2 = s2 * w2 * 1.0;

      var total = sxb1 + sxb2;
      return total;
$$
WHERE profile_id = 'RI0800200000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI08006000");
        
        var r = ratingByThreshold(thresholdByCode("RI0800200000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0800200000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI08006000");
        
        var r = ratingByThreshold(thresholdByCode("RI0800200000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI08006000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0800200200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI08005000");
        
        var r = ratingByThreshold(thresholdByCode("RI0800200100"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0800200100"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI08005000");
        
        var r = ratingByThreshold(thresholdByCode("RI0800200100"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI08005000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0800200100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI1200200100
      var numerator1 = findConsolidateByCode("SI12003000");
      var denominator1 = findConsolidateByCode("SI12004000");
      if (denominator1 == 0) { denominator1 = 1; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI1200200000"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI1200200000"), r1);
      var w1 = weightByCode("RI1200200100");
      var sxb1 = s1 * w1 * 1.0;

      // RI1200200200
      var numerator2 = findConsolidateByCode("SI12005000");
      var denominator2 = findConsolidateByCode("SI12006000");
      if (denominator2 == 0) { denominator2 = 1; }
      var result2 = numerator2 / denominator2;
      var r2 = ratingByThreshold(thresholdByCode("RI1200200000"), result2);
      var s2 = scoreByRating(scoreFormulaByCode("RI1200200000"), r2);
      var w2 = weightByCode("RI1200200200");
      var sxb2 = s2 * w2 * 1.0;

      // RI1200200300
      var numerator3 = findConsolidateByCode("SI12007000");
      var denominator3 = findConsolidateByCode("SI12008000");
      if (denominator3 == 0) { denominator3 = 1; }
      var result3 = numerator3 / denominator3;
      var r3 = ratingByThreshold(thresholdByCode("RI1200200000"), result3);
      var s3 = scoreByRating(scoreFormulaByCode("RI1200200000"), r3);
      var w3 = weightByCode("RI1200200300");
      var sxb3 = s3 * w3 * 1.0;

      var total = sxb1 + sxb2 + sxb3;
      return total;
$$
WHERE profile_id = 'RI1200200000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI12005000");
        var denominator = findConsolidateByCode("SI12006000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200200000"), result);
        var s = scoreByRating(scoreFormulaByCode("RI1200200000"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI12005000");
        var denominator = findConsolidateByCode("SI12006000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200200000"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI12005000");
        var denominator = findConsolidateByCode("SI12006000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1200200200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI12003000");
        var denominator = findConsolidateByCode("SI12004000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200200200"), result);
        var s = scoreByRating(scoreFormulaByCode("RI1200200200"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI12003000");
        var denominator = findConsolidateByCode("SI12004000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200200200"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI12003000");
        var denominator = findConsolidateByCode("SI12004000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1200200200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI12007000");
        var denominator = findConsolidateByCode("SI12008000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200200300"), result);
        var s = scoreByRating(scoreFormulaByCode("RI1200200300"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI12007000");
        var denominator = findConsolidateByCode("SI12008000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200200300"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI12007000");
        var denominator = findConsolidateByCode("SI12008000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1200200300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0200100100: (SI02002000 + SI02003000 + SI02004000) / SI02001000
      var a1 = findConsolidateByCode("SI02002000");
      var b1 = findConsolidateByCode("SI02003000");
      var c1 = findConsolidateByCode("SI02004000");
      var d1 = findConsolidateByCode("SI02001000");
      if (d1 == 0) { d1 = 1; }
      var r1val = (a1 + b1 + c1) / d1;
      var r1 = ratingByThreshold(thresholdByCode("RI0200100000"), r1val);
      var s1 = scoreByRating(scoreFormulaByCode("RI0200100000"), r1);
      var w1 = weightByCode("RI0200100100");
      var res1 = s1 * w1 * 1.0;

      // RI0200100200: (SI02005000 + SI02006000 + SI02007000) / SI02008000
      var a2 = findConsolidateByCode("SI02005000");
      var b2 = findConsolidateByCode("SI02006000");
      var c2 = findConsolidateByCode("SI02007000");
      var d2 = findConsolidateByCode("SI02008000");
      if (d2 == 0) { d2 = 1; }
      var r2val = (a2 + b2 + c2) / d2;
      var r2 = ratingByThreshold(thresholdByCode("RI0200100000"), r2val);
      var s2 = scoreByRating(scoreFormulaByCode("RI0200100000"), r2);
      var w2 = weightByCode("RI0200100200");
      var res2 = s2 * w2 * 1.0;

      // RI0200100300: SI02009000 / SI02001000
      var a3 = findConsolidateByCode("SI02009000");
      var d3 = findConsolidateByCode("SI02001000");
      if (d3 == 0) { d3 = 1; }
      var r3val = a3 / d3;
      var r3 = ratingByThreshold(thresholdByCode("RI0200100000"), r3val);
      var s3 = scoreByRating(scoreFormulaByCode("RI0200100000"), r3);
      var w3 = weightByCode("RI0200100300");
      var res3 = s3 * w3 * 1.0;

      // RI0200100400: SI02010000 / SI02011000
      var a4 = findConsolidateByCode("SI02010000");
      var d4 = findConsolidateByCode("SI02011000");
      if (d4 == 0) { d4 = 1; }
      var r4val = a4 / d4;
      var r4 = ratingByThreshold(thresholdByCode("RI0200100000"), r4val);
      var s4 = scoreByRating(scoreFormulaByCode("RI0200100000"), r4);
      var w4 = weightByCode("RI0200100400");
      var res4 = s4 * w4 * 1.0;

      // RI0200100500: SI02012000 / SI02001000
      var a5 = findConsolidateByCode("SI02012000");
      var d5 = findConsolidateByCode("SI02001000");
      if (d5 == 0) { d5 = 1; }
      var r5val = a5 / d5;
      var r5 = ratingByThreshold(thresholdByCode("RI0200100000"), r5val);
      var s5 = scoreByRating(scoreFormulaByCode("RI0200100000"), r5);
      var w5 = weightByCode("RI0200100500");
      var res5 = s5 * w5 * 1.0;

      // RI0200100600: SI02013000 / SI02014000
      var a6 = findConsolidateByCode("SI02013000");
      var d6 = findConsolidateByCode("SI02014000");
      if (d6 == 0) { d6 = 1; }
      var r6val = a6 / d6;
      var r6 = ratingByThreshold(thresholdByCode("RI0200100000"), r6val);
      var s6 = scoreByRating(scoreFormulaByCode("RI0200100000"), r6);
      var w6 = weightByCode("RI0200100600");
      var res6 = s6 * w6 * 1.0;

      // RI0200100700: SI02015000 / SI02014000
      var a7 = findConsolidateByCode("SI02015000");
      var d7 = findConsolidateByCode("SI02014000");
      if (d7 == 0) { d7 = 1; }
      var r7val = a7 / d7;
      var r7 = ratingByThreshold(thresholdByCode("RI0200100000"), r7val);
      var s7 = scoreByRating(scoreFormulaByCode("RI0200100000"), r7);
      var w7 = weightByCode("RI0200100700");
      var res7 = s7 * w7 * 1.0;

      // RI0200100800: SI02016000 / SI02001000
      var a8 = findConsolidateByCode("SI02016000");
      var d8 = findConsolidateByCode("SI02001000");
      if (d8 == 0) { d8 = 1; }
      var r8val = a8 / d8;
      var r8 = ratingByThreshold(thresholdByCode("RI0200100000"), r8val);
      var s8 = scoreByRating(scoreFormulaByCode("RI0200100000"), r8);
      var w8 = weightByCode("RI0200100800");
      var res8 = s8 * w8 * 1.0;

      // RI0200100900: SI02017000 / SI02018000
      var a9 = findConsolidateByCode("SI02017000");
      var d9 = findConsolidateByCode("SI02018000");
      if (d9 == 0) { d9 = 1; }
      var r9val = a9 / d9;
      var r9 = ratingByThreshold(thresholdByCode("RI0200100000"), r9val);
      var s9 = scoreByRating(scoreFormulaByCode("RI0200100000"), r9);
      var w9 = weightByCode("RI0200100900");
      var res9 = s9 * w9 * 1.0;

      // RI0200101000: SI02019000 / SI02014000
      var a10 = findConsolidateByCode("SI02019000");
      var d10 = findConsolidateByCode("SI02014000");
      if (d10 == 0) { d10 = 1; }
      var r10val = a10 / d10;
      var r10 = ratingByThreshold(thresholdByCode("RI0200100000"), r10val);
      var s10 = scoreByRating(scoreFormulaByCode("RI0200100000"), r10);
      var w10 = weightByCode("RI0200101000");
      var res10 = s10 * w10 * 1.0;

      var total = res1 + res2 + res3 + res4 + res5 + res6 + res7 + res8 + res9 + res10;
      return total;
$$
WHERE profile_id = 'RI0200100000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI02013000");
              var denominator = findConsolidateByCode("SI02014000");
        
              if (denominator == 0) {
          return 0.0;
        }
        
              var consolidateValue = numerator / denominator;
        
              var r = ratingByThreshold(thresholdByCode("RI0200100000"), consolidateValue);
        
              var s = scoreByRating(scoreFormulaByCode("RI0200100000"), r);
        
              return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI02013000");
              var denominator = findConsolidateByCode("SI02014000");
        
              if (denominator == 0) {
          return 0;
        }
        
              var consolidateValue = numerator / denominator;
        
              var r = ratingByThreshold(thresholdByCode("RI0200100000"), consolidateValue);
        
              return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI02013000");
              var denominator = findConsolidateByCode("SI02014000");
        
              if (denominator == 0) {
          return 0.0;
        }
        
              var consolidateValue = numerator / denominator;
        
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RI0200100600';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI02015000");
            var denominator = findConsolidateByCode("SI02014000");
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200100700"), consolidateValue);
        
            var s = scoreByRating(scoreFormulaByCode("RI0200100700"), r);
        
            return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI02015000");
            var denominator = findConsolidateByCode("SI02014000");
        
            if (denominator == 0) {
          return 0;
        }
        
            var consolidateValue = numerator / denominator;
        
            var r = ratingByThreshold(thresholdByCode("RI0200100700"), consolidateValue);
        
            return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI02015000");
            var denominator = findConsolidateByCode("SI02014000");
        
            if (denominator == 0) {
          return 0.0;
        }
        
            var consolidateValue = numerator / denominator;
        
            return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
    2:76
    3:60
    4:44
    5:28
$$
WHERE profile_id = 'RI0200100700';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var a = findConsolidateByCode("SI02005000");
              var b = findConsolidateByCode("SI02006000");
              var c = findConsolidateByCode("SI02007000");
              var d = findConsolidateByCode("SI02008000");
        
              var numerator = a + b + c;
              var denominator = d;
        
              if (denominator == 0) {
          return 0.0;
        }
        
              var consolidateValue = numerator / denominator;
        
              var r = ratingByThreshold(thresholdByCode("RI0200100200"), consolidateValue);
        
              var s = scoreByRating(scoreFormulaByCode("RI0200100200"), r);
        
              return s;
$$,
    rating_rule = $$
var a = findConsolidateByCode("SI02005000");
              var b = findConsolidateByCode("SI02006000");
              var c = findConsolidateByCode("SI02007000");
              var d = findConsolidateByCode("SI02008000");
        
              var numerator = a + b + c;
              var denominator = d;
        
              if (denominator == 0) {
          return 0;
        }
        
              var consolidateValue = numerator / denominator;
        
              var r = ratingByThreshold(thresholdByCode("RI0200100200"), consolidateValue);
        
              return r;
$$,
    value_rule = $$
var a = findConsolidateByCode("SI02005000");
              var b = findConsolidateByCode("SI02006000");
              var c = findConsolidateByCode("SI02007000");
              var d = findConsolidateByCode("SI02008000");
        
              var numerator = a + b + c;
              var denominator = d;
        
              if (denominator == 0) {
          return 0.0;
        }
        
              var consolidateValue = numerator / denominator;
        
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RI0200100200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI02017000");
              var denominator = findConsolidateByCode("SI02018000");
        
              if (denominator == 0) {
          return 0.0;
        }
        
              var consolidateValue = numerator / denominator;
        
              var r = ratingByThreshold(thresholdByCode("RI0200100900"), consolidateValue);
        
              var s = scoreByRating(scoreFormulaByCode("RI0200100900"), r);
        
              return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI02017000");
              var denominator = findConsolidateByCode("SI02018000");
        
              if (denominator == 0) {
          return 0;
        }
        
              var consolidateValue = numerator / denominator;
        
              var r = ratingByThreshold(thresholdByCode("RI0200100900"), consolidateValue);
        
              return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI02017000");
              var denominator = findConsolidateByCode("SI02018000");
        
              if (denominator == 0) {
          return 0.0;
        }
        
              var consolidateValue = numerator / denominator;
        
              return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
      2:76
      3:60
      4:44
      5:28
$$
WHERE profile_id = 'RI0200100900';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0500100200
 var consolidateValue1 = findConsolidateByCode("SI05003000");
 var denominator1 = findConsolidateByCode("SI05002000");
 if (denominator1 == 0) { consolidateValue1 = 0; } else { consolidateValue1 = consolidateValue1 / denominator1; }
 var r1 = ratingByThreshold(thresholdByCode("RI0500100000"), consolidateValue1);
 var s1 = scoreByRating(scoreFormulaByCode("RI0500100000"), r1);
 var w1 = weightByCode("RI0500100200");
 var sxb1 = s1 * w1 * 1.0;

// RI0500100100
 var consolidateValue2 = findConsolidateByCode("SI05001000");
 var denominator2 = findConsolidateByCode("SI05002000");
 if (denominator2 == 0) { consolidateValue2 = 0; } else { consolidateValue2 = consolidateValue2 / denominator2; }
 var r2 = ratingByThreshold(thresholdByCode("RI0500100000"), consolidateValue2);
 var s2 = scoreByRating(scoreFormulaByCode("RI0500100000"), r2);
 var w2 = weightByCode("RI0500100100");
 var sxb2 = s2 * w2 * 1.0;

// RI0500100000 total
var total = sxb1 + sxb2;
return total;
$$
WHERE profile_id = 'RI0500100000';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var numerator = findConsolidateByCode("SI05003000");
        var denominator = findConsolidateByCode("SI05002000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0500100000"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI05003000");
        var denominator = findConsolidateByCode("SI05002000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500100200';

UPDATE inherent_risk_profile_edge
SET value_rule = $$
var consolidateValue = findConsolidateByCode("SI05004000");
          
          return consolidateValue * 1.0;
$$
WHERE profile_id = 'RI0500100201';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var numerator = findConsolidateByCode("SI05003000");
          var denominator = findConsolidateByCode("SI05002000");
          if (denominator == 0) { return 0; }
          var result = numerator / denominator;
          var r = ratingByThreshold(thresholdByCode("RI0500100202"), result);
          return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI05003000");
          var denominator = findConsolidateByCode("SI05002000");
          
          if (denominator == 0) {
          return 0.0;
        }
          
          var result = numerator / denominator;
          
          return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500100202';

UPDATE inherent_risk_profile_edge
SET rating_rule = $$
var numerator = findConsolidateByCode("SI05001000");
        var denominator = findConsolidateByCode("SI05002000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0500100100"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI05001000");
        var denominator = findConsolidateByCode("SI05002000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0500100100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0800100100
      var numerator1 = findConsolidateByCode("SI08003000");
      var denominator1 = findConsolidateByCode("SI08008000");
      if (denominator1 == 0) { denominator1 = 1; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI0800100000"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0800100000"), r1);
      var w1 = weightByCode("RI0800100100");
      var sxb1 = s1 * w1 * 1.0;

      // RI0800100200
      var consolidateValue2 = findConsolidateByCode("SI08004000");
      var r2 = ratingByThreshold(thresholdByCode("RI0800100000"), consolidateValue2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0800100000"), r2);
      var w2 = weightByCode("RI0800100200");
      var sxb2 = s2 * w2 * 1.0;

      var total = sxb1 + sxb2;
      return total;
$$
WHERE profile_id = 'RI0800100000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI08004000");
        
        var r = ratingByThreshold(thresholdByCode("RI0800100000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0800100000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI08004000");
        
        var r = ratingByThreshold(thresholdByCode("RI0800100000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI08004000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0800100200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI08003000");
        var denominator = findConsolidateByCode("SI08008000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0800100100"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0800100100"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI08003000");
        var denominator = findConsolidateByCode("SI08008000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0800100100"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI08003000");
        var denominator = findConsolidateByCode("SI08008000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0800100100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0100400100
      var numerator1 = findConsolidateByCode("SI01022000");
      var denominator1 = findConsolidateByCode("SI01004000");
      if (denominator1 == 0) { return 0.0; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI0100400100"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0100400100"), r1);
      var w1 = weightByCode("RI0100400100");
      var sxb1 = s1 * w1 * 1.0;

      // RI0100400200
      var consolidateValue2 = findConsolidateByCode("SI01023000");
      var r2 = ratingByThreshold(thresholdByCode("RI0100400200"), consolidateValue2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0100400200"), r2);
      var w2 = weightByCode("RI0100400200");
      var sxb2 = s2 * w2 * 1.0;

      // RI0100400300
      var consolidateValue3 = findConsolidateByCode("SI01024000");
      var r3 = ratingByThreshold(thresholdByCode("RI0100400300"), consolidateValue3);
      var s3 = scoreByRating(scoreFormulaByCode("RI0100400300"), r3);
      var w3 = weightByCode("RI0100400300");
      var sxb3 = s3 * w3 * 1.0;

      // RI0100400400
      var consolidateValue4 = findConsolidateByCode("SI01025000");
      var r4 = ratingByThreshold(thresholdByCode("RI0100400400"), consolidateValue4);
      var s4 = scoreByRating(scoreFormulaByCode("RI0100400400"), r4);
      var w4 = weightByCode("RI0100400400");
      var sxb4 = s4 * w4 * 1.0;

      // RI0100400500
      var consolidateValue5 = findConsolidateByCode("SI01026000");
      var r5 = ratingByThreshold(thresholdByCode("RI0100400500"), consolidateValue5);
      var s5 = scoreByRating(scoreFormulaByCode("RI0100400500"), r5);
      var w5 = weightByCode("RI0100400500");
      var sxb5 = s5 * w5 * 1.0;

      // RI0100400600
      var numerator6 = findConsolidateByCode("SI01027000");
      var denominator6 = findConsolidateByCode("SI01028000");
      if (denominator6 == 0) { return 0.0; }
      var result6 = numerator6 / denominator6;
      var r6 = ratingByThreshold(thresholdByCode("RI0100400600"), result6);
      var s6 = scoreByRating(scoreFormulaByCode("RI0100400600"), r6);
      var w6 = weightByCode("RI0100400600");
      var sxb6 = s6 * w6 * 1.0;

      var totalScore = sxb1 + sxb2 + sxb3 + sxb4 + sxb5 + sxb6;
      return totalScore;
$$
WHERE profile_id = 'RI0100400000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI01027000");
        var denominator = findConsolidateByCode("SI01028000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100400000"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100400000"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI01027000");
        var denominator = findConsolidateByCode("SI01028000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100400000"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI01027000");
        var denominator = findConsolidateByCode("SI01028000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100400600';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI01023000");
        
        var r = ratingByThreshold(thresholdByCode("RI0100400200"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0100400200"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI01023000");
        
        var r = ratingByThreshold(thresholdByCode("RI0100400200"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI01023000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100400200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI01026000");
        
        var r = ratingByThreshold(thresholdByCode("RI0100400500"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0100400500"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI01026000");
        
        var r = ratingByThreshold(thresholdByCode("RI0100400500"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI01026000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100400500';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI01022000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100400100"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100400100"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI01022000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100400100"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI01022000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100400100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI01025000");
        
        var r = ratingByThreshold(thresholdByCode("RI0100400400"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0100400400"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI01025000");
        
        var r = ratingByThreshold(thresholdByCode("RI0100400400"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI01025000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100400400';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI01024000");
        
        var r = ratingByThreshold(thresholdByCode("RI0100400300"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0100400300"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI01024000");
        
        var r = ratingByThreshold(thresholdByCode("RI0100400300"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI01024000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100400300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0400400100: SI04019000 / SI04010000
      var num1 = findConsolidateByCode("SI04019000");
      var den1 = findConsolidateByCode("SI04010000");
      if (den1 == 0) { den1 = 1; }
      var cv1 = num1 / den1;
      var r1 = ratingByThreshold(thresholdByCode("RI0400400000"), cv1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0400400000"), r1);
      var w1 = weightByCode("RI0400400100");
      var result1 = s1 * w1 * 1.0;

      // RI0400400201: SI04020000
      var cv2 = findConsolidateByCode("SI04020000");
      var r2 = ratingByThreshold(thresholdByCode("RI0400400000"), cv2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0400400000"), r2);
      var w2 = weightByCode("RI0400400201");
      var result2 = s2 * w2 * 1.0;

      // RI0400400202: SI04021000
      var cv3 = findConsolidateByCode("SI04021000");
      var r3 = ratingByThreshold(thresholdByCode("RI0400400000"), cv3);
      var s3 = scoreByRating(scoreFormulaByCode("RI0400400000"), r3);
      var w3 = weightByCode("RI0400400202");
      var result3 = s3 * w3 * 1.0;

      var total = result1 + result2 + result3;
      return total;
$$
WHERE profile_id = 'RI0400400000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04020000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400400000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400400000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04020000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400400000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04020000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400400201';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04021000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400400202"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400400202"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04021000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400400202"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04021000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400400202';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI04019000");
        
        var denominator = findConsolidateByCode("SI04010000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var consolidateValue = numerator / denominator;
        
        var r = ratingByThreshold(thresholdByCode("RI0400400100"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400400100"), r);
        
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI04019000");
        
        var denominator = findConsolidateByCode("SI04010000");
        
        if (denominator == 0) {
          return 0;
        }
        
        var consolidateValue = numerator / denominator;
        
        var r = ratingByThreshold(thresholdByCode("RI0400400100"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI04019000");
        
        var denominator = findConsolidateByCode("SI04010000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var consolidateValue = numerator / denominator;
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400400100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0700400100
 var consolidateValue1 = findConsolidateByCode("SI07022000");
 var r1 = ratingByThreshold(thresholdByCode("RI0700400000"), consolidateValue1);
 var s1 = scoreByRating(scoreFormulaByCode("RI0700400000"), r1);
 var w1 = weightByCode("RI0700400100");
 var sxb1 = s1 * w1 * 1.0;

var total = sxb1;
return total;
$$
WHERE profile_id = 'RI0700400000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07022000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700400000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700400000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07022000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700400000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07022000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700400100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0100300100 - uses computed score since it aggregates its own children
      var s1 = computedScoreByCode("RI0100300100");
      var w1 = weightByCode("RI0100300100");
      var sxb1 = s1 * w1 * 1.0;

      // RI0100300200
      var consolidateValue2 = findConsolidateByCode("SI01020000");
      var r2 = ratingByThreshold(thresholdByCode("RI0100300200"), consolidateValue2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0100300200"), r2);
      var w2 = weightByCode("RI0100300200");
      var sxb2 = s2 * w2 * 1.0;

      // RI0100300300
      var numerator3 = findConsolidateByCode("SI01021000");
      var denominator3 = findConsolidateByCode("SI01004000");
      if (denominator3 == 0) { return 0.0; }
      var result3 = numerator3 / denominator3;
      var r3 = ratingByThreshold(thresholdByCode("RI0100300300"), result3);
      var s3 = scoreByRating(scoreFormulaByCode("RI0100300300"), r3);
      var w3 = weightByCode("RI0100300300");
      var sxb3 = s3 * w3 * 1.0;

      var totalScore = sxb1 + sxb2 + sxb3;
      return totalScore;
$$
WHERE profile_id = 'RI0100300000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI01020000");
        
        var r = ratingByThreshold(thresholdByCode("RI0100300000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0100300000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI01020000");
        
        var r = ratingByThreshold(thresholdByCode("RI0100300000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI01020000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100300200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0100300101
        var consolidateValue1 = findConsolidateByCode("SI01018000");
        var r1 = ratingByThreshold(thresholdByCode("RI0100300101"), consolidateValue1);
        var s1 = scoreByRating(scoreFormulaByCode("RI0100300101"), r1);
        var w1 = weightByCode("RI0100300101");
        var sxb1 = s1 * w1 * 1.0;

        // RI0100300102
        var consolidateValue2 = findConsolidateByCode("SI01019000");
        var r2 = ratingByThreshold(thresholdByCode("RI0100300102"), consolidateValue2);
        var s2 = scoreByRating(scoreFormulaByCode("RI0100300102"), r2);
        var w2 = weightByCode("RI0100300102");
        var sxb2 = s2 * w2 * 1.0;

        // RI0100300103
        var a3 = findConsolidateByCode("SI01001000");
        var b3 = findConsolidateByCode("SI01002000");
        var numerator3 = a3 - b3;
        var denominator3 = b3;
        if (denominator3 == 0) { return 0.0; }
        var result3 = numerator3 / denominator3;
        var r3 = ratingByThreshold(thresholdByCode("RI0100300103"), result3);
        var s3 = scoreByRating(scoreFormulaByCode("RI0100300103"), r3);
        var w3 = weightByCode("RI0100300103");
        var sxb3 = s3 * w3 * 1.0;

        var totalScore = sxb1 + sxb2 + sxb3;
        return totalScore;
$$
WHERE profile_id = 'RI0100300100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI01018000");
          
          var r = ratingByThreshold(thresholdByCode("RI0100300100"), consolidateValue);
          
          var s = scoreByRating(scoreFormulaByCode("RI0100300100"), r);
          
          return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI01018000");
          
          var r = ratingByThreshold(thresholdByCode("RI0100300100"), consolidateValue);
          
          return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI01018000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100300101';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI01019000");
          
          var r = ratingByThreshold(thresholdByCode("RI0100300102"), consolidateValue);
          
          var s = scoreByRating(scoreFormulaByCode("RI0100300102"), r);
          
          return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI01019000");
          
          var r = ratingByThreshold(thresholdByCode("RI0100300102"), consolidateValue);
          
          return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI01019000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100300102';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var a = findConsolidateByCode("SI01001000");
          var b = findConsolidateByCode("SI01002000");
          var numerator = a - b;
          var denominator = b;
          if (denominator == 0) { return 0.0; }
          var result = numerator / denominator;
          var r = ratingByThreshold(thresholdByCode("RI0100300103"), result);
          var s = scoreByRating(scoreFormulaByCode("RI0100300103"), r);
          return s;
$$,
    rating_rule = $$
var a = findConsolidateByCode("SI01001000");
          var b = findConsolidateByCode("SI01002000");
          var numerator = a - b;
          var denominator = b;
          if (denominator == 0) { return 0; }
          var result = numerator / denominator;
          var r = ratingByThreshold(thresholdByCode("RI0100300103"), result);
          return r;
$$,
    value_rule = $$
var a = findConsolidateByCode("SI01001000");
          var b = findConsolidateByCode("SI01002000");
          var numerator = a - b;
          var denominator = b;
          if (denominator == 0) { return 0.0; }
          
          var result = numerator / denominator;
          
          return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100300103';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI01021000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100300300"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100300300"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI01021000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100300300"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI01021000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100300300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0400300101: SI04013000
      var cv1 = findConsolidateByCode("SI04013000");
      var r1 = ratingByThreshold(thresholdByCode("RI0400300000"), cv1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0400300000"), r1);
      var w1 = weightByCode("RI0400300101");
      var result1 = s1 * w1 * 1.0;

      // RI0400300102: SI04014000
      var cv2 = findConsolidateByCode("SI04014000");
      var r2 = ratingByThreshold(thresholdByCode("RI0400300000"), cv2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0400300000"), r2);
      var w2 = weightByCode("RI0400300102");
      var result2 = s2 * w2 * 1.0;

      // RI0400300103: SI04015000
      var cv3 = findConsolidateByCode("SI04015000");
      var r3 = ratingByThreshold(thresholdByCode("RI0400300000"), cv3);
      var s3 = scoreByRating(scoreFormulaByCode("RI0400300000"), r3);
      var w3 = weightByCode("RI0400300103");
      var result3 = s3 * w3 * 1.0;

      // RI0400300104: SI04016000
      var cv4 = findConsolidateByCode("SI04016000");
      var r4 = ratingByThreshold(thresholdByCode("RI0400300000"), cv4);
      var s4 = scoreByRating(scoreFormulaByCode("RI0400300000"), r4);
      var w4 = weightByCode("RI0400300104");
      var result4 = s4 * w4 * 1.0;

      // RI0400300105: SI04017000
      var cv5 = findConsolidateByCode("SI04017000");
      var r5 = ratingByThreshold(thresholdByCode("RI0400300000"), cv5);
      var s5 = scoreByRating(scoreFormulaByCode("RI0400300000"), r5);
      var w5 = weightByCode("RI0400300105");
      var result5 = s5 * w5 * 1.0;

      // RI0400300106: SI04018000
      var cv6 = findConsolidateByCode("SI04018000");
      var r6 = ratingByThreshold(thresholdByCode("RI0400300000"), cv6);
      var s6 = scoreByRating(scoreFormulaByCode("RI0400300000"), r6);
      var w6 = weightByCode("RI0400300106");
      var result6 = s6 * w6 * 1.0;

      var total = result1 + result2 + result3 + result4 + result5 + result6;
      return total;
$$
WHERE profile_id = 'RI0400300000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04013000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400300000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400300000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04013000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400300000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04013000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400300101';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04014000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400300102"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400300102"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04014000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400300102"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04014000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400300102';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04015000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400300103"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400300103"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04015000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400300103"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04015000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400300103';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04017000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400300105"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400300105"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04017000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400300105"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04017000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400300105';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04016000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400300104"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400300104"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04016000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400300104"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04016000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400300104';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04018000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400300106"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400300106"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04018000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400300106"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04018000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400300106';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI1200100100
      var numerator1 = findConsolidateByCode("SI12001000");
      var denominator1 = findConsolidateByCode("SI12002000");
      if (denominator1 == 0) { denominator1 = 1; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI1200100000"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI1200100000"), r1);
      var w1 = weightByCode("RI1200100100");
      var sxb1 = s1 * w1 * 1.0;

      var total = sxb1;
      return total;
$$
WHERE profile_id = 'RI1200100000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI12001000");
        var denominator = findConsolidateByCode("SI12002000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200100000"), result);
        var s = scoreByRating(scoreFormulaByCode("RI1200100000"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI12001000");
        var denominator = findConsolidateByCode("SI12002000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1200100000"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI12001000");
        var denominator = findConsolidateByCode("SI12002000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1200100100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0700300100 children
      // RI0700300101
 var consolidateValue1 = findConsolidateByCode("SI07012000");
 var r1 = ratingByThreshold(thresholdByCode("RI0700300000"), consolidateValue1);
 var s1 = scoreByRating(scoreFormulaByCode("RI0700300000"), r1);
 var w1 = weightByCode("RI0700300101");
 var sxb1 = s1 * w1 * 1.0;

// RI0700300102
 var consolidateValue2 = findConsolidateByCode("SI07013000");
 var r2 = ratingByThreshold(thresholdByCode("RI0700300000"), consolidateValue2);
 var s2 = scoreByRating(scoreFormulaByCode("RI0700300000"), r2);
 var w2 = weightByCode("RI0700300102");
 var sxb2 = s2 * w2 * 1.0;

// RI0700300103
var consolidateValue3 = findConsolidateByCode("SI07014000");
var r3 = ratingByThreshold(thresholdByCode("RI0700300000"), consolidateValue3);
var s3 = scoreByRating(scoreFormulaByCode("RI0700300000"), r3);
var w3 = weightByCode("RI0700300103");
var sxb3 = s3 * w3 * 1.0;

// RI0700300104
var consolidateValue4 = findConsolidateByCode("SI07015000");
var r4 = ratingByThreshold(thresholdByCode("RI0700300000"), consolidateValue4);
var s4 = scoreByRating(scoreFormulaByCode("RI0700300000"), r4);
var w4 = weightByCode("RI0700300104");
var sxb4 = s4 * w4 * 1.0;

// RI0700300105
var consolidateValue5 = findConsolidateByCode("SI07016000");
var r5 = ratingByThreshold(thresholdByCode("RI0700300000"), consolidateValue5);
var s5 = scoreByRating(scoreFormulaByCode("RI0700300000"), r5);
var w5 = weightByCode("RI0700300105");
var sxb5 = s5 * w5 * 1.0;

// RI0700300100 total
var total_RI0700300100 = sxb1 + sxb2 + sxb3 + sxb4 + sxb5;
var w_RI0700300100 = weightByCode("RI0700300100");
var sxb_RI0700300100 = total_RI0700300100 * w_RI0700300100 * 1.0;

// RI0700300200
 var consolidateValue6 = findConsolidateByCode("SI07017000");
 var r6 = ratingByThreshold(thresholdByCode("RI0700300000"), consolidateValue6);
 var s6 = scoreByRating(scoreFormulaByCode("RI0700300000"), r6);
 var w6 = weightByCode("RI0700300200");
 var sxb_RI0700300200 = s6 * w6 * 1.0;

// RI0700300400 children
// RI0700300401
 var consolidateValue7 = findConsolidateByCode("SI07019000");
 var r7 = ratingByThreshold(thresholdByCode("RI0700300000"), consolidateValue7);
 var s7 = scoreByRating(scoreFormulaByCode("RI0700300000"), r7);
 var w7 = weightByCode("RI0700300401");
 var sxb7 = s7 * w7 * 1.0;

// RI0700300402
 var consolidateValue8 = findConsolidateByCode("SI07020000");
 var r8 = ratingByThreshold(thresholdByCode("RI0700300000"), consolidateValue8);
 var s8 = scoreByRating(scoreFormulaByCode("RI0700300000"), r8);
 var w8 = weightByCode("RI0700300402");
 var sxb8 = s8 * w8 * 1.0;

// RI0700300400 total
var total_RI0700300400 = sxb7 + sxb8;
var w_RI0700300400 = weightByCode("RI0700300400");
var sxb_RI0700300400 = total_RI0700300400 * w_RI0700300400 * 1.0;

// RI0700300500
 var consolidateValue9 = findConsolidateByCode("SI07021000");
 var r9 = ratingByThreshold(thresholdByCode("RI0700300000"), consolidateValue9);
 var s9 = scoreByRating(scoreFormulaByCode("RI0700300000"), r9);
 var w9 = weightByCode("RI0700300500");
 var sxb_RI0700300500 = s9 * w9 * 1.0;

// RI0700300000 total
var total = sxb_RI0700300100 + sxb_RI0700300200 + sxb_RI0700300400 + sxb_RI0700300500;
return total;
$$
WHERE profile_id = 'RI0700300000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07017000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700300000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07017000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07017000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700300200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07021000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300500"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700300500"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07021000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300500"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07021000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700300500';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0700300101
 var consolidateValue1 = findConsolidateByCode("SI07012000");
 var r1 = ratingByThreshold(thresholdByCode("RI0700300100"), consolidateValue1);
 var s1 = scoreByRating(scoreFormulaByCode("RI0700300100"), r1);
 var w1 = weightByCode("RI0700300101");
 var sxb1 = s1 * w1 * 1.0;

// RI0700300102
 var consolidateValue2 = findConsolidateByCode("SI07013000");
 var r2 = ratingByThreshold(thresholdByCode("RI0700300100"), consolidateValue2);
 var s2 = scoreByRating(scoreFormulaByCode("RI0700300100"), r2);
 var w2 = weightByCode("RI0700300102");
 var sxb2 = s2 * w2 * 1.0;

// RI0700300103
var consolidateValue3 = findConsolidateByCode("SI07014000");
var r3 = ratingByThreshold(thresholdByCode("RI0700300100"), consolidateValue3);
var s3 = scoreByRating(scoreFormulaByCode("RI0700300100"), r3);
var w3 = weightByCode("RI0700300103");
var sxb3 = s3 * w3 * 1.0;

// RI0700300104
var consolidateValue4 = findConsolidateByCode("SI07015000");
var r4 = ratingByThreshold(thresholdByCode("RI0700300100"), consolidateValue4);
var s4 = scoreByRating(scoreFormulaByCode("RI0700300100"), r4);
var w4 = weightByCode("RI0700300104");
var sxb4 = s4 * w4 * 1.0;

// RI0700300105
var consolidateValue5 = findConsolidateByCode("SI07016000");
var r5 = ratingByThreshold(thresholdByCode("RI0700300100"), consolidateValue5);
var s5 = scoreByRating(scoreFormulaByCode("RI0700300100"), r5);
var w5 = weightByCode("RI0700300105");
var sxb5 = s5 * w5 * 1.0;

var total = sxb1 + sxb2 + sxb3 + sxb4 + sxb5;
return total;
$$
WHERE profile_id = 'RI0700300100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07013000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300100"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700300100"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07013000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300100"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07013000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700300102';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07012000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300101"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700300101"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07012000");
          
          var r = ratingByThreshold(thresholdByCode("RI0700300101"), consolidateValue);
          
          return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07012000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700300101';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07014000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300103"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700300103"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07014000");
          
          var r = ratingByThreshold(thresholdByCode("RI0700300103"), consolidateValue);
          
          return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07014000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700300103';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07015000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300104"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700300104"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07015000");
          
          var r = ratingByThreshold(thresholdByCode("RI0700300104"), consolidateValue);
          
          return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07015000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700300104';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07016000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300105"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700300105"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07016000");
          
          var r = ratingByThreshold(thresholdByCode("RI0700300105"), consolidateValue);
          
          return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07016000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700300105';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0700300401
 var consolidateValue1 = findConsolidateByCode("SI07019000");
 var r1 = ratingByThreshold(thresholdByCode("RI0700300400"), consolidateValue1);
 var s1 = scoreByRating(scoreFormulaByCode("RI0700300400"), r1);
 var w1 = weightByCode("RI0700300401");
 var sxb1 = s1 * w1 * 1.0;

// RI0700300402
 var consolidateValue2 = findConsolidateByCode("SI07020000");
 var r2 = ratingByThreshold(thresholdByCode("RI0700300400"), consolidateValue2);
 var s2 = scoreByRating(scoreFormulaByCode("RI0700300400"), r2);
 var w2 = weightByCode("RI0700300402");
 var sxb2 = s2 * w2 * 1.0;

var total = sxb1 + sxb2;
return total;
$$
WHERE profile_id = 'RI0700300400';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07019000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300400"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700300400"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07019000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300400"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07019000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700300401';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07020000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300402"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700300402"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07020000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700300402"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07020000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700300402';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI1100300100
      var consolidateValue1 = findConsolidateByCode("SI10008000");
      var r1 = ratingByThreshold(thresholdByCode("RI1100300000"), consolidateValue1);
      var s1 = scoreByRating(scoreFormulaByCode("RI1100300000"), r1);
      var w1 = weightByCode("RI1100300100");
      var sxb1 = s1 * w1 * 1.0;

      var total = sxb1;
      return total;
$$
WHERE profile_id = 'RI1100300000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI10008000");
        
        var r = ratingByThreshold(thresholdByCode("RI1100300000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI1100300000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI10008000");
        
        var r = ratingByThreshold(thresholdByCode("RI1100300000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI10008000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1100300100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0100200100
      var a1 = findConsolidateByCode("SI01009000");
      var b1 = findConsolidateByCode("SI01010000");
      var c1 = findConsolidateByCode("SI01001000");
      var d1 = findConsolidateByCode("SI01008000");
      var numerator1 = a1 + b1;
      var denominator1 = c1 + d1;
      if (denominator1 == 0) { return 0.0; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI0100200100"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0100200100"), r1);
      var w1 = weightByCode("RI0100200100");
      var sxb1 = s1 * w1 * 1.0;

      // RI0100200200
      var a2 = findConsolidateByCode("SI01011000");
      var b2 = findConsolidateByCode("SI01012000");
      var c2 = findConsolidateByCode("SI01001000");
      var d2 = findConsolidateByCode("SI01008000");
      var numerator2 = a2 + b2;
      var denominator2 = c2 + d2;
      if (denominator2 == 0) { return 0.0; }
      var result2 = numerator2 / denominator2;
      var r2 = ratingByThreshold(thresholdByCode("RI0100200200"), result2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0100200200"), r2);
      var w2 = weightByCode("RI0100200200");
      var sxb2 = s2 * w2 * 1.0;

      // RI0100200300
      var numerator3 = findConsolidateByCode("SI01013000");
      var denominator3 = findConsolidateByCode("SI01001000");
      if (denominator3 == 0) { return 0.0; }
      var result3 = numerator3 / denominator3;
      var r3 = ratingByThreshold(thresholdByCode("RI0100200300"), result3);
      var s3 = scoreByRating(scoreFormulaByCode("RI0100200300"), r3);
      var w3 = weightByCode("RI0100200300");
      var sxb3 = s3 * w3 * 1.0;

      // RI0100200400
      var numerator4 = findConsolidateByCode("SI01014000");
      var denominator4 = findConsolidateByCode("SI01004000");
      if (denominator4 == 0) { return 0.0; }
      var result4 = numerator4 / denominator4;
      var r4 = ratingByThreshold(thresholdByCode("RI0100200400"), result4);
      var s4 = scoreByRating(scoreFormulaByCode("RI0100200400"), r4);
      var w4 = weightByCode("RI0100200400");
      var sxb4 = s4 * w4 * 1.0;

      // RI0100200500
      var numerator5 = findConsolidateByCode("SI01015000");
      var denominator5 = findConsolidateByCode("SI01004000");
      if (denominator5 == 0) { return 0.0; }
      var result5 = numerator5 / denominator5;
      var r5 = ratingByThreshold(thresholdByCode("RI0100200500"), result5);
      var s5 = scoreByRating(scoreFormulaByCode("RI0100200500"), r5);
      var w5 = weightByCode("RI0100200500");
      var sxb5 = s5 * w5 * 1.0;

      // RI0100200600
      var a6 = findConsolidateByCode("SI01015000");
      var b6 = findConsolidateByCode("SI01017000");
      var c6 = findConsolidateByCode("SI01004000");
      var d6 = findConsolidateByCode("SI01016000");
      var numerator6 = a6 - b6;
      var denominator6 = c6 - d6;
      if (denominator6 == 0) { return 0.0; }
      var result6 = numerator6 / denominator6;
      var r6 = ratingByThreshold(thresholdByCode("RI0100200600"), result6);
      var s6 = scoreByRating(scoreFormulaByCode("RI0100200600"), r6);
      var w6 = weightByCode("RI0100200600");
      var sxb6 = s6 * w6 * 1.0;

      // RI0100200700
      var numerator7 = findConsolidateByCode("SI01016000");
      var denominator7 = findConsolidateByCode("SI01004000");
      if (denominator7 == 0) { return 0.0; }
      var result7 = numerator7 / denominator7;
      var r7 = ratingByThreshold(thresholdByCode("RI0100200700"), result7);
      var s7 = scoreByRating(scoreFormulaByCode("RI0100200700"), r7);
      var w7 = weightByCode("RI0100200700");
      var sxb7 = s7 * w7 * 1.0;

      var totalScore = sxb1 + sxb2 + sxb3 + sxb4 + sxb5 + sxb6 + sxb7;
      return totalScore;
$$
WHERE profile_id = 'RI0100200000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI01013000");
        var denominator = findConsolidateByCode("SI01001000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200000"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100200000"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI01013000");
        var denominator = findConsolidateByCode("SI01001000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200000"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI01013000");
        var denominator = findConsolidateByCode("SI01001000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100200300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var a = findConsolidateByCode("SI01015000");
        var b = findConsolidateByCode("SI01017000");
        var c = findConsolidateByCode("SI01004000");
        var d = findConsolidateByCode("SI01016000");
        var numerator = a - b;
        var denominator = c - d;
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200600"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100200600"), r);
        return s;
$$,
    rating_rule = $$
var a = findConsolidateByCode("SI01015000");
        var b = findConsolidateByCode("SI01017000");
        var c = findConsolidateByCode("SI01004000");
        var d = findConsolidateByCode("SI01016000");
        var numerator = a - b;
        var denominator = c - d;
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200600"), result);
        return r;
$$,
    value_rule = $$
var a = findConsolidateByCode("SI01015000");
        var b = findConsolidateByCode("SI01017000");
        var c = findConsolidateByCode("SI01004000");
        var d = findConsolidateByCode("SI01016000");
        var numerator = a - b;
        var denominator = c - d;
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100200600';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var a = findConsolidateByCode("SI01011000");
        var b = findConsolidateByCode("SI01012000");
        var c = findConsolidateByCode("SI01001000");
        var d = findConsolidateByCode("SI01008000");
        var numerator = a + b;
        var denominator = c + d;
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200200"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100200200"), r);
        return s;
$$,
    rating_rule = $$
var a = findConsolidateByCode("SI01011000");
        var b = findConsolidateByCode("SI01012000");
        var c = findConsolidateByCode("SI01001000");
        var d = findConsolidateByCode("SI01008000");
        var numerator = a + b;
        var denominator = c + d;
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200200"), result);
        return r;
$$,
    value_rule = $$
var a = findConsolidateByCode("SI01011000");
        var b = findConsolidateByCode("SI01012000");
        var c = findConsolidateByCode("SI01001000");
        var d = findConsolidateByCode("SI01008000");
        var numerator = a + b;
        var denominator = c + d;
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100200200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI01015000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200500"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100200500"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI01015000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200500"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI01015000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100200500';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var a = findConsolidateByCode("SI01009000");
        var b = findConsolidateByCode("SI01010000");
        var c = findConsolidateByCode("SI01001000");
        var d = findConsolidateByCode("SI01008000");
        var numerator = a + b;
        var denominator = c + d;
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200100"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100200100"), r);
        return s;
$$,
    rating_rule = $$
var a = findConsolidateByCode("SI01009000");
        var b = findConsolidateByCode("SI01010000");
        var c = findConsolidateByCode("SI01001000");
        var d = findConsolidateByCode("SI01008000");
        var numerator = a + b;
        var denominator = c + d;
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200100"), result);
        return r;
$$,
    value_rule = $$
var a = findConsolidateByCode("SI01009000");
        var b = findConsolidateByCode("SI01010000");
        var c = findConsolidateByCode("SI01001000");
        var d = findConsolidateByCode("SI01008000");
        var numerator = a + b;
        var denominator = c + d;
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100200100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI01014000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200400"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100200400"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI01014000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200400"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI01014000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100200400';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI01016000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200700"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100200700"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI01016000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100200700"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI01016000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100200700';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0400200100: Aggregates RI0400200101 (SI04007000) + RI0400200102 (SI04008000)
      var cv1_1 = findConsolidateByCode("SI04007000");
      var r1_1 = ratingByThreshold(thresholdByCode("RI0400200000"), cv1_1);
      var s1_1 = scoreByRating(scoreFormulaByCode("RI0400200000"), r1_1);
      var w1_1 = weightByCode("RI0400200101");
      var sxb1_1 = s1_1 * w1_1 * 1.0;
      
      var cv1_2 = findConsolidateByCode("SI04008000");
      var r1_2 = ratingByThreshold(thresholdByCode("RI0400200000"), cv1_2);
      var s1_2 = scoreByRating(scoreFormulaByCode("RI0400200000"), r1_2);
      var w1_2 = weightByCode("RI0400200102");
      var sxb1_2 = s1_2 * w1_2 * 1.0;
      
      var total1 = sxb1_1 + sxb1_2;
      var w1 = weightByCode("RI0400200100");
      var result1 = total1 * w1 * 1.0;

      // RI0400200200: SI04009000 / SI04010000
      var num2 = findConsolidateByCode("SI04009000");
      var den2 = findConsolidateByCode("SI04010000");
      if (den2 == 0) { den2 = 1; }
      var cv2 = num2 / den2;
      var r2 = ratingByThreshold(thresholdByCode("RI0400200000"), cv2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0400200000"), r2);
      var w2 = weightByCode("RI0400200200");
      var result2 = s2 * w2 * 1.0;

      // RI0400200300: SI04011000
      var cv3 = findConsolidateByCode("SI04011000");
      var r3 = ratingByThreshold(thresholdByCode("RI0400200000"), cv3);
      var s3 = scoreByRating(scoreFormulaByCode("RI0400200000"), r3);
      var w3 = weightByCode("RI0400200300");
      var result3 = s3 * w3 * 1.0;

      // RI0400200400: SI04012000
      var cv4 = findConsolidateByCode("SI04012000");
      var r4 = ratingByThreshold(thresholdByCode("RI0400200000"), cv4);
      var s4 = scoreByRating(scoreFormulaByCode("RI0400200000"), r4);
      var w4 = weightByCode("RI0400200400");
      var result4 = s4 * w4 * 1.0;

      var total = result1 + result2 + result3 + result4;
      return total;
$$
WHERE profile_id = 'RI0400200000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04011000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400200000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400200000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04011000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400200000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04011000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400200300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI04009000");
        
        var denominator = findConsolidateByCode("SI04010000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var consolidateValue = numerator / denominator;
        
        var r = ratingByThreshold(thresholdByCode("RI0400200200"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400200200"), r);
        
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI04009000");
        
        var denominator = findConsolidateByCode("SI04010000");
        
        if (denominator == 0) {
          return 0;
        }
        
        var consolidateValue = numerator / denominator;
        
        var r = ratingByThreshold(thresholdByCode("RI0400200200"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI04009000");
        
        var denominator = findConsolidateByCode("SI04010000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var consolidateValue = numerator / denominator;
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400200200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0400200101: SI04007000
        var consolidateValue1 = findConsolidateByCode("SI04007000");
        var r1 = ratingByThreshold(thresholdByCode("RI0400200100"), consolidateValue1);
        var s1 = scoreByRating(scoreFormulaByCode("RI0400200100"), r1);
        var w1 = weightByCode("RI0400200101");
        var sxb1 = s1 * w1 * 1.0;

        // RI0400200102: SI04008000
        var consolidateValue2 = findConsolidateByCode("SI04008000");
        var r2 = ratingByThreshold(thresholdByCode("RI0400200100"), consolidateValue2);
        var s2 = scoreByRating(scoreFormulaByCode("RI0400200100"), r2);
        var w2 = weightByCode("RI0400200102");
        var sxb2 = s2 * w2 * 1.0;

        var total = sxb1 + sxb2;
        return total;
$$
WHERE profile_id = 'RI0400200100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04007000");
          
          var r = ratingByThreshold(thresholdByCode("RI0400200100"), consolidateValue);
          
          var s = scoreByRating(scoreFormulaByCode("RI0400200100"), r);
          
          return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04007000");
          
          var r = ratingByThreshold(thresholdByCode("RI0400200100"), consolidateValue);
          
          return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04007000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400200101';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04008000");
          
          var r = ratingByThreshold(thresholdByCode("RI0400200102"), consolidateValue);
          
          var s = scoreByRating(scoreFormulaByCode("RI0400200102"), r);
          
          return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04008000");
          
          var r = ratingByThreshold(thresholdByCode("RI0400200102"), consolidateValue);
          
          return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04008000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400200102';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04012000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400200400"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400200400"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04012000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400200400"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04012000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400200400';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0700200100
 var consolidateValue1 = findConsolidateByCode("SI07011000");
 var r1 = ratingByThreshold(thresholdByCode("RI0700200000"), consolidateValue1);
 var s1 = scoreByRating(scoreFormulaByCode("RI0700200000"), r1);
 var w1 = weightByCode("RI0700200100");
 var sxb1 = s1 * w1 * 1.0;

var total = sxb1;
return total;
$$
WHERE profile_id = 'RI0700200000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI07011000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700200000"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0700200000"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI07011000");
        
        var r = ratingByThreshold(thresholdByCode("RI0700200000"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI07011000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0700200100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI1100200100
      var numerator1 = findConsolidateByCode("SI10004000");
      var denominator1 = findConsolidateByCode("SI10002000");
      if (denominator1 == 0) { denominator1 = 1; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI1100200000"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI1100200000"), r1);
      var w1 = weightByCode("RI1100200100");
      var sxb1 = s1 * w1 * 1.0;

      // RI1100200200
      var numerator2 = findConsolidateByCode("SI10005000");
      var denominator2 = findConsolidateByCode("SI10002000");
      if (denominator2 == 0) { denominator2 = 1; }
      var result2 = numerator2 / denominator2;
      var r2 = ratingByThreshold(thresholdByCode("RI1100200000"), result2);
      var s2 = scoreByRating(scoreFormulaByCode("RI1100200000"), r2);
      var w2 = weightByCode("RI1100200200");
      var sxb2 = s2 * w2 * 1.0;

      // RI1100200300
      var numerator3 = findConsolidateByCode("SI10006000");
      var denominator3 = findConsolidateByCode("SI10003000");
      if (denominator3 == 0) { denominator3 = 1; }
      var result3 = numerator3 / denominator3;
      var r3 = ratingByThreshold(thresholdByCode("RI1100200000"), result3);
      var s3 = scoreByRating(scoreFormulaByCode("RI1100200000"), r3);
      var w3 = weightByCode("RI1100200300");
      var sxb3 = s3 * w3 * 1.0;

      // RI1100200400
      var numerator4 = findConsolidateByCode("SI10007000");
      var denominator4 = findConsolidateByCode("SI10001000");
      if (denominator4 == 0) { denominator4 = 1; }
      var result4 = numerator4 / denominator4;
      var r4 = ratingByThreshold(thresholdByCode("RI1100200000"), result4);
      var s4 = scoreByRating(scoreFormulaByCode("RI1100200000"), r4);
      var w4 = weightByCode("RI1100200400");
      var sxb4 = s4 * w4 * 1.0;

      var total = sxb1 + sxb2 + sxb3 + sxb4;
      return total;
$$
WHERE profile_id = 'RI1100200000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI10006000");
        var denominator = findConsolidateByCode("SI10003000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1100200000"), result);
        var s = scoreByRating(scoreFormulaByCode("RI1100200000"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI10006000");
        var denominator = findConsolidateByCode("SI10003000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1100200000"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI10006000");
        var denominator = findConsolidateByCode("SI10003000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1100200300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI10005000");
        var denominator = findConsolidateByCode("SI10002000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1100200200"), result);
        var s = scoreByRating(scoreFormulaByCode("RI1100200200"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI10005000");
        var denominator = findConsolidateByCode("SI10002000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1100200200"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI10005000");
        var denominator = findConsolidateByCode("SI10002000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1100200200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI10004000");
        var denominator = findConsolidateByCode("SI10002000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1100200100"), result);
        var s = scoreByRating(scoreFormulaByCode("RI1100200100"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI10004000");
        var denominator = findConsolidateByCode("SI10002000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1100200100"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI10004000");
        var denominator = findConsolidateByCode("SI10002000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1100200100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI10007000");
        var denominator = findConsolidateByCode("SI10001000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1100200400"), result);
        var s = scoreByRating(scoreFormulaByCode("RI1100200400"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI10007000");
        var denominator = findConsolidateByCode("SI10001000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI1100200400"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI10007000");
        var denominator = findConsolidateByCode("SI10001000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI1100200400';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0100100100
      var numerator1 = findConsolidateByCode("SI01003000");
      var denominator1 = findConsolidateByCode("SI01001000");
      if (denominator1 == 0) { return 0.0; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI0100100100"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0100100100"), r1);
      var w1 = weightByCode("RI0100100100");
      var sxb1 = s1 * w1 * 1.0;

      // RI0100100200
      var numerator2 = findConsolidateByCode("SI01005000");
      var denominator2 = findConsolidateByCode("SI01004000");
      if (denominator2 == 0) { return 0.0; }
      var result2 = numerator2 / denominator2;
      var r2 = ratingByThreshold(thresholdByCode("RI0100100200"), result2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0100100200"), r2);
      var w2 = weightByCode("RI0100100200");
      var sxb2 = s2 * w2 * 1.0;

      // RI0100100300
      var numerator3 = findConsolidateByCode("SI01006000");
      var denominator3 = findConsolidateByCode("SI01004000");
      if (denominator3 == 0) { return 0.0; }
      var result3 = numerator3 / denominator3;
      var r3 = ratingByThreshold(thresholdByCode("RI0100100300"), result3);
      var s3 = scoreByRating(scoreFormulaByCode("RI0100100300"), r3);
      var w3 = weightByCode("RI0100100300");
      var sxb3 = s3 * w3 * 1.0;

      // RI0100100400
      var numerator4 = findConsolidateByCode("SI01007000");
      var denominator4 = findConsolidateByCode("SI01004000");
      if (denominator4 == 0) { return 0.0; }
      var result4 = numerator4 / denominator4;
      var r4 = ratingByThreshold(thresholdByCode("RI0100100400"), result4);
      var s4 = scoreByRating(scoreFormulaByCode("RI0100100400"), r4);
      var w4 = weightByCode("RI0100100400");
      var sxb4 = s4 * w4 * 1.0;

      var totalScore = sxb1 + sxb2 + sxb3 + sxb4;
      return totalScore;
$$
WHERE profile_id = 'RI0100100000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI01006000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100100000"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100100000"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI01006000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100100000"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI01006000");
        var denominator = findConsolidateByCode("SI01004000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100100300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI01005000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100100200"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100100200"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI01005000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100100200"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI01005000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100100200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI01003000");
        var denominator = findConsolidateByCode("SI01001000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100100100"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100100100"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI01003000");
        var denominator = findConsolidateByCode("SI01001000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100100100"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI01003000");
        var denominator = findConsolidateByCode("SI01001000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100100100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI01007000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0.0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100100400"), result);
        var s = scoreByRating(scoreFormulaByCode("RI0100100400"), r);
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI01007000");
        var denominator = findConsolidateByCode("SI01004000");
        if (denominator == 0) { return 0; }
        var result = numerator / denominator;
        var r = ratingByThreshold(thresholdByCode("RI0100100400"), result);
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI01007000");
        var denominator = findConsolidateByCode("SI01004000");
        
        if (denominator == 0) {
          return 0.0;
        }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0100100400';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0400100100: Aggregates RI0400100101 (SI04001000) + RI0400100102 (SI04002000)
      var cv1_1 = findConsolidateByCode("SI04001000");
      var r1_1 = ratingByThreshold(thresholdByCode("RI0400100000"), cv1_1);
      var s1_1 = scoreByRating(scoreFormulaByCode("RI0400100000"), r1_1);
      var w1_1 = weightByCode("RI0400100101");
      var sxb1_1 = s1_1 * w1_1 * 1.0;
      
      var cv1_2 = findConsolidateByCode("SI04002000");
      var r1_2 = ratingByThreshold(thresholdByCode("RI0400100000"), cv1_2);
      var s1_2 = scoreByRating(scoreFormulaByCode("RI0400100000"), r1_2);
      var w1_2 = weightByCode("RI0400100102");
      var sxb1_2 = s1_2 * w1_2 * 1.0;
      
      var total1 = sxb1_1 + sxb1_2;
      var w1 = weightByCode("RI0400100100");
      var result1 = total1 * w1 * 1.0;

      // RI0400100200: SI04003000
      var cv2 = findConsolidateByCode("SI04003000");
      var r2 = ratingByThreshold(thresholdByCode("RI0400100000"), cv2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0400100000"), r2);
      var w2 = weightByCode("RI0400100200");
      var result2 = s2 * w2 * 1.0;

      // RI0400100300: Aggregates RI0400100301 (SI04004000) + RI0400100302 (SI04005000)
      var cv3_1 = findConsolidateByCode("SI04004000");
      var r3_1 = ratingByThreshold(thresholdByCode("RI0400100000"), cv3_1);
      var s3_1 = scoreByRating(scoreFormulaByCode("RI0400100000"), r3_1);
      var w3_1 = weightByCode("RI0400100301");
      var sxb3_1 = s3_1 * w3_1 * 1.0;
      
      var cv3_2 = findConsolidateByCode("SI04005000");
      var r3_2 = ratingByThreshold(thresholdByCode("RI0400100000"), cv3_2);
      var s3_2 = scoreByRating(scoreFormulaByCode("RI0400100000"), r3_2);
      var w3_2 = weightByCode("RI0400100302");
      var sxb3_2 = s3_2 * w3_2 * 1.0;
      
      var total3 = sxb3_1 + sxb3_2;
      var w3 = weightByCode("RI0400100300");
      var result3 = total3 * w3 * 1.0;

      // RI0400100400: SI04006000
      var cv4 = findConsolidateByCode("SI04006000");
      var r4 = ratingByThreshold(thresholdByCode("RI0400100000"), cv4);
      var s4 = scoreByRating(scoreFormulaByCode("RI0400100000"), r4);
      var w4 = weightByCode("RI0400100400");
      var result4 = s4 * w4 * 1.0;

      var total = result1 + result2 + result3 + result4;
      return total;
$$
WHERE profile_id = 'RI0400100000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0400100301: SI04004000
        var consolidateValue1 = findConsolidateByCode("SI04004000");
        var r1 = ratingByThreshold(thresholdByCode("RI0400100000"), consolidateValue1);
        var s1 = scoreByRating(scoreFormulaByCode("RI0400100000"), r1);
        var w1 = weightByCode("RI0400100301");
        var sxb1 = s1 * w1 * 1.0;

        // RI0400100302: SI04005000
        var consolidateValue2 = findConsolidateByCode("SI04005000");
        var r2 = ratingByThreshold(thresholdByCode("RI0400100000"), consolidateValue2);
        var s2 = scoreByRating(scoreFormulaByCode("RI0400100000"), r2);
        var w2 = weightByCode("RI0400100302");
        var sxb2 = s2 * w2 * 1.0;

        var total = sxb1 + sxb2;
        return total;
$$
WHERE profile_id = 'RI0400100300';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04004000");
          
          var r = ratingByThreshold(thresholdByCode("RI0400100000"), consolidateValue);
          
          var s = scoreByRating(scoreFormulaByCode("RI0400100000"), r);
          
          return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04004000");
          
          var r = ratingByThreshold(thresholdByCode("RI0400100000"), consolidateValue);
          
          return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04004000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400100301';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04005000");
          
          var r = ratingByThreshold(thresholdByCode("RI0400100302"), consolidateValue);
          
          var s = scoreByRating(scoreFormulaByCode("RI0400100302"), r);
          
          return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04005000");
          
          var r = ratingByThreshold(thresholdByCode("RI0400100302"), consolidateValue);
          
          return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04005000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400100302';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04003000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400100200"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400100200"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04003000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400100200"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04003000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400100200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0400100101: SI04001000
        var consolidateValue1 = findConsolidateByCode("SI04001000");
        var r1 = ratingByThreshold(thresholdByCode("RI0400100100"), consolidateValue1);
        var s1 = scoreByRating(scoreFormulaByCode("RI0400100100"), r1);
        var w1 = weightByCode("RI0400100101");
        var sxb1 = s1 * w1 * 1.0;

        // RI0400100102: SI04002000
        var consolidateValue2 = findConsolidateByCode("SI04002000");
        var r2 = ratingByThreshold(thresholdByCode("RI0400100100"), consolidateValue2);
        var s2 = scoreByRating(scoreFormulaByCode("RI0400100100"), r2);
        var w2 = weightByCode("RI0400100102");
        var sxb2 = s2 * w2 * 1.0;

        var total = sxb1 + sxb2;
        return total;
$$
WHERE profile_id = 'RI0400100100';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04001000");
          
          var r = ratingByThreshold(thresholdByCode("RI0400100100"), consolidateValue);
          
          var s = scoreByRating(scoreFormulaByCode("RI0400100100"), r);
          
          return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04001000");
          
          var r = ratingByThreshold(thresholdByCode("RI0400100100"), consolidateValue);
          
          return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04001000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400100101';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04002000");
          
          var r = ratingByThreshold(thresholdByCode("RI0400100102"), consolidateValue);
          
          var s = scoreByRating(scoreFormulaByCode("RI0400100102"), r);
          
          return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04002000");
          
          var r = ratingByThreshold(thresholdByCode("RI0400100102"), consolidateValue);
          
          return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04002000");
          
          return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400100102';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI04006000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400100400"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0400100400"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI04006000");
        
        var r = ratingByThreshold(thresholdByCode("RI0400100400"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI04006000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0400100400';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
// RI0600500200
      var numerator1 = findConsolidateByCode("SI06012000");
      var denominator1 = findConsolidateByCode("SI06007000");
      if (denominator1 == 0) { denominator1 = 1; }
      var result1 = numerator1 / denominator1;
      var r1 = ratingByThreshold(thresholdByCode("RI0600500000"), result1);
      var s1 = scoreByRating(scoreFormulaByCode("RI0600500000"), r1);
      var w1 = weightByCode("RI0600500200");
      var sxb1 = s1 * w1 * 1.0;

      // RI0600500100
      var consolidateValue2 = findConsolidateByCode("SI06011000");
      var r2 = ratingByThreshold(thresholdByCode("RI0600500000"), consolidateValue2);
      var s2 = scoreByRating(scoreFormulaByCode("RI0600500000"), r2);
      var w2 = weightByCode("RI0600500100");
      var sxb2 = s2 * w2 * 1.0;

      var total = sxb1 + sxb2;
      return total;
$$
WHERE profile_id = 'RI0600500000';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var numerator = findConsolidateByCode("SI06012000");
        var denominator = findConsolidateByCode("SI06007000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        var r = ratingByThreshold(thresholdByCode("RI0600500000"), result);
        
        var s = scoreByRating(scoreFormulaByCode("RI0600500000"), r);
        
        return s;
$$,
    rating_rule = $$
var numerator = findConsolidateByCode("SI06012000");
        var denominator = findConsolidateByCode("SI06007000");
        if (denominator == 0) { return 0; }
        
        var result = numerator / denominator;
        
        var r = ratingByThreshold(thresholdByCode("RI0600500000"), result);
        
        return r;
$$,
    value_rule = $$
var numerator = findConsolidateByCode("SI06012000");
        var denominator = findConsolidateByCode("SI06007000");
        if (denominator == 0) { return 0.0; }
        
        var result = numerator / denominator;
        
        return result * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0600500200';

UPDATE inherent_risk_profile_edge
SET score_rule = $$
var consolidateValue = findConsolidateByCode("SI06011000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600500100"), consolidateValue);
        
        var s = scoreByRating(scoreFormulaByCode("RI0600500100"), r);
        
        return s;
$$,
    rating_rule = $$
var consolidateValue = findConsolidateByCode("SI06011000");
        
        var r = ratingByThreshold(thresholdByCode("RI0600500100"), consolidateValue);
        
        return r;
$$,
    value_rule = $$
var consolidateValue = findConsolidateByCode("SI06011000");
        
        return consolidateValue * 1.0;
$$,
    score_formula = $$
1:92
2:76
3:60
4:44
5:28
$$
WHERE profile_id = 'RI0600500100';

COMMIT;
