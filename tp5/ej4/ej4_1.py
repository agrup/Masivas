import math
import random

def distancia(p,c):
	d=((p[0]-c[0])**2 ) + ((p[1]-c[1])**2)
	d=math.sqrt(d)
	return(d)

def calcularCentroMedia(lista):
	largo=len(lista)
	sumax=0
	sumay=0
	lf=[]
	#print(largo)
	for i in range(0 ,largo):
		l2=len(lista[i])
		listai = lista[i]
		for i in range (0,l2):
			valor = listai[i]
			sumax += valor[0]
			sumay += valor[1]
		l=[math.ceil(sumax/l2),math.ceil(sumay/l2)]
		sumay=0
		sumax=0
		lf.append(l)
	return lf

def calclarCentroVacio(lista,centros):
	men=100000
	cn=1
	l=[]
	largo=len(lista)
	ancho=len(centros)
	for i in range (0,ancho):#creo la lista para los centrodes
		l.append([])	
	for i in range (0,largo):#recorro la lista de puntos
		for j in range(0,ancho):#recorro los centroides para comparar las distancias
			d = (distancia(lista[i],centros[j]))
			if (d<men):
				cn=j
				men=d
				#print(men)
				#print(j)
		l[cn].append(lista[i])
		men=1000000
	return(l)	

def asignarRandom(lista,cl):
	largo=len(lista)
	l=[]
	for i in range (1,cl+1):
		l.append([])
	for i in range(0,largo):
		r = (random.randrange(cl))
		l[r].append(lista[i])
	return l

def asignarCentro(lPuntos,lcentroides):
	men=100000
	cn=1
	l=[]
	largo=len(lPuntos)
	ancho=len(lcentroides)
	print(lPuntos)
	for i in range (0,ancho):#creo la lista para los centrodes
		l.append([])	
	for i in range (0,largo):#recorro la lista de puntos
		l2=len(lPuntos[i])
		listai = lPuntos[i]
		for p in range (0,l2):#recorr la lista internas de puntos para un centroide
			for j in range(0,ancho):#recorro los centroides para comparar las distancias
				d = (distancia(listai[p],lcentroides[j]))
				if (d<men):
					cn=j
					men=d
					#print(men)
					#print(j)
			l[cn].append(listai[p])
			men=1000000
	return(l)

#############MAIN######################	

A1=(2,10)
A2=(2,5)
A3=(8,4)
A4=(2,7)
A5=(7,5)
A6=(6,4)
A7=(1,2)
A8=(4,9)
c1=(2,10)
c2=(2,5)
c3=(1,2)

#print (distancia(A1,c1))
list=[A1,A2,A3,A4,A5,A6,A7,A8]
#list.append(A3)
#list.append(A4)

#laux=asignarRandom(list,3)
centroides=[A1,A2,A7]#asigno los centros del ej 3

laux=calclarCentroVacio(list,centroides)
print("lista")
print(laux)
char = "S"
while (char != "N"):
	centroides=calcularCentroMedia(laux)
	print("centroides")
	print (centroides)
	laux=asignarCentro(laux,centroides)
	print("aux")
	print (laux)
	char=input("Seguir iterando")
print("centroides")
print(centroides)
print("Lista final")
print(laux)

#print(calcularpivoteMedia(l1))