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

program: TK_CLASS ID LCURLY RCURLY EOF;