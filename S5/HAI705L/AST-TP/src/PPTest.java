import org.antlr.v4.runtime.*;

import java.io.IOException;

public class PPTest {
    public static void main (String [] argv) throws IOException {
        CharStream stream = CharStreams.fromFileName("src/test.txt");
        PPLexer lexer = new PPLexer(stream);
        CommonTokenStream tokens = new CommonTokenStream (lexer);
        PPParser parser = new PPParser(tokens);
        PPProg prog = parser.prog().value;
        System.out.println(prog);
    }
}