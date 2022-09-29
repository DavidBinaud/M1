// $Id$

grammar PP;
// On ne prends pas en compte la précédence des expressions
//Quand dans le cours x ou f on utilise ID
//Quand c'est une suite de mots, utiliser des '' pour chaque mots pour corriger le problème d'espacement exact

ID: [a-z]+ ;

types: 'integer' | 'boolean' | 'array' 'of' types ;

const:  Number | 'true' | 'false'

variables:


prog:

	func*
	instructions
//
func:
	instructions

instructions:
	'if' expr 'then' instructions 'else' instructions 	|
	'while' expr 'do' instructions						|
	phi													|
	'skip'												|
	instructions ';' instructions						|



// Expression
expr:
	const |

// Unary Operator
uop:

// Binary Operator
bop: 
	atomExpr '+' atomExpr 	|
	atomExpr '-' atomExpr 	|
	atomExpr '*' atomExpr 	|
	atomExpr '/' atomExpr 	|
	atomExpr 'and' atomExpr |
	atomExpr 'or' atomExpr 	|
	atomExpr '<' atomExpr 	|
	atomExpr '<=' atomExpr 	|
	atomExpr '!=' atomExpr 	|
	atomExpr '>=' atomExpr 	|
	atomExpr '>' atomExpr

// Call target
phi: 'read' | 'write' | ID

// A number is an integer value
Number : ('0'..'9')+ ;

// We're going to ignore all white space characters
WS : [ \t\r\n]+ -> skip ;