#!/bin/bash - 
#===============================================================================
#
#          FILE: leds_down.sh
# 
#         USAGE: ./leds_down.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 07/31/2015 18:05
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
#!/bin/bash
brightness=$(cat "/sys/class/leds/asus::kbd_backlight/brightness")
a=$((brightness-1))

if [ "$brightness" -gt 0 ]
then
  echo $a >> /sys/class/leds/asus\:\:kbd_backlight/brightness
fi

