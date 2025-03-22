programa
{
	funcao inicio ()
	{
	inteiro numeros[5], soma_numeros = 0
	real media = 0.0

	para (inteiro i=0; i < 5; i++){
		escreva("Digite o ", i+1, "º numero: " )
		leia(numeros[i])
		
		soma_numeros = soma_numeros + numeros[i]
	}	
		
	media = soma_numeros / 5
	
	escreva("A média final é: ", media, "\n")
	
	para (inteiro cont=0; cont < 5; cont++){
		se(numeros[cont] > media){
			escreva(numeros[cont], " é maior que a média!", "\n")
		}
	}
	}
}