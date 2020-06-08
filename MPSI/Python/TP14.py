## IPT --- TP14 --- Augustin Albert ##

import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import quad
from scipy.interpolate import lagrange

## 1 ##
f = lambda x : np.sqrt(1-x**2)
I=np.linspace(-1,1,200)
plt.plot(I,f(I))
plt.title("Graphe de f")
plt.show()

## 2 ##
'''
L'aire recherchée est consituée d'une fraction du cercle d'angle pi/6  et d'un triangle rectangle. On obtient ainsi I = pi/12*1² + (1/2 * arcsin(2*pi/3))/2 = pi/12 + sqrt(3)/8
'''
## 3 ##
'''
En latex : 
Une primitive pour x inferieur à 1 donne :
\[\int_{0}^{x}\sqrt{1-x^{2}}dx=\int_{0}^{arcsin(x)}cos(t)^{2}dt=\int_{0}^{arcsin(x)}\frac{cos(t)+1}{2}dt=\frac{1}{2}(arcsin(x)+\frac{sin(2arcsin(x)}{2})=\frac{1}{2}(arcsin(x)+sin(arcsin(x))cos(arcsin(x)))=\frac{1}{2}(arcsin(x)+x\sqrt{1-x^{2}})\]
On retrouve bien I=pi/12 + sqrt(3)/8
'''
## 4 ##
def rectangle (f,a,b,n):
    h = (b-a)/n
    return h*sum(f(a+h*k) for k in range(n))

Int=np.pi/12+np.sqrt(3)/8
print("I =",Int)
print("\nMéthode des rectangles pour n variant")
for n in np.arange(10,100,20):
    print("n =",n," In =",rectangle(f,0,1/2,n))

## 5 ##
n,a,b=20,0,1/2
print("\nDifférentes méthodes pour n =",n)
h=(b-a)/n
m1 = h*sum(f(a+h*k) for k in range(n));                     print("Rectangles :",m1)
m2 = h*sum(f(a+h*k+h/2) for k in range(n));                 print("Points-milieux:",m2)
m3 = h*((f(a)+f(b))/2 + sum(f(a+h*k) for k in range(1,n))); print("Trapèzes :",m3)
m4 = 1/3*m3 + 2/3*m2;                                       print("Simpson :",m4)

## 6 ##
'''
On peut approximer numeriquement pour tout x de l'intervalle l'integrale de 0 à x de f. Pour éviter trop de calculs, on ne recalcule à chaque fois que l'integrale entre deux abscisses succesives. 
'''
X = np.linspace(0,1, 200)
Y = np.zeros(200)
Y[0]=0

n=5
h = (X[1]-X[0])/n
for i in range(199):
    Y[i+1]=Y[i]+h*sum(f(X[i+1]+h*k) for k in range(n))
plt.plot(X,Y)
plt.title("Approximation de l'integrale de f s'annulant en 0 par la méthode ses rectangles")
plt.show()

## 7 ## Les deux valeurs renvoyées sont la valeur de l'integrale de la fonction et une estimation de l'erreur commise
print("\nMéthode clé-en-main :",quad(f,a,b)[0])

## 8 ##
n=1000
pointsX, pointsY = [np.random.uniform(0,1/2) for k in range(n)],[np.random.uniform(0,1) for k in range(n)]
plt.plot(I,f(I))
plt.plot([0,0.5,0.5,0,0],[0,0,1,1,0])
plt.plot(pointsX,pointsY,"+")
plt.title("Méthode de Monte-Carlo")
plt.show()

## 9 ##
s=(1/2)*sum(1 for k in range(n) if f(pointsX[k])>=pointsY[k])/n
print("\nMéthode de Monte-Carlo :",s)

## 10 ##
a,b=0,1/2
def m1(n): h = 1/(2*n); return h*sum(f(a+h*k) for k in range(n))
m1 = np.vectorize(m1)
def m2(n): h = 1/(2*n); return h*sum(f(a+h*k+h/2) for k in range(n))
m2 = np.vectorize(m2)
def m3(n): h = 1/(2*n); return h*((f(a)+f(b))/2 + sum(f(a+h*k) for k in range(1,n)))
m3 = np.vectorize(m3)
def m4(n): h = 1/(2*n); return 1/3*m3(n) + 2/3*m2(n)

def m5(n): 
    S=np.zeros(150)
    for i in range(150):
        pointsX, pointsY = [np.random.uniform(0,1/2) for k in range(n)],[np.random.uniform(0,1) for k in range(n)]
        S[i]=(1/2)*sum(1 for k in range(n) if f(pointsX[k])>=pointsY[k])/n
    return abs(sum(S)/200-Int)
m5 = np.vectorize(m5)

X=np.arange(1,20,1)
plt.plot(np.log(X),np.log(m1(X)-Int),label="Rectangle")
plt.plot(np.log(X),np.log(m2(X)-Int),label="Points-milieux")
plt.plot(np.log(X),np.log(Int-m3(X)),label="Trapèzes")
plt.plot(np.log(X),np.log(Int-m4(X)),label="Simpson")
plt.plot(np.log(X),np.log(m5(X)),label="Monte-Carlo")
plt.title("Erreur relative des diférentes méthodes")
plt.legend()
plt.show()



## 11 ##
'''
Ce morceau de code permet de générer une liste de 10 points dont l'ordonné est plus ou moins proche de la courbe de la fonction x -> 2x²+x+3
'''
## 12 ##
Xechant=np.linspace(0,3,10)
Yechant=(2*Xechant**2 +Xechant + 3) + np.random.uniform(-2,2,10)
plt.plot(Xechant,Yechant,"+")

## 13 ## On dispose de 10 points. Le degré du polynome est donc 9.
P=lagrange(Xechant,Yechant)
print("\nPolynome interpolateur :",P)

## 14 ## P[2] est le coef de degré 2 alors que P(2) est l'évaluation de P en 2.
print("P[2] =",P[2]," P(2) =",P(2))

## 15 ## La fonction passe exactement par les points, mais ce n'est peut etre pas l'approche recherché (modèle affine, d'un degré quelconque, etc)
I=np.linspace(0,3,200)
plt.plot(I,P(I),label="Lagrange")

## 16 ##
A,B=np.poly1d([1,0,-1]),np.poly1d([5,4,3])
print("\nCalculs avec les polynomes :\nA =\n",A,"\nB =\n",B,"\nA+B =\n",A+B,"\nA*B =\n",A*B) 

## 17 ##
def monlagrange(X,Y):
    l = len(X)
    def f(x):
        L=np.empty(l)
        for i in range(l):
            m=1
            for j in range(l):
                if j!=i : m*=(x-X[j])/(X[i]-X[j])
            L[i]=m
        return sum(Y[j]*L[j] for j in range(l))
    return np.vectorize(f)

## 18 ## polyfit renvoie le tableau numpy des coefs 
T=np.polyfit(Xechant,Yechant,2)

## 19, 21 ## 
P=np.poly1d(T)
plt.plot(I,P(I),label="moindres carré")
plt.legend()
plt.show()

## 20 ## 
def transform_poly(C):
    l = len(C)
    return lambda x: sum(C[k]*x**(l-1-k) for k in range(l))

