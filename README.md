# troubleshoot.sh
A daemon like resource diagnostic tool designed for change controlled environments

Usage:

Run these commands:
chmod 700 troubleshoot.sh
nohup ./troubleshoot.sh &

Now the process is daemonized.

 tail -f troubleshoot.log
 tail -f large_files.log
 tail -f high_cpu.log
