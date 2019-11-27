caractere = lambda M, c: c in M
def caractere(M,c):
    for i in M:
        if c==i:
            return True
    return False

#print(caractere("test",'h'))

compte_caractere = lambda M,c: sum(1 for i in M if i==c)

#print(compte_caractere("test",'t'))

def match(M,m,p):
    for i in range(len(m)) :
        if i+p>=len(M) or M[i+p]!=m[i]:
            return False
    return True

#print(match("test moi","test",6))

def sous_mot(M,n):
    p=0
    trouve = False
    while not trouve and p<=len(M): 
        trouve=match(M,n,p)
        p+=1
    return trouve

#print(sous_mot("test moi", "t em"))

def pos_sous_mot(M,n):
    l=[]
    s=0
    p=0
    while sous_mot(M[s:],n):
        print(M[s:])
        while not match(M,n,s):
            s+=1
        l.append(s)
        s+=1
    return l

#print(pos_sous_mot("motmoest moi", "mo"))

compte_sous_mot = lambda M,n:  sum(1 for i in range(len(M)) if match(M,n,i))

#print(compte_sous_mot(["e","e","r"],["e"]))

from random import randint
def chaine_aleatoire(n):
    pool="ATGC"
    s=""
    for _ in range(n):
        s+=pool[randint(0,3)]
    return s

#print(chaine_aleatoire(50))

#print(sum(compte_sous_mot(chaine_aleatoire(10**4),chaine_aleatoire(5)) for _ in range(100))/100)
#(1/4)⁴


longueurA = lambda M: len(max(M.replace("C"," ").replace("T"," ").replace("G"," ").split(), key=len))

def longueur(M,L):
    for i in L:
        M= M.replace(i," ")
    return len(max(M.split(), key=len))

#print(longueurA(chaine_aleatoire(50)))

def longueurATGC(M):

    lA=longueur(M,"TGC")
    lT=longueur(M,"AGC")
    lG=longueur(M,"ATC")
    lC=longueur(M,"ATG")
    return max(lA,lT,lG,lC)

#print(longueurATGC("AATGAGGTTTTTCCCCC"))

def nombre_mots(M):
    state=0
    p=0
    c=0
    for p in M:
        if p in [" " , "," , ";" , "'" , "-" , "." , "!" , "?"]:
            state=0
        elif state==0:
            state=1
            c+=1
    return c

#print(nombre_mots(C'est super chez lui ! - Vraiment ?"))

long_mot = lambda M: len(max(M.split(), key=len))

def long_mot(M):
    state=0
    tM=0
    m=0
    for p in M:
        if p==" ":
            state=0
            if m>tM: tM=m
            m=0
        elif state==0:
            state=1
            m+=1
        else : m+=1
    return tM


#print(long_mot("C'est super chez lui ! - Vraiment ?"))
