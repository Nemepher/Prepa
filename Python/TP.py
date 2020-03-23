
import numpy as np 
import  matplotlib.pyplot as plt
import scipy.optimize as opt 
from math import pi, sqrt, log

f = lambda x : (x-pi)*(x-sqrt(2)) #sur [0,4]
def dicho(f, a , b, eps):
    g,d=a,b
    while d-g>2*eps:
        m = (g+d)/2
        if f(g)*f(d) < 0 : g=m
        else : d = m
    return (g+d)/2

print(pi, dicho(f,3,3.5,1e-8))
print(sqrt(2), dicho(f,1,2,0.001))

def newton(f,fp,a,n):
    x=a
    while n>0:
        x=x-f(x)/fp(x)
        n-=1
    return x

'''
f= lambda x : x**3 -5*x + 12
fp = lambda x : 3*x**2 - 5
I=np.linspace(-10,10,100)
plt.plot(I,f(I))

for n in range(3):
    x = newton(f,fp,5,n)
    plt.plot([x]*2,[-100,100])
    plt.plot([-50,50],[f(x)]*2)
plt.show()
'''

f = lambda x : x**2-2
fp = lambda x : 2*x
def newton2(a,eps):
    x=a
    while abs(f(x))>eps:
        x= x- (x**2-2)/(2*x)
    return x
print(newton2(5,1e-5))

def newton3(f,fp,a,eps):
    x=a-f(a)/fp(a)
    x2=a
    while abs(f(x)-f(x2))>eps:
        x2=x
        x = x - f(x)/fp(x)
    return x


f= lambda x : (x-pi)
print(opt.bisect(f,0,4))
f= lambda x : x**2 -2
print(opt.newton(f,2))
print(np.roots([5,6,0,0,2]))

def D0(f,x,h=1e-3):
    return (f(x+h)-f(x))/h
def D1(f,x,h=1e-3):
    return (f(x+h)-f(x-h))/(2*h)
print(D0(f,5),D1(f,5))

f = np.vectorize(lambda x : log(1+x))
I=np.arange(1,30)
plt.plot(I,D1(f,0,10.0**(-I)))
plt.show()

def delta(eps):
    return 1-np.vectorize(dicho)(lambda x : log(x), 0.1,2,eps)

I=10.0**(-np.linspace(1,5,500))
plt.plot(-np.log(I),np.log(np.abs(delta(I))))
plt.show()
