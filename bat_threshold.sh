#!/bin/bash

LIMITS=(60 80 100)
CURRENT=$(bat threshold | grep -o '[0-9]\+')

# Определяем следующий предел
NEXT_LIMIT=${LIMITS[0]}
for i in "${!LIMITS[@]}"; do
    if [[ ${LIMITS[$i]} -gt $CURRENT ]]; then
        NEXT_LIMIT=${LIMITS[$i]}
        break
    fi
done

# Устанавливаем новый предел заряда
sudo bat threshold $NEXT_LIMIT
sudo bat persist
notify-send "Предел заряда установлен" "Новый предел: $NEXT_LIMIT%"
pkill -RTMIN+10 waybar