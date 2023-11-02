set $dir=/mnt/pmem
set $nfiles=8M
set $nthreads=50
set $meandirwidth=1000000set $filesize=cvar(type=cvar-gamma,parameters=mean:32768;gamma:1.5)set $iosize=1mset $meanappendsize=16kdefine fileset name=bigfileset,path=$dir,size=$filesize,entries=$nfiles,dirwidth=$meandirwidth,prealloc=80



define process name=filereader,instances=1

{

  thread name=filereaderthread,memsize=10m,instances=$nthreads

  {

    flowop deletefile name=deletefile1,filesetname=bigfileset

    flowop createfile name=createfile2,filesetname=bigfileset,fd=1

    flowop appendfilerand name=appendfilerand2,iosize=$meanappendsize,fd=1

    flowop fsync name=fsyncfile2,fd=1

    flowop closefile name=closefile2,fd=1

    flowop openfile name=openfile3,filesetname=bigfileset,fd=1

    flowop readwholefile name=readfile3,fd=1,iosize=$iosize

    flowop appendfilerand name=appendfilerand3,iosize=$meanappendsize,fd=1

    flowop fsync name=fsyncfile3,fd=1

    flowop closefile name=closefile3,fd=1

    flowop openfile name=openfile4,filesetname=bigfileset,fd=1

    flowop readwholefile name=readfile4,fd=1,iosize=$iosize

    flowop closefile name=closefile4,fd=1

  }

}



echo  "Varmail Version 3.0 personality successfully loaded"



run 60

