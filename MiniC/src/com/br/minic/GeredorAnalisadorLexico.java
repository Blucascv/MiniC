package com.br.minic;
import java.io.File;

public class GeredorAnalisadorLexico {
	
	public static void main(String[] args) {
		
		
		File arquivoEspecificacao = new File("especificacoes/MiniC.lex");
		
		jflex.Main.generate(arquivoEspecificacao);
		
	}

}
