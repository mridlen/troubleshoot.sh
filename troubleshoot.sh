#!/bin/bash

# This is a script that will troubleshoot the server in the background

while [ true ]
do
    # sub process: stats
    (
        curl -s localhost | grep "<address>" > curlout.txt
        echo "$(date) Load: $(cat /proc/loadavg) Disk: $(df -P | grep dev/mapper) $(top -bn1 | grep Cpu) Web: $(cat curlout.txt | wc -l | if grep -q 1; then echo "UP"; else echo "DOWN"; fi)" >> troubleshoot.log
    )

    # sub process: large files
    (
        date >> large_files.log
        find / -xdev -type f -size +1000M -exec ls -al --block-size=M {} \; >> large_files.log
    )

    # sub process: high CPU processes
    (
         date >> high_cpu.log
         ps aux --sort=-pcpu | head -n 11 >> high_cpu.log
    )
    sleep 10
done
