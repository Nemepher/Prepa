import numpy as np
import matplotlib.pyplot as plt
import scipy.optimize as opt
import scipy.misc as msc

I = np.arange(0,10)

f = lambda x : np.exp(x*2)-15

def D0(x,f,h=1e-3):
    return (f(x+h)-f(x))/h

def D1(x,f,h=1e-3) : 
    return (f(h+x)-f(x-h))/(2*h)

def lambdaN(f,a,n, s):
    x=a
    while n>0:
        x = x - f(x)/D1(x,f,1e-3)
        n-=1
    return abs(s-x)

def lambdaD(f,a,b,n,s):
    g,d = a,b
    while n>0 : 
        m =(d+g)/2 
        if f(d)*f(g)<0 : g = m
        else : d = m
        n-=1
    return abs(s-(g+d)/2)

plt.plot(I, (np.vectorize(lambdaN)(f,2,I,1.5)),label="Newton" )
plt.plot(I, (np.vectorize(lambdaD)(f,0.1,2,I,1.5)), label="Dicho")
plt.title("erreur/itérations")
plt.legend()
plt.show()



I=np.arange(0,15); J=10.0**(-I)
f = lambda x : np.log(1+x)
fp = lambda x : 1/(1+x)
x=0

lambda0 = lambda x,f,h : D0(x,f,h)-fp(x)
lambda1 = lambda x,f,h : D1(x,f,h)-fp(x)

plt.plot(I,np.vectorize(lambda0)(x,f,J))
plt.plot(I,np.vectorize(lambda1)(x,f,J))
plt.show()
