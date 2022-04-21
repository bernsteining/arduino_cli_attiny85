#!/bin/bash

# check if arduino-cli is downloaded, if not download it
if ! command -v arduino-cli;
  then
  echo "arduino-cli is not installed or wasn't found."
  echo "Installing arduino-cli in ~/.arduino15/"
  cd ~
  curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
  export PATH=$PATH:~/bin
  arduino-cli config init
else
	echo "arduino-cli is already installed, continuing."
fi

# check if udev rules exists, else ask for permission to add them
udev_rules_file=/etc/udev/rules.d/49-micronucleus.rules

echo "Looking for necessary udev rules in $udev_rules_file..."

# add os detection and add rules (todo handle arch linux)
if [ ! -f $udev_rules_file ]; then
	echo "sudo privileges are needed to create udev rules in $udev_rules_file, add the following rules in $udev_rules_file with privileges like that, or simply run udev_rules.sh with sudo:"
	cat udev_rules.sh
	exit
fi

echo "$udev_rules_file exists, continuing"

arduino-cli config init

# check if board exists in arduino-cli's config, otherwise insert it
if grep -q  digistump ~/.arduino15/arduino-cli.yaml; then
        echo 'Board is already installed in config file.'
else
        sed -i "s,\[],['https://raw.githubusercontent.com/bernsteining/arduino_cli_attiny85/main/package_digistump_index.json']," ~/.arduino15/arduino-cli.yaml
        arduino-cli core update-index
        arduino-cli core install digistump:avr
fi
