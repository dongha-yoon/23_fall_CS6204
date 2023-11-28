import matplotlib.pyplot as plt
import numpy as np
import re

fworkloads = ["sr", "sw", "rr", "rw"]
res = []
for wl in fworkloads:

    f1 = open(f"pmem_{wl}_.output", "r")
    lines = f1.readlines()
    bw1 = float(re.findall("\d+", lines[-1])[0])
    
    f2 = open(f"pmem_{wl}__.output", "r")
    lines = f2.readlines()
    bw2 = float(re.findall("\d+", lines[-1])[0])
    
    res.append(bw2/bw1)

plt.bar(np.arange(len(fworkloads))-0.1, np.ones(4), width=0.2, label="w/o fio")        
plt.bar(np.arange(len(fworkloads))+0.1, res, width=0.2, label="w/  fio")
plt.xticks(range(len(fworkloads)), fworkloads)
plt.ylim(0.9,1.1)
plt.title("FIO: Normalized bandwidth")
plt.xlabel("FIO workload")
plt.legend()
plt.plot()