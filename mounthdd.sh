#!/bin/bash - 
#===============================================================================
#
#          FILE: mounthdd.sh
# 
#         USAGE: ./mounthdd.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: Sunday 15 March 2015 21:34
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
IP=192.168.0.102
sudo mount -o soft,intr,rsize=8192,wsize=8192 $IP:/nfs ~/nfs/

