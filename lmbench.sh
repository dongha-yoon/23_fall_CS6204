numactl -C 8-15 ../lmbench/bin/x86_64-linux-gnu/bw_mem -P 8 4096m rd
numactl -C 8-15 ../lmbench/bin/x86_64-linux-gnu/bw_mem -P 8 4096m wr
numactl -C 8-15 ../lmbench/bin/x86_64-linux-gnu/bw_mem -P 8 4096m rdwr

