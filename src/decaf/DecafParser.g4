parser grammar DecafParser;

@header 
{
  package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: TK_CLASS LCURLY field_decl* method_decl* RCURLY ;

field_decl: type id (',' type id)*
  | type id '[' int_literal ']' (',' type id '[' int_literal ']') ';' ;

method_decl: (type|'void') id '(' [ type id (',' type id)* ] ')' block ;

block: LCURLY var_decl* statement* RCURLY ;

var_decl: type id (',' type id)* ';' ;

type: RINT 
  | RBOOLEAN ;

statement: location assign_op expr ';'
  | method_call ';'
  | RIF '(' expr ')' block (RELSE block)* 
  | RFOR '(' id = expr ';' expr ';' block ')'
  | RRETURN expr* ';'
  | RBREAK ';'
  | RCONTINUE ';'
  | block ;

assign_op: OP_ATR ;

method_call: method_name '(' expr (',' expr)* ')'
  | RCALLOUT '(' string_literal (',' callout_arg)* ')' ;

method_name: id ;

location: id
  | id (expr)* ;

expr: location
  | method_call
  | literal
  | expr bin_op expr
  | '-' expr
  | '!' expr
  | '(' expr ')' ;

callout_arg: expr
  | string_literal ;

bin_op: OP_ARI 
  | OP_REL
  | OP_IGU
  | OP_COD ;

literal: int_literal
  | char_literal
  | bool_literal ;

id: alpha alpha_num* ;

alpha_num: alpha | digit ;

alpha: ID ;

digit: INT ;

hex_digit: HEXDECIMAL ;

int_literal: decimal_literal | hex_literal ;

decimal_literal: digit digit* ;

hex_literal:  hex_digit hex_digit* ;

bool_literal: BOOLEANLITERAL ;

char_literal: CHAR ;

string_literal: STRING ;




