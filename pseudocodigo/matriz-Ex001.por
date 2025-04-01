programa
{
	funcao inicio ()
	{
		inteiro tabela[4][3], soma_total = 0, maior_pontuacao = 0
		
		para (inteiro linha=0; linha < 4; linha++)
		{
			escreva("Linha ", linha+1, "\n")
			para (inteiro coluna=0; coluna < 3; coluna++)
			{
				escreva("numero ", coluna+1, ": ")
				leia(tabela[linha][coluna])
			}
		}
		
		para (inteiro linha=0; linha<4; linha++)
		{
			soma_total = 0
			para (inteiro coluna=0; coluna < 3; coluna++)
			{
				soma_total = soma_total + tabela[linha][coluna]
				
				se (maior_pontuacao < soma_total)
				{
					maior_pontuacao = soma_total
				}
			}
			escreva("A soma total da linha ", linha+1, " é ", soma_total, "\n")
		}
		
		escreva("A maior pontuação foi de : ", maior_pontuacao)
		
	}
}