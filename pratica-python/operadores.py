salario = 0
faltas = 0
salario_novo = 0

salario = float(input("Salario: "))
faltas = int(input("Quantidade de faltas: "))

if(salario < 2000 and faltas == 0):
    salario_novo = salario * 1.10
else:
    salario_novo = salario

print(f"O salario novo é: {salario_novo}")