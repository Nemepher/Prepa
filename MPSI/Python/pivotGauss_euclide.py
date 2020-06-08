import numpy as np 

def euclide2 (a,b):
    r0,u0,v0,r1,u1,v1 = a,1,0,b,0,1
    while r1!=0:
        q = r0//r1
        r0,u0,v0,r1,u1,v1 = r1,u1,v1,r0-q*r1,u0-q*u1,v0-q*v1
    return r0,u0,v0

def euclide (l):
    n=len(l)
    u=np.array([0]*n)
    p,a,b= euclide2(l[0],l[1])
    u[0:2] = [a,b]
    for i in range(2,n):
        p,a,b = euclide2(p,l[i])
        u*=a
        u[i]=b
    return p,u


def transvection(C,i,j,c,ligne=True):
    if ligne :C[i]+=c*C[j]
    else : C[:,i]+=c*C[:,j]

def dilatation(C,i,c,ligne=True):
    if ligne : C[i]*=c
    else : C[:,i]*=c 

def echange(C,i,j,ligne=True):
    if ligne :
        for k in range(len(C[0])):
            C[j,k],C[i,k] = C[i,k],C[j,k] 
    else : 
         for k in range(len(C)):
            C[k,j],C[k,i] = C[k,i],C[k,j] 


def mini(C,j,ligne=True):
    i=j
    m=abs(C[j,j])
    if ligne :
        for k in range(j+1,len(C)):
            if (abs(C[k,j])>0 and abs(C[k,j])<m):
                m=abs(C[k,j])
                i=k
        return i,m
    else :
        for k in range(j+1,len(C[0])):
            if (abs(C[j,k])>0 and abs(C[j,k])<m):
                m=abs(C[j,k])
                i=k
        return i,m

def mini2(C,k):
    i,j=k,k
    m=abs(C[j,j])
    for l in range(j,len(C)):
        for c in range(j,len(C[0])):
            m2 = abs(C[l,c])
            if m2>0 and m2<m :
                m = m2
                i,j=l,c
    return i,j,m

def pivot1(A):
    C=A
    l1=len(C)
    l2=len(C[0])
    print(C)

    for j in range(l2):
        pivot = C[j,j] 
        for i in range(j+1,l1):
            cible=C[i,j]
            p,a,b = euclide2(pivot,cible)
            dilatation(C,i,pivot//p)
            transvection(C,i,j,-cible//p)
    print(C) 
    for j in range(l2-1,-1,-1):
        pivot = C[j,j]
        for i in range(j):
            cible=C[i,j]
            p,a,b = euclide2(pivot,cible)
            dilatation(C,i,pivot//p)
            transvection(C,i,j,-cible//p)
    print(C)
    for j in range(1,l2):
        #dilatatiopen(C,j,C[j-1,j-1])
        p,a,b = euclide2(C[j-1,j-1],C[j,j])
        dilatation(C,j,C[j-1,j-1]//p)

    print(C)
    return(C)

def pivot2(A):
    C=A
    l1=len(C)
    l2=len(C[0])

    for j in range(l2):
        print(C)

        '''Il faut repérer le plus plus petit
        for k in range(j,l2):
        if mini(C,k)[0]>0 : echange(C,j,mini(C,k)[0])
        if mini(C,j,False)[0]>0 : echange(C,j,mini(C,j,False)[0],False)
        pivot = C[j,j] 
        '''     
        l,c,m = mini2(C,j)
        if l>-1 : echange(C,j,l)
        if c>-1 : echange(C,j,c,False)
        pivot = C[j,j]

        for i in range(j+1,l1):
            cible=C[i,j]
            p,a,b = euclide2(pivot,cible)
            dilatation(C,i,pivot//p)
            transvection(C,i,j,-cible//p)

        for i in range(j+1,l2):
            cible=C[j,i]
            p,a,b = euclide2(pivot,cible)
            dilatation(C,i,pivot//p,False)
            transvection(C,i,j,-cible//p,False)

    print(C) 

    for j in range(0,l2-1):
        pivot = C[j,j]
        cible= C[j+1,j+1]
        p,a,b = euclide(C[j,j],C[j+1,j+1])
        transvection(C,j,j+1,1,False)
        print(C)
        dilatation(C,j,a)
        print(C)
        transvection(C,j,j+1,b)
        print(C)
        transvection(C,j+1,j,-b*cible//p,False)
        transvection(C,j+1,j,1)

    print(C)

    return(C)

def pivot3(A):
    C=A
    l1=len(C)
    l2=len(C[0])
    
    #Sans à priori les relations de divisibilité
    for j in range(min(l2,l1)):
        
        arrange=False
        while not arrange:
            
            print(C)
            
            l,c,_ = mini2(C,j)
            echange(C,j,l)
            echange(C,j,c,False)
            pivot = C[j,j]
            ''' 
            l,_ = mini(C,j)
            echange(C,j,l)
            c,_ = mini(C,j,False)
            echange(C,j,c,False)
            pivot = C[j,j]
            '''

            for i in range(j+1,l1):
                cible=C[i,j]
                transvection(C,i,j,-cible//pivot)

            for i in range(j+1,l2):
                cible=C[j,i]
                transvection(C,i,j,-cible//pivot,False)
            
            arrange = mini(C,j)[0]==j and mini(C,j,False)[0]==j

    #Relations de divisibilité
    for j in range(min(l1,l2)-2,-1,-1):
        
        print(C)

        p,u,v = euclide2(C[j,j],C[j+1,j+1])
        
        transvection(C,j,j+1,v,False)
        transvection(C,j+1,j,(u-1))
        transvection(C,j,j+1,1)
        transvection(C,j+1,j,-C[j+1,j]//C[j,j])
        transvection(C,j+1,j,-C[j,j+1]//C[j,j],False)
        
    return(C)



A=np.array([[16,-5,8,45,2,8],[7,8,11,2,4,7],[16,13,-18,2,9,8],[17,2,3,2,4,7]])
pivot3(A)
