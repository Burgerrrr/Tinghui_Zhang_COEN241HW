#!/bin/bash

file-test-mode = 'rndrw rndwr seqwr'

for mode in $file-test-mode
do
	for((i = 1; i<=5; i++))
	do
		sysbench --test=fileio --file-total-size=500M prepare
		sysbench --test=fileio --file-total-size=500M --file-test-mode=$mode --max-time=30 --max-requests=0 run
		sysbench --test=fileio --file-total-size=500M cleanup
		echo 3 > /proc/sys/vm/drop_caches
	done
done
