fichier = open('hugo.txt', encoding='latin')
contenu=fichier.read()
#print(type(fichier)) 
#print(contenu)
fichier.close()

fichier=open('premiers-1000.txt', encoding='latin1')
#print(sum(int(L) for L in fichier))
fichier.close()

fichier=open('nouveau-fichier','w',encoding='latin1')
fichier.write('kangourou')
fichier.close()

fichier=open('nouveau-fichier','a',encoding='latin1')
fichier.write("\nEncore une fois!")
fichier.close()

fichier=open('tables.txt','w',encoding='latin1')
for i in range(1,11):
    for j in range(1,11):
        fichier.write(str(i)+"*"+str(j)+"="+str(i*j)+"  ")
    fichier.write("\n")
fichier.close()

fichier=open('matrix.txt')
#for l in fichier:
#    #print(l.split(','))
#m=[ [int(i) for i in l.replace('\n','').split(",")] for l in fichier]
#print(m)
fichier.close()

def suiteS(n):
    def Syra(x):
        if x%2==0:
            return x//2
        else:
            return x*3+1
    S=""
    S+=str(n)+" "
    while n > 1:
        n=Syra(n)
        S+=str(n)+" "
    return S

fichier=open('syracuse.txt','w',encoding='latin1')
for i in range(100):
    fichier.write("Suite de Syracuse de l'entier "+str(i+1)+": "+suiteS(i+1)+"\n")
fichier.close()

from csv import reader
fichier=open('communes.csv','r')
s=reader(fichier)
grosseCommunes=[]
bonNom=[]
l=s.__next__()
l=s.__next__()
for _ in range(0,20000):
    if int(l[3])>=200000:
        grosseCommunes.append(l[1])
    if l[1][:2]=="Ca" and l[1][-2:]=="en":
        bonNom.append(l[1])
    l=s.__next__()
fichier.close()
#print(grosseCommunes)
#print(bonNom)

fichier=open('hugo.txt',encoding='latin1')
contenu=fichier.read()
c=sum(len(l) for l in fichier)
m=contenu.replace("."," ").replace(","," ").replace("'"," ").replace("\n"," ").split(" ")
#print(len(m))

mots=[]
for i in m:
    if 'x' in i or 'X' in i:
        mots.append(i)
print(mots)

print(sum(1 for i in m if i=='Cimourdain'))
fichier.close()



def invM(s):
    S=""
    for i in range(1,len(s)+1):
        S+=s[len(s)-i]
    return S
def inverseur(name):
    nName=invM(name.split(".")[0])+'.'+name.split(".")[1]
    fichier1=open(name,encoding='latin1')
    fichier2=open(nName,'w',encoding='latin1')
    c=fichier1.read().replace("\n"," ")
    fichier2.write(invM(c))   
    fichier1.close()
    fichier2.close()

inverseur("hugo.txt")

