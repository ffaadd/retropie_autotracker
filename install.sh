#!/bin/bash
BSNES=1
QUSB2SNES=1
ALTTPTRACKER=1

sudo mkdir /opt/ffaadd 2>/dev/null
sudo chown pi:pi /opt/ffaadd

cd /opt/ffaadd

if [ "$PWD" != "/opt/ffaadd" ]; then	
	exit 2
fi

if [ $BSNES = 1 ]; then
	git clone https://github.com/libretro/bsnes-mercury
	cd /opt/ffaadd/bsnes-mercury/
	if [ "$PWD" != "/opt/ffaadd/bsnes-mercury" ]; then	
		exit 2
	fi
	#make

	sudo mkdir /opt/retropie/libretrocores/lr-bsnes-mercury
	sudo cp /opt/ffaadd/bsnes-mercury/bsnes_mercury_performance_libretro.so  /opt/retropie/libretrocores/lr-bsnes-mercury/bsnes_mercury_libretro_.so
	sudo patch -N /opt/retropie/configs/snes/emulators.cfg ../patchfiles/emulators.patch 
fi

if [ $QUSB2SNES = 1 ]; then
	sudo apt install qt5-qmake libqt5websockets5-dev libqt5serialport5-dev
	git clone https://github.com/Skarsnik/QUsb2snes.git
	export QT_SELECT=qt5
	cd /opt/ffaadd/QUsb2snes/
	if [ "$PWD" != "/opt/ffaadd/QUsb2snes" ]; then	
		exit 2
	fi
	git submodule init
	git submodule update
	patch -N main.cpp ../patchfiles/trust.patch
	sudo patch -N /opt/retropie/configs/all/retroarch.cfg ../patchfiles/retroarch.patch

	qmake "QUSB2SNES_NOGUI=1" CONFIG+='release'
	make
fi

if [ $ALTTPTRACKER = 1 ]; then
	git clone https://github.com/bigdunka/alttptracker.git
fi
