programa
{
    funcao inicio()
    {
        inteiro numero, soma_par = 0, soma_impar = 0, i
        
        escreva("Quantidade de vezes do loop: ")
        leia(numero)
        
        para(i = numero; i >= 0; i = i - 1)
        {
            se(i % 2 == 0) 
            {
                soma_par = soma_par + i
            } 
            senao 
            {
                soma_impar = soma_impar + i
            }
        }

        escreva("Soma dos pares: ", soma_par, " Soma dos ímpares: ", soma_impar)
    }
}