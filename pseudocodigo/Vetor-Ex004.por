programa
{
	funcao inicio ()
	{
		inteiro numeros[4] = {13,7,32,64}
		inteiro temp = 0
		
		para (inteiro i = 0; i < 4; i++)
		{
			escreva(" indice ", i, " : ", numeros[i], "\n")
			
		}
		
		escreva("==========================", "\n")
		
		para (inteiro i = 0; i < 4; i++)
		{
			para (inteiro j = 0; j < 4 - i - 1; j++)
			{
				se (numeros[j] > numeros[j + 1])
				{
					temp = numeros[j + 1]
					numeros[j + 1] = numeros[j]
					numeros[j] = temp
				}
			}
		}
		
		para (inteiro i = 0; i < 4; i++)
		{
			escreva(" indice ", i, " : ", numeros[i], "\n")
			
		}
	}
}