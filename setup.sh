sudo apt-get update -y && sudo apt-get upgrade -y &&
sudo apt install mc -y &&
sudo apt install net-tools -y &&
sudo apt install linux-tools-generic -y &&
sudo apt install linux-tools-$(uname -r) -y &&
sudo apt install linux-tools-raspi -y &&
sudo modprobe usbip-core &&
sudo modprobe usbip-host &&
sudo modprobe vhci-hcd
