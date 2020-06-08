from time import time

def sommes_cumulees(L):
    """1+2+...+len(L)=i!len(L)*(1+len(L))/2"""
    return [sum(L[i] for i in range(0,n+1)) for n in range(0,len(L))]


#print(sommes_cumulees([1,5,7]))

from random import randint
randomList = lambda l : [randint(0,i) for i in range(l)]

L=randomList(100)
#s=time()
#sommes_cumulees(L)
#print(time()-s)

for i in range(0,5):
    L=randomList(2**i)
    s=time()
    sommes_cumulees(L)
    print(time()-s, end=' ')
    print(len(L)*(1+len(L))/2)

def maximum(L):
    #Lié à la longueur de la liste : L
    m=L[0]
    for i in L:
        if i>m : m=i
    return m



def maximum_indice(L):
#Lié au nombre de termes avant le max
    m = maximum(L)
    for i in range(len(L)):
        if L[i]==m : return i

s=time()
maximum(L)
print("maximum ",time()-s)
s=time()
max(L)
print("max ", time()-s)


def recherche1(L,x):
    c=0
    test=False
    for y in L:
        c+=1
        if y==x:
         test=True
    print(c)
    return(test)

def recherche2(L,x):
    c=0
    test=False
    for y in L:
        c+=1
        if y==x:
            test=True
            break
    print(c)
    return(test)

def recherche3(L,x):
    c=0
    for y in L:
        c+=1
        if y==x:
            print(c)
            return True
    print(c)
    return False


def recherche4(L,x):
    c=0
    i=0
    trouve=False
    while i<len(L) and not trouve:
        if L[i]==x:
            trouve=True
        i=i+1
        c+=1
    print(c)
    return trouve

L=randomList(100)
x=2
print(" ")
s=time()
recherche1(L,x)
a=time()
recherche2(L,x)
b=time()
recherche3(L,x)
c=time()
recherche4(L,x)
d=time()
x in L
e=time()
print("1:",a-s,"2:",b-a,"3:",c-b,"4:",d-c, "x in L:",e-d)

def recherche_premiere_occurence(L,x):
#Complexité liée à la position de x : peut être compris entre 1 et len(L)
    for y in range(len(L)):
        if L[y]==x:
            return y
    return -1

def recherche_liste_positions(L,x):
#Si x est dans L : complexité de "x in L", sinon lié à len(l) 
    if not x in L : print("nb:",x," , pas d'occurences")
    else:
        l=[]
        for i in range(len(L)):
            if L[i]==x:
                l.append(i)
        print("nb:",x,", occurences:",len(l),", positions:",l)
def recherche_liste_positions2(L,x):
    l=[]
    for i in range(len(L)):
        if L[i]==x:
            l.append(i)
    if len(l)>0 : print("nb:",x,", occurences:",len(l),", positions:",l)
    else : print("pas d'occurences")

#recherche_liste_positions(L,x)

def Dsearch1(L,x):
    i = int((len(L)-1)/2)
    print(i)
    if L[i]>x: return Dsearch(L[:i],x)
    elif L[i]<x: return i+Dsearch(L[i+1:],x)
    else : return i

def Dsearch(L,x,b,a=0,c):
#Complexité relative a la position dans la chaine 
    i = (b+a)//2
    if L[i]>x:return Dsearch(L,x,i,a)
    elif L[i]<x:return i+Dsearch(L,x,b,i)
    elif L[i]==x: return i
    else : return -1

L=[1,2,3,8,9,14,15]
print(" ")
#print("position",Dsearch(L,14,len(L)))

for _ in range(10):
    L=randomList(10)
    L.sort()
    s=time()
    Dsearch(L,1,len(L))
    print(time()-s)


