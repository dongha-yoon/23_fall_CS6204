import matplotlib.pyplot as plt
import numpy as np
import re

fworkloads = ["fbench"]
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

plt.bar(np.arange(len(fworkloads))-0.1, np.ones(4), width=0.2, label="w/o filebench")        
plt.bar(np.arange(len(fworkloads))+0.1, res, width=0.2, label="w/  filebench")
plt.xticks(range(len(fworkloads)), [""])
# plt.ylim(0.9,1.1)
plt.xlim(-1,1)
plt.title("Graph500: Normalized max. latency")
# plt.xlabel("Concurrent FIO workload")
plt.legend()
plt.show()
plt.clf()



t1 = 0
t2 = 0
b1 = 0
b2 = 0
for i in range(1,4):
    f = open(f"filebench_{i}.result")
    res = f.readlines()[-2]
    res = re.findall("\d+\.\d+", res)
    t1 += float(res[1])
    b1 += float(res[2])

    f = open(f"fileserver_pmem_25nt_3200knf.f_{i}.result")
    res = f.readlines()[-2]
    res = re.findall("\d+\.\d+", res)
    t2 += float(res[1])
    b2 += float(res[2])

t1/=3
t2/=3
b1/=3
b2/=3

res = b1/b2

print(b2)
plt.bar(np.arange(len(fworkloads))-0.1, np.ones(4), width=0.2, label="w/o Graph500")        
plt.bar(np.arange(len(fworkloads))+0.1, res, width=0.2, label="w/  Graph500")
plt.xticks(range(len(fworkloads)), [""])
# plt.ylim()
plt.xlim(-1,1)
plt.title("Fileserver: Normalized bandwidth")
# plt.xlabel("Concurrent FIO workload")
plt.legend()
plt.show()
plt.clf()
