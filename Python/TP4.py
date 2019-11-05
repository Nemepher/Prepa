L=[89,11,-1,34,1]
#for i in L:
 #   print("Le carre de " ,i, " est ",i**2)

def appartient(L,x):
    for i in L:
        if i==x:
            return True 
    return False

#print(appartient([1,2,3],3))


def test_entiers(L):
    for i in range(1,11):
        if appartient(L, i):
            print("L'entier ",i," est dans L")
        else:
            print("L'entier ",i," n'est pas dans L")

#test_entiers(L)

Lentiers=[]
for i in range(1,21):
    Lentiers.append(i**2)

#print(Lentiers)

def listecarre(L):
    L2=[]
    for i in L:
        L2.append(i**2)
    return L2

#print(listecarre(L))

from random import randrange

def liste_alea(N):
    L=[]
    for i in range(N):
        L.append(randrange(0,101))
    return L

#print(liste_alea(4))

def ligne_suivante(L):
    Ls=[L[0]]
    for i in range(len(L)-1):
        Ls.append(L[i]+L[i+1])
    Ls.append(L[-1])
    return Ls

#print(ligne_suivante([1,1]))

def pascal(n):
    L=[1]
    for i in range(n):
        print(L)
        L=ligne_suivante(L)

#pascal(6)

def couples_carre():
#10**2 =100
    L=[]
    for i in range (10):
        if i**2>9:
            L.append([str(i**2)[0], str(i**2)[1]])
        else:
            L.append([str(i**2)[0], '0'])
    #print(L)
    return L

#couples_carre()

def restants(L):
    Lr=[i for i in range(100)]
    for i in L:
        if 0<=i and i<100:
            Lr.remove(i)
    return Lr

#print(restants([1,2,3,5,6]))

def liste_carre(L):
    return [i**2 for i in L]

def liste_alea(N):
    return [randrange(0,101) for i in range(N)]

#print(liste_alea(4))
#(liste_carre([1,2,3]))

L6 = [L[len(L)-i] for i in range(1,len(L))]

M= [[i+2*j for i in range(1,4)] for j in range(1,5)]

#print(M[3][2])

def produit_matrices(A,B):
    def prod(l,c):
        s=0
        for i in range(len(A[l])):
            s+= A[l][i]*B[i][c]
        return s
    S=[[ prod(l,c) for c in range(len(A))  ] for l in range(len(B[0]))  ]
    return S

#print(produit_matrices([[1,2],[2,3]],[ [2,3],[4,5] ]))

from math import sqrt
def moyenne(L):
    m=0
    for i in L:
        m+=i
    m/=len(L)
    return m

def variance(L):
    m = moyenne(L)
    return moyenne( [(i-m)**2 for i in L] )

def ecart_type(L):
    return sqrt(variance(L))

L= [10, 0, 5 , 8]
#print(moyenne(L))
#print(variance(L))
#print(ecart_type(L))

#[i for i in L]

def echange(L,i,j):
    if max(i,j)<len(L):
        L[i], L[j] = L[j], L[i]
    else :
        return

L=[1,2,3]
echange(L,1,2)
#print(L)

def copiematrice(L):
    return [[i for i in L[j] ] for j in range(len(L)) ]

L= [[1,2],[3,4]]
L2 = copiematrice(L)
print("L1 ",L, "L2 ",L2)
L[0][0]=12
print("L1 ",L, "L2 ", L2)



