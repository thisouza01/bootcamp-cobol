programa
{
	funcao inicio ()
	{
		real salario_base, faturamento, salario_novo = 0
		
		escreva("Salario base: ")
		leia(salario_base)
		
		escreva("Faturamento: ")
		leia(faturamento)
		
		se(faturamento > 5000){
			salario_novo = salario_base + 300
		}
		
		escreva("Salario base: ", salario_base, ", Salario novo: ", salario_novo, " Faturamento: ", faturamento)
		
	}
}