var_nome = str("")
num1 = 0
num2 = 0
media = 0
ano = 0

var_nome = input("Nome: ")

num1 = int(input("Nota 1: "))
num2 = int(input("Nota 2: "))

media = (num1 + num2) / 2

print(media)

if(media >= 7):
  ano = int(input("Ano - (1, 2, 3) "))
  
  if(ano == 3):
    print("Diplomado")
  else:  
    print("Aprovado!")
else:
  print("Nova prova!")
