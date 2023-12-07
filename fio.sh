fioworkloads=("rr" "rw" "sr" "sw")

do_lmbench() {
	fioname=$1

	for i in {1..15}
	do
		echo "start lmbench $1 tr $i"
		numactl -C 8-15 ../lmbench/bin/x86_64-linux-gnu/bw_mem -P 8 8m rd 2>> lmbench_res/fio_${fioname}_rd.res
		numactl -C 8-15 ../lmbench/bin/x86_64-linux-gnu/bw_mem -P 8 8m wr 2>> lmbench_res/fio_${fioname}_wr.res
		numactl -C 8-15 ../lmbench/bin/x86_64-linux-gnu/bw_mem -P 8 8m rdwr 2>> lmbench_res/fio_${fioname}_rdwr.res
	done
	echo "lmbench $1 done"
}




YET=0
DONE=1
STATE=$YET

do_fio() {
	fioname=$1
	ff=$2
	echo "numactl -C 12-15 fio pmem_${fioname}.fio -output=fio_res/pmem_${fioname}${ff}.output"
	numactl -C 12-15 fio pmem_${fioname}.fio -output=fio_res/pmem_${fioname}${ff}.output

}

do_graph() {
	fioname=$1
	ff=$2
	echo "mpirun -genv -n 8 ../graph500/src/graph500_reference_bfs 24 >> graph500_res/graph_${fioname}${ff}.result 2>&1"
	mpirun -n 8 ../graph500/src/graph500_reference_bfs 24 >> graph500_res/graph_${fioname}${ff}.result 2>&1
}	

do_fileserver(){
	wl=$1
	for i in {1..3}
	do
		echo "numactl -C 12-15 filebench -f workloads/${wl}_pmem_5nt_3200knf.f > final_res/${wl}_${i}.result"
		numactl -C 12-15 filebench -f workloads/${wl}_pmem_5nt_3200knf.f > final_res/${wl}_${i}.result
	done
}

do_webserver(){
	wl=$1
	ff=$2
	for i in {1..3}
	do
		echo "numactl -C 12-15 filebench -f workloads/${wl}_pmem_5nt_4mnf.f > final_res/${wl}_${i}${ff}.result"
		numactl -C 12-15 filebench -f workloads/${wl}_pmem_5nt_4mnf.f > final_res/${wl}_${i}${ff}.result
	done
}

export PMEM_IS_PMEM_FORCE=1

# rm lmbench_res/*
# rm fio_res/*
# rm graph500_res/*

fbworkloads=( )

wl="fileserver"
do_fileserver $wl _
# do_graph $wl __
# sleep 300

wl="webserver"
do_webserver $wl _
do_webserver $wl _ &
do_graph $wl __

# for wl in "${fioworkloads[@]}"
# do
# 	do_fio $wl _
# 	do_graph $wl _
# 	do_fio $wl __ &
# 	sleep 30s
# 	do_graph $wl __
# 	sleep 600s
	
# 	# do_lmbench $wl
	
# done


