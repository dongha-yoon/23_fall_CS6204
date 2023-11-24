for i in {1..10}
do
 	filebench -f workloads/fileserver_pmem_1nt_100knf.f > results/fileserver_pmem_1nt_100knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_1nt_800knf.f > results/fileserver_pmem_1nt_800knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_1nt_3200knf.f > results/fileserver_pmem_1nt_3200knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_5nt_100knf.f > results/fileserver_pmem_5nt_100knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_5nt_800knf.f > results/fileserver_pmem_5nt_800knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_5nt_3200knf.f > results/fileserver_pmem_5nt_3200knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_10nt_100knf.f > results/fileserver_pmem_10nt_100knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_10nt_800knf.f > results/fileserver_pmem_10nt_800knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_10nt_3200knf.f > results/fileserver_pmem_10nt_3200knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_25nt_100knf.f > results/fileserver_pmem_25nt_100knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_25nt_800knf.f > results/fileserver_pmem_25nt_800knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_25nt_3200knf.f > results/fileserver_pmem_25nt_3200knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_50nt_100knf.f > results/fileserver_pmem_50nt_100knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_50nt_800knf.f > results/fileserver_pmem_50nt_800knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_50nt_3200knf.f > results/fileserver_pmem_50nt_3200knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_100nt_100knf.f > results/fileserver_pmem_100nt_100knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_100nt_800knf.f > results/fileserver_pmem_100nt_800knf.f_${i}.result
	filebench -f workloads/fileserver_pmem_100nt_3200knf.f > results/fileserver_pmem_100nt_3200knf.f_${i}.result
	filebench -f workloads/varmail_pmem_1nt_100knf.f > results/varmail_pmem_1nt_100knf.f_${i}.result
	filebench -f workloads/varmail_pmem_1nt_800knf.f > results/varmail_pmem_1nt_800knf.f_${i}.result
	filebench -f workloads/varmail_pmem_1nt_8mnf.f > results/varmail_pmem_1nt_8mnf.f_${i}.result
	filebench -f workloads/varmail_pmem_5nt_100knf.f > results/varmail_pmem_5nt_100knf.f_${i}.result
	filebench -f workloads/varmail_pmem_5nt_800knf.f > results/varmail_pmem_5nt_800knf.f_${i}.result
	filebench -f workloads/varmail_pmem_5nt_8mnf.f > results/varmail_pmem_5nt_8mnf.f_${i}.result
	filebench -f workloads/varmail_pmem_10nt_100knf.f > results/varmail_pmem_10nt_100knf.f_${i}.result
	filebench -f workloads/varmail_pmem_10nt_800knf.f > results/varmail_pmem_10nt_800knf.f_${i}.result
	filebench -f workloads/varmail_pmem_10nt_8mnf.f > results/varmail_pmem_10nt_8mnf.f_${i}.result
	filebench -f workloads/varmail_pmem_25nt_100knf.f > results/varmail_pmem_25nt_100knf.f_${i}.result
	filebench -f workloads/varmail_pmem_25nt_800knf.f > results/varmail_pmem_25nt_800knf.f_${i}.result
	filebench -f workloads/varmail_pmem_25nt_8mnf.f > results/varmail_pmem_25nt_8mnf.f_${i}.result
	filebench -f workloads/varmail_pmem_50nt_100knf.f > results/varmail_pmem_50nt_100knf.f_${i}.result
	filebench -f workloads/varmail_pmem_50nt_800knf.f > results/varmail_pmem_50nt_800knf.f_${i}.result
	filebench -f workloads/varmail_pmem_50nt_8mnf.f > results/varmail_pmem_50nt_8mnf.f_${i}.result
	filebench -f workloads/varmail_pmem_100nt_100knf.f > results/varmail_pmem_100nt_100knf.f_${i}.result
	filebench -f workloads/varmail_pmem_100nt_800knf.f > results/varmail_pmem_100nt_800knf.f_${i}.result
	filebench -f workloads/varmail_pmem_100nt_8mnf.f > results/varmail_pmem_100nt_8mnf.f_${i}.result
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
	filebench -f workloads/webserver_pmem_1nt_100knf.f > results/webserver_pmem_1nt_100knf.f_${i}.result
	filebench -f workloads/webserver_pmem_1nt_800knf.f > results/webserver_pmem_1nt_800knf.f_${i}.result
	filebench -f workloads/webserver_pmem_1nt_4mnf.f > results/webserver_pmem_1nt_4mnf.f_${i}.result
	filebench -f workloads/webserver_pmem_5nt_100knf.f > results/webserver_pmem_5nt_100knf.f_${i}.result
	filebench -f workloads/webserver_pmem_5nt_800knf.f > results/webserver_pmem_5nt_800knf.f_${i}.result
	filebench -f workloads/webserver_pmem_5nt_4mnf.f > results/webserver_pmem_5nt_4mnf.f_${i}.result
	filebench -f workloads/webserver_pmem_10nt_100knf.f > results/webserver_pmem_10nt_100knf.f_${i}.result
	filebench -f workloads/webserver_pmem_10nt_800knf.f > results/webserver_pmem_10nt_800knf.f_${i}.result
	filebench -f workloads/webserver_pmem_10nt_4mnf.f > results/webserver_pmem_10nt_4mnf.f_${i}.result
	filebench -f workloads/webserver_pmem_25nt_100knf.f > results/webserver_pmem_25nt_100knf.f_${i}.result
	filebench -f workloads/webserver_pmem_25nt_800knf.f > results/webserver_pmem_25nt_800knf.f_${i}.result
	filebench -f workloads/webserver_pmem_25nt_4mnf.f > results/webserver_pmem_25nt_4mnf.f_${i}.result
	filebench -f workloads/webserver_pmem_50nt_100knf.f > results/webserver_pmem_50nt_100knf.f_${i}.result
	filebench -f workloads/webserver_pmem_50nt_800knf.f > results/webserver_pmem_50nt_800knf.f_${i}.result
	filebench -f workloads/webserver_pmem_50nt_4mnf.f > results/webserver_pmem_50nt_4mnf.f_${i}.result
	filebench -f workloads/webserver_pmem_100nt_100knf.f > results/webserver_pmem_100nt_100knf.f_${i}.result
	filebench -f workloads/webserver_pmem_100nt_800knf.f > results/webserver_pmem_100nt_800knf.f_${i}.result
	filebench -f workloads/webserver_pmem_100nt_4mnf.f > results/webserver_pmem_100nt_4mnf.f_${i}.result
 done


 sudo fio --name=write_throughput --directory=/mnt/fio --numjobs=16 \
--size=10G --time_based --runtime=60s --ramp_time=2s --ioengine=libaio \
--direct=1 --verify=0 --bs=1M --iodepth=64 --rw=write \
--group_reporting=1 --iodepth_batch_submit=64 \
--iodepth_batch_complete_max=64