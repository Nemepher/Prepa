import numpy as np
from scipy.integrate import ode
import matplotlib.pyplot as plt

xMin=-20; xMax=20; yMin=-20; yMax=20
vXNum=20; vYNum=20

#Function 
def f(t,x): return[x[1]-x[0],-5*x[0]+x[1]]

#Vector field
X,Y = np.meshgrid( np.linspace(xMin,xMax,vXNum),np.linspace(yMin,yMax,vYNum) )
U,V = f(0,[X,Y])
#Normalize arrows
N = np.sqrt(U**2+V**2)  
U2, V2 = U/N, V/N

def vectorField():
    ax.quiver( X,Y,U2, V2)

fig = plt.figure(num=1)
ax=fig.add_subplot(111)
coords = [0,0]

#Events handling
def onclick(event):
    global coords
    coords=[event.xdata, event.ydata]
    if (coords[0]!=None and coords[1]!=None):
        update()
cid = fig.canvas.mpl_connect('button_press_event', onclick)

#Solution curves
def update():

    ax.clear()
    plt.xlim([xMin,xMax])
    plt.ylim([yMin,yMax])
    plt.xlabel(r"$x$")
    plt.ylabel(r"$y$")

    vectorField()

    #Equation solver
    t0=0; tEnd=10; dt=0.01 
    r=ode(f).set_integrator('vode', method='bdf',max_step=dt)
    ic=[coords,[6,-4]]
    color=['r','b','g']
    for k in range(len(ic)):
        Y=[]
        r.set_initial_value(ic[k], t0).set_f_params()
        while r.successful() and r.t +dt < tEnd:
            r.integrate(r.t+dt)
            Y.append(r.y)

        S=np.array(np.real(Y))
        ax.plot(S[:,0],S[:,1], color = color[k], lw = 1.25)
    plt.draw()

update()
plt.show()
