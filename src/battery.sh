#!/bin/bash

# Contain every function taht return information related to the battery or screen backlight

# Return brightness level of the screen
get_brightness() {
  max_br=$(cat /sys/class/backlight/*/max_brightness)
  br=$(cat /sys/class/backlight/*/brightness)
  percentage=$(echo "scale=3; $br/$max_br" | bc)
  percentage=$(echo "($percentage*100)/1" | bc)
  echo $percentage
}

# Return the actual powerprofile of tlp
# by reading the bus property.
get_tlp_powerprofile() {
  mode=$(busctl get-property \
    org.freedesktop.UPower.PowerProfiles \
    /org/freedesktop/UPower/PowerProfiles \
    org.freedesktop.UPower.PowerProfiles \
    ActiveProfile)
  echo ${mode:3: -1} 
}

