from cgi import print_arguments

L=int(input("Ingresa el largo del vector: ")) 								#largo del vector
C=[0]																		#inicio de lista

for i in range(L): 															#ingreso de datos
	C.append(int(input("Agrega un elemento al vector: ")))

C.append(0)																	#fin d elista
P=int(input("Ingresa la cantidad de permutaciones: ")) 						#cantidad de pasos
#print (C[1:-1]) 															#lista de control

for j in range(P): 		
	D=[]            														#lista de cambios													
	for i in range(len(C)):													#llenar lista de cambios
		D.append(C[i])
		
	for i in range(1,len(C)-1):												#hacer el proceso
#		print("paso ",i)													#control
#		print ("Anterior: ",C[i-1]," Actual: ",C[i]," Siguiente: ",C[i+1])	
		if (C[i-1]==C[i+1]):												#anterior y siguientes iguales =0 
#			print ("deberia ser ",0)
			D[i]=0
		else:																#anterior y sigueinte diferente =1
#			print ("deberia ser ",1)
			D[i]=1
	for i in range(len(C)):													#lista de cambos pasa a ser la original
		C[i]=D[i]
#	print (D[1:-1])
print (C[1:-1])