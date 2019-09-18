#%%
from math import factorial
def factSum(n):
    r=0
    for i in str(n):
        r+=factorial(int(i))
    return r

def gotSolution(n):
    if 10**(n-1)>n*factorial(9):
        return False
    else:
        return True
#%%
def findAll():
    n=1
    while gotSolution(n)==True:
        n+=1
    print(n, " is the max number of decimal")

    for i in range(0,10**(n-1)):
        if i==factSum(i):
            print(i)

findAll()
#%%
