package decaf;

import java.io.*;
import java.util.Arrays;
import javax.swing.JFrame;
import javax.swing.JPanel;

//import antlr.Token;

import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.gui.TreeViewer;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java6035.tools.CLI.*;
import decaf.DecafSymbolsAndScopes;

class Main {

    public static void main(String[] args) {
		
		try 
		{
        	CLI.parse (args, new String[0]);

        	InputStream inputStream = args.length == 0 ? System.in : new java.io.FileInputStream(CLI.infile);

        	if (CLI.target == CLI.SCAN)
        	{
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
        		Token token;
        		boolean done = false;
        		while (!done)
        		{
        			try
        			{
		        		for (token=lexer.nextToken(); token.getType()!=Token.EOF; token=lexer.nextToken())
		        		{
		        			String type = "";
		        			String text = token.getText();

		        			switch (token.getType())
		        			{
								case DecafLexer.BOOLEANLITERAL:
									type = " BOOLEANLITERAL";
									break;
								case DecafLexer.RESERVEWORD:
									type = " ";
									break;
								case DecafLexer.ID:
									type = " IDENTIFIER";
									break;
								case DecafLexer.CHAR:
									type = " CHARLITERAL";
									break;
								case DecafLexer.HEXDECIMAL:
									type = " INTLITERAL";
									break;
								case DecafLexer.INT:
									type = " INTLITERAL";
									break;
								case DecafLexer.STRING:
									type = " STRINGLITERAL";
									break;
		        			}
		        			System.out.println (token.getLine() + type + " " + text);
		        		}
		        		done = true;
        			} catch(Exception e) {
        	            System.out.println(CLI.infile+" "+e);
        	            lexer.skip();
        	        }
        		}
        	}
        	else if (CLI.target == CLI.PARSE || CLI.target == CLI.DEFAULT)
        	{
        		
				DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
				CommonTokenStream tokens = new CommonTokenStream(lexer);
        		DecafParser parser = new DecafParser(tokens);

                // Adiciona as regras semanticas
                ParseTree tree = parser.program();

                if (CLI.debug) 
				{
                    
					// Se estiver no modo debug imprime a arvore de parsing
                    // Create Tree View
                    // Source: https://stackoverflow.com/questions/23809005/how-to-display-antlr-tree-gui

                    // Show AST in console
                    System.out.println(tree.toStringTree(parser));

                    // Show AST in GUI
                    JFrame frame = new JFrame("Antlr AST");
                    JPanel panel = new JPanel();
                    TreeViewer viewr = new TreeViewer(Arrays.asList(parser.getRuleNames()),tree);
                    
					viewr.setScale(1.0);
                    panel.add(viewr);
                    frame.add(panel);
                    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
					frame.setLocationRelativeTo(null);
					frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
                    frame.setVisible(true);

                }

        	}
			else if (CLI.target == CLI.INTER)
			{

				// Primeiro faz o parsing da cadeia
				DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
				CommonTokenStream tokens = new CommonTokenStream(lexer);
				DecafParser parser = new DecafParser(tokens);

				// Adiciona as regras semânticas
				ParseTree tree = parser.program();

				// Realiza o parsing do programa
				DecafSymbolsAndScopes def = new DecafSymbolsAndScopes();
				ParseTreeWalker walker = new ParseTreeWalker();
				walker.walk(def, tree);

				if (CLI.debug) 
				{

					// Se estiver no modo debug imprime a árvore de parsing
					// Create Tree View
					// Source: https://stackoverflow.com/questions/23809005/how-to-display-antlr-tree-gui

					// Show AST in console
					System.out.println(tree.toStringTree(parser));

					// Show AST in GUI
					JFrame frame = new JFrame("Antlr AST");
					JPanel panel = new JPanel();
					TreeViewer viewr = new TreeViewer(Arrays.asList(parser.getRuleNames()),tree);

					viewr.setScale(1.0);
                    panel.add(viewr);
                    frame.add(panel);
                    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
					frame.setLocationRelativeTo(null);
					frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
                    frame.setVisible(true);

				}

			}
        	
        } 
		catch(Exception e) 
		{
        	// Print the error:
            System.out.println(CLI.infile+" "+e);
        }
    }

}

