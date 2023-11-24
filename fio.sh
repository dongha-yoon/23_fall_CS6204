fioworkloads=("rr" "rw" "sr" "sw")

do_lmbench() {
	fioname=$1

	for i in {1..5}
	do
		echo "start lmbench $1 tr_$i"
		numactl -C 8-15 bash -c "../lmbench/bin/x86_64-linux-gnu/bw_mem -P 8 4096m rd >> lmbench_res/fio_${fioname}_rd.res"
		numactl -C 8-15 bash -c "../lmbench/bin/x86_64-linux-gnu/bw_mem -P 8 4096m wr >> lmbench_res/fio_${fioname}_wr.res"
		numactl -C 8-15 bash -c "../lmbench/bin/x86_64-linux-gnu/bw_mem -P 8 4096m rdwr >> lmbench_res/fio_${fioname}_rdwr.res"
	done

	echo "lmbench $1 done"
}

do_fio() {
	fioname=$1
	echo "numactl -C 4-7 fio pmem_${fioname}.fio -output=fio_res/pmem_${fioname}.output"
	numactl -C 4-7 fio pmem_${fioname}.fio -output=fio_res/pmem_${fioname}.output
	
	echo "$fioname done" >> lmbench_res/fio_${fioname}_rd.res
	echo "$fioname done" >> lmbench_res/fio_${fioname}_wr.res
	echo "$fioname done" >> lmbench_res/fio_${fioname}_rdwr.res
}


export PMEM_IS_PMEM_FORCE=1

rm lmbench_res/*
rm fio_res/*

for wl in $fioworkloads
do
	do_fio $wl &
	do_lmbench $wl
done

