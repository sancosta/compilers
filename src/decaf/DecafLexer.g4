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

BOOLEANLITERAL : ('false'|'true');
RESERVEWORD : ('if'|'boolean'|'break'|'callout'|'class'|'continue'|'else'|'for'|'int'|'return'|'void') ;

LCURLY : '{' ;
RCURLY : '}' ;

WS_ : (' '|'\n'|'\t') -> skip ;
SL_COMMENT : '//' (~'\n')* '\n' -> skip ;

ID : [_a-zA-Z][_a-zA-Z0-9]* ;
CHAR : '\'' (ESC|SPC) '\'' ;
STRING : '\"' (ESC|SPC|ID|' ')+ '\"' ;
INT : ('0x'[a-fA-F0-9]+|[0-9]+) ;

OPERADOR : ('+'|'-'|'*'|'>'|'<'|'<='|'>='|'!='|'&&') ;
ESP : ('!'|'#'|'$'|'%'|'&'|')'|'('|'*'|'+'|','|'-'|':'|','|';'|'<'|'='|'>'|'@'|']'|'['|'^'|'_'|'`'|'|'|'~') ;

fragment
ESC :  '\\' ('n'|'t'|'\"'|'\''|'\\') ;

fragment
SPC : ('a'..'z'|'A'..'Z'|'0'..'9'|'!'|'#'|'$'|'%'|'&'|')'|'('|'*'|'+'|','|'-'|'.'|':'|','|';'|'<'|'='|'>'|'?'|'@'|']'|'['|'^'|'_'|'`'|'|'|'~') ;