programa
{
	funcao inicio ()
	{
		real peso, altura, imc = 0
		
		escreva("Peso: ")
		leia(peso)
		
		escreva("Altura: ")
		leia(altura)
		
		imc = peso * (altura * altura)
		
		escreva(imc)
		
		se(imc <= 18.5){
			escreva("Abaixo")
		} senao se(imc >18.5 e imc <= 24.9){
			escreva("Normal")
		} senao se(imc > 25 e imc <= 29.9){
			escreva("Sobrepeso")
		} senao {
			escreva("Acima")
		}
		
	}
}