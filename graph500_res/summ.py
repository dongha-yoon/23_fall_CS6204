import matplotlib.pyplot as plt
import numpy as np

fworkloads = ["sr", "sw", "rr", "rw"]
res = []
for wl in fworkloads:

    f1 = open(f"graph_{wl}_.result", "r")
    lines = f1.readlines()
    # min = float(lines[-28].split()[-1])
    # med = float(lines[-26].split()[-1])
    max1 = float(lines[-24].split()[-1])
    # avg1 = float(lines[-23].split()[-1])
            
    f2 = open(f"graph_{wl}__.result", "r")
    lines = f2.readlines()
    # min = float(lines[-28].split()[-1])
    # med = float(lines[-26].split()[-1])
    max2 = float(lines[-24].split()[-1])
    # avg2 = float(lines[-23].split()[-1])
    
    res.append(max2/max1)

plt.bar(np.arange(len(fworkloads))-0.1, np.ones(4), width=0.2, label="w/o fio")        
plt.bar(np.arange(len(fworkloads))+0.1, res, width=0.2, label="w/  fio")
plt.xticks(range(len(fworkloads)), fworkloads)
# plt.ylim(0.9,1.1)
plt.title("Graph500: Normalized max. latency")
plt.xlabel("Concurrent FIO workload")
plt.legend()
plt.plot()