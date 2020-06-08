import imageio
import matplotlib.pyplot as plt
import numpy as np

image = imageio.imread("boeing-avion.jpg")
taille=np.shape(image)
largeur=taille[1] ; hauteur=taille[0]
print("largeur: ",largeur,"   hauteur: ",hauteur)

# 1 pixel sur 3
image2 = np.array([[image[i][j] for j in range(largeur) if j%3==0] for i in range(hauteur) if i%3==0])

# un petit morceau de l'image
image3 = np.array([[image[i][j] for j in range(400,700) ] for i in range(100,200) ])

plt.imshow(image2)
plt.show()
plt.imshow(image3)
plt.show()
