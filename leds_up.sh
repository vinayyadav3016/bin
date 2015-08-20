#!/bin/bash - 
#===============================================================================
#
#          FILE: leds_up.sh
# 
#         USAGE: ./leds_up.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 07/31/2015 18:06
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
#!/bin/bash
brightness=$(cat "/sys/class/leds/asus::kbd_backlight/brightness")
a=$((brightness+1))

if [ "$brightness" -lt 3 ]
then
  echo $a >> /sys/class/leds/asus\:\:kbd_backlight/brightness
fi

