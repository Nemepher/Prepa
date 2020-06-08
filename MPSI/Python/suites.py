#%%
def nextV(a):
    b=0
    for s in str(a):
        b+=int(s)**3
    return b

def reccurence(a,n):
    i=0
    v=a
    while i<n:
        print(v)
        v=nextV(v)
        i+=1

#%%
from math import sqrt
def nextV2(v):
    return sqrt(2+v)

def reccurence2(n):
    i=0
    v=0
    while i<n:
        print(v)
        v=nextV2(v)
        i+=1

def getApprox(a):
    n=0
    v=0
    while (2-v)>a:
        v=nextV2(v)
        n+=1
    print(n)

#%%
