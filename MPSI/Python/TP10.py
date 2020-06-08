import matplotlib.pyplot as plt
import numpy as np
from random import randint


#plt.fill([1,5,4,9,6],[2,0,2,-1,4],linewidth=10,color='crimson')

#plt.plot([np.cos(2*np.pi*13/30*k) for k in range(31)],[np.sin(2*np.pi*13/30*k) for k in range(31)], linewidth=10, color='crimson')

f = lambda x : np.exp(x)-4*x+9*np.cos(10*x)
#plt.plot(np.linspace(-5,5),[f(x) for x in np.linspace(-5,5)], color='crimson')

def T(n):
    if n%2==0 : return n//2
    else: return n*3 +1

def L(n):
    c=0
    while n != 1:
        n=T(n)
        c+=1
    return c

def R(k):
    if k==1 : return 0 
    else : return max(R(k-1), L(k))

#plt.plot([L(n) for n in range(1,101)],color='crimson')
#plt.plot([R(k) for k in range(1,101)], color='aquamarine')

S=np.linspace(0,np.pi*2)
#plt.plot([3+5*np.cos(t) for t in S], [4+5*np.sin(t) for t in S], color='crimson')

def cercle(x,y,R):
    plt.plot([x+R*np.cos(t) for t in S], [y+R*np.sin(t) for t in S], color='crimson')


#for i in range(10):
#    cercle(randint(0,20),randint(0,20), randint(1,10))

#for t in S:
#    cercle(np.cos(t),np.sin(t),0.5)

fx = lambda t : np.cos(t)+np.cos(7*t)/2 + np.sin(17*t)/3
fy = lambda t : np.sin(t)+np.sin(t)/2 + np.cos(17*t)/3
S=np.linspace(0,np.pi*2, 300)

#plt.plot([fx(t) for t in S], [fy(t) for t in S], color="crimson")

S=np.arange(0,np.pi*50, 0.2)
r = lambda t : 1+1/3*np.cos(20/19*t)
#plt.plot(r(S)*np.cos(S), r(S)*np.sin(S), color="crimson") #!!!

phi = (1-np.sqrt(5))/2 


L=np.arange(0,500)
S=np.pi*2*phi*L
A=np.sqrt(L)
#plt.plot(A*np.cos(S),A*np.sin(S), '+')

L2=np.arange(0,250)*2
#plt.plot(np.sqrt(L2)*np.cos(np.pi*2*phi*L2), np.sqrt(L2)*np.sin(np.pi*2*phi*L2), '+', color='crimson')

S=np.arange(-100,-95,0.2)
y = lambda x,K : x +K*(x**2 +1)*np.exp(-x)
for k in range(5):
    plt.plot(S,y(S,k*2))

def binom(n,k):
    if k==0:
        return 1
    return n*binom(0,k-1)//k

P = lambda n,p,k : binom(n,k)*(p**k)*(1-p)**(n-k)

#for n in range(10):
#    S=np.arange(0,20,1)
#    plt.plot([P(n,1/3,k) for k in S])

#plt.axis('equal')
plt.show()


