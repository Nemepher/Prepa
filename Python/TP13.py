## IPT --- TP13 --- Augustin Albert ##

import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint
from mpl_toolkits.mplot3d.axes3d import Axes3D

## 1 ##
'''
Des solutions périodiques seraient représentées par des courbes repassants par les mêmes points et donc fermées sur le portrait de phase.
'''

## 2,3,4,5,6 ##

a,b,c,d = 3,1,2,1
G = lambda x,y : a*x-b*x*y #l'argument t n'est pas nécessaire dans ce cas
H = lambda x,y : c*x*y-d*y

#Résolution sur [0,10]. Un pas plus petit permet de se rapprocher d'une solution périodique. 
#La solution obtenue pour h=0,05 avec la méthode d'Euler n'est pas périodique.
h=0.05
I = np.arange(0,10,h)
L=len(I)
X = np.zeros(L); X[0]=1
Y = np.zeros(L); Y[0]=2

#Méthodes 
Phi_E = lambda F,xk,yk,h : F(xk,yk)
Phi_PM = lambda F,xk,yk,h : F(xk + h/2, yk + h/2*F(xk,yk))
Phi_PC = lambda F,xk,yk,h : 1/2*(F(xk,yk)+F(xk+h,yk+h*F(xk,yk)))
def Phi_TK(F,xk,yk,h):
    k1=F(xk,yk)
    k2=F(xk+h/2,yk+h/2*k1)
    k3=F(xk+h/2,yk+h/2*k2)
    k4=F(xk+h,yk+h*k3)
    return (k1 + k2*2 + k3*2 + k4)/6
Phi_TK = np.vectorize(Phi_TK)

fig = plt.figure() #histoire d'avoir les graphiques sur une même page
plt.title("Système proies prédateurs")
plt.axis("off")
ax = fig.add_subplot(2,2,1)

for Phi in [Phi_E, Phi_PM, Phi_PC, Phi_TK]:
    for k in range(L-1):
        xk,yk = X[k],Y[k]
        X[k+1]=xk+h*Phi(G,xk,yk,h)
        Y[k+1]=yk+h*Phi(H,xk,yk,h)
    ax.plot(X,Y)
ax.set_xlabel("proies")
ax.set_ylabel("prédateurs")

## 7 ##

def f(Y,t) :
    x,y=Y
    return [G(x,y),H(x,y)]
Y0 = 1,2
LY = odeint(f,Y0,I)

## 8 ##

X,Y = LY[:,0],LY[:,1]

## 9 ##

theme = plt.cm.viridis(np.linspace(0.1,1,14)) #Plus simple 

ax = fig.add_subplot(2,2,3)
for y in range(1,15):
    Y0=0.5,y/5
    LY=odeint(f,Y0,I)
    ax.plot(LY[:,0],LY[:,1],color=theme[y-1])
ax.set_xlabel("proies")
ax.set_ylabel("prédateurs")

## 10 ##

Y0 =1,2
LY=odeint(f,Y0,I)
ax = fig.add_subplot(2,2,2)
ax.plot(I,LY[:,1],label="prédateurs")
ax.plot(I,LY[:,0],label="proies")
ax.legend()
plt.show()

## 11 ##
'''
Si x et y sont constants, alors leur dérivée est nulle, d'ou 0=x'=ax+bxy et 0=y'=cxy-dy. On obtient alors les solutions suivantes pour (x,y) : (0,0) et (d/c,a/b). La première est située sur l'origine et la seconde au centre des courbes fermées.
'''

## 12 ##
'''
Lorsque l'on diminue ou augmente soudainement le nombre de proies ou prédateur, on obtient de nouvelles conditions initiales qui si elles sont favorables sur le moment, peuvent conduire à une augmentation de l'amplitude des variations. Il faut pour évitr cela connaitre la phase actuelle du cycle. 
'''

## 13 ##
a,b,c,d,e = 3,1,2,1,0.2
G = lambda x,y : a*x-b*x*y-e*x*x
H = lambda x,y : c*x*y-d*y
I=np.arange(0,40,h)


Y0 =1,2
LY=odeint(f,Y0,I)
X,Y=LY[:,0],LY[:,1]
fig,axs=plt.subplots(1,2)
axs[1].plot(X,Y)
axs[1].set_xlabel("proies")
axs[1].set_ylabel("prédateurs")
axs[0].plot(I,Y,label="prédateurs")
axs[0].plot(I,X,label="proies")
axs[0].legend()
plt.show()

## 14 ##

a,b,c = 10,28,8/3
F = lambda x,y,z : a*(y-x)
G = lambda x,y,z : b*x-y-x*z 
H = lambda x,y,z : x*y-c*z

def f(Y,t) :
    x,y,z=Y
    return [F(x,y,z),G(x,y,z),H(x,y,z)]

Y0=(1,0,0)
I=np.linspace(0,100,10000)

LY=odeint(f,Y0,I)
X,Y,Z = LY[:,0],LY[:,1],LY[:,2]

fig=plt.figure()
plt.title("Papillon de Lorentz")
plt.axis("off")
ax = fig.add_subplot(2,2,1,projection='3d'); ax.plot(X,Y,Z,linewidth=0.5,color="orangered")
ax = fig.add_subplot(2,2,2); ax.plot(X,Y,linewidth=0.5,color="deeppink")
ax = fig.add_subplot(2,2,3); ax.plot(Y,Z,linewidth=0.5,color="deepskyblue")
ax = fig.add_subplot(2,2,4); ax.plot(Z,X,linewidth=0.5,color="chartreuse")
plt.show()

## 16,17,18,19,20 ## Les solutions finissent toutes par rejoindre une même solution périodique.
fig = plt.figure()
plt.title("Oscillateur de Van der Pol")
plt.axis("off")

a,b = 1,1
G = lambda y,w : w # w=y', toujours pas de t
H = lambda y,w : a*b*(1-y*y)*w-b*b*y

def f(Y,t):
    y,w = Y 
    return G(y,w),H(y,w)
I=np.linspace(0,10,400)

ax=fig.add_subplot(2,2,1)
for Y0 in [[0.5,0.5],[-2,3],[2,-3],[3,-3],[-1,4],[4,-3.5]]:
    LY=odeint(f,Y0,I)
    ax.plot(LY[:,0],LY[:,1])

#Pour ne dessiner que le cycle limite, il passer en argument à la fonction plot que certains points en elevant les premiers, par example LY[100:,0]

ax=fig.add_subplot(2,2,4)
plt.title("Variations de ε à ω fixé")
Y0 = -2,3
I=np.linspace(0,20,1000)
for a in np.arange(0,3,0.5):
    LY=odeint(f,Y0,I)
    ax.plot(LY[240:,0],LY[240:,1],linewidth=0.9)


ax=fig.add_subplot(2,2,3)
plt.title("Variations de ω à ε fixé")
I=np.linspace(0,21,1000)
for b in np.arange(0.5,3,0.5):
    LY=odeint(f,Y0,I)
    ax.plot(LY[300:,0],LY[300:,1],linewidth=0.9)
plt.show()

## 21,22,23,24,25 ##
fig,axs = plt.subplots(2,2)
fig.suptitle("Pendule simple")

a,w0,v0 = 1,1,0.5
G = lambda y,w : w
H = lambda y,w : -a*a*y
def f(Y,t):
    y,w = Y 
    return G(y,w),H(y,w)

for h in [0.05,0.01,0.001]:
        
    I=np.arange(0,20,h)
    L=len(I)
    X=np.zeros(L); X[0]=v0
    Y=np.zeros(L); Y[0]=w0

    for k in range(L-1):
        xk,yk = X[k],Y[k]
        X[k+1]=xk+h*Phi_E(G,xk,yk,h)
        Y[k+1]=yk+h*Phi_E(H,xk,yk,h)
    axs[0,0].plot(I,X)
axs[0,0].set_title("Méthode d'Euler")

Y0= [w0,v0]
LY=odeint(f,Y0,I)
axs[0,1].plot(I,LY[:,0])
axs[0,1].set_title("Avec odeint")

I=np.linspace(0,20,100)
def fr(Theta,t):
    y,w=Theta 
    return w,-a*a*np.sin(y)

for i,w0 in enumerate([0.2,1.5]):
    Y0=[w0,v0]
    LY=odeint(f,Y0,I)
    LYr=odeint(fr,Y0,I)
    axs[1,i].plot(I,LY[:,0])
    axs[1,i].plot(I,LYr[:,0])

axs[1,0].set_title("Solution réelle et approchée : θ(0) petit")
axs[1,1].set_title("θ(0) proche de pi")
plt.show()

## 26 ## Seul le pendule réel fait des tours complets 

Y0=[np.pi,0]
I=np.linspace(0,50,200)
LY=odeint(f,Y0,I)
LYr=odeint(fr,Y0,I)
plt.plot(I,LY[:,0],label="odeint")
plt.plot(I,LYr[:,0],label="solution réelle")
plt.legend()
plt.title("Solution réelle et approchée pour θ(0)=2")
plt.show()

## 27 ##

'''
La résolution de l'équation pour theta0 = pi et thetha'0 = 0 n'est pas exacte. (Le pendule tombe plutot que de rester immobile)  
Cette solution est un équilibre instable du pendule : la solution mathématique ne conduit à aucune evolution du système, mais ce n'est physiquement pas possible. 
L'erreur de précision commise durant la résolution représente finalement mieux l'evolution d'un pendule réel.
'''

## 28 ##

fig,axs = plt.subplots(1,2)
fig.suptitle("Portait de phase des oscillateurs")


#Sélection de points particuliers
points1,points2 = [],[]
for i in np.arange(0,6,0.5):
    points1.append([i,0])

for i in np.linspace(0,np.pi,6):
    points2.append([i,0])
    points2.append([i+np.pi,0])
for i in np.arange(-3,3,0.5):
    points2.append([-np.pi,i])
    points2.append([np.pi*3,i])

I=np.linspace(0,20,150)
for Y0 in points1:
    LY=odeint(f,Y0,I)
    axs[0].plot(LY[:,0],LY[:,1],color="tab:orange")
axs[0].set_title("oscillateur linéarisé")

for Y0 in points2:
    LYr=odeint(fr,Y0,I)
    axs[1].plot(LYr[:,0],LYr[:,1],color="tab:blue")
axs[1].axis([-3,9.2,-3.1,3.1])
axs[1].set_title("oscillateur réel")
plt.show()

## 29 ## On rajoute un terme d'amortissement comme dans la question 13 (theta'' = a*a*sin(theta) - b*theta')
a,b = 1,0.3
def fr(Theta,t):
    y,w=Theta 
    return w,-a*a*np.sin(y)-b*w

#Sélection de points particuliers
points = []
for i in range(-18,22,2):
    points.append([i,5])
    points.append([i,-5])

I=np.linspace(0,30,200)
for Y0 in points:
    LYr=odeint(fr,Y0,I)
    plt.plot(LYr[:,0],LYr[:,1],color="tab:blue")
plt.axis([-6,12.5,-5,5])
plt.title("Portrait de phase de l'oscillateur réel amorti")
plt.show()






