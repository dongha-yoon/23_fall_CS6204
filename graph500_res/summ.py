
workloads = ["rr", "rw", "sr", "sw"]


for wl in workloads:
    print(f">> {wl} RESULT")
    
    f1 = open(f"graph_{wl}_.result", "r")
    lines = f1.readlines()
    min = float(lines[-28].split()[-1])
    med = float(lines[-26].split()[-1])
    max = float(lines[-24].split()[-1])
    avg = float(lines[-23].split()[-1])
    
    print(f"\t[w/o fio] min:{min:.3f}, avg:{avg:.3f}, med:{med:.3f}, max:{max:.3f}")
    
    f2 = open(f"graph_{wl}__.result", "r")
    lines = f2.readlines()
    min = float(lines[-28].split()[-1])
    med = float(lines[-26].split()[-1])
    max = float(lines[-24].split()[-1])
    avg = float(lines[-23].split()[-1])
    
    print(f"\t[w/  fio] min:{min:.3f}, avg:{avg:.3f}, med:{med:.3f}, max:{max:.3f}")