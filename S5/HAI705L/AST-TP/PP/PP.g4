// $Id$

grammar PP;
// On ne prends pas en compte la précédence des expressions
//Quand dans le cours x ou f on utilise ID
//Quand c'est une suite de mots, utiliser des '' pour chaque mots pour corriger le problème d'espacement exact
ID: [a-zA-Z]+ ;

// A number is an integer value
Number : ('0'..'9')+ ;

// types
types: 'integer' | 'boolean' | 'array' 'of' types ;

// const
const:  Number | 'true' | 'false';

// Binary Operator
bop:
    expr '+' expr 	|
	expr '-' expr 	|
	expr '*' expr 	|
	expr '/' expr 	|
	expr 'and' expr |
	expr 'or' expr 	|
	expr '<' expr 	|
	expr '<=' expr 	|
	expr '==' expr  |
	expr '!=' expr 	|
	expr '>=' expr 	|
	expr '>' expr
	;

// Unary Operator
uop: '-' expr | 'not' expr;

// Call target
phi: 'read' | 'write' | ID;

// Expression
expr:
	const                                   |
	ID                                      |
	uop                                     |
	bop                                     |
    phi '(' expr* ')'                       |
	expr '[' expr ']'                       |
	'new' 'array' 'of' types '[' expr ']'
	;

instructions:
    ID ':''=' expr                                        |
    expr '[' expr ']' ':''=' expr                         |
	'if' expr 'then' instructions 'else' instructions 	|
	'while' expr 'do' instructions						|
	phi '(' expr* ')'									|
	'skip'												|
	instructions ';' instructions
	;

variables:
    'var' (ID ':' types)+;

//
funcProc:
    ID'('(ID ':' types)* ')' (':' types)?
    variables?
	instructions
	;

prog:
    variables?
    funcProc*
	instructions
	;

// We're going to ignore all white space characters
WS : [ \t\r\n]+ -> skip ;