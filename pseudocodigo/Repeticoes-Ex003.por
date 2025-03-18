programa
{
	funcao inicio ()
	{
		real soma_produtos=0.0, valor
		cadeia produto
		caracter saida

		saida = 'n'
		
		enquanto(saida == 'n'){
			
			escreva("produto: ")
			leia(produto)
			
			escreva("valor: ")
			leia(valor)
			
			soma_produtos = soma_produtos + valor
			
			escreva("quer sair? (s/n) ")
			leia(saida)
		
		}
		
		escreva("Soma total = ", soma_produtos)
		
	}
}