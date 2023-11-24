for i in {1..3}
do
 	filebench -f workloads/webproxy_pmem_1nt_100knf.f > results/webproxy_pmem_1nt_100knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_1nt_800knf.f > results/webproxy_pmem_1nt_800knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_1nt_8mnf.f > results/webproxy_pmem_1nt_8mnf.f_${i}.result
	filebench -f workloads/webproxy_pmem_5nt_100knf.f > results/webproxy_pmem_5nt_100knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_5nt_800knf.f > results/webproxy_pmem_5nt_800knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_5nt_8mnf.f > results/webproxy_pmem_5nt_8mnf.f_${i}.result
	filebench -f workloads/webproxy_pmem_10nt_100knf.f > results/webproxy_pmem_10nt_100knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_10nt_800knf.f > results/webproxy_pmem_10nt_800knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_10nt_8mnf.f > results/webproxy_pmem_10nt_8mnf.f_${i}.result
	filebench -f workloads/webproxy_pmem_25nt_100knf.f > results/webproxy_pmem_25nt_100knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_25nt_800knf.f > results/webproxy_pmem_25nt_800knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_25nt_8mnf.f > results/webproxy_pmem_25nt_8mnf.f_${i}.result
	filebench -f workloads/webproxy_pmem_50nt_100knf.f > results/webproxy_pmem_50nt_100knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_50nt_800knf.f > results/webproxy_pmem_50nt_800knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_50nt_8mnf.f > results/webproxy_pmem_50nt_8mnf.f_${i}.result
	filebench -f workloads/webproxy_pmem_100nt_100knf.f > results/webproxy_pmem_100nt_100knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_100nt_800knf.f > results/webproxy_pmem_100nt_800knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_100nt_8mnf.f > results/webproxy_pmem_100nt_8mnf.f_${i}.result
 done