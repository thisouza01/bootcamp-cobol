programa
{
	funcao inicio ()
	{
		inteiro num1, num2, num_Temp = 0
		
		escreva("Número 1: ")
		leia(num1)
		
		escreva("Número 2: ")
		leia(num2)
		
		se(num1 != num2){
			num_Temp = num1
			num1 = num2
			num2 = num_Temp
		}
		
		escreva("Número 1: ", num1, ", Número 2: ", num2)
			
				
	}
}