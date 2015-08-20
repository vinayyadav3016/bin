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
brightness=$(cat "/sys/class/backlight/intel_backlight/brightness")
a=$((brightness-5))

if [ "$brightness" -gt 1 ]
then
  echo $a >> /sys/class/backlight/intel_backlight/brightness
fi

