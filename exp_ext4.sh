for i in {1..3}
do
 	filebench -f workloads/fileserver_pmem_50nt_100knf.f > results_ext4/fileserver_pmem_50nt_100knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_50nt_800knf.f > results_ext4/fileserver_pmem_50nt_800knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_50nt_3200knf.f > results_ext4/fileserver_pmem_50nt_3200knf.f_${i}.result
	filebench -f workloads/varmail_pmem_50nt_100knf.f > results_ext4/varmail_pmem_50nt_100knf.f_${i}.result
	filebench -f workloads/varmail_pmem_50nt_800knf.f > results_ext4/varmail_pmem_50nt_800knf.f_${i}.result
	filebench -f workloads/varmail_pmem_50nt_8mnf.f > results_ext4/varmail_pmem_50nt_8mnf.f_${i}.result
	filebench -f workloads/webproxy_pmem_50nt_100knf.f > results_ext4/webproxy_pmem_50nt_100knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_50nt_800knf.f > results_ext4/webproxy_pmem_50nt_800knf.f_${i}.result
	filebench -f workloads/webproxy_pmem_50nt_8mnf.f > results_ext4/webproxy_pmem_50nt_8mnf.f_${i}.result
	filebench -f workloads/webserver_pmem_50nt_100knf.f > results_ext4/webserver_pmem_50nt_100knf.f_${i}.result
	filebench -f workloads/webserver_pmem_50nt_800knf.f > results_ext4/webserver_pmem_50nt_800knf.f_${i}.result
	filebench -f workloads/webserver_pmem_50nt_4mnf.f > results_ext4/webserver_pmem_50nt_4mnf.f_${i}.result
 done