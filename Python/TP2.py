#%%
for i in range(6,10):
    print(i)
    print('koala')
    print(-i)
print('kangourou')

#%%
for i in range(2,6):
    print(i)
    for j in range(4,6):
        print([i,j])


#%%
u0=1
u1=1
u3=0
for i in range (1,10):
    print(u0)
    u3=u0+u1
    u0=u1
    u1=u3
    print(str(float(u0)/u1))

#%%
L=[True, 123,1.123, [3,4,5], (1,2), 'abc']
for x in L:
    print(x,type(x))
print("\n")
for i in range(len(L)):
    print(L[i],type(L[i]))

#%%
s='ubktbtknvt'
for letter in s:
    print(letter)
print('\n')
for i in range(len(s)):
    print(s[i])

#%%
S=0
for i in range(1,101):
    S+=i**2
print(S)
print(100*101*201/6)

#%%
S=0
for i in range(1,101):
    for j in range (1,101):
        S+=min(i,j)
print(S)

#%%
from math import factorial
f=1
for i in range(1,51):
    f*=i
print(f)
print(factorial(50))

#%%
from math import factorial as fac
from math import e
S=0
for i in range(0,101):
    S+=1/fac(i)
print(S)
print(e)

#%%
for i in range(9):
    ligne=""
    for j in range(8-i):
        ligne+=" "
    for j in range(2*i+1):
        ligne+="*"
    print(ligne)

#%%
from math import factorial
n=factorial(50)
print(n)
S=0
for c in str(n):
    S+=int(c)
print(S)

#%%
print((3==3 or 1==2) and 3==4)
print(3==3 or (1==2 and 3==4))

#%%
3==3 or 1==2 and 3==4
# or prioritaire
 
#%%
# k%2==0 k est pair
#%%
for i in range(10):
    print(i)
    if i%2==0:
        print("pair")
    print("entier")
print("terminé")

#%%
for i in range(10):
    if i%3==0:
        print(i,"multiple de 3")
    else :
        print(-i)

#%%
for i in range(10):
    if i%2==0:
        print(i)
    if i%3==0:
        print(-i)
print("\n")
for i in range(10):
    if i%2==0:
        print(i)
    elif i%3==0:
        print(-i)

#%%
for i in range(50):
    print(i)
    if i%5==0: 
        print("A")
    elif i%6==0:
        print("B")
    elif i%7==0:
        print("C")
    else:
        print("D")

#%%
a=1
while a<100:
    a*=2
    print(a)

#%%
a=1
while a<100:
    a+=2
    print(a)

#%%
c=1
a=0
while c<100:
    c*=105/100
    a+=1
print(a)

#%%
