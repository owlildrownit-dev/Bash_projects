#!/usr/bin/env bash

diskusage=$(df -h / | awk 'NR==2 {print $5}')
totalram=$(free -h | awk 'NR==2 {print $2}')
avRAM=$(free -h | awk 'NR==2 {print $7}')
timeup=$(uptime -p)

printf '========SYSTEM METRICS=========\n'
printf 'Disk Usage: %s\n' "$diskusage"
printf 'Total RAM: %s\n' "$totalram"
printf 'Available: %s\n' "$avRAM"
printf 'Uptime: %s\n' "$timeup"
printf '===============================\n'
