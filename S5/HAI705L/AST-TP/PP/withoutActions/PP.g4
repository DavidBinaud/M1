// $Id$

grammar PP;
// On ne prends pas en compte la précédence des expressions
//Quand dans le cours x ou f on utilise ID
//Quand c'est une suite de mots, utiliser des '' pour chaque mots pour corriger le problème d'espacement exact
ID: [a-zA-Z]+ ;

// A number is an integer value
Number : ('0'..'9')+ ;

prog:
    declarationVariables?
    funcProc*
	instructions
	EOF
	;

//
funcProc:
    ID'('(ID ':' types)* ')' (':' types)?
    declarationVariables?
    instructions
    ;

declarationVariables:
    'var' (ID ':' types)+;

instructions:
    ID ':''=' expr                                                                |
    expr '[' expr ']' ':''=' expr                                                 |
    'if' expr 'then' instructions 'else' instructions 	|
    'while' expr 'do' instructions						|
    phi '(' expr* ')'									|
    'skip'												|
    instructions ';' instructions
    ;

// Expression
expr:
    const                                   |
    ID                                      |
    '-' expr                                |
    'not' expr                              |
    expr '+' expr 	                        |
    expr '-' expr 	                        |
    expr '*' expr 	                        |
    expr '/' expr 	                        |
    expr 'and' expr                         |
    expr 'or' expr 	                        |
    expr '<' expr 	                        |
    expr '<=' expr 	                        |
    expr '==' expr                          |
    expr '!=' expr 	                        |
    expr '>=' expr 	                        |
    expr '>' expr                           |
    phi '(' expr* ')'                       |
    expr '[' expr ']'                       |
    'new' 'array' 'of' types '[' expr ']'
    ;

// Call target
phi: 'read' | 'write' | ID;

// types
types: 'integer' | 'boolean' | 'array' 'of' types ;

// const
const:  Number | 'true' | 'false';

// We're going to ignore all white space characters
WS : [ \t\r\n]+ -> skip ;