notas = []
media = float(0)

for i in range(4):
    notas.append(float(input("Nota: ")))
    media = media + notas[i]

media = media / 4

print(f"A média é {media}")

if media >= 7:
    print("Aprovado")
else:
    print("Nova prova")    