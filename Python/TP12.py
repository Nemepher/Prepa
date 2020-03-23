## IPT --- TP12 --- Augustin Albert ##

import numpy as np
import matplotlib.colors as colors
import matplotlib.cm as cmx
import matplotlib.pyplot as plt
from scipy.integrate import odeint

## 1 ##
'''
La solution générale de cette EDL1 est la somme de la solution de l'équation homogène [ y'= (t-1)²/(t²+1) * y = 0 ] et d'une solution particulière. 
Or, (t-1)²/(t²+1) = 1 - 2t/(t²+1) de primitive t-ln(t²+1).
On cherche une solution particuliere sous la forme t -> at + b. On obtient alors a( t³-t²+t+1 )+ b( t²-2t+1 )  = t³-t²+t+1 donc (a,b)=(1,0) convient.
L'ensemble des solution est donc { t -> A*exp(ln(t²+1)-t) + t, A dans R}.
'''

## 2 ##
'''
Soit y une solution. Alors 8 = y(-1) = A*2/e - 1 donc A =9/2*e et la solution recherchée est t -> t + 9/2*(t²+1)exp(-1-t). 
'''

## 3,4,5,6,9,10,11 --- Résolution typique d'une equa diff ##

#Données du problème
F = lambda t,y : 1/(t**2+1) * (t**3-t**2+t+1-(t-1)**2*y)
I=[-1,10]
n=30 #Plus parlant que 100 intervalles pour voir les différences entre les techniques
s=8

'''
F = lambda t,y : np.sinh(t)
I=[-10,10]
n=30
s=5
'''

#Méthodes de résolution
Phi_Euler = lambda F,tk,yk,h : F(tk,yk) 
Phi_MPM = lambda F,tk,yk,h : F(tk + h/2, yk + h/2*F(tk,yk))
Phi_PC = lambda F,tk,yk,h : 1/2*(F(tk,yk)+F(tk+h,yk+h*F(tk,yk)))
def Phi_TK(F,tk,yk,h):
    k1=F(tk,yk)
    k2=F(tk+h/2,yk+h/2*k1)
    k3=F(tk+h/2,yk+h/2*k2)
    k4=F(tk+h,yk+h*k3)
    return (k1 + k2*2 + k3*2 + k4)/6
Phi_TK = np.vectorize(Phi_TK)

#Solution exacte
solv = lambda t : t + 9/2*(t**2+1)*np.exp(-t-1)

def Resolution(F,I,n,s,Phi):
    
    #Tt,Ty,h 
    h=(I[1]-I[0])/n
    X=np.linspace(I[0],I[1],n+1) # avec des listes python X=[I[0]+h*k for k in range(n+1)]
    Y=np.zeros(n+1)              # Y=[0 for k in ]
    
    Y[0]=s
    for k in range(n):      
        Y[k+1]=Y[k] + h*Phi(F,X[k],Y[k],h)
    return X,Y

#Comparaison des différentes méthodes
X,Y = Resolution(F,I,n,s,Phi_Euler) ; plt.plot(X,Y,label="Euler")
X,Y = Resolution(F,I,n,s,Phi_MPM) ; plt.plot(X,Y,label="PM")
iX,Y = Resolution(F,I,n,s,Phi_PC) ; plt.plot(X,Y,label="PC")
X,Y = Resolution(F,I,n,s,Phi_TK) ; plt.plot(X,Y,label="TK")
X=np.linspace(I[0],I[1],200) ; plt.plot(X,solv(X), color="black", label = "Solution exacte")
plt.title("Comparaison des differentes méthodes")
plt.legend()
plt.show()

## 8 ##

I=[-1,5]
L=np.linspace(-80,70,50)
X=np.linspace(-1,5,100)

#Construction d'un theme pour colorer les fonctions(bonus)
theme = cm = plt.get_cmap('rainbow') #viridis plasma
cNorm = colors.Normalize(vmin=-50, vmax=50)
scalarMap= cmx.ScalarMappable(norm=cNorm, cmap=theme)

#Representation de l'espace des phases

for s in L:    
    plt.plot(X,odeint(F,s,X,tfirst=True),color=scalarMap.to_rgba(s))
plt.axis([-1,5,-6,10])
plt.title("espace des phases")
plt.show()


## 12 ##
'''
y' = 2ty² equivaut lorsque y n'est pas la fonction nulle (qui est une des solutions) à -y'/y² = -2t soit en integrant 1/y = -t² + A
D'ou l'ensemble des solution est { t-> 1/(A-t²), A dans R}
Avec la condition y(0)=1/5, la solution est t-> 1/(5-t²)
'''

## 13,14,15 ##

'''
Plus l'on s'aproche du point critique (sqrt(5)), plus la méthode d'Euler s'écarte de la fonction.
Sur l'intervalle [0,3], la fonction odeint renvoie une erreure et/ou affiche des résultats aberrants. 
'''

#Données du problème
F = lambda t,y : 2*t*(y**2)
s=1/5

#Solution exacte
solv = lambda t : 1/(5-t**2)

for I in [[0,2.2],[0,3]]:

    X=np.linspace(I[0],I[1],200)
    #Odeint
    plt.plot(X,odeint(F,s,X,tfirst=True),label="Odeint")
    #Solution exacte
    plt.plot(X,solv(X), color="black", label = "Solution exacte")
    #Méthode d'Euler
    for n in [20,50,80,110]:
        X,Y=Resolution(F,I,n,s,Phi_Euler) 
        plt.plot(X,Y,label=("Euler, n="+str(n)))
    plt.axis([0,4,-3.5,3.5])
    plt.legend()
    plt.title("Différentes méthodes pour une borne droite égale à "+str(I[1]))
    plt.show()

## 16 ##

F = lambda t,y : 1/(t**2+1) * (t**3-t**2+t+1-(t-1)**2*y)
I=[-1,5]
s=8
solv = lambda t : t + 9/2*(t**2+1)*np.exp(-t-1)

Xh=np.exp(-np.array(np.linspace(1,5,30)))

def Erreur(Phi):
    erreur=[]
    for h in Xh:
        X=np.arange(I[0],I[1],h)
        n=len(X)-1
        s1=solv(X[0])
        err=0
        for k in range(n) : 
            s2=solv(X[k+1])
            err+=np.abs(s2-s1-h*Phi(F,X[k],s1,h))
            s1=s2
        erreur.append(err)
    return np.array(erreur)/erreur[0]

plt.plot(-np.log(Xh),np.log(Erreur(Phi_Euler)),label="Euler")
plt.plot(-np.log(Xh),np.log(Erreur(Phi_MPM)),label="PM")
plt.plot(-np.log(Xh),np.log(Erreur(Phi_PC)),label="PC")
plt.plot(-np.log(Xh),np.log(Erreur(Phi_TK)),label="TK")
plt.title("Comparaison des différentes erreurs")
plt.legend()
plt.show()

