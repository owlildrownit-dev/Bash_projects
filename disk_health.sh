#!/usr/bin/env bash

# Тестовые переменные
#usage="75%"
#usage="85%"
#usage="95%"
#usage="65%"

# Переменные
usage=$(df -h / |awk 'NR==2 {print $5}')
number=${usage%\%}
file="/home/daniil/devops/Projects/bash_study/disk_health.sh"
warning=${1:-75}
critical=${2:-90}
exit_code=0

#Начало скрипта
printf '=================\n'
printf 'Disk Usage: %s\n' "$usage"

if [[ ! -f "$file" ]]; then
    printf 'ERROR: File does not exist!\n'
    exit_code=4
elif [[ $# -gt 2 || $# -eq 1 ]]; then
    printf 'ERRROR: Invalid number of arguments!\n'
    exit_code=3
elif [[ "$number" -lt 0 || "$number" -gt 100 ]]; then
    printf 'ERROR: Invalid value!\n'
    exit_code=3
elif [[ "$number" -ge $critical ]]; then
    printf 'Status: CRITICAL\n'
    printf 'Осторожно, на диске слишком мало места!\n'
    exit_code=2
elif [[ "$number" -lt $warning ]]; then
    printf 'Status: OK\n'
    printf 'На диске достаточно места!\n'
    exit_code=0
elif [[ "$number" -ge $warning && "$number" -lt $critical ]]; then
    printf 'Status: WARNING\n'
    printf 'Будьте внимательны, на диске скоро закончится свободное пространство!\n'
    exit_code=1
else
    printf 'Status: OK\n'
    printf 'На диске достаточно места!\n'
fi

printf '=================\n' 
exit "$exit_code"
