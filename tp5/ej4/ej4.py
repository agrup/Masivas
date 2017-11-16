a = input("hola escribir")

inits =""
for palabra in a.split():
	inits += palabra[0]
print(inits.upper())