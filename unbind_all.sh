#!/bin/bash

# Отримати вивід команди usbip list -l та вилучити лише рядки, які містять слово "busid"
busids=$(sudo usbip list -l | grep "busid")

# Вилучити лише потрібну частину busid з використанням cut
busids=$(echo "$busids" | cut -d " " -f 4)

# Вивести знайдені busid
echo "Список busid:"
echo "$busids"

sudo usbip unbind -b $busids
