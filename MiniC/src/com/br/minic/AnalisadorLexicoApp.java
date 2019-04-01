package com.br.minic;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.br.minic.token.Token;

public class AnalisadorLexicoApp {

	public static void main(String[] args) throws IOException{
	
		FileReader fileReader = null;
		
		try {
			
			fileReader = new FileReader("programas/Teste1.txt");
			
		}
		
		catch(FileNotFoundException e) {
			
			e.printStackTrace();
			
		}
		
		AnalisadorLexico analisadorLexico = new AnalisadorLexico(fileReader);
		
		List<Token> tokens = new ArrayList<Token>();
		List<Token> tokenErros = new ArrayList<Token>();
		
		Token token = analisadorLexico.yylex();
		
		while (token != null) {
			
			if( token.getTipo().equalsIgnoreCase("ERRO")) {
				
				tokenErros.add(token);
				
			}else {
				
				tokens.add(token);
			
			}
			
			System.out.println(token);
			
			token = analisadorLexico.yylex();
		}
		
		System.out.println("-----TOKENS-----\n ");
		
		for(Token tokenAux: tokens) {
			
			System.out.println(" " + tokenAux);
		
		}
		
		System.out.println("\n\n -----ERROS-----\n");
		
		for(Token tokenAux: tokenErros) {
			
			System.out.println(" " + tokenAux);
			
		}
		
		System.out.println("\nTotal de Erros: " + tokenErros.size() );
		
	}
		
}
