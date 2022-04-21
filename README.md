bootstrapin arduino-cli & digispark setup to quickly turn your attiny85 into a 2$ rubber ducky

`arduino-cli` is installed with `curl` so be sure to have `curl` installed on your machine, otherwise: `sudo apt install curl`

# Usage

* buy a digispark attiny85 microcontroller [here](https://fr.aliexpress.com/item/2052244399.html) or somewhere else
* run `setup.sh` in the repo, basically it:
  * installs `arduino-cli`
  * set specific udev permissions in order to program the attiny85 microcontroller
  * installs specific depedencies so that `arduino-cli` can program the attiny85 microcontroller

Once your setup is done, edit your .ino project located in project/ and compile it as follow:

`arduino-cli compile --fqbn digistump:avr:digispark-tiny project/`

then upload it on your board:

`arduino-cli upload --fqbn digistump:avr:digispark-tiny -p /dev/ttyACM0 project`

NB: make sure that your project.ino is inside a folder of the same name (here `project`). Won't work otherwise.

You'll then have 60 seconds to plug in your USB attiny85 to upload the payload on it.

# 3D printing a case

The repo contains 3D models (in `models/`) to 3D print a case to make it look like an USB key.

A `.blend` to modify it with blender.

A `.cbddlp` in case you have an elegoo mars 3d printer.

# Motivations

The [official documentation](https://digistump.com/wiki/digispark) doesn't provide a simple bash script to automate everything, so here it is. I was just fed up with clicking everywhere in the GUI to configure my computer & flash the device.

If it doesn't work goto [troubleshooting](https://digistump.com/wiki/digispark/tutorials/linuxtroubleshooting) :)

& thx to https://github.com/ArminJo/DigistumpArduino/ for the `package_digistump_index.json`