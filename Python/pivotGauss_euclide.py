import numpy as np 

def euclide (a,b):
    r0,u0,v0,r1,u1,v1 = a,1,0,b,0,1
    while r1!=0:
        q = r0//r1
        r0,u0,v0,r1,u1,v1 = r1,u1,v1,r0-q*r1,u0-q*u1,v0-q*v1
    return r0,u0,v0

def transvection(C,i,j,c):
    C[i]+=c*C[j]
def dilatation(C,i,c,div=False):
    if not div : C[i]*=c
    else : C[i]=C[i]//c 
def echange(C,i,j):
    for k in range(len(C[0])):
        C[j,k],C[i,k] = C[i,k],C[j,k] 

def pivot(A):
    C=A
    l1=len(C)
    l2=len(C[0])

    for j in range(l2):
        pivot = C[j,j] 
        for i in range(j+1,l1):
            cible=C[i,j]
            p,a,b = euclide(pivot,cible)
            dilatation(C,i,pivot//p)
            transvection(C,i,j,-cible//p)
    
    for j in range(l2-1,-1,-1):
        pivot = C[j,j]
        for i in range(j):
            cible=C[i,j]
            p,a,b = euclide(pivot,cible)
            dilatation(C,i,pivot//p)
            transvection(C,i,j,-cible//p)
    
    for j in range(1,l2):
        dilatation(C,j,C[j-1,j-1])

    return(C)

A=np.array([[1,-2,8],[3,7,5],[8,2,-9],[1,0,0,]])
pivot(A)
print(A)
