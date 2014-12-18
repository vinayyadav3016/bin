#!/bin/bash

PROJECT=$1
AVR_PATH=/home/vinay/projects/avr-projects
mkdir -p $AVR_PATH/$PROJECT
mkdir -p $AVR_PATH/$PROJECT/bin
mkdir -p $AVR_PATH/$PROJECT/bin/cof/
mkdir -p $AVR_PATH/$PROJECT/bin/eep/
mkdir -p $AVR_PATH/$PROJECT/bin/elf/
mkdir -p $AVR_PATH/$PROJECT/bin/hex/
mkdir -p $AVR_PATH/$PROJECT/bin/lss/
mkdir -p $AVR_PATH/$PROJECT/bin/map/
mkdir -p $AVR_PATH/$PROJECT/bin/obj/
mkdir -p $AVR_PATH/$PROJECT/bin/sym/
mkdir -p $AVR_PATH/$PROJECT/include/
mkdir -p $AVR_PATH/$PROJECT/include/$1/
mkdir -p $AVR_PATH/$PROJECT/src/
cp ~/bin/Makefile_avr $AVR_PATH/$PROJECT/Makefile
