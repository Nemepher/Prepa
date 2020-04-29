import numpy as np 

def transvection(C,i,j,c):
    C[i]+=c*C[j]
def dilatation(C,i,c):
    C[i]*=c
def echange(C,i,j):
    for k in range(len(C[0])):
        C[j,k],C[i,k] = C[i,k],C[j,k] 

def choixpivot(C,j):
    i=0
    m=0
    for k in range(j,len(C)):
        if m < abs(C[k,j]): 
            m = abs(C[k,j]) 
            i=k
    if m == 0 : return -1
    return i

def pivot(A,B,f):
    C = np.hstack((A,np.array([B]).transpose()))
    l = len(C)
    writeMatrix(C,f)

    for j in range(l):
        i = choixpivot(C,j)
        if i==-1 : 
            writeMatrix(C,f)
            return -1
        echange(C,i,j)
        pivot = C[j,j] 
        
        writeMatrix(C,f)
        
        for k in range(j+1,l):
            transvection(C,k,j,-C[k,j]/pivot)
    
    
    writeMatrix(C,f)
    
    for j in range(l):
        dilatation(C,j,1/C[j,j])
    
    writeMatrix(C,f)

    for j in range(l-1,-1,-1):
        for i in range(j):
            transvection(C,i,j,-C[i,j])
                
    writeMatrix(C,f)
    return(C[:,l])

def writeMatrix(C,f):
    c = len(C[0])
    l = len(C)
    f.write("\left[\\begin{array}{"+"c"*(c-1)+"|c}\n") 
    for i in range(l):
        for j in range(c): 
            if j == c-1 : f.write(str(C[i,j])+" \\\\\n")
            else: f.write(str(C[i,j])+" & ")
    f.write("\end{array}\\right]\\\\\n")


f = open("output.tex","w")
A = np.array([[0.0,2,-7,12],[2,-6,-1,-5],[-3,9,6,12],[-1,8,7,14]])
B = [1,2,3,4]

A=[[0.0,2,58,12],[2,-6,-4,-5],[-3,9,6,12],[-1,8,7,14]]
B=[-70,31,-51,-52]
B=[-22,31,-51,-52]
A=[[4.0,2,8,5],[2,1,2,2],[2,2,0,1],[3,2,4,3]]
B=[0,0,0,0]
A=[[1,0.25,1],[1,1/3,2],[0,1,12]]
A=[[1.0,3,4],[2,4,1],[-2,2,1]]
B=[0,0,1]
pivot(A,B,f)
f.close()
