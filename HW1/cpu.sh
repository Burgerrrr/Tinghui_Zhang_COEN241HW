#!/bin/bash
primes='10000 20000 50000'


for prime in $primes;
do
	for((i  =0; i < 5; i++))
	do
		sysbench --test=cpu --cpu-max-prime=$prime run
		echo 3 > /proc/sys/vm/drop_caches
	done
done
