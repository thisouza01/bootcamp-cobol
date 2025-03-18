programa
{
	funcao inicio ()
	{
		real capital, capital_final=0.0, taxa
		inteiro num_meses, contador = 1
		
		escreva("Qual o capital: ")
		leia(capital)
		
		escreva("Taxa: ")
		leia(taxa)
		
		escreva("Quantidade de meses: ")
		leia(num_meses)
		
		capital_final = capital
		
		enquanto(contador <= num_meses){
			capital_final = capital_final + (capital_final * taxa)
			contador ++
		}
		
		escreva(capital,"\n")
		escreva(capital_final,"\n")
		escreva(taxa,"\n")
		escreva(num_meses)
		
	}
}