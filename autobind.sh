#!/bin/bash

#sudo usbipd -D

# Отримати вивід команди usbip list -l та вилучити лише рядки, які містять слово "busid"
busids=$(sudo usbip list -l | grep "busid")

# Вилучити лише потрібну частину busid з використанням cut
busids=$(echo "$busids" | cut -d " " -f 4)

# Вивести знайдені busid
echo "Список busid:"
echo "$busids"

# Перевірка, чи є пристрій вже прив'язаний
for busid in $busids; do
    sudo usbip bind -b $busid
    if sudo usbip list --remote=127.0.0.1 | grep -q "$busid"; then
        echo "Пристрій [$busid] прив'язаний ✓"
    fi
done

sudo usbip list --remote=127.0.0.1
