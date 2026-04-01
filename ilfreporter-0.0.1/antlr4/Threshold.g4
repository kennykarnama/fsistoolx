grammar Threshold;

ruleFile
    : ruleDecl EOF
    ;

ruleDecl
    : rating ':' expr
    ;

rating
    : INT
    ;

expr
    : value op value (op value)*
    ;

value
    : INT
    | FLOAT
    | 'x'
    ;

op
    : '<'
    | '<='
    | '>'
    | '>='
    | '=='
    ;

INT    : [0-9]+ ;
FLOAT  : [0-9]+ '.' [0-9]+ ;
WS     : [ \t\r\n]+ -> skip ;