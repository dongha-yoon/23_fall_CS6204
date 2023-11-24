
def readBody(wname):
    f = open("workloadbody/"+wname)
    txt = ""
    for l in f.readlines():
        txt = txt + l + "\n"

    return txt;


#fileserver
def Setfileserver(type, nt, nf):
    TXT = ""
    
    dirname = "/mnt/pmem"

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
    
    dirname = "/mnt/pmem"

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
    
    dirname = "/mnt/pmem"

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
    
    dirname = "/mnt/pmem"

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
nthreads = [1, 5, 10, 25, 50, 100]
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


def main():
    ScriptTxt = ""
    for wname in workloads[2:3]:
        for mt in memtype:
            for nt in nthreads:        
                for nf in nfiles[wname]:
                    expName = f"{wname}_{mt}_{nt}nt_{nf}nf.f"
                    WorkloadTxt = wfunction[wname](mt, nt, nf) + readBody(wname)
                    
                    f = open("workloads/"+expName, "+w")
                    f.write(WorkloadTxt)
                    f.close()

                    ScriptTxt = ScriptTxt + f"\tfilebench -f workloads/{expName} > results/{expName}_${{i}}.result" +"\n"
    
    f = open("exp2.sh", "+w")
    f.write(f"for i in {{1..{Ntry}}}\ndo\n {ScriptTxt} done")
    f.close()
    
main()