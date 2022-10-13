// $Id$

grammar PP;

prog returns [PPProg progVal]:
    declarationVariables
    declarationsFuncProc
	instructions
	EOF
	{ $progVal = new PPProg($declarationVariables.value, $declarationFuncProc.value, $instructions.value); }
	;

//Declarations of func and proc
declarationsFuncProc returns [ArrayList<PPDef> defs]
@init{ $defs = new ArrayList<PPDef>; } :
    ( funcProc { $defs.add($funcProc.value); } )*
    ;

//Declaration of a func or Proc
funcProc returns [PPDef def]:
    funcName=ID'(' declarationArgs ')' (':' returnType=types)?
    localVars=declarationVariables
    instructions
    {   if($returnType){
            $def = new PPFun($declarationArgs.value, $localVars.value, $instructions.value, $returnType.value);
        } else {
            $def = new PPProc($declarationArgs.value, $localVars.value, $instructions.value);
        }
    }
    ;

//Arg declaration for func or proc
declarationArgs returns [ArrayList<Pair<String,Type>> args]
@init{ $args = new ArrayList<Pair<String,Type>>; } :
    (argName=ID ':' argType=types { $args.add(new Pair($argName.text, $argType.value)); } )*
    ;

//Var declarations for prog, func or proc
declarationVariables  returns [ArrayList<Pair<String,Type>> list]
@init{ $list = new ArrayList<Pair<String,Type>>; } :
    ('var' (ID ':' types {$list.add(new Pair($ID.text, $types.value)); } )+)?
    ;

instructions returns [PPInst inst]:
    ID ':''=' expr                                                              { $inst = new PPAssign($ID.text, $expr.value); }                                |
    array=expr '[' index=expr ']' ':''=' expr                                   { $inst = new PPArraySet($array.value, $index.value, $expr.value); }            |
    'if' cond=expr 'then' trueInst=instructions 'else' falseInst=instructions 	{ $inst = new PPCond($cond.value, $trueInst.value, $falseInst.value); }         |
    'while' cond=expr 'do' instructions	                                        { $inst = new PPWhile($cond.value, $instructions.value); }					    |
    procCall							                                                                                                                        |
    'skip'		                                                                { $inst = new PPSkip(); }										                |
    inst1=instructions ';' inst2=instructions                                   { $inst = new PPSeq($inst1.value, $inst2.value); }
    ;

//Call to a proc
procCall returns [PPProcCall inst]:
    phi '(' callArgs ')' { $inst = new PPProcCall($phi.text, $args.value); }
    ;

//Call arguments for functions or proc
callArgs returns [ArrayList<PPExpr> list]
@init{ $list = new ArrayList<PPExpr>(); } :
    ( e = expr { $list.add($e.value); } )*
    ;

// Expression
expr returns [PPExpr value]:
    const                                       { $value = $const.value; }                              |
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
funCall returns [PPFunCall inst]:
    phi '(' callArgs ')' { $inst = new PPFunCall($phi.text, $callArgs.value); }
    ;


// Call target
phi: 'read' | 'write' | ID;

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