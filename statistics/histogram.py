import numpy as np
from matplotlib import pyplot as plt
with open('results.csv') as f:
  v = np.loadtxt(f, delimiter=",", dtype='float', comments="#", skiprows=1, usecols=None)
v_hist = np.ravel(v)   # 'flatten' v
fig = plt.figure()
ax1 = fig.add_subplot(111)

n, bins, patches = ax1.hist(v_hist, bins=10, normed=1, facecolor='blue')
plt.show()
