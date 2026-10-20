#!/usr/bin/env bash

read -r -p "Как тебя зовут?" name
read -r -p "Какую технологию ты изучаешь?" tech

printf 'Привет,%s\n' "$name"
printf 'Ого, ты изучаешь %s\n' "$tech"
