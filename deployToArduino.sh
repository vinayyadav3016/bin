#!/bin/bash - 
#===============================================================================
#
#		   FILE: deployToArduino.sh
# 
#		  USAGE: ./deployToArduino.sh 
# 
#	DESCRIPTION: 
# 
#		OPTIONS: 
#  REQUIREMENTS: Arduino
#		   BUGS: ---
#		  NOTES: ---
#		 AUTHOR: Vinay Yadav, 
#  ORGANIZATION: Freelancer
#		CREATED: Tuesday 23 December 2014 09:51
#	   REVISION:  ---
#===============================================================================

set -o nounset								# Treat unset variables as an error

error() {
	echo "Usage    : -f flash -p port -d device -b buadrate -u uploader -h for help"
	echo "Flash    : main.hex"
	echo "Device   : atmega328p"
	echo "Port	   : /dev/ttyACM0"
	echo "Baudrate : 115200"
	echo "Uploader : arduino(for 328p), wiring(mega2560)"
	exit $@
}

HEX_FILE=""
DEVICE=""
PORT=""
BAUDRATE=""
UPLOADER=""
TEMP=`getopt -o f:d:b:p:u:h --long flash:,device:,baudrate:,port:,uploader:  -- "$@"`
eval set -- "$TEMP"
while true
do
	case $1 in
	-f|--flash)
		#echo "Flash : $2"
		HEX_FILE=$2
		shift 2;;
	-d|--device)
		#echo "Device : $2"
		DEVICE=$2
		shift 2;;
	-p|--port)
		#echo "Port : $2"
		PORT=$2
		shift 2;;
	-b|--baudrate)
		#echo "Baudrate : $2"
		BAUDRATE=$2
		shift 2;;
	-u|--uploader)
		#echo "Uploader : $2"
		UPLOADER=$2
		shift 2;;
	--)
		shift;
		break;;
	-h)
		error 0;;
	*)
		error 0
	esac
done

if [[ -z "$HEX_FILE" ]]
then
	echo "Hex"
	error 1
fi

if [[ -z "$DEVICE" ]]
then
	echo "device"
	error 1
fi

if [[ -z "$PORT" ]]
then
	error 1
fi

if [[ -z "$BAUDRATE" ]]
then
	error 1
fi

if [[ -z "$UPLOADER" ]]
then
	error 1
fi

if [[ -c "$PORT" ]]
then
	#echo "PORT exist"
	if [[ -f "$HEX_FILE" ]]
	then
		echo "Flash    : $HEX_FILE"
		echo "Device   : $DEVICE"
		echo "Port	   : $PORT"
		echo "Baudrate : $BAUDRATE"
		echo "Uploader : $UPLOADER"
		#avrdude -C/usr/share/arduino/hardware/tools/avrdude.conf\
		#avrdude -C/usr/share/arduino/hardware/tools/avr/etc/avrdude.conf\
		avrdude -C/etc/avrdude.conf -v \
			-p$DEVICE -c$UPLOADER -P$PORT -b$BAUDRATE -D -Uflash:w:$HEX_FILE:i
	else
		echo "File $HEX_FILE do not exist"
	fi
else
	echo "Port $PORT do not Exist"
fi
