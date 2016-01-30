#!/bin/bash - 
#===============================================================================
#
#          FILE: restart_wifi.sh
# 
#         USAGE: ./restart_wifi.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 12/16/2015 09:31
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

sudo rmmod iwlmvm iwlwifi 
sudo modprobe iwlwifi 11n disable=1
