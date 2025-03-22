#!/bin/bash

CONFIG="$HOME/.config/hypr/hyprland.conf"
INTERNAL_DISPLAY_MODEL="0xE495"        # Модель встроенного дисплея
EXTERNAL_DISPLAY_SERIAL="UHB1728007151" # Серийник конкретного внешнего дисплея

# Получаем список подключённых мониторов
CONNECTED_MONITORS=$(hyprctl monitors -j)

# Проверяем, есть ли только встроенный дисплей
ONLY_INTERNAL=$(echo "$CONNECTED_MONITORS" | jq -r 'length == 1 and .[0].model == "'"$INTERNAL_DISPLAY_MODEL"'"')

# Проверяем, подключён ли нужный внешний монитор
EXTERNAL_MONITOR=$(echo "$CONNECTED_MONITORS" | jq -r '.[] | select(.name != "eDP-1") | .serial')

if [ "$ONLY_INTERNAL" == "true" ]; then
    # Только встроенный монитор — отключаем внешние настройки
    sed -i 's|^monitor=HDMI-A-1,1920x1080@60,140x-1298,0.83333|#monitor=HDMI-A-1,1920x1080@60,140x-1298,0.83333|' "$CONFIG"
    sed -i 's|^monitor=HDMI-A-1,1920x1080@60,2560x-800,0.83333|#monitor=HDMI-A-1,1920x1080@60,2560x-800,0.83333|' "$CONFIG"
elif [ "$EXTERNAL_MONITOR" == "$EXTERNAL_DISPLAY_SERIAL" ]; then
    # Подключён нужный внешний монитор — располагаем сверху
    sed -i 's|^#monitor=HDMI-A-1,1920x1080@60,140x-1298,0.83333|monitor=HDMI-A-1,1920x1080@60,140x-1298,0.83333|' "$CONFIG"
    sed -i 's|^monitor=HDMI-A-1,1920x1080@60,2560x-800,0.83333|#monitor=HDMI-A-1,1920x1080@60,2560x-800,0.83333|' "$CONFIG"
else
    # Подключён другой внешний монитор — располагаем справа
    sed -i 's|^#monitor=HDMI-A-1,1920x1080@60,2560x-800,0.83333|monitor=HDMI-A-1,1920x1080@60,2560x-800,0.83333|' "$CONFIG"
    sed -i 's|^monitor=HDMI-A-1,1920x1080@60,140x-1298,0.83333|#monitor=HDMI-A-1,1920x1080@60,140x-1298,0.83333|' "$CONFIG"
fi

hyprctl reload
