import cmath as cm
from math import sin, cos

def racines(z0,n):
    z0=cm.polar(z0)
    return [z0[0]**(1/n)*cm.exp(complex(0,z0[1]+(2*k*cm.pi)/n)) for k in range(n)]

#print([i**4 for i in racines(1,4)])

def log_complexe(Z):
    if Z==0:
        print("L'équation exp(z)=",Z," n'a pas de solutions)")
    else:
        print("Les solution de l'équation exp(z)=",Z," sont de la forme :\n",cm.log(abs(Z)),"+ i *(",cm.phase(Z),"+2 * k * pi ) avec k entier") 

#print(log_complexe(1+3j))

a=3+4j
b=4-2j
c=-7-10j
d=-3+3j

def angle(a,b,c,r=False):
    if r==True:
        return cm.phase((a-b)/(c-b))
    else:
        return cm.phase((a-b)/(c-b))*180/cm.pi
def milieu(a,b):
    return (a+b)/2

print("BAD",angle(a,d,b), angle(b,a,d), angle(d,b,a))
print("BCD", angle(b,c,d), angle(c,d,b), angle(d,b,c))
i,j,k,l = milieu(a,b), milieu(b,c), milieu(c,d), milieu(a,d)
print("IJK et KLI :",angle(i,j,k),angle(k,l,i))
print("JKL et LIJ :", angle(j,k,l),angle(k,l,i))

def transfor(a,b):
    if a==0:
        print("Pas une transformation")
    elif a==1:
        print("Translation de vecteur",b)
    else:
        print("Similitude directe de centre",b/(1-a),"de rapport",a+b,"et d'angle",(a+b)/b)

transfor(1+1j, 2+1j)

def morley(A,B,C):
    '''Points du triangle'''
    b=angle(A,B,C,True)
    a=angle(C,A,B,True)
    c=angle(B,C,A,True)
    def inter(A,B,a,b):
        return (abs(B-A)*sin(a)/sin(a+b))*rect:*2 + B
    
    M=inter(A,B,a/3,b/3)
    N=inter(B,C,b/3,c/3)
    P=inter(C,A,c/3,a/3)
    
    return(M,N,P,angle(M,N,P),angle(N,P,M),angle(P,M,N))

print(morley(0,1j,1))
