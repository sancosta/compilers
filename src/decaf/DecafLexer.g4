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

WS_             : (' '|'\n'|'\t') -> skip ;

SL_COMMENT      : '//' (~'\n')* '\n' -> skip ;

ID              : [_a-zA-Z][_a-zA-Z0-9]* ;

CHAR            : '\'' (ESC|SPC|CES|UNI) '\'' ;

STRING          : '\"' (ESC|SPC|CES|UNI|' ')+ '\"' ;

INT             : [0-9]+ ~('x'|')'|'('|']'|'['|';'|'.'|','|'-') ;

HEXDECIMAL      : '0x' [a-fA-F0-9]+ ;

OP_REL          : ('>'|'<'|'<='|'>=') ;

OP_COD          : ('&&'|'||') ;

OP_IGU          : ('!='|'==') ;

OP_ARI          : ('+'|'-'|'*'|'/'|'%') ;

OP_ATR          : ('='|'-='|'+=') ;

OP_GEL          : (OP_REL|OP_COD|OP_IGU|OP_ARI|OP_ATR) ;

CL_CUR          : '{' ;

CR_CUR          : '}' ;

CL_COC          : '[' ;

CR_COC          : ']' ;

CL_PAR          : '(' ;

CR_PAR          : ')' ;

CT_VIG          : ',' ;

CT_END          : ';' ;

CT_MIN          : '-' ;

CT_IGU          : '=' ;

CT_ITG          : '!' ;

fragment ESC    : '\\' ('n'|'t'|'\"'|'\''|'\\') ;

fragment SPC    : ('a'..'z'|'A'..'Z'|'0'..'9') ;

fragment CES    : ('?'|'#'|'$'|'@'|'^'|'.'|':'|'_'|'`'|'~') ;

fragment UNI    : ('<'|'>'|'='|'&'|'|'|'!'|'+'|'-'|'*'|'/'|'%'|')'|'('|']'|'['|';'|',') ;