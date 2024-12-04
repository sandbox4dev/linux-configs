#!/bin/bash

# Каталог с обоями
directory=~/Pictures/wallpapers

# Ждем пока монитор загрузится по пол секунды
until hyprctl monitors | grep -q "Monitor"; do
    sleep 0.5
done

# Получаем список всех мониторов
monitors=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

# Проверяем, существует ли каталог
if [ -d "$directory" ]; then
    # Выбираем случайное изображение (поддержка JPG и PNG)
    random_background=$(find "$directory" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

    # Проверяем, найдено ли изображение
    if [ -n "$random_background" ]; then
        echo "Устанавливаем обои: $random_background"
        
        # Устанавливаем обои для каждого монитора
        hyprctl hyprpaper unload all
        
        for monitor in $monitors; do
            echo "Применяем обои для монитора: $monitor"
            hyprctl hyprpaper preload "$random_background"
            hyprctl hyprpaper wallpaper "$monitor,$random_background"
        done

        echo "Обои успешно установлены."
    else
        echo "No valid images found in $directory"
    fi
else
    echo "Directory $directory does not exist"
fi