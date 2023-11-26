


def readBody(wname):
    f = open("workloadbody/"+wname)
    txt = ""
    for l in f.readlines():
        txt = txt + l + "\n"

    return txt;

DIR_NAME = "/mnt/pmem"

#fileserver
def Setfileserver(type, nt, nf):
    TXT = ""
    
    dirname = DIR_NAME

    TXT = TXT + f"set $dir={dirname}" + "\n"
    TXT = TXT + f"set $nfiles={nf}" + "\n"
    TXT = TXT + f"set $nthreads={nt}" + "\n"
    
    TXT = TXT + f"set $meandirwidth=20" + "\n"
    TXT = TXT + f"set $filesize=cvar(type=cvar-gamma,parameters=mean:131072;gamma:1.5)" + "\n"
    TXT = TXT + f"set $iosize=16k" + "\n"
    TXT = TXT + f"set $meanappendsize=16k" + "\n"
    TXT = TXT + f"set $runtime=60" + "\n"
    
    return TXT

#varmail
def Setvarmail(type, nt, nf):
    TXT = ""
    
    dirname = DIR_NAME

    TXT = TXT + f"set $dir={dirname}" + "\n"
    TXT = TXT + f"set $nfiles={nf}" + "\n"
    TXT = TXT + f"set $nthreads={nt}" + "\n"

    TXT = TXT + "set $meandirwidth=1000000"
    TXT = TXT + "set $filesize=cvar(type=cvar-gamma,parameters=mean:32768;gamma:1.5)"
    TXT = TXT + "set $iosize=1m"
    TXT = TXT + "set $meanappendsize=16k"

    return TXT

def Setwebproxy(type, nt, nf):
    TXT = ""
    
    dirname = DIR_NAME

    TXT = TXT + f"set $dir={dirname}" + "\n"
    TXT = TXT + f"set $nfiles={nf}" + "\n"
    TXT = TXT + f"set $nthreads={nt}" + "\n"


    TXT = TXT + "set $meandirwidth=1000000"
    TXT = TXT + "set $meanfilesize=32k"
    TXT = TXT + "set $meaniosize=16k"
    TXT = TXT + "set $iosize=1m"
    
    return TXT

#webserver
def Setwebserver(type, nt, nf):
    TXT = ""
    
    dirname = DIR_NAME

    TXT = TXT + f"set $dir={dirname}" + "\n"
    TXT = TXT + f"set $nfiles={nf}" + "\n"
    TXT = TXT + f"set $nthreads={nt}" + "\n"

    TXT = TXT + "set $meandirwidth=20"
    TXT = TXT + "set $filesize=cvar(type=cvar-gamma,parameters=mean:65536;gamma:1.5)"
    TXT = TXT + "set $iosize=1m"
    TXT = TXT + "set $meanappendsize=8k"

    return TXT


NAME_FILESERVER = "fileserver"
NAME_VALMAIL    = "varmail"
NAME_WEBPROXY   = "webproxy"
NAME_WEBSERVER  = "webserver"

Ntry = 3
workloads = [NAME_FILESERVER, NAME_VALMAIL, NAME_WEBPROXY, NAME_WEBSERVER]
nthreads = ["1", "5", "10", "25", "50", "100"]
memtype = ["pmem"]

nfiles = {
    NAME_FILESERVER: ["100k", "800k", "3200k"],
    NAME_VALMAIL   : ["100k", "800k", "8m"],
    NAME_WEBPROXY  : ["100k", "800k", "8m"],
    NAME_WEBSERVER : ["100k", "800k", "4m"]
}

wfunction = {
    NAME_FILESERVER: Setfileserver,
    NAME_VALMAIL   : Setvarmail,
    NAME_WEBPROXY  : Setwebproxy,
    NAME_WEBSERVER : Setwebserver
}


def genworkload():
    ScriptTxt = ""
    for wname in workloads:
        for mt in memtype:
            for nt in nthreads:        
                for nf in nfiles[wname]:
                    expName = f"{wname}_{mt}_{nt}nt_{nf}nf.f"
                    WorkloadTxt = wfunction[wname](mt, nt, nf) + readBody(wname)
                    
                    f = open("workloads/"+expName, "+w")
                    f.write(WorkloadTxt)
                    f.close()

                    ScriptTxt = ScriptTxt + f"\tfilebench -f workloads/{expName} > results_ext4/{expName}_${{i}}.result" +"\n"
    
    # f = open("exp.sh", "+w")
    f = open("exp_ext4.sh", "+w")
    
    f.write(f"for i in {{1..{Ntry}}}\ndo\n {ScriptTxt} done")
    f.close()
    

import re
import matplotlib.pyplot as plt
import numpy as np


NOVA_t = {
    NAME_FILESERVER: 140,
    NAME_VALMAIL   : 300,
    NAME_WEBPROXY  : 275,
    NAME_WEBSERVER : 210
}

def plot():
    
    # X = nthreads
    # Y = bw/tp
    # legend = nfiles
    
    for wname in workloads:
        for mt in memtype:
            TP = []
            BW = []
            for nf in nfiles[wname]:    
                t = []
                b = []
                for nt in nthreads:    
                    throughput = 0
                    bandwidth = 0
                    for tr in range(1,Ntry+1):
                        fname = f"results/{wname}_{mt}_{nt}nt_{nf}nf.f_{tr}.result"
                        f = open(fname, "r")
                        res = f.readlines()[-2]
                        res = re.findall("\d+\.\d+", res)
                        throughput += float(res[1])
                        bandwidth += float(res[2])
                        
                    t.append(throughput/3)
                    b.append(bandwidth/3)
                
                TP.append(t)
                BW.append(b)
            
            
            idx = np.arange(len(nthreads))
            width = 0.25
            plt.title(wname)
            for i in range(len(TP)):
                Y = np.array(TP[i])
                plt.bar(idx+(i)*width, Y/1000., width=width, label=f"NF:{nfiles[wname][i]}")
            
            plt.axhline(NOVA_t[wname], label="NOVA PCM-large", color='r', linestyle='--')
            plt.xticks(idx+width, nthreads)
            plt.xlabel("# threads")
            plt.ylabel("Throughput (Kops/s)")
            plt.legend()
            # plt.show()
            # plt.savefig(f"plots/{wname}_t.png")        
            plt.clf()
        
        
            plt.title(wname)
            for i in range(len(BW)):
                Y = np.array(BW[i])
                plt.bar(idx+(i)*width, Y/1000., width=width, label=f"NF:{nfiles[wname][i]}")
            
            plt.xticks(idx+width, nthreads)
            plt.xlabel("# threads")
            plt.ylabel("Bandwidth (GB/s)")
            plt.legend()
            plt.show()        
            # plt.savefig(f"plots/{wname}_b.png")
            plt.clf()
def main():
    genworkload()
    # plot()
    
    
main()