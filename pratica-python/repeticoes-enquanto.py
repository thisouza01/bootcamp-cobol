capital = 0
capital_acumulado = 0
taca = 0
meses = 0
contador = 1

capital = float(input("Qual o capital de investimento: "))
taxa = float(input("Qual a taxa por mes: "))
meses = int(input("Quantidade de meses do investimento: "))

capital_acumulado = capital

while contador <= meses:
    capital_acumulado = capital_acumulado + (capital_acumulado * taxa)
    contador = contador + 1


print(f"Capital acumulado: {capital_acumulado:.2f}")    