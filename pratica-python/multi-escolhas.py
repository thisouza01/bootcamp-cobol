var_produto = ""
valor = 0
estado = ""

var_produto = str(input("Nome: "))
valor = int(input("Valor: "))
estado = str(input("Estado [SP/RJ/MG]: "))

frete = 0

match estado:
  case "SP":
    frete = valor * 0.10
  case "RJ":
    frete = valor * 0.15
  case "MG":  
    frete = valor * 0.17
  case _:  
    print("Não entregamos!")

if frete > 0:
    print(f"Frete: R${frete:.2f}")
else:
    print("Nenhum frete disponível para o estado informado.")
    