#!/bin/bash - 
#===============================================================================
#
#		   FILE: genCMake.sh
# 
#		  USAGE: ./genCMake.sh 
# 
#	DESCRIPTION: 
# 
#		OPTIONS: ---
#  REQUIREMENTS: ---
#		   BUGS: ---
#		  NOTES: ---
#		 AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#		CREATED: Sunday 21 December 2014 20:30
#	   REVISION:  ---
#===============================================================================

set -o nounset								# Treat unset variables as an error

mkdir -p build
cd build
str=""
case $1 in
	avr)
		str="-DCMAKE_TOOLCHAIN_FILE=~/cmakefiles/avr-toolchain.cmake"
		mkdir -p ../bin/eep
		mkdir -p ../bin/elf
		mkdir -p ../bin/hex
		mkdir -p ../bin/map
		cmake "${str}" $@
		make
		shift
		;;
	arm)
		str="-DCMAKE_TOOLCHAIN_FILE=~/cmakefiles/arm-toolchain.cmake"
		#source ${PROJECTS}/ros-projects-arm/env-arm-ros.sh
		cmake "${str}" $@
		#make
		shift
		;;
	pc)
		cmake $@
		make
		;;
	*)
		echo "Error please give a platform to build tool"
		;;
esac
cd ..
