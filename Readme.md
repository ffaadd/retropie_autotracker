# A Link to the Past Randomizer Retropie Autotracker Setup

To use an autotracker you have to install serval things and make some configuration changes on your retropie. This repository includes an `install.sh` which 
downloads the software, installs it and apply patches where needed. The `start.sh` will automatically be run on startup to spin up Qusb2snes and a webserver to serve the tracker.

Clone this Repository on your retropie and run `install.sh`

The autotracker is accessible on `http://retropie:8000` within your home network after the installation an reboot.
