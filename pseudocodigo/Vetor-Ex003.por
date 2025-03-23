programa
{
	funcao inicio ()
	{
	real numeros[6], menor_valor = 0.0, maior_valor = 0.0

	para (inteiro i=0; i < 6; i++){
		escreva("Digite o ", i+1, "º numero: " )
		leia(numeros[i])
	}	
	
	menor_valor = numeros[0]
	maior_valor = numeros[0]
	
	para (inteiro cont=0; cont < 6; cont++){
		se(menor_valor > numeros[cont]){
			menor_valor = numeros[cont]
			
		}	
		senao se(maior_valor < numeros[cont]){
			maior_valor = numeros[cont]
		}
		
		}
	
	escreva("O menor valor é: ", menor_valor, "\n")
	escreva("O maior valor é: ", maior_valor, "\n")		
	}
	}
}