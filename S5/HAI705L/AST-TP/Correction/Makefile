# $Id: 007ee4442e1f422952c2b6d2dfa9e15f1ad1a057 $

ANTLR=java -jar /home/e20180001426/Bureau/M1/S5/HAI705L/AST-TP/antlr4.jar
JAVAC= javac -cp antlr4.jar
G4=Hello.g4 ExprArith.g4 ExprArithEval.g4 ExprArithAST.g4 ExprArithList.g4

bin:
	for i in $(G4); do $(ANTLR) $$i; done; \
        for i in $(G4); do tmp=`basename $$i .g4`; $(JAVAC) $$tmp*.java; done

clean:
	rm -f *~ *.interp *.class *.tokens *Lexer.java *Parser.java *Listener.java
