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

do_fio() {
	fioname=$1
	ff=$2
	echo "numactl -C 4-7 fio pmem_${fioname}.fio -output=fio_res/pmem_${fioname}${ff}.output"
	numactl -C 4-7 fio pmem_${fioname}.fio -output=fio_res/pmem_${fioname}${ff}.output
	
	# echo "$fioname done" >> lmbench_res/fio_${fioname}_rd.res
	# echo "$fioname done" >> lmbench_res/fio_${fioname}_wr.res
	# echo "$fioname done" >> lmbench_res/fio_${fioname}_rdwr.res
}

do_graph() {
	$fioname=$1
	ff=$2
	mpirun -genv I_MPI_PIN_PROCESSOR_LIST 8-15 -n 8 ../graph500/src/graph500_reference_bfs 10 >> graph_${fioname}${ff}.result 2>&1
	
}

export PMEM_IS_PMEM_FORCE=1

# rm lmbench_res/*
# rm fio_res/*


do_graph "tt" __

# for wl in "${fioworkloads[@]}"
# do
# 	do_fio $wl _
# 	do_graph $wl _

# 	do_fio $wl __ &
# 	sleep 10s
# 	do_graph $wl __
	
# 	# do_lmbench $wl
	
# done

