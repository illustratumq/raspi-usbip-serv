## Systemct

#### [ Warning ]: edit path /home/USER/raspi-usbip-serv/ in both files.

```
sudo mv /home/name/raspi-usbip-serv/autobind.service /etc/systemd/system/autobind.service &&
```
```
sudo mv /home/name/raspi-usbip-serv/autoserver.service /etc/systemd/system/autoserver.service &&
```
```
chmod +x /home/user/raspi-usbip-serv/server.sh && chmod +x /home/user/raspi-usbip-serv/autobind.sh &&
```
```
sudo systemctl enable server.service && sudo systemctl enable autobind.service
```

## setup.sh
To install all libs:
```
source setup.sh
```
then, you need open the file:
```sudo nano /etc/modules-load.d/modules.conf```
and write:
```
usbip-core
usbip-host
vhci-hcd
```

## autobind.sh
To bind all usb devises one's:
```
source autobind.sh
```
or automaticaly
```
watch -n 1 /home/yourlocalname/path_to_this_folder/autobind.sh
```

## unbind_all.sh
To unbind all usb devises:
```
source unbind_all.sh
```

## How to work with screen
First, you need write the `screen` and enter 'Esc' or 'Space'.
Use this command to manage screen's:

- `screen -ls` look up for current screen's
- `Ctrl + a + d` dettach window 
- `screen -S [screen_id] -X sessionname new_session_name` rename screen
- `screen -X -S [screen_id] quit` delete screen

## Raspi localhost
First, you need:
```
sudo apt install isc-dhcp-server -y && sudo apt install dnsmasq
```
Then, move dhcpd.conf file:
```
sudo mv /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.backup
```
Open one
```
sudo nano /etc/dhcp/dhcpd.conf
```
And write next options:
```
subnet 192.168.9.0 netmask 255.255.255.0 {
  range 192.168.9.50 192.168.9.100;
  option routers 192.168.9.1;
  option subnet-mask 255.255.255.0;
  option domain-name-servers 8.8.8.8, 8.8.4.4;
  option broadcast-address 192.168.9.255;
  default-lease-time 600;
  max-lease-time 7200;
}
```
Edit isc-dhcp-server:
```
sudo nano /etc/default/isc-dhcp-server
```
write:
```
INTERFACESv4="eth0"
```

```
sudo systemctl stop dnsmasq &&
sudo systemctl disable dnsmasq &&
sudo service isc-dhcp-server restart &&
sudo ifconfig eth0 192.168.9.1 &&
sudo ifconfig eth0 netmask 255.255.255.0 &&
sudo ifconfig eth0 up
```


