## setup.sh

sudo apt-get update -y && sudo apt-get upgrade -y &&
sudo apt install mc -y &&
sudo apt install screen && 
sudo apt install linux-tools-generic -y &&
sudo apt install linux-tools-6.5.0-1005-raspi -y &&
sudo apt install linux-tools-raspi -y &&
sudo modprobe usbip-core &&
sudo modprobe usbip-host &&
sudo modprobe vhci-hcd

y1:~$ source setup.sh
y1:~$ sudo nano /etc/modules-load.d/modules.conf

usbip-core
usbip-host
vhci-hcd

## autobind.sh

#!/bin/bash
sudo usbipd -D
містять слово "busid"
busids=$(sudo usbip list -l | grep "busid")
busids=$(echo "$busids" | cut -d " " -f 4)
echo "Список busid:"
echo "$busids"
sudo usbip bind -b $busids
sudo usbip list --remote=127.0.0.1

## unbind_all.sh

#!/bin/bash

# Отримати вивід команди usbip list -l та вилучити лише рядки, які містять слово "busid"
busids=$(sudo usbip list -l | grep "busid")

# Вилучити лише потрібну частину busid з використанням cut
busids=$(echo "$busids" | cut -d " " -f 4)

# Вивести знайдені busid
echo "Список busid:"
echo "$busids"

sudo usbip unbind -b $busids

--------------------------------------------------------------
screen

Дивитись вікна:
 screen -ls
Детач вікна: 
Ctrl + a + d
Rename вікна: 
screen -S [screen_id] -X sessionname new_session_name
Видалити вікно:
screen -X -S [screen_id] quit
