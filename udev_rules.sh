echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"16d0\", ATTRS{idProduct}==\"0753\", MODE:=\"0666\"" > /etc/udev/rules.d/49-micronucleus.rules
echo "KERNEL==\"ttyACM*\", ATTRS{idVendor}==\"16d0\", ATTRS{idProduct}==\"0753\", MODE:=\"0666\", ENV{ID_MM_DEVICE_IGNORE}=\"1\"" >> /etc/udev/rules.d/49-micronucleus.rules
