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

program         : TK_CLASS CL_CUR field_decl* method_decl* CR_CUR ;

field_decl      : type id (CT_VIG type id)* CT_END
                  | type id CL_COC int_literal CR_COC (CT_VIG type id CL_COC int_literal CR_COC)* CT_END ;

method_decl     : ( type | RVOID ) id CL_PAR ( type id (CT_VIG type id)* )* CR_PAR block ;

block           : CL_CUR var_decl* statement* CR_CUR ;

var_decl        : type id (CT_VIG type id)* CT_END ;

type            : RINT 
                  | RBOOLEAN ;

statement       : location assign_op expr CT_END
                  | method_call CT_END
                  | RIF CL_PAR expr CR_PAR block (RELSE block)*
                  | RFOR id OP_ATR_I expr CT_VIG expr block
                  | RRETURN expr* CT_END
                  | RBREAK CT_END
                  | RCONTINUE CT_END
                  | block ;

assign_op       : OP_ATR_I
                  | OP_ATR_M
                  | OP_ATR_P ;

method_call     : method_name CL_PAR (expr (CT_VIG expr)*)* CR_PAR
                  | RCALLOUT CL_PAR string_literal (CT_VIG callout_arg)* CR_PAR ;

method_name     : id ;

location        : id
                  | id CL_COC expr CR_COC ;

expr            : location
                  | method_call
                  | literal
                  | expr bin_op expr
                  | OP_ARI_M expr
                  | CT_ITG expr
                  | CL_PAR expr CR_PAR ;

callout_arg     : expr
                  | string_literal ;

bin_op          : arith_op
                  | rel_op
                  | eq_op
                  | cond_op ;

arith_op        : OP_ARI_P
                  | OP_ARI_M
                  | OP_ARI_X
                  | OP_ARI_D
                  | OP_ARI_R ;

rel_op          : OP_REL ;

eq_op           : OP_IGU ;

cond_op         : OP_COD ;

literal         : int_literal
                  | char_literal
                  | bool_literal ;

id              : ID ;

digit           : INT ;

hex_digit       : HEXDECIMAL ;

int_literal     : decimal_literal
                  | hex_literal ;

decimal_literal : digit digit* ;

hex_literal     : hex_digit hex_digit* ;

bool_literal    : RFALSE
                  | RTRUE ;

char_literal    : CHAR ;

string_literal  : STRING ;