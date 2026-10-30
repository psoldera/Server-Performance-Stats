#!/bin/bash

echo "----------------------------------------------------------------"
figlet "server-status"
echo "----------------------------------------------------------------"
top -bn1 | grep "%Cpu" | awk '{print "Total CPU Usage: " $2"%"}'
free -g | awk '/Mem/ {printf "Memory Free (GB):  " $4 "\nMemory Usage (GB): " $3 "\nMemory Usage (%): %.1f%%\n", $3/$2*100}'
df -BG --total | awk '/total/ {printf "Disk Usage (GB): %s\nDisk Free (GB): %s\nDisk Usage (%%): %s\n", $3, $4, $5}'
echo "Top 5 processes by CPU usage: $(ps -eo comm --sort=-%cpu --no-headers | head -n 5 | xargs)"
echo "Top 5 processes by Memory usage: $(ps -eo comm --sort=-%mem --no-headers | head -n 5 | xargs)"
