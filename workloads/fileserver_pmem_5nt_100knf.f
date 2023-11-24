set $dir=/mnt/pmem
set $nfiles=100k
set $nthreads=5
set $meandirwidth=20
set $filesize=cvar(type=cvar-gamma,parameters=mean:131072;gamma:1.5)
set $iosize=16k
set $meanappendsize=16k
set $runtime=60
define fileset name=bigfileset,path=$dir,size=$filesize,entries=$nfiles,dirwidth=$meandirwidth,prealloc=80



define process name=filereader,instances=1

{

  thread name=filereaderthread,memsize=10m,instances=$nthreads

  {

    flowop createfile name=createfile1,filesetname=bigfileset,fd=1

    flowop writewholefile name=wrtfile1,srcfd=1,fd=1,iosize=$iosize

    flowop closefile name=closefile1,fd=1

    flowop openfile name=openfile1,filesetname=bigfileset,fd=1

    flowop appendfilerand name=appendfilerand1,iosize=$meanappendsize,fd=1

    flowop closefile name=closefile2,fd=1

    flowop openfile name=openfile2,filesetname=bigfileset,fd=1

    flowop readwholefile name=readfile1,fd=1,iosize=$iosize

    flowop closefile name=closefile3,fd=1

    flowop deletefile name=deletefile1,filesetname=bigfileset

    flowop statfile name=statfile1,filesetname=bigfileset

  }

}



echo  "File-server Version 3.0 personality successfully loaded"



run 60

