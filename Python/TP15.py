## IPT --- TP15 --- Augustin Albert ##

import numpy as np

## 2 ##
A = np.array([[1,2],[3,4]])
B = np.array([[5,6],[7,8]])
C = np.array([[1,3,5],[7,9,11]])
D = np.array([[2,4],[6,8],[10,12]])

## 3 ## Lorsque les matrices ont des tailles différente, une erreur est renvoyée
print("A+B",A+B)
print("A*b",A*B)
#A+D

## 4 ##
print("dot A B",np.dot(A,B))
print("dot B A",np.dot(B,A))
#np.dot(C,A)

## 5 ##
u=np.array([7,11,13])
v=np.array([4,5,9])
w=np.array([3,6])
'''
Numpy interprète les vecteurs ou bien comme des lignes ou bien comme des colonnes afin de donner du sens aux produits.
Les produits étant bien définis sont donc - A par w
                                          - C par u
                                          - w par A
                                          - u par D
                                          - u par v
'''             

## 6 ## Cette fonction ne modifie pas la matrice d'origine 
tA = A.transpose()
print("A et tA",A,"\n",tA)

## 7 ## 
np.vstack((A,B))
np.hstack((A,C))
#np.hstack((D,C))
#np.hstack((A,D))

## 8 ##
X =np.array([100]*3)
np.hstack((D, np.array([X]).transpose()))

## 10 ##
print("A^(-1)",np.linalg.inv(A))

## 11 ##

## 12 ##

## 13 ##
def transvection(C,i,j,c):
    C[i]+=c*C[j]
def dilatation(C,i,c):
    C[i]*=c
def echange(C,i,j):
    for k in range(len(C[0])):
        C[j,k],C[i,k] = C[i,k],C[j,k] 

## 14 ##
def choixpivot(C,j):
    i=0
    m=0
    for k in range(j,len(C)):
        if m < abs(C[k,j]): 
            m = abs(C[k,j]) 
            i=k
    if m == 0 : return -1
    return i

## 15 ##
def pivot(A,B):
    C = np.hstack((A,np.array([B]).transpose()))
    l = len(C)

    for j in range(l):
        i = choixpivot(C,j)
        if i==-1 : 
            return -1
        echange(C,i,j)
        pivot = C[j,j] 
        for k in range(j+1,l):
            transvection(C,k,j,-C[k,j]/pivot)
 
    for j in range(l):
        dilatation(C,j,1/C[j,j])

    for j in range(l-1,-1,-1):
        for i in range(j):
            transvection(C,i,j,-C[i,j])
                
    return(C[:,l])

## 16 ##
C=(pivot([[0.0,1,2,3],[1,2,3,4],[2,9,6,5],[-8,-9,10,1]],[5,-3,9,0])   ) 
print(C)
print(np.dot([[0.0,1,2,3],[1,2,3,4],[2,9,6,5],[-8,-9,10,1]],C))

## 17 ##
def transvection2(C,i,j,c):
    for k in range(len(C[0])):
        C[i][k]+=c*C[j][k]

def dilatation2(C,i,c):
    for k in range(len(C[0])):
        C[i][k]*=c

def echange2(C,i,j):
    for k in range(len(C[0])):
        C[j][k],C[i][k] = C[i][k],C[j][k] 

def choixpivot2(C,j):
    i=0
    m=0
    for k in range(j,len(C)):
        if m < abs(C[k][j]): 
            m = abs(C[k][j]) 
            i=k
    if m == 0 : return -1
    return i

def pivot2(A,B):
    C = [A[k]+[B[k]] for k in range(len(B))]
    l = len(C)

    for j in range(l):
        i = choixpivot2(C,j)
        if i==-1 : 
            return -1
        echange2(C,i,j)
        pivot = C[j][j] 
        for k in range(j+1,l):
            transvection2(C,k,j,-C[k][j]/pivot)

    for j in range(l):
        dilatation2(C,j,1/C[j][j])

    for j in range(l-1,-1,-1):
        for i in range(j):
            transvection2(C,i,j,-C[i][j])

    return([C[k][l] for k in range(l)])

print(pivot2([[0.0,1,2,3],[1,2,3,4],[2,9,6,5],[-8,-9,10,1]],[5,-3,9,0]))

## 18 ##
'''
Loi des mailles : i1 -i2 -i3 = 0
                  i2 -i4 -i5 = 0
                  i6 -i3 -i5 = 0
Loi des nœuds :   r*i2 + R*i4 = E
                  r*i2 + -R*i3 + R*i5 = 0
                  -R*i4 + R*i5 + r*i6 = 0
'''
E,R,r = 3,10,5
A = [[1,-1,-1,0,0,0],[0,1,0,-1,-1,0],[0,0,-1,0,-1,1],[0,r,0,R,0,0],[0,r,-R,0,R,0],[0,0,0,-R,R,r]]
B = [0,0,0,E,0,0]
print(np.linalg.solve(A,B))

## 19 ##
'''Pas de résoudre numériquement'''
15/8

## 20 ##
'''
On résoud?? le système suivant : 
    a + b = 1/2
    b + c = 1/3
    c + a = 1/4
'''
A = [[2,2,0],[0,3,3],[4,0,4]]
B = [1,1,1]
print(1/np.linalg.solve(A,B)[2])

## 21 ##
A=np.random.rand(10,10)
B=[1]*10
print(np.linalg.solve(A,B))

## 22 ##
'''
$\left[\begin{array}{ccc|c}
1.0 & 0.25 & 1.0 & 0.0 \\
1.0 & 1/3 & 2.0 & 0.0 \\
0.0 & 1.0 & 12.0 & 1.0 \\
\end{array}\right]\\
\left[\begin{array}{ccc|c}
1.0 & 0.25 & 1.0 & 0.0 \\
1.0 & 1/3 & 2.0 & 0.0 \\
0.0 & 1.0 & 12.0 & 1.0 \\
\end{array}\right]\\
\left[\begin{array}{ccc|c}
1.0 & 0.25 & 1.0 & 0.0 \\
0.0 & 1.0 & 12.0 & 1.0 \\
0.0 & 1/12 & 1.0 & 0.0 \\
\end{array}\right]\\
\left[\begin{array}{ccc|c}
1.0 & 0.25 & 1.0 & 0.0 \\
0.0 & 1.0 & 12.0 & 1.0 \\
0.0 & 0.0 & 0 & -1/12 \\
\end{array}\right]$

Donc le système n'admet pas de solution.
'''

## 23 ##
A=[[1,0.25,1],[1,1/3,2],[0,1,12]]
B=[0,0,1]
print(pivot(A,B))
print(np.linalg.solve(A,B))
'''
Python accumule des erreurs d'arrondi. La matrice obtenue à la 3ême étape (avec pivot()) est ainsi :

$\left[\begin{array}{ccc|c}
1.0 & 0.25 & 1.0 & 0.0 \\
0.0 & 1.0 & 12.0 & 1.0 \\
0.0 & 0.0 & 2.220446049250313e-16 & -0.08333333333333331 \\
\end{array}\right]\\$

    Le coefficient en bas à droite, censé être égal à 12-1/(1/3 - 1/4) n'est pas nul ! 
'''

## 24 ##
'''
Le sytème equivaut à : x + y = 0
                       -10^{-20}*y = 1

qui est de Cramer. Il admet donc une unique solution.
'''

## 25 ##
A = [[1,1],[1,1-1e-20]]
B = [0,1]
print(pivot(A,B))
#print(np.linalg.solve(A,B))
'''
Il s'agit encore une fois d'une erreur d'arrondi. Pour Python, 1-1e-20 = 1.0 et le système n'admet alors pas de solution.
'''

## 26 ##
Hilbert = lambda n : np.array([[1/(i+j+1) for i in range(n) ] for j in range(n)])

## 27 ## Une petite différence peut provoquer un écart bien plus important !
A = Hilbert(4)
B1 = np.array([1,0.57,0.41,0.32])
B2 = B1 + np.array([0.05,0,0,0])
print(pivot(A,B1),pivot(A,B2))
print(np.linalg.solve(A,B1),np.linalg.solve(A,B2))
