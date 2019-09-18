#%%
def syracuse(n):
    if n%2==0 :
        return n/2
    else :
        return n*3+1

def flyTime(n):
    t=0
    while n!= 1:
        n=syracuse(n)
        t+=1
    return t

def reccurence(n, l):
    i=0
    while i<40:
        print(n)
        n=syracuse(n)
        i+=1

def printAll(n):
    while n!=1:
        print(n)
        n=syracuse(n)

#%%