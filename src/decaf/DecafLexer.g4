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

TK_CLASS        : 'class Program' ;

BOOLEANLITERAL  : (RFALSE|RTRUE) ;

RFALSE          : 'false' ;

RTRUE           : 'true' ;

RIF             : 'if' ;

RBOOLEAN        : 'boolean' ;

RBREAK          : 'break' ;

RCALLOUT        : 'callout' ;

RCLASS          : 'class' ;

RCONTINUE       : 'continue' ;

RELSE           : 'else' ;

RFOR            : 'for' ;

RINT            : 'int' ;

RRETURN         : 'return' ;

RVOID           : 'void' ;

RESERVEWORD     : (RIF|RBOOLEAN|RBREAK|RCALLOUT|RCLASS|RCONTINUE|RELSE|RFOR|RINT|RRETURN|RVOID) ;

CL_CUR          : '{' ;

CR_CUR          : '}' ;

CL_COC          : '[' ;

CR_COC          : ']' ;

CL_PAR          : '(' ;

CR_PAR          : ')' ;

WS_             : (' '|'\n'|'\t') -> skip ;

SL_COMMENT      : '//' (~'\n')* '\n' -> skip ;

ID              : [_a-zA-Z][_a-zA-Z0-9]* ;

CHAR            : '\'' (ESC|SPC|CES|UNI) '\'' ;

STRING          : '\"' (ESC|SPC|CES|UNI|' ')+ '\"' ;

INT             : [0-9]+ ;

HEXDECIMAL      : '0x' [a-fA-F0-9]+ ;

OP_REL          : ('>'|'<'|'<='|'>=') ;

OP_COD          : ('&&'|'||') ;

OP_IGU          : ('!='|'==') ;

OP_ARI_P        : '+' ;

OP_ARI_M        : '-' ;

OP_ARI_X        : '*' ;

OP_ARI_D        : '/' ;

OP_ARI_R        : '%' ;

OP_ATR_I        : '=' ;

OP_ATR_M        : '-=' ;

OP_ATR_P        : '+=' ;

CT_VIG          : ',' ;

CT_END          : ';' ;

CT_ITG          : '!' ;

fragment ESC    : '\\' ('n'|'t'|'\"'|'\''|'\\') ;

fragment SPC    : ('a'..'z'|'A'..'Z'|'0'..'9') ;

fragment CES    : ('?'|'#'|'$'|'@'|'^'|'.'|':'|'_'|'`'|'~') ;

fragment UNI    : ('<'|'>'|'='|'&'|'|'|'!'|'+'|'-'|'*'|'/'|'%'|')'|'('|']'|'['|';'|',') ;