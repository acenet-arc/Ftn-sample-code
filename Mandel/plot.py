''' This version reads in and plots data
'''

import numpy as np
import matplotlib
import sys
#matplotlib.use('Agg')
matplotlib.use('TkAgg')

import matplotlib.pyplot as plt

settings={
  "colormap":"nipy_spectral",
}

file = sys.stdin # or could use sys.argv to check for a filename argument, meh...

line=file.readline()
lineSplit=line.split()
settings["x_limits"]=(float(lineSplit[0]),float(lineSplit[1]))
settings["y_limits"]=(float(lineSplit[2]),float(lineSplit[3]))
line=file.readline()
lineSplit=line.split()
settings["resolution"]=(int(lineSplit[0]),int(lineSplit[1]))

data=np.empty((settings["resolution"][1],settings["resolution"][0]))

x = np.linspace(settings["x_limits"][0], settings["x_limits"][1], settings["resolution"][0]+1)
y = np.linspace(settings["y_limits"][0], settings["y_limits"][1], settings["resolution"][1]+1)

j=settings["resolution"][1]-1
for line in file:
  lineSplit=line.split()
  i=0
  for item in lineSplit:
    
    data[j][i]=int(item)
    i=i+1
  j=j-1

ax = plt.axes()
ax.set_aspect("equal")
graph = ax.pcolormesh(x, y, data, cmap=settings["colormap"])
plt.colorbar(graph)
plt.xlabel("Real-Axis")
plt.ylabel("Imaginary-Axis")
plt.show()
