capital = 0
capital_acumulado = 0
taca = 0
meses = 0
contador = 1

capital = float(input("Qual o capital de investimento: "))
taxa = float(input("Qual a taxa por mes: "))
meses = int(input("Quantidade de meses do investimento: "))

capital_acumulado = capital

for contador in range(meses):
    capital_acumulado = capital_acumulado + (capital_acumulado * taxa)


print(f"Capital acumulado: {capital_acumulado:.2f}")