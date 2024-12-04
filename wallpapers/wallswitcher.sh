#!/bin/bash

# Каталог с обоями
directory=~/pictures/wallpapers
# Получаем имя монитора
monitor=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

# Проверяем, существует ли каталог
if [ -d "$directory" ]; then
    # Выбираем случайное изображение (поддержка JPG и PNG)
    random_background=$(find "$directory" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

    # Проверяем, найдено ли изображение
    if [ -n "$random_background" ]; then
        # Устанавливаем обои
        hyprctl hyprpaper unload all
        hyprctl hyprpaper preload "$random_background"
        hyprctl hyprpaper wallpaper "$monitor,$random_background"
    else
        echo "No valid images found in $directory"
    fi
else
    echo "Directory $directory does not exist"
fi