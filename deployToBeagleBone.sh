#!/bin/bash - 
#===============================================================================
#
#          FILE: deplyToBeagleBone.sh
# 
#         USAGE: ./deplyToBeagleBone.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: 
#  REQUIREMENTS: indido-arm
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Vinay Yadav, 
#  ORGANIZATION: Freelancer
#       CREATED: Tuesday 23 December 2014 09:51
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
## user at beaglebone
UNAME=robot
## ip of beaglebone
REMOTE=192.168.7.2
## ros project directory
REMOTE_DIR="/home/robot/projects/ros-projects-arm/"
## Here libs will be put
LIB_DIR="/home/robot/libs/"
## file sendor
BIN=rsync
## optargs
TEMP=`getopt -o hblmre::p: --long binaries,libs,manifest,roslaunch,extra::,project:,  -- "$@"`
eval set -- "$TEMP"
## default settings
B=0;L=0;M=0;R=0;E=0
while true
do
  case $1 in
    -b|--binaries)
      #echo "Deploying Binaries."
      B=1
      shift;;
    -l|--libs)
      #echo "Libraries deployed" 
      L=1
      shift;;
    -m|--manifest)
      #echo "manifest deployed"
      M=1
      shift;;
    -r|--raslaunch)
      #echo "roslaunch file deployed"
      R=1
      shift;;
    -e|--extra)
      #echo "Extra are deployed : ${2}"
      E=1
      shift 2;;
    -p|--project)
      #echo "Deploying Project : ${2}"
      PROJECT=$2
      source /opt/ros/indigo-arm/env-arm-ros.sh
      HOST_DIR=`rospack find $2`
      shift 2;;
    --)
      shift; break;;
    *)
      echo "-b to send binary"
      echo "-m to send manifest file"
      echo "-l to send libs"
      echo "-p project name to be deployed : required"
      echo "-e deploy some extra file"
      exit 0
  esac
done
if [[ -d "$HOST_DIR" ]]
then
  echo "Deploying project : $PROJECT"
  REMOTE_DIR=${REMOTE_DIR}/$(echo ${HOST_DIR} | cut -d/ -f6- )
  if [[ "$M" = 1 ]];
  then
    echo "Deploying manifest file."
    if [[ -f "$HOST_DIR/manifest.xml" ]]
    then
      $BIN $HOST_DIR/manifest.xml $UNAME@$REMOTE:$REMOTE_DIR/
    fi
  fi
  if [[ "$B" = 1 ]];
  then
    echo "Deploying Binaries."
    if [[ $(ls "$HOST_DIR/bin/") ]]
    then
      $BIN $HOST_DIR/bin/* $UNAME@$REMOTE:$REMOTE_DIR/bin/
    fi
  fi
  if [[ "$L" = 1 ]];
  then
    echo "Libraries deployed"
    if [[ $(ls "$HOST_DIR/lib/") ]]
    then
      $BIN $HOST_DIR/lib/* $UNAME@$REMOTE:$LIB_DIR/
    fi
  fi
  if [[ "$R" = 1 ]];
  then
    echo "roslaunch file deployed"
    if [[ -f "$HOST_DIR/roslaunch/*" ]]
    then
      $BIN $HOST_DIR/roslaunch/* $UNAME@$REMOTE:$REMOTE_DIR/roslaunch/
    fi
  fi
  if [[ "$E" = 1 ]];
  then
    echo "some extra file"
  fi
else
  echo "Project name $REMOTE_DIR not found"
  exit 0;
fi
