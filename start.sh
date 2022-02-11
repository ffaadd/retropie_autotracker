#!/bin/bash
PID1=`ps a | grep "python3 -m http.server" | grep -v grep | cut -d " " -f1`
PID2=`ps a | grep "/opt/ffaadd/QUsb2snes/QUsb2Snes" | grep -v grep | cut -d " " -f1`
echo $PID1

if [ "$PID1" != "" ]; then
	kill $PID1
fi
if [ "$PID2" != "" ]; then
	kill $PID2
fi
/opt/ffaadd/QUsb2snes/QUsb2Snes &
cd /opt/ffaadd/alttptracker
python3 -m http.server &
