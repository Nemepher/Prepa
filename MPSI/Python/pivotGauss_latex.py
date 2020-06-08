import sympy as sp
from subprocess import Popen

def transvection(C,i,j,c): 
    for k in range(C.shape[1]):
        C[i,k] = c*C[j,k] + C[i,k]
def dilatation(C,i,c):
    for k in range(C.shape[1]):
        C[i,k] = c*C[i,k]
def echange(C,i,j):
    for k in range(C.shape[1]):
        C[j,k],C[i,k] = C[i,k],C[j,k] 

def choixpivot(C,j):
    i=0
    m=0
    for k in range(j,C.shape[0]):
        if m < abs(C[k,j]): 
            m = abs(C[k,j]) 
            i=k
    if m == 0 : return -1
    return i

def pivot(A,f,n):
    C=A
    l = C.shape[0]
    writeMatrix(C,f,n)

    for j in range(l):
        i = choixpivot(C,j)
        if i==-1 : 
            break
        echange(C,i,j)
        pivot = C[j,j] 
        writeMatrix(C,f,n)
        for k in range(j+1,l):
            transvection(C,k,j,-C[k,j]/pivot) 
        writeMatrix(C,f,n)


    writeMatrix(A,f,n)
    
    for j in range(l):
        if C[j,j]!=0:
            dilatation(C,j,1/C[j,j])
    
    writeMatrix(C,f,n)

    for j in range(l-1,-1,-1):
        for i in range(j):
            transvection(C,i,j,-C[i,j])
                
    writeMatrix(C,f,n)
    return(C)

def writeMatrix(C,f,n):
    l,c = C.shape
    f.write("\left[\\begin{array}{"+"c"*(c-n)+"|"+"c"*n+"}\n") 
    for i in range(l):
        for j in range(c): 
            if j == c-1 : f.write(str(C[i,j])+" \\\\\n")
            else: f.write(str(C[i,j])+" & ")
    f.write("\end{array}\\right]\\\\\n")



A = sp.Matrix([[2,2,2,12,-22],[2,-6,-4,-5,31],[-3,9,6,12,-51],[-1,8,7,14,-52]])

'''
A=[[0.0,2,58,12],[2,-6,-4,-5],[-3,9,6,12],[-1,8,7,14]]
B=[-70,31,-51,-52]
B=[-22,31,-51,-52]
A=[[4.0,2,8,5],[2,1,2,2],[2,2,0,1],[3,2,4,3]]
B=[0,0,0,0]
A=[[1,0.25,1],[1,1/3,2],[0,1,12]]
A=[[1.0,3,4],[2,4,1],[-2,2,1]]
B=[0,0,1]'''

f = open("output.tex","w")
f.write("\\documentclass{article}\n\\setlength\parindent{0pt}\n\\begin{document}\n$")
pivot(A,f,1)
f.write("$\n\\end{document}")
f.close()
Popen(["pdflatex","output.tex"])

