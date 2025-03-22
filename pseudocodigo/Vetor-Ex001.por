programa
{
	funcao inicio ()
	{
		inteiro numeros[5], soma_numeros = 0
		real media = 0.0
		
		para(inteiro i=0; i<5; i++){
			escreva("adicione o ", i+1, "º numero: ")		
			leia(numeros[i])
			
			soma_numeros = soma_numeros + numeros[i]
		}
		
		media = soma_numeros / 5
		
		escreva("A média dos numeros é: ", media)
	}
}