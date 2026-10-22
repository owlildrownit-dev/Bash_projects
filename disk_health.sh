#!/usr/bin/env bash

printf '=================\n'

#usage="74%"
usage=$(df -h / |awk 'NR==2 {print $5}')
number=${usage%\%}
printf '%s\n' "$number"

if [[ "$number" -ge 90 ]]; then
    printf 'Status: CRITICAL\n'
    printf 'Осторожно, на диске слишком мало места!\n'
elif [[ "$number" -lt 75 ]]; then
    printf 'Status: OK\n'
    printf 'На диске достаточно места!\n'
elif [[ "$number" -ge 75 ]]&& [[ "$number" -le 89 ]]; then
    printf 'Status: WARNING\n'
    printf 'Будьте внимательны, на диске скоро закончится свободное пространство!\n'
else
    printf 'Status: OK\n'
    printf 'На диске достаточно места!\n'
fi

printf '=================\n'