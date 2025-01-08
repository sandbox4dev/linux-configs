#!/bin/bash
case $1 in
    pre)
        # Действия перед гибернацией
        # move to /lib/systemd/system-sleep/manage_wifi_bt.sh
        # add rights sudo chmod +x /lib/systemd/system-sleep/manage_wifi_bt.sh 
        echo "Disabling Wi-Fi and Bluetooth..." >> /var/log/hibernate.log
        nmcli radio wifi off   # Выключаем Wi-Fi
        rfkill block bluetooth # Выключаем Bluetooth
        ;;
    post)
        # Действия после восстановления
        sleep 5
        echo "Enabling Wi-Fi and Bluetooth..." >> /var/log/hibernate.log
        nmcli radio wifi on    # Включаем Wi-Fi
        rfkill unblock bluetooth # Включаем Bluetooth
        ;;
esac
