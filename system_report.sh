#!/usr/bin/env bash

printf "LINUX SYSTEM REPORT\n"

curdate=$(date)
timeup=$(uptime -p)
infd=$(df -h /)
infOZU=$(free -h)

printf 'Текущая дата и время: %s\n' "$curdate"
printf '\n'
printf 'Время работы системы: %s\n' "$timeup"
printf '\n'
printf 'Информация о диске: %s\n' "$infd"
printf '\n'
printf 'Информация об оперативной памяти: %s\n' "$infOZU"