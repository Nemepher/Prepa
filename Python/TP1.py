#%%
def swapVar(a,b):
    return b,a

#%%
2+2
print(2*3)

#%%
for i in range (6,10):
    print(i)
    print('koala')
    print(-i)
print('kangourou')

#%%
#Ceci est un etit programme pour deviner votre âge 
res = 0
for k in range(7):
    for i in range(128):
        if i%(2**(k+1)) >= 2**k:
            print(str(i),end=" ") 
    print()
    if input("votre age figure t'il dans cette liste? o/n")=="o":
        res+=2**k
    print()

print('Vous avez '+str(res)+' ans!')

#%%
from math import factorial
def titi(n):
    res=1
    for i in range(2,n+1):
        res*=i
    return res

print(titi(5))
print(factorial(5))

#%%
from math import factorial
for i in range(100,1000):
    if i == factorial(int(str(i)[2]))+factorial(int(str(i)[1]))+factorial(int(str(i)[0])):
        print(i)
#%%
from math import sqrt
def numberOfMen(s=13, a=1):
    for n in range (s+a,s+a+1000):
        b= 13*n*n+a
        if sqrt(b)==int(sqrt(b)):
            print(b)

numberOfMen(13,1)

