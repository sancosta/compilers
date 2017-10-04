lexer grammar DecafLexer;

@header 
{
  package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

TK_CLASS : 'class Program' ;

BOOLEANLITERAL : (RFALSE|RTRUE);

RFALSE : 'false' ;

RTRUE : 'true' ;

RIF : 'if' ;

RBOOLEAN : 'boolean' ;

RBREAK : 'break' ;

RCALLOUT : 'callout' ;

RCLASS : 'class' ;

RCONTINUE : 'continue' ;

RELSE : 'else' ;

RFOR : 'for' ;

RINT : 'int' ;

RRETURN : 'return' ;

RVOID : 'void' ;

RESERVEWORD : (RIF|RBOOLEAN|RBREAK|RCALLOUT|RCLASS|RCONTINUE|RELSE|RFOR|RINT|RRETURN|RVOID) ;

LCURLY : '{' ;

RCURLY : '}' ;

WS_ : (' '|'\n'|'\t') -> skip ;

SL_COMMENT : '//' (~'\n')* '\n' -> skip ;

ID : [_a-zA-Z][_a-zA-Z0-9]* ;

CHAR : '\'' (ESC|SPC) '\'' ;

STRING : '\"' (ESC|SPC|ID|' ')+ '\"' ;

HEXDECIMAL : '0x'[a-fA-F0-9]+ ;

INT : [0-9]+ (~'x') ;

OP_REL : ('>'|'<'|'<='|'>=');
OP_COD : ('&&'|'||');
OP_IGU : ('!='|'==');
OP_ARI : ('+'|'-'|'*'|'/'|'%');
OP_ATR : ('='|'-='|'+=');
OPERAD : (OP_REL|OP_COD|OP_IGU|OP_ARI|OP_ATR);

ESP : ('!'|'#'|'$'|'%'|'&'|')'|'('|'*'|'+'|','|'-'|':'|','|';'|'<'|'='|'>'|'@'|']'|'['|'^'|'_'|'`'|'|'|'~') ;

fragment ESC :  '\\' ('n'|'t'|'\"'|'\''|'\\') ;
fragment SPC : ('a'..'z'|'A'..'Z'|'0'..'9'|'!'|'#'|'$'|'%'|'&'|')'|'('|'*'|'+'|','|'-'|'.'|':'|','|';'|'<'|'='|'>'|'?'|'@'|']'|'['|'^'|'_'|'`'|'|'|'~') ;
fragment HEX : ('a'..'z'|'A'..'Z'|'!'|'#'|'$'|'%'|'&'|')'|'('|'*'|'+'|','|'-'|'.'|':'|','|';'|'<'|'='|'>'|'?'|'@'|']'|'['|'^'|'_'|'`'|'|'|'~') ;