sudo systemctl stop dnsmasq &&
sudo systemctl disable dnsmasq &&
sudo service isc-dhcp-server restart &&
sudo ifconfig eth0 192.168.9.1 &&
sudo ifconfig eth0 netmask 255.255.255.0 &&
sudo ifconfig eth0 up
