programa
{
	funcao inicio ()
	{
		inteiro tamanho = 5, acumula = 0
		inteiro vetor[5]
		
		para(inteiro i = 0; i < tamanho; i++)
		{
			escreva("Inteiro: ")
			leia(vetor[i])
		}
		
		para(inteiro i = 0; i < tamanho - 1; i++)
		{
			se(vetor[i] > vetor[i + 1])
			{
				acumula = acumula + 1
			}
			
		}
		
		se (acumula > 0){
			escreva("Não ordenado")
		} senao {
			escreva("Ordenado")
		}
	}
}