import numpy as np
from math import pi, cos

T=np.array([1,3,7,9])
print(type(T))

A=np.zeros((4,5))
for i in range(4):
    for j in range(5):
        A[i,j]=j+100*i
#print(A)
#print([[j+100*i for j in range(5)] for i in range(4)])

A=[[j/(i+j) for i in range(1,3)] for j in range(1,4)]
B=[cos(k*pi/180) for k in range(91)]
#print(A)
#print(B)

def vandermonde(A):
    n=len(A)
    B=np.ones((n,n))
    for i in range(n):
        for j in range(n):
            B[i,j]=A[i]**j
    return B
#print(vandermonde([1,2,3]))

A=np.ones((4,4)); A[2,3]=2; A[3,1]=6
#print(A)
B=np.zeros((7,7)); B[2:4,1:3]=np.ones((2,2))*2
#print(B)

def norme(A):
    return np.sqrt(sum(A**2))
#print(norme(np.array([1,2,3])))

A=np.zeros((5,8))
A[3:,:-5]=np.ones((2,3))
A[:3,:3]=np.diag([5,6,7])
A[:,3:]=np.eye(5)
A=np.hstack((A,np.ones((5,1))*4))
A=np.vstack((A,np.ones((1,9))*3))
A=np.hstack((np.ones((6,1))*8, A))
#print(A)


