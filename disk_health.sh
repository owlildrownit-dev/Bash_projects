#!/usr/bin/env bash

printf '=================\n'

#usage="95%"
exit_code=0
usage=$(df -h / |awk 'NR==2 {print $5}')
number=${usage%\%}
file="/home/daniil/devops/Projects/bash_study/disk_health.sh"
printf '%s\n' "$number"

if [[ ! -f "$file" ]]; then
    printf 'ERROR: File does not exist!\n'
    exit_code=4
elif [[ "$number" -lt 0 || "$number" -gt 100 ]]; then
    printf 'ERROR: Invalid value!\n'
    exit_code=3
elif [[ "$number" -ge 90 ]]; then
    printf 'Status: CRITICAL\n'
    printf 'Осторожно, на диске слишком мало места!\n'
    exit_code=2
elif [[ "$number" -lt 75 ]]; then
    printf 'Status: OK\n'
    printf 'На диске достаточно места!\n'
    exit_code=0
elif [[ "$number" -ge 75 && "$number" -le 89 ]]; then
    printf 'Status: WARNING\n'
    printf 'Будьте внимательны, на диске скоро закончится свободное пространство!\n'
    exit_code=1
else
    printf 'Status: OK\n'
    printf 'На диске достаточно места!\n'
    printf 'File exists: %s\n' "$file"
fi

printf '=================\n' 
exit "$exit_code"
