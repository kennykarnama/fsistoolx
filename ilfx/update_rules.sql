-- Generated UPDATE statements for FSI and consolidation rules
-- Generated from XML test data files

BEGIN;

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI10001000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI10001000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI10002000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI10002000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI10003000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI10003000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI10004000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI10004000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI10005000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI10005000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI10006000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI10006000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI10007000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI10007000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI10008000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI10008000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI10009000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI10009000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI10010000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI10010000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI10011000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI10011000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI10012000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI10012000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI10013000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI10013000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05001000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI05001000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05002000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI05002000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05003000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI05003000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05004000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI05004000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05005000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI05005000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05006000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI05006000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05007000");
var count_condition = 0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    for (val : values) {
        total_count = total_count + 1;
        if (val == 1) {
            count_condition = count_condition + 1;
        }
    }
}

if (total_count == 0) { return 0.0; }
return (count_condition * 100.0) / total_count;
$$
WHERE code = 'SI05007000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05008000");
var count_condition = 0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    for (val : values) {
        total_count = total_count + 1;
        if (val == 1) {
            count_condition = count_condition + 1;
        }
    }
}

if (total_count == 0) { return 0.0; }
return (count_condition * 100.0) / total_count;
$$
WHERE code = 'SI05008000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05009000");
var count_condition = 0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    for (val : values) {
        total_count = total_count + 1;
        if (val == 1) {
            count_condition = count_condition + 1;
        }
    }
}

if (total_count == 0) { return 0.0; }
return (count_condition * 100.0) / total_count;
$$
WHERE code = 'SI05009000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05010000");
var count_condition = 0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    for (val : values) {
        total_count = total_count + 1;
        if (val == 1) {
            count_condition = count_condition + 1;
        }
    }
}

if (total_count == 0) { return 0.0; }
return (count_condition * 100.0) / total_count;
$$
WHERE code = 'SI05010000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05011000");
var count_condition = 0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    for (val : values) {
        total_count = total_count + 1;
        if (val == 1) {
            count_condition = count_condition + 1;
        }
    }
}

if (total_count == 0) { return 0.0; }
return (count_condition * 100.0) / total_count;
$$
WHERE code = 'SI05011000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05012000");
var total_sum = 0.0;

for (entry : items) {
    total_sum = total_sum + sum(entry.second);
}

if (total_sum > 0) {
    return 1.0;
} else {
    return 0.0;
}
$$
WHERE code = 'SI05012000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05013000");
var total_sum = 0.0;

for (entry : items) {
    total_sum = total_sum + sum(entry.second);
}

if (total_sum > 0) {
    return 1.0;
} else {
    return 0.0;
}
$$
WHERE code = 'SI05013000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05014000");
var count_condition = 0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    for (val : values) {
        total_count = total_count + 1;
        if (val == 1) {
            count_condition = count_condition + 1;
        }
    }
}

if (total_count == 0) { return 0.0; }
return (count_condition * 100.0) / total_count;
$$
WHERE code = 'SI05014000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05015000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI05015000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05016000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI05016000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05017000");
var count_condition = 0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    for (val : values) {
        total_count = total_count + 1;
        if (val == 1) {
            count_condition = count_condition + 1;
        }
    }
}

if (total_count == 0) { return 0.0; }
return (count_condition * 100.0) / total_count;
$$
WHERE code = 'SI05017000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05018000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI05018000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI05019000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI05019000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI12001000");

var acc = 0.0;

for (item : items) {
    acc = acc + sum(item.second);
}

return acc;
$$
WHERE code = 'SI12001000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI12002000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI12002000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI12003000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI12003000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI12004000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI12004000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI12005000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI12005000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI12006000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI12006000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI12007000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI12007000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI12008000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI12008000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI12009000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI12009000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI12010000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI12011000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09001000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09001000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09002000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09002000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09003000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09003000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09004000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09004000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09005000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09005000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09006000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09006000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09007000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09007000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09008000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09008000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09009000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09009000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09010000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09010000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09011000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09011000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09012000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09012000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09013000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09013000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09014000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI09014000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09015000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI09015000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09016000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI09016000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09017000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI09017000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09018000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI09018000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09019000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI09019000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09020000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI09020000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09021000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI09021000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09022000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI09022000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI09023000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI09023000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI11001000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI11001000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI11002000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI11002000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI11003000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI11003000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI11004000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI11004000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI11005000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI11005000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI11006000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI11006000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI11007000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI11007000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI11008000");

var acc = 0.0;
var c = 0;

for (item : items) {
    acc = acc + sum(item.second);
    c = c + 1;
}

if (c == 0) {
    return 0.0;
}

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI11008000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI08001000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI08001000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI08002000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI08002000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI08003000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI08003000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI08004000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI08004000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI08005000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI08005000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI08006000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI08006000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI08007000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI08007000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI08008000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI08008000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01001000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01001000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01002000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01002000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01003000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01003000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01004000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01004000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01005000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01005000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01006000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01006000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01007000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01007000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01008000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01008000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01009000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01009000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01010000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01010000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01011000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01011000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01012000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01012000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01013000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01013000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01014000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01014000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01015000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01015000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01016000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01016000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01017000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01017000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01018000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI01018000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01019000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI01019000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01020000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01020000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01021000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01021000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01022000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01022000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01023000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI01023000';

UPDATE inherent_source
SET fsi_rule = $$
var codes = [
    "SI01024001": 0,
    "SI01024002": 0,
    "SI01024003": 0
];

for (code : codes) {
    var item = companyValuesByCodeAndCompanyName(code.first, companyName);
    codes[code.first] = item;
}

var result = 0.0;

print(codes);

var denominator = codes["SI01024002"] + codes["SI01024003"];

if (denominator != 0) {
    result = codes["SI01024001"] * 1.0 / denominator * 1.0;
} else {
    result = 0;
}

print(result);

return result;
$$, consolidate_rule = $$
var items = companyValuesByCode("SI01024000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI01024000';

UPDATE inherent_source
SET fsi_rule = $$
var codes = [
    "SI01025001": 0,
    "SI01025002": 0,
    "SI01025003": 0,
    "SI01025004": 0
];

for (code : codes) {
    var item = companyValuesByCodeAndCompanyName(code.first, companyName);
    codes[code.first] = item;
}

var result = 0.0;

print(codes);

var denominator = codes["SI01025002"] + codes["SI01025003"] + codes["SI01025004"];

if (denominator != 0) {
    result = codes["SI01025001"] * 1.0 / denominator * 1.0;
} else {
    result = 0;
}

print(result);

return result;
$$, consolidate_rule = $$
var items = companyValuesByCode("SI01025000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI01025000';

UPDATE inherent_source
SET fsi_rule = $$
var codes = [
    "SI01026001": 0,
    "SI01026002": 0,
    "SI01026003": 0,
    "SI01026004": 0
];

for (code : codes) {
    var item = companyValuesByCodeAndCompanyName(code.first, companyName);
    codes[code.first] = item;
}

var result = 0.0;

print(codes);

var denominator = codes["SI01026002"] + codes["SI01026003"] + codes["SI01026004"];

if (denominator != 0) {
    result = codes["SI01026001"] * 1.0 / denominator * 1.0;
} else {
    result = 0;
}

print(result);

return result;
$$, consolidate_rule = $$
var items = companyValuesByCode("SI01026000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI01026000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01027000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01027000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI01028000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI01028000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03001000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03001000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03002000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03002000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03003000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03003000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03004000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03004000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03005000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03005000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03006000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03006000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03007000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03007000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03008000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03008000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03009000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03009000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03010000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03010000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03011000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03011000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03012000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03012000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03013000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03013000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03014000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03014000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03015000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI03015000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03016000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03016000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03017000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03017000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03018000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03018000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03019000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03019000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020001");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020001';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020002");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020002';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020003");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020003';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020004");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020004';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020005");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020005';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020006");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020006';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020007");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020007';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020008");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020008';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020009");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020009';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020010");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020010';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020011");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020011';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020012");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020012';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020013");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020013';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020014");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020014';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020015");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020015';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020016");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020016';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020017");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020017';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020018");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020018';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020019");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020019';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020020");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020020';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020021");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020021';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020022");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020022';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020023");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020023';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020024");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020024';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020025");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020025';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020026");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020026';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020027");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020027';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020028");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020028';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020029");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020029';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03020030");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03020030';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021001");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021001';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021002");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021002';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021003");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021003';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021004");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021004';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021005");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021005';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021006");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021006';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021007");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021007';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021008");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021008';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021009");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021009';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021010");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021010';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021011");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021011';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021012");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021012';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021013");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021013';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021014");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021014';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021015");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021015';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021016");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021016';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021017");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021017';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021018");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021018';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021019");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021019';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021020");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021020';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021021");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021021';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021022");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021022';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021023");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021023';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021024");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021024';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021025");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021025';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021026");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021026';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI03021027");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI03021027';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04001000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI04001000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04002000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI04002000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04003000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI04003000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04004000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI04004000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04005000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI04005000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04006000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI04006000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04007000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI04007000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04008000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI04008000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04009000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI04009000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04010000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI04010000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04011000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI04011000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04012000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI04012000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04013000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI04013000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04014000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI04014000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04015000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI04015000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04016000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI04016000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04017000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI04017000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04018000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI04018000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04019000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI04019000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04020000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI04020000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI04021000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI04021000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02001000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02001000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02002000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02002000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02003000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02003000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02004000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02004000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02005000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02005000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02006000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02006000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02007000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02007000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02008000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02008000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02009000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02009000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02010000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02010000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02011000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02011000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02012000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02012000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02013000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02013000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02014000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02014000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02015000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02015000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02016000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02016000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02017000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02017000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02018000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02018000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02019000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02019000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02020000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI02020000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02021000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI02021000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02022000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02022000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02023000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02023000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02024000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02024000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02025000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI02025000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02026000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02026000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02027000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02027000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02028000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02028000';

UPDATE inherent_source
SET fsi_rule = $$
var codes = [
    "SI02029001": 0,
    "SI02029002": 0
];

for (code : codes) {
    var item = companyValuesByCodeAndCompanyName(code.first, companyName);
    codes[code.first] = item;
}

var result = 0.0;

if (codes["SI02029002"] != 0) {
    result = codes["SI02029001"] * 1.0 / codes["SI02029002"] * 1.0;
} else {
    result = 0;
}

return result;
$$, consolidate_rule = $$
var items = companyValuesByCode("SI02029000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI02029000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02030000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02030000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02031000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02031000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02032000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02032000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02033000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02033000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI02034000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI02034000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI06001000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SI06001000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI06002000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI06002000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI06003000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI06003000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI06004000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI06004000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI06005000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI06005000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI06006000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI06006000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI06007000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI06007000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI06008000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI06008000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI06009000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI06009000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI06010000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI06010000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI06011000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI06011000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI06012000");
var total = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
}

return total;
$$
WHERE code = 'SI06012000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07001000");   // map[string] -> []int

print(items);
print("awkwk");

// counts[1]..counts[5] used; counts[0] unused
var counts = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

var total = 0.0;

// Each company contributes ONE vote based on the size of its []int
for (entry : items) {
    var sz = entry.second.size();
    if (sz >= 1 && sz <= 5) {
        counts[sz] = counts[sz] + 1.0;
        total = total + 1.0;
    }
}

if (total == 0.0) { return 0.0; }

var half = total / 2.0;
var cumulative = 0.0;

// Walk through buckets 1..5
for (i : [1,2,3,4,5]) {
    cumulative = cumulative + counts[i];
    if (cumulative > half) {
        return i * 1.0;   // return as float
    }
}

print(cumulative);
return 0.0;
$$
WHERE code = 'SI07001000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07002000");

// counts[1]..counts[5] used; counts[0] unused
var counts = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

var total = 0.0;

for (entry : items) {
    var sz = entry.second.size();
    if (sz >= 1 && sz <= 5) {
        counts[sz] = counts[sz] + 1.0;
        total = total + 1.0;
    }
}

if (total == 0.0) { return 0.0; }

var half = total / 2.0;
var cumulative = 0.0;

// Walk through buckets 1..5
for (i : [1,2,3,4,5]) {
    cumulative = cumulative + counts[i];
    if (cumulative > half) {
        return i * 1.0;
    }
}

return 0.0;
$$
WHERE code = 'SI07002000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07003000");

// counts[1]..counts[5] used; counts[0] unused
var counts = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

var total = 0.0;

for (entry : items) {
    var sz = entry.second.size();
    if (sz >= 1 && sz <= 5) {
        counts[sz] = counts[sz] + 1.0;
        total = total + 1.0;
    }
}

if (total == 0.0) { return 0.0; }

var half = total / 2.0;
var cumulative = 0.0;

// Walk through buckets 1..5
for (i : [1,2,3,4,5]) {
    cumulative = cumulative + counts[i];
    if (cumulative > half) {
        return i * 1.0;
    }
}

return 0.0;
$$
WHERE code = 'SI07003000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07004000");

var acc = 0.0;
var c = 0;

for (entry : items) {
    acc = acc + sum(entry.second);
    c = c + 1;
}

if (c == 0) { return 0.0; }

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI07004000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07005000");

var acc = 0.0;
var c = 0;

for (entry : items) {
    acc = acc + sum(entry.second);
    c = c + 1;
}

if (c == 0) { return 0.0; }

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI07005000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07006000");

var acc = 0.0;
var c = 0;

for (entry : items) {
    acc = acc + sum(entry.second);
    c = c + 1;
}

if (c == 0) { return 0.0; }

return acc * 1.0 / c * 1.0;
$$
WHERE code = 'SI07006000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07007000");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07007000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07008000");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07008000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07009000");

// counts[1]..counts[5] used; counts[0] unused
var counts = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

var total = 0.0;

// Each company contributes ONE vote based on the size of its []int
for (entry : items) {
    var sz = entry.second.size();
    if (sz >= 1 && sz <= 5) {
        counts[sz] = counts[sz] + 1.0;
        total = total + 1.0;
    }
}

if (total == 0.0) { return 0.0; }

var half = total / 2.0;
var cumulative = 0.0;

// Walk through buckets 1..5
for (i : [1,2,3,4,5]) {
    cumulative = cumulative + counts[i];
    if (cumulative > half) {
        return i * 1.0;
    }
}

return 0.0;
$$
WHERE code = 'SI07009000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07010000");

var total = 0.0;
var count = 0.0;

for (entry : items) {
    total = total + sum(entry.second);
    count = count + size(entry.second);
}

if (count == 0.0) {
    return 0.0;
}

return round(total / count);
$$
WHERE code = 'SI07010000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07011000");

// counts[1]..counts[5] used; counts[0] unused
var counts = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

var total = 0.0;

for (entry : items) {
    var sz = entry.second.size();
    if (sz >= 1 && sz <= 5) {
        counts[sz] = counts[sz] + 1.0;
        total = total + 1.0;
    }
}

if (total == 0.0) { return 0.0; }

var half = total / 2.0;
var cumulative = 0.0;

// Walk through buckets 1..5
for (i : [1,2,3,4,5]) {
    cumulative = cumulative + counts[i];
    if (cumulative > half) {
        return i * 1.0;
    }
}

return 0.0;
$$
WHERE code = 'SI07011000';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07012001 — SUM
//
var items_01 = companyValuesByCode("SI07012001");

var sum_01 = 0.0;

for (entry : items_01) {
    sum_01 = sum_01 + sum(entry.second);
}

//
// SI07012002 — SUM
//
var items_02 = companyValuesByCode("SI07012002");

var sum_02 = 0.0;

for (entry : items_02) {
    sum_02 = sum_02 + sum(entry.second);
}

//
// Final result: SI07012001 / SI07012002
//
if (sum_02 == 0) {
    return 0.0;
}

return sum_01 * 1.0 / sum_02 * 1.0;
$$
WHERE code = 'SI07012000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07012001");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07012001';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07012002");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07012002';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07013001 — SUM
//
var items_01 = companyValuesByCode("SI07013001");

var sum_01 = 0.0;

for (entry : items_01) {
    sum_01 = sum_01 + sum(entry.second);
}

//
// SI07013002 — SUM
//
var items_02 = companyValuesByCode("SI07013002");

var sum_02 = 0.0;

for (entry : items_02) {
    sum_02 = sum_02 + sum(entry.second);
}

//
// Final result: SI07013001 / SI07013002
//
if (sum_02 == 0) {
    return 0.0;
}

return sum_01 * 1.0 / sum_02 * 1.0;
$$
WHERE code = 'SI07013000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07013001");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07013001';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07013002");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07013002';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07014001 — SUM
//
var items_01 = companyValuesByCode("SI07014001");

var sum_01 = 0.0;

for (entry : items_01) {
    sum_01 = sum_01 + sum(entry.second);
}

//
// SI07014002 — SUM
//
var items_02 = companyValuesByCode("SI07014002");

var sum_02 = 0.0;

for (entry : items_02) {
    sum_02 = sum_02 + sum(entry.second);
}

//
// Final result: SI07014001 / SI07014002
//
if (sum_02 == 0) {
    return 0.0;
}

return sum_01 * 1.0 / sum_02 * 1.0;
$$
WHERE code = 'SI07014000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07014001");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07014001';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07014002");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07014002';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07015000");   // map[string] -> []int

var minVal = 999999;   // large sentinel

for (entry : items) {
    var sz = entry.second.size();   // the company's input value

    if (sz < minVal) {
        minVal = sz;
    }
}

if (minVal == 999999) {
    return 0.0;   // no companies
}

return minVal;
$$
WHERE code = 'SI07015000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07016000");   // map[string] -> []int

var minVal = 999999;   // large sentinel

for (entry : items) {
    var sz = entry.second.size();   // the company's input value

    if (sz < minVal) {
        minVal = sz;
    }
}

if (minVal == 999999) {
    return 0.0;   // no companies
}

return minVal;
$$
WHERE code = 'SI07016000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07017000");

// counts[1]..counts[5] used; counts[0] unused
var counts = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

var total = 0.0;

for (entry : items) {
    var sz = entry.second.size();
    if (sz >= 1 && sz <= 5) {
        counts[sz] = counts[sz] + 1.0;
        total = total + 1.0;
    }
}

if (total == 0.0) { return 0.0; }

var half = total / 2.0;
var cumulative = 0.0;

// Walk through buckets 1..5
for (i : [1,2,3,4,5]) {
    cumulative = cumulative + counts[i];
    if (cumulative > half) {
        return i * 1.0;
    }
}

return 0.0;
$$
WHERE code = 'SI07017000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07018000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return total_sum / total_count;
$$
WHERE code = 'SI07018000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07019000");

// counts[1]..counts[5] used; counts[0] unused
var counts = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

var total = 0.0;

for (entry : items) {
    var sz = entry.second.size();
    if (sz >= 1 && sz <= 5) {
        counts[sz] = counts[sz] + 1.0;
        total = total + 1.0;
    }
}

if (total == 0.0) { return 0.0; }

var half = total / 2.0;
var cumulative = 0.0;

// Walk through buckets 1..5
for (i : [1,2,3,4,5]) {
    cumulative = cumulative + counts[i];
    if (cumulative > half) {
        return i * 1.0;
    }
}

return 0.0;
$$
WHERE code = 'SI07019000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07020000");

// counts[1]..counts[5] used; counts[0] unused
var counts = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

var total = 0.0;

for (entry : items) {
    var sz = entry.second.size();
    if (sz >= 1 && sz <= 5) {
        counts[sz] = counts[sz] + 1.0;
        total = total + 1.0;
    }
}

if (total == 0.0) { return 0.0; }

var half = total / 2.0;
var cumulative = 0.0;

// Walk through buckets 1..5
for (i : [1,2,3,4,5]) {
    cumulative = cumulative + counts[i];
    if (cumulative > half) {
        return i * 1.0;
    }
}

return 0.0;
$$
WHERE code = 'SI07020000';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07021000 — Pearson Correlation between Growth % Total Aset and GDP
// Embeds all consolidation rules inline for both ranges
//

var range1 = [];
var range2 = [];

// SI07021014: (SI07021002 - SI07021001) / SI07021001
var items_01 = companyValuesByCode("SI07021001");
var sum_01 = 0.0;
for (entry : items_01) { sum_01 = sum_01 + sum(entry.second); }
var items_02 = companyValuesByCode("SI07021002");
var sum_02 = 0.0;
for (entry : items_02) { sum_02 = sum_02 + sum(entry.second); }
range1.push_back(sum_01 == 0 ? 0.0 : (sum_02 - sum_01) / sum_01);

// SI07021015: (SI07021003 - SI07021002) / SI07021002
var items_03 = companyValuesByCode("SI07021003");
var sum_03 = 0.0;
for (entry : items_03) { sum_03 = sum_03 + sum(entry.second); }
range1.push_back(sum_02 == 0 ? 0.0 : (sum_03 - sum_02) / sum_02);

// SI07021016: (SI07021004 - SI07021003) / SI07021003
var items_04 = companyValuesByCode("SI07021004");
var sum_04 = 0.0;
for (entry : items_04) { sum_04 = sum_04 + sum(entry.second); }
range1.push_back(sum_03 == 0 ? 0.0 : (sum_04 - sum_03) / sum_03);

// SI07021017: (SI07021005 - SI07021004) / SI07021004
var items_05 = companyValuesByCode("SI07021005");
var sum_05 = 0.0;
for (entry : items_05) { sum_05 = sum_05 + sum(entry.second); }
range1.push_back(sum_04 == 0 ? 0.0 : (sum_05 - sum_04) / sum_04);

// SI07021018: (SI07021006 - SI07021005) / SI07021005
var items_06 = companyValuesByCode("SI07021006");
var sum_06 = 0.0;
for (entry : items_06) { sum_06 = sum_06 + sum(entry.second); }
range1.push_back(sum_05 == 0 ? 0.0 : (sum_06 - sum_05) / sum_05);

// SI07021019: (SI07021007 - SI07021006) / SI07021006
var items_07 = companyValuesByCode("SI07021007");
var sum_07 = 0.0;
for (entry : items_07) { sum_07 = sum_07 + sum(entry.second); }
range1.push_back(sum_06 == 0 ? 0.0 : (sum_07 - sum_06) / sum_06);

// SI07021020: (SI07021008 - SI07021007) / SI07021007
var items_08 = companyValuesByCode("SI07021008");
var sum_08 = 0.0;
for (entry : items_08) { sum_08 = sum_08 + sum(entry.second); }
range1.push_back(sum_07 == 0 ? 0.0 : (sum_08 - sum_07) / sum_07);

// SI07021021: (SI07021009 - SI07021008) / SI07021008
var items_09 = companyValuesByCode("SI07021009");
var sum_09 = 0.0;
for (entry : items_09) { sum_09 = sum_09 + sum(entry.second); }
range1.push_back(sum_08 == 0 ? 0.0 : (sum_09 - sum_08) / sum_08);

// SI07021022: (SI07021010 - SI07021009) / SI07021009
var items_10 = companyValuesByCode("SI07021010");
var sum_10 = 0.0;
for (entry : items_10) { sum_10 = sum_10 + sum(entry.second); }
range1.push_back(sum_09 == 0 ? 0.0 : (sum_10 - sum_09) / sum_09);

// SI07021023: (SI07021011 - SI07021010) / SI07021010
var items_11 = companyValuesByCode("SI07021011");
var sum_11 = 0.0;
for (entry : items_11) { sum_11 = sum_11 + sum(entry.second); }
range1.push_back(sum_10 == 0 ? 0.0 : (sum_11 - sum_10) / sum_10);

// SI07021024: (SI07021012 - SI07021011) / SI07021011
var items_12 = companyValuesByCode("SI07021012");
var sum_12 = 0.0;
for (entry : items_12) { sum_12 = sum_12 + sum(entry.second); }
range1.push_back(sum_11 == 0 ? 0.0 : (sum_12 - sum_11) / sum_11);

// SI07021025: (SI07021013 - SI07021012) / SI07021012
var items_13 = companyValuesByCode("SI07021013");
var sum_13 = 0.0;
for (entry : items_13) { sum_13 = sum_13 + sum(entry.second); }
range1.push_back(sum_12 == 0 ? 0.0 : (sum_13 - sum_12) / sum_12);

// SI07021026: GDP SUM
var items_26 = companyValuesByCode("SI07021026");
var sum_26 = 0.0;
for (entry : items_26) { sum_26 = sum_26 + sum(entry.second); }
range2.push_back(sum_26);

// SI07021027: GDP SUM
var items_27 = companyValuesByCode("SI07021027");
var sum_27 = 0.0;
for (entry : items_27) { sum_27 = sum_27 + sum(entry.second); }
range2.push_back(sum_27);

// SI07021028: GDP SUM
var items_28 = companyValuesByCode("SI07021028");
var sum_28 = 0.0;
for (entry : items_28) { sum_28 = sum_28 + sum(entry.second); }
range2.push_back(sum_28);

// SI07021029: GDP SUM
var items_29 = companyValuesByCode("SI07021029");
var sum_29 = 0.0;
for (entry : items_29) { sum_29 = sum_29 + sum(entry.second); }
range2.push_back(sum_29);

// SI07021030: GDP SUM
var items_30 = companyValuesByCode("SI07021030");
var sum_30 = 0.0;
for (entry : items_30) { sum_30 = sum_30 + sum(entry.second); }
range2.push_back(sum_30);

// SI07021031: GDP SUM
var items_31 = companyValuesByCode("SI07021031");
var sum_31 = 0.0;
for (entry : items_31) { sum_31 = sum_31 + sum(entry.second); }
range2.push_back(sum_31);

// SI07021032: GDP SUM
var items_32 = companyValuesByCode("SI07021032");
var sum_32 = 0.0;
for (entry : items_32) { sum_32 = sum_32 + sum(entry.second); }
range2.push_back(sum_32);

// SI07021033: GDP SUM
var items_33 = companyValuesByCode("SI07021033");
var sum_33 = 0.0;
for (entry : items_33) { sum_33 = sum_33 + sum(entry.second); }
range2.push_back(sum_33);

// SI07021034: GDP SUM
var items_34 = companyValuesByCode("SI07021034");
var sum_34 = 0.0;
for (entry : items_34) { sum_34 = sum_34 + sum(entry.second); }
range2.push_back(sum_34);

// SI07021035: GDP SUM
var items_35 = companyValuesByCode("SI07021035");
var sum_35 = 0.0;
for (entry : items_35) { sum_35 = sum_35 + sum(entry.second); }
range2.push_back(sum_35);

// SI07021036: GDP SUM
var items_36 = companyValuesByCode("SI07021036");
var sum_36 = 0.0;
for (entry : items_36) { sum_36 = sum_36 + sum(entry.second); }
range2.push_back(sum_36);

// SI07021037: GDP SUM
var items_37 = companyValuesByCode("SI07021037");
var sum_37 = 0.0;
for (entry : items_37) { sum_37 = sum_37 + sum(entry.second); }
range2.push_back(sum_37);

// Calculate Pearson correlation
var n = range1.size();
if (n == 0 || n != range2.size()) {
    return 0.0;
}

var sum1 = 0.0;
var sum2 = 0.0;
for (var i = 0; i < n; ++i) {
    sum1 = sum1 + range1[i];
    sum2 = sum2 + range2[i];
}
var mean1 = sum1 / n;
var mean2 = sum2 / n;

var numerator = 0.0;
var sumSq1 = 0.0;
var sumSq2 = 0.0;

for (var i = 0; i < n; ++i) {
    var diff1 = range1[i] - mean1;
    var diff2 = range2[i] - mean2;
    numerator = numerator + (diff1 * diff2);
    sumSq1 = sumSq1 + (diff1 * diff1);
    sumSq2 = sumSq2 + (diff2 * diff2);
}

var denominator = sqrt(sumSq1 * sumSq2);
if (denominator == 0) {
    return 0.0;
}

return numerator / denominator;
$$
WHERE code = 'SI07021000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021001");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021001';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021002");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021002';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021003");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021003';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021004");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021004';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021005");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021005';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021006");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021006';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021007");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021007';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021008");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021008';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021009");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021009';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021010");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021010';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021011");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021011';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021012");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021012';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021013");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021013';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07021014 — Growth % calculation: (SI07021002 - SI07021001) / SI07021001
//

// SI07021001 — SUM
var items_01 = companyValuesByCode("SI07021001");
var sum_01 = 0.0;
for (entry : items_01) {
    sum_01 = sum_01 + sum(entry.second);
}

// SI07021002 — SUM
var items_02 = companyValuesByCode("SI07021002");
var sum_02 = 0.0;
for (entry : items_02) {
    sum_02 = sum_02 + sum(entry.second);
}

// Growth % calculation
if (sum_01 == 0) {
    return 0.0;
}

return (sum_02 - sum_01) / sum_01;
$$
WHERE code = 'SI07021014';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07021015 — Growth % calculation: (SI07021003 - SI07021002) / SI07021002
//

// SI07021002 — SUM
var items_02 = companyValuesByCode("SI07021002");
var sum_02 = 0.0;
for (entry : items_02) {
    sum_02 = sum_02 + sum(entry.second);
}

// SI07021003 — SUM
var items_03 = companyValuesByCode("SI07021003");
var sum_03 = 0.0;
for (entry : items_03) {
    sum_03 = sum_03 + sum(entry.second);
}

// Growth % calculation
if (sum_02 == 0) {
    return 0.0;
}

return (sum_03 - sum_02) / sum_02;
$$
WHERE code = 'SI07021015';

UPDATE inherent_source
SET consolidate_rule = $$
var items_03 = companyValuesByCode("SI07021003");
var sum_03 = 0.0;
for (entry : items_03) {
    sum_03 = sum_03 + sum(entry.second);
}

var items_04 = companyValuesByCode("SI07021004");
var sum_04 = 0.0;
for (entry : items_04) {
    sum_04 = sum_04 + sum(entry.second);
}

if (sum_03 == 0) {
    return 0.0;
}

return (sum_04 - sum_03) / sum_03;
$$
WHERE code = 'SI07021016';

UPDATE inherent_source
SET consolidate_rule = $$
var items_04 = companyValuesByCode("SI07021004");
var sum_04 = 0.0;
for (entry : items_04) {
    sum_04 = sum_04 + sum(entry.second);
}

var items_05 = companyValuesByCode("SI07021005");
var sum_05 = 0.0;
for (entry : items_05) {
    sum_05 = sum_05 + sum(entry.second);
}

if (sum_04 == 0) {
    return 0.0;
}

return (sum_05 - sum_04) / sum_04;
$$
WHERE code = 'SI07021017';

UPDATE inherent_source
SET consolidate_rule = $$
var items_05 = companyValuesByCode("SI07021005");
var sum_05 = 0.0;
for (entry : items_05) {
    sum_05 = sum_05 + sum(entry.second);
}

var items_06 = companyValuesByCode("SI07021006");
var sum_06 = 0.0;
for (entry : items_06) {
    sum_06 = sum_06 + sum(entry.second);
}

if (sum_05 == 0) {
    return 0.0;
}

return (sum_06 - sum_05) / sum_05;
$$
WHERE code = 'SI07021018';

UPDATE inherent_source
SET consolidate_rule = $$
var items_06 = companyValuesByCode("SI07021006");
var sum_06 = 0.0;
for (entry : items_06) {
    sum_06 = sum_06 + sum(entry.second);
}

var items_07 = companyValuesByCode("SI07021007");
var sum_07 = 0.0;
for (entry : items_07) {
    sum_07 = sum_07 + sum(entry.second);
}

if (sum_06 == 0) {
    return 0.0;
}

return (sum_07 - sum_06) / sum_06;
$$
WHERE code = 'SI07021019';

UPDATE inherent_source
SET consolidate_rule = $$
var items_07 = companyValuesByCode("SI07021007");
var sum_07 = 0.0;
for (entry : items_07) {
    sum_07 = sum_07 + sum(entry.second);
}

var items_08 = companyValuesByCode("SI07021008");
var sum_08 = 0.0;
for (entry : items_08) {
    sum_08 = sum_08 + sum(entry.second);
}

if (sum_07 == 0) {
    return 0.0;
}

return (sum_08 - sum_07) / sum_07;
$$
WHERE code = 'SI07021020';

UPDATE inherent_source
SET consolidate_rule = $$
var items_08 = companyValuesByCode("SI07021008");
var sum_08 = 0.0;
for (entry : items_08) {
    sum_08 = sum_08 + sum(entry.second);
}

var items_09 = companyValuesByCode("SI07021009");
var sum_09 = 0.0;
for (entry : items_09) {
    sum_09 = sum_09 + sum(entry.second);
}

if (sum_08 == 0) {
    return 0.0;
}

return (sum_09 - sum_08) / sum_08;
$$
WHERE code = 'SI07021021';

UPDATE inherent_source
SET consolidate_rule = $$
var items_09 = companyValuesByCode("SI07021009");
var sum_09 = 0.0;
for (entry : items_09) {
    sum_09 = sum_09 + sum(entry.second);
}

var items_10 = companyValuesByCode("SI07021010");
var sum_10 = 0.0;
for (entry : items_10) {
    sum_10 = sum_10 + sum(entry.second);
}

if (sum_09 == 0) {
    return 0.0;
}

return (sum_10 - sum_09) / sum_09;
$$
WHERE code = 'SI07021022';

UPDATE inherent_source
SET consolidate_rule = $$
var items_10 = companyValuesByCode("SI07021010");
var sum_10 = 0.0;
for (entry : items_10) {
    sum_10 = sum_10 + sum(entry.second);
}

var items_11 = companyValuesByCode("SI07021011");
var sum_11 = 0.0;
for (entry : items_11) {
    sum_11 = sum_11 + sum(entry.second);
}

if (sum_10 == 0) {
    return 0.0;
}

return (sum_11 - sum_10) / sum_10;
$$
WHERE code = 'SI07021023';

UPDATE inherent_source
SET consolidate_rule = $$
var items_11 = companyValuesByCode("SI07021011");
var sum_11 = 0.0;
for (entry : items_11) {
    sum_11 = sum_11 + sum(entry.second);
}

var items_12 = companyValuesByCode("SI07021012");
var sum_12 = 0.0;
for (entry : items_12) {
    sum_12 = sum_12 + sum(entry.second);
}

if (sum_11 == 0) {
    return 0.0;
}

return (sum_12 - sum_11) / sum_11;
$$
WHERE code = 'SI07021024';

UPDATE inherent_source
SET consolidate_rule = $$
var items_12 = companyValuesByCode("SI07021012");
var sum_12 = 0.0;
for (entry : items_12) {
    sum_12 = sum_12 + sum(entry.second);
}

var items_13 = companyValuesByCode("SI07021013");
var sum_13 = 0.0;
for (entry : items_13) {
    sum_13 = sum_13 + sum(entry.second);
}

if (sum_12 == 0) {
    return 0.0;
}

return (sum_13 - sum_12) / sum_12;
$$
WHERE code = 'SI07021025';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021026");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021026';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021027");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021027';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021028");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021028';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021029");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021029';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021030");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021030';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021031");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021031';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021032");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021032';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021033");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021033';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021034");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021034';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021035");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021035';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021036");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021036';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07021037");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07021037';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022000 — Average of all Pencapaian Realisasi codes
// Embeds all consolidation logic inline and sums results, then divides by 9
//

var totalSum = 0.0;

// SI07022004 — Pencapaian Realisasi Total Aset (based on SI07022001)
var items_004 = companyValuesByCode("SI07022001");
var weighted_004 = 0.0;
for (entry : items_004) {
    var v = sum(entry.second);
    var w = findWeightByCompany(entry.first);
    weighted_004 = weighted_004 + (v * w * 1.0);
}
totalSum = totalSum + (weighted_004 >= 100.0 ? 1 : 0);

// SI07022008 — Pencapaian Realisasi Total Ekuitas (based on SI07022005)
var items_008 = companyValuesByCode("SI07022005");
var weighted_008 = 0.0;
for (entry : items_008) {
    var v = sum(entry.second);
    var w = findWeightByCompany(entry.first);
    weighted_008 = weighted_008 + (v * w * 1.0);
}
totalSum = totalSum + (weighted_008 >= 100.0 ? 1 : 0);

// SI07022012 — Pencapaian Realisasi Total Laba (based on SI07022009)
var items_012 = companyValuesByCode("SI07022009");
var weighted_012 = 0.0;
for (entry : items_012) {
    var v = sum(entry.second);
    var w = findWeightByCompany(entry.first);
    weighted_012 = weighted_012 + (v * w * 1.0);
}
totalSum = totalSum + (weighted_012 >= 100.0 ? 1 : 0);

// SI07022015 — Pencapaian Realisasi Kredit/Pembiayaan (based on SI07022013)
var items_015 = companyValuesByCode("SI07022013");
var weighted_015 = 0.0;
for (entry : items_015) {
    var v = sum(entry.second);
    var w = findWeightByCompany(entry.first);
    weighted_015 = weighted_015 + (v * w * 1.0);
}
totalSum = totalSum + (weighted_015 >= 100.0 ? 1 : 0);

// SI07022018 — Pencapaian Realisasi Premi Asuransi (based on SI07022016)
var items_018 = companyValuesByCode("SI07022016");
var weighted_018 = 0.0;
for (entry : items_018) {
    var v = sum(entry.second);
    var w = findWeightByCompany(entry.first);
    weighted_018 = weighted_018 + (v * w * 1.0);
}
totalSum = totalSum + (weighted_018 >= 100.0 ? 1 : 0);

// SI07022021 — Pencapaian Realisasi NPL/NPF (based on SI07022019)
var items_021 = companyValuesByCode("SI07022019");
var weighted_021 = 0.0;
for (entry : items_021) {
    var v = sum(entry.second);
    var w = findWeightByCompany(entry.first);
    weighted_021 = weighted_021 + (v * w * 1.0);
}
totalSum = totalSum + (weighted_021 >= 100.0 ? 1 : 0);

// SI07022024 — Pencapaian Realisasi CAR (based on SI07022022)
var items_024 = companyValuesByCode("SI07022022");
var weighted_024 = 0.0;
for (entry : items_024) {
    var v = sum(entry.second);
    var w = findWeightByCompany(entry.first);
    weighted_024 = weighted_024 + (v * w * 1.0);
}
totalSum = totalSum + (weighted_024 >= 100.0 ? 1 : 0);

// SI07022027 — Pencapaian Realisasi RBC (based on SI07022025)
var items_027 = companyValuesByCode("SI07022025");
var weighted_027 = 0.0;
for (entry : items_027) {
    var v = sum(entry.second);
    var w = findWeightByCompany(entry.first);
    weighted_027 = weighted_027 + (v * w * 1.0);
}
totalSum = totalSum + (weighted_027 >= 100.0 ? 1 : 0);

// SI07022030 — Pencapaian Realisasi Gearing Ratio (based on SI07022028)
var items_030 = companyValuesByCode("SI07022028");
var weighted_030 = 0.0;
for (entry : items_030) {
    var v = sum(entry.second);
    var w = findWeightByCompany(entry.first);
    weighted_030 = weighted_030 + (v * w * 1.0);
}
totalSum = totalSum + (weighted_030 >= 100.0 ? 1 : 0);

// Final result: average of all 9 pencapaian values
return totalSum / 9.0;
$$
WHERE code = 'SI07022000';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07022001");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07022001';

UPDATE inherent_source
SET fsi_rule = $$
var v = companyValuesByCodeAndCompanyName("SI07022001", companyName);

var w = findWeightByCompany(companyName);

print(v);
print(w);

return v * w * 1.0;
$$
WHERE code = 'SI07022002';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07022001");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}

// final result
return totalWeighted;
$$
WHERE code = 'SI07022003';

UPDATE inherent_source
SET consolidate_rule = $$
//
// Weighted sum using companyValuesByCode("SI07022001")
//
var items = companyValuesByCode("SI07022001");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}

//
// Excel rule: IF(O302 >= 100%; 1; 0)
//
if (totalWeighted >= 100.0) {
    return 1.0;
}

return 0.0;
$$
WHERE code = 'SI07022004';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07022005");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07022005';

UPDATE inherent_source
SET fsi_rule = $$
var v = companyValuesByCodeAndCompanyName("SI07022005", companyName);

var w = findWeightByCompany(companyName);

print(v);
print(w);

return v * w * 1.0;
$$
WHERE code = 'SI07022006';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022005 — Weighted SUM
//
var items = companyValuesByCode("SI07022005");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}


return totalWeighted;
$$
WHERE code = 'SI07022007';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022005 — Weighted SUM
//
var items = companyValuesByCode("SI07022005");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}

//
// Excel rule: IF(O302 >= 100%; 1; 0)
//
if (totalWeighted >= 100.0) {
    return 1.0;
}

return 0.0;
$$
WHERE code = 'SI07022008';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07022009");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07022009';

UPDATE inherent_source
SET fsi_rule = $$
var v = companyValuesByCodeAndCompanyName("SI07022009", companyName);

var w = findWeightByCompany(companyName);

print(v);
print(w);

return v * w * 1.0;
$$
WHERE code = 'SI07022010';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022009 — Weighted SUM
//
var items = companyValuesByCode("SI07022009");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}


return totalWeighted;
$$
WHERE code = 'SI07022011';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022009 — Weighted SUM
//
var items = companyValuesByCode("SI07022009");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}

//
// Excel rule: IF(O302 >= 100%; 1; 0)
//
if (totalWeighted >= 100.0) {
    return 1.0;
}

return 0.0;
$$
WHERE code = 'SI07022012';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07022013");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07022013';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022013 — Weighted SUM
//
var items = companyValuesByCode("SI07022013");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}


return totalWeighted;
$$
WHERE code = 'SI07022014';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022013 — Weighted SUM
//
var items = companyValuesByCode("SI07022013");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}

//
// Excel rule: IF(O302 >= 100%; 1; 0)
//
if (totalWeighted >= 100.0) {
    return 1.0;
}

return 0.0;
$$
WHERE code = 'SI07022015';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07022016");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07022016';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022016 — Weighted SUM
//
var items = companyValuesByCode("SI07022016");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}


return totalWeighted;
$$
WHERE code = 'SI07022017';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022016 — Weighted SUM
//
var items = companyValuesByCode("SI07022016");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}

//
// Excel rule: IF(O302 >= 100%; 1; 0)
//
if (totalWeighted >= 100.0) {
    return 1.0;
}

return 0.0;
$$
WHERE code = 'SI07022018';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07022019");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07022019';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022019 — Weighted SUM
//
var items = companyValuesByCode("SI07022019");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}


return totalWeighted;
$$
WHERE code = 'SI07022020';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022019 — Weighted SUM
//
var items = companyValuesByCode("SI07022019");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}

//
// Excel rule: IF(O302 >= 100%; 1; 0)
//
if (totalWeighted >= 100.0) {
    return 1.0;
}

return 0.0;
$$
WHERE code = 'SI07022021';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07022022");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07022022';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022022 — Weighted SUM
//
var items = companyValuesByCode("SI07022022");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}


return totalWeighted;
$$
WHERE code = 'SI07022023';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022022 — Weighted SUM
//
var items = companyValuesByCode("SI07022022");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}

//
// Excel rule: IF(O302 >= 100%; 1; 0)
//
if (totalWeighted >= 100.0) {
    return 1.0;
}

return 0.0;
$$
WHERE code = 'SI07022024';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07022025");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07022025';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022025 — Weighted SUM
//
var items = companyValuesByCode("SI07022025");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}


return totalWeighted;
$$
WHERE code = 'SI07022026';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022025 — Weighted SUM
//
var items = companyValuesByCode("SI07022025");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}

//
// Excel rule: IF(O302 >= 100%; 1; 0)
//
if (totalWeighted >= 100.0) {
    return 1.0;
}

return 0.0;
$$
WHERE code = 'SI07022027';

UPDATE inherent_source
SET consolidate_rule = $$
var items = companyValuesByCode("SI07022028");

var acc = 0.0;

for (entry : items) {
    acc = acc + sum(entry.second);
}

return acc;
$$
WHERE code = 'SI07022028';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022028 — Weighted SUM
//
var items = companyValuesByCode("SI07022028");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}


return totalWeighted;
$$
WHERE code = 'SI07022029';

UPDATE inherent_source
SET consolidate_rule = $$
//
// SI07022028 — Weighted SUM
//
var items = companyValuesByCode("SI07022028");   // map<string] -> []int

var totalWeighted = 0.0;

// iterate all companies
for (entry : items) {
    var companyName = entry.first;
    var values = entry.second;

    // v = sum of the company's values
    var v = sum(values);

    // w = weight for this company
    var w = findWeightByCompany(companyName);

    // accumulate weighted value
    totalWeighted = totalWeighted + (v * w * 1.0);
}

//
// Excel rule: IF(O302 >= 100%; 1; 0)
//
if (totalWeighted >= 100.0) {
    return 1.0;
}

return 0.0;
$$
WHERE code = 'SI07022030';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10004000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + 1;
}

print(total_count);

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10004002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10004003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10004003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10004001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10004001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10004004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10004004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10003000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10003002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10003003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10003003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10003001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10003001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10002000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10002001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10002004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10002004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10002002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10002002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10002003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10002003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10001000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10001001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10001004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10001004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10001002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10001002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK10001003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK10001003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05004000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05004002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05004003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05004003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05004001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05004001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05004004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05004004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05003000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05003004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05003002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05003002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05003003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05003003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05003001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05003001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05002000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05002001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05002002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05002002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05002003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05002003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05001000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05001003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05001001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05001001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05001004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05001004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK05001002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK05001002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK12002000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK12002001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK12002003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK12002003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK12002002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK12002002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK12003000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK12003002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK12003001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK12003001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK12003003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK12003003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK12004000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK12004002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK12004001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK12004001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK12001000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK12001002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK12001001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK12001001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09001000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09001003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09001001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09001001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09001004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09001004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09001002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09001002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09004000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09004004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09004002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09004002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09004003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09004003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09004001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09004001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09003000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09003001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09003002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09003002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09003003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09003003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09002000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09002003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09002001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09002001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK09002002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK09002002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK11002000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK11002003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK11002002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK11002002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK11002001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK11002001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK11003000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK11003002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK11003001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK11003001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK11003003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK11003003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK11001000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK11001002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK11001001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK11001001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK11004000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK11004002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK11004001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK11004001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08004000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08004002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08004003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08004003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08004001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08004001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08004004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08004004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08003000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08003002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08003003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08003003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08003001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08003001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08002000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08002002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08002003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08002003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08002001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08002001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08001000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08001001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08001004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08001004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08001002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08001002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK08001003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK08001003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01004002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01004002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01004003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01004003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01004001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01004001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01004004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01004004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01003002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01003002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01003005");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01003005';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01003003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01003003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01003001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01003001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01003004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01003004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01002002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01002002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01002003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01002003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01002001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01002001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01001001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01001001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01001004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01001004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01001002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01001002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK01001003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK01001003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03002000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03002003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03002001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03002001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03002002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03002002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03001000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03001002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03001003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03001003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03001001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03001001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03001004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03001004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03004000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03004001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03004004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03004004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03004002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03004002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03004003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03004003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03003000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03003003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03003001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03003001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK03003002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK03003002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04004000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04004003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04004001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04004001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04004004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04004004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04004002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04004002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04003000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04003002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04003003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04003003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04003001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04003001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04003004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04003004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04002000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04002002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04002003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04002003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04002001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04002001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04001000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04001004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04001002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04001002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04001003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04001003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK04001001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK04001001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02001000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02001003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02001001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02001001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02001004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02001004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02001002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02001002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02004000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02004004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02004002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02004002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02004003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02004003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02004001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02004001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02003000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02003001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02003002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02003002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02003003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02003003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02002000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02002003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02002001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02002001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK02002002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK02002002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06002000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06002003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06002001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06002001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06002002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06002002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06001000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06001003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06001001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06001001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06001004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06001004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06001002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06001002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06004000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06004001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06004004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06004004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06004002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06004002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06004003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06004003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06003000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06003003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06003001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06003001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK06003002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK06003002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07003000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07003003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07003001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07003001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07003002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07003002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07002000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07002002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07002003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07002003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07002001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07002001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07001000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07001002';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07001003");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07001003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07001001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07001001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07001004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07001004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07004000");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07004003';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07004001");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07004001';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07004004");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07004004';

UPDATE kpmr_source
SET consolidate_rule = $$
var items = companyValuesByCode("SK07004002");
var total_sum = 0.0;
var total_count = 0;

for (entry : items) {
    var values = entry.second;
    total_sum = total_sum + sum(values);
    total_count = total_count + size(values);
}

if (total_count == 0) { return 0.0; }
return round(total_sum / total_count);
$$
WHERE code = 'SK07004002';

COMMIT;
