/*
    David Binaud - Hamza Ikiou - Master M1 GL
*/

grammar PP;

prog returns [PPProg value]:
    declarationVariables
    declarationsFuncProc
	instructions
	EOF
	{ $value = new PPProg($declarationVariables.value, $declarationsFuncProc.value, $instructions.value); }
	;

//Declarations of func and proc
declarationsFuncProc returns [ArrayList<PPDef> value]
@init{ $value = new ArrayList<PPDef>(); } :
    ( funcProc { $value.add($funcProc.value); } )*
    ;

//Declaration of a func or Proc
funcProc returns [PPDef value]:
    (funcName=ID'(' declarationArgs ')' (':' returnType=types)?
    localVars=declarationVariables
    instructions)
    {   if($returnType.value != null){
            $value = new PPFun($funcName.text, $declarationArgs.value, $localVars.value, $instructions.value, $returnType.value);
        } else {
            $value = new PPProc($funcName.text, $declarationArgs.value, $localVars.value, $instructions.value);
        }
    }
    ;

//Arg declaration for func or proc
declarationArgs returns [ArrayList<Pair<String,Type>> value]
@init{ $value = new ArrayList<Pair<String,Type>>(); } :
    (argName=ID ':' argType=types { $value.add(new Pair($argName.text, $argType.value)); } )*
    ;

//Var declarations for prog, func or proc
declarationVariables  returns [ArrayList<Pair<String,Type>> value]
@init{ $value = new ArrayList<Pair<String,Type>>(); } :
    ('var' (ID ':' types {$value.add(new Pair($ID.text, $types.value)); } )+)?
    ;

instructions returns [PPInst value]:
    ID ':''=' expr                                                              { $value = new PPAssign($ID.text, $expr.value); }                                |
    array=expr '[' index=expr ']' ':''=' expr                                   { $value = new PPArraySet($array.value, $index.value, $expr.value); }            |
    'if' cond=expr 'then' trueInst=instructions 'else' falseInst=instructions 	{ $value = new PPCond($cond.value, $trueInst.value, $falseInst.value); }         |
    'while' cond=expr 'do' instructions	                                        { $value = new PPWhile($cond.value, $instructions.value); }					    |
    procCall							                                                                                                                        |
    'skip'		                                                                { $value = new PPSkip(); }										                |
    inst1=instructions ';' inst2=instructions                                   { $value = new PPSeq($inst1.value, $inst2.value); }
    ;

//Call to a proc
procCall returns [PPProcCall value]:
    phi '(' callArgs ')' { $value = new PPProcCall($phi.value, $callArgs.value); }
    ;

//Call arguments for functions or proc
callArgs returns [ArrayList<PPExpr> value]
@init{ $value = new ArrayList<PPExpr>(); } :
    ( e = expr { $value.add($e.value); } )*
    ;

// Expression
expr returns [PPExpr value]:
    c=const                                       { $value = $c.value; }                              |
    ID                                          { $value = new PPVar($ID.text); }                       |
    '-' expr                                    { $value = new PPInv($expr.value); }                    |
    'not' expr                                  { $value = new PPNot($expr.value); }                    |
    e1=expr '+' e2=expr 	                    { $value = new PPAdd($e1.value, $e2.value); }           |
    e1=expr '-' e2=expr 	                    { $value = new PPSub($e1.value, $e2.value); }           |
    e1=expr '*' e2=expr 	                    { $value = new PPMul($e1.value, $e2.value); }           |
    e1=expr '/' e2=expr 	                    { $value = new PPDiv($e1.value, $e2.value); }           |
    e1=expr 'and' e2=expr                       { $value = new PPAnd($e1.value, $e2.value); }           |
    e1=expr 'or' e2=expr 	                    { $value = new PPOr($e1.value, $e2.value); }            |
    e1=expr '<' e2=expr 	                    { $value = new PPLt($e1.value, $e2.value); }            |
    e1=expr '<=' e2=expr 	                    { $value = new PPLe($e1.value, $e2.value); }            |
    e1=expr '==' e2=expr                        { $value = new PPEq($e1.value, $e2.value); }            |
    e1=expr '!=' e2=expr 	                    { $value = new PPNe($e1.value, $e2.value); }            |
    e1=expr '>=' e2=expr 	                    { $value = new PPGe($e1.value, $e2.value); }            |
    e1=expr '>' e2=expr                         { $value = new PPGt($e1.value, $e2.value); }            |
    funCall                                                                                             |
    array=expr '[' index=expr ']'               { $value = new PPArrayGet($array.value, $index.value); }               |
    'new' 'array' 'of' types '[' size=expr ']'  { $value = new PPArrayAlloc($types.value, $size.value); }
    ;

//Call to a function
funCall returns [PPFunCall value]:
    phi '(' callArgs ')' { $value = new PPFunCall($phi.value, $callArgs.value); }
    ;


// Call target
phi returns [Callee value]:
    'read'  { $value = new Read(); }        |
    'write' { $value = new Write(); }       |
    ID      { $value = new User($ID.text); }
    ;

// types
types returns [Type value]:
    'integer'           { $value = new Int(); }    |
    'boolean'           { $value = new Bool(); }   |
    'array' 'of' types  { $value = new Array($types.value); };

// const
const returns [PPExpr value]:
    Number  { $value = new PPCte(Integer.parseInt($Number.text)); }      |
    'true'  { $value = new PPTrue(); }                                   |
    'false' { $value = new PPFalse(); }
    ;

// On ne prends pas en compte la précédence des expressions
//Quand dans le cours x ou f on utilise ID
//Quand c'est une suite de mots, utiliser des '' pour chaque mots pour corriger le problème d'espacement exact
ID: [a-zA-Z]+ ;

// A number is an integer value
Number : ('0'..'9')+ ;
// We're going to ignore all white space characters
WS : [ \t\r\n]+ -> skip ;