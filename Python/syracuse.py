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

print(flyTime(2))

i=10
t=0
while t<100:
    t=0
    n=i
    while n!=1:
        n=syracuse(n)
        t+=1
    i+=1

print("done! n="+str(i-1)+" t="+str(t))
exit

#%%
