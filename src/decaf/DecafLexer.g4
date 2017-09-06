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

RESERVEWORD : 'if' ;

LCURLY : '{';
RCURLY : '}';

ID : '_'?[a-zA-Z0-9_]+ ;

WS_ : (' ' | '\n') -> skip;

SL_COMMENT : '//' (~'\n'|ID)* '\n' -> skip;

CHAR : '\'' (ESC|'\\t'|'\\\\') '\'';
STRING : '"' (ESC|~'"')* '"';
INTLITERAL : '0x'[a-fA-F0-9]+ ;

fragment
ESC :  '\\' ('n'|'"');