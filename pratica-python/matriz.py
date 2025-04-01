import numpy as np

notas = np.zeros((2,5), dtype=object)

for linha in range(2):
    notas[linha,0] = input("Nome: ")
    for coluna in range(4):
        notas[linha,coluna+1] = int(input("Numero: "))

media = 0

for linha in range(2):
    print("----------")
    print(notas[linha,0])
    for coluna in range(4):
        print(notas[linha,coluna+1])
        media = media + notas[linha,coluna+1]
    media = media / 4
    print("Media = ", media)    
