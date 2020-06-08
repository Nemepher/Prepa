#1
def sommes(n):
	S1,S2,S3=0,0,0
	for k in range(1, n+1):
		S1=S1+k
		S2=S2+k*k
		S3=S3+k*k*k
	return S1,S2,S3
print(sommes(5))
print(sommes(5)[0]**2)

#2
def T(x):
	if x%2==0 :  return x//2
	return 3*x+1

def Syracuse(n):
	print(n, end=' ')
	while n>1:
		n=T(n)
	print(n,end=' ')

def SyracuseL(n):
	i=0
	while n>1:
		i+=1
		n=T(n)
	return i

Syracuse(14)
print("length :", SyracuseL(14))

def SyracuseLT(l):
	n=0
	s=SyracuseL(n)
	while s<=l:
		n+=1
		s=SyracuseL(n)
	return(n)



#3
from time import localtime
def conversion(t):
	h,m,s = 0,0,0
	h=t//3600
	t=t%3600
	m=t//60
	s=t%60
	return [h,m,s]

def bissextile(a):
	return a%4==0 and (a%100!=0 or (a%100==0 and a%400==0))

def decompte(J,M,A):
	jM=[0,31,28,31,30,31,30,31,31,30,31,30,31]
	'''jour, mois, année'''
	#l,A,M,J = 0,1,1,1
	l,j,m,a=0,localtime()[2],localtime()[1],localtime()[0]

	if A>a:
		return

	l+=(j-J)

	while m>M:
		if bissextile(a) and m==2:
			l+=29
		else:
			l+=jM[m]
		m-=1

	while m<M:
		m+=1
		if bissextile(a) and m==2:
			l-=29
		else:
			l-jM[m]

	while a>A:
		if bissextile(a) :
			l+=366
		else:
			l+=365
		a-=1
	return l

print("decompte :", decompte(29,10,2001))

#4
def conversion10(L,b):
	n=0
	l=len(str(L))
	for i in range(0,l):
		n+=(b**i)*int(str(L)[l-1-i])
	return n

def conversion(x,b):
	o=[]
	while x>0:
		o.append(x%b)
		x=x//b
	o.reverse()
	return o

	#j=0
	#while x>0:
	#	i=0
	#	while x%(b**i)==0:
	#		o[j]=x//(b**i)
	#		i+=1
	#	w-=o[j]*(b**i)
	#	j+=1
	#return[o.reverse()]

print(conversion10(101010101,2))
print(conversion(102112,2))

#5
from math import floor
def premier(n):
	i=2
	premier = True
	while i < floor(n)  and premier:
		if n%i==0:
			premier = False
		i+=1
	return premier

'''def factorise(n):
	o=[]
	i=2
        while i<10:
		if n%i==0:
			if premier(i):
				o.append(i)
			n=n//i
'''

print(premier(45))


























