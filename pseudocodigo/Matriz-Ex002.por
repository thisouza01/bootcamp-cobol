programa
{
	funcao inicio ()
	{
		inteiro matriz_a[3][3], matriz_b[3][3], matriz_c[3][3]
		
		para (inteiro linha=0;linha<3;linha++)
		{
			escreva("linha ", linha+1, "\n")
			para (inteiro coluna=0;coluna<3;coluna++)
			{
				escreva("coluna ", coluna+1, ": ")
				leia(matriz_a[linha][coluna])
			}
		}
		para (inteiro linha=0;linha<3;linha++)
		{
			escreva("linha ", linha+1, "\n")
			para (inteiro coluna=0;coluna<3;coluna++)
			{
				escreva("coluna ", coluna+1, ": ")
				leia(matriz_b[linha][coluna])	
			}
		}
		para (inteiro linha=0;linha<3;linha++)
		{
			para (inteiro coluna=0;coluna<3;coluna++)
			{
				matriz_c[linha][coluna] = matriz_a[linha][coluna] + matriz_b[linha][coluna]	
			}
		}
		para (inteiro linha=0;linha<3;linha++)
		{
			escreva("\n")
			escreva("linha ", linha+1, "\n")
			para (inteiro coluna=0;coluna<3;coluna++)
			{
				escreva(matriz_c[linha][coluna],"|")	
			}
		}
		
	}
}