#!/usr/bin/env bash

read -r -p "Введи первое число " x
read -r -p "Введи второе число " y

sum=$((x + y))
minus=$((x - y))
proizv=$((x * y))

if [[ $y -eq 0 ]]; then
    printf "Операция невозможна, на ноль делить нельзя!%s\n"
else
    ost=$((x % y))
    division=$((x / y))
    
    printf 'Целая часть от деления %s\n' "$division"
    printf 'Остаток от деления %s\n' "$ost"
fi

printf 'Сумма %s\n' "$sum"
printf 'Разность %s\n' "$minus"
printf 'Произведение %s\n' "$proizv"

