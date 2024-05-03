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
