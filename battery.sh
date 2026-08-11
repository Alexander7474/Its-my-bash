#!/bin/bash

battery() {
  max_br=$(cat /sys/class/backlight/*/max_brightness)
  br=$(cat /sys/class/backlight/*/brightness)
  percentage=$(echo "scale=3; $br/$max_br" | bc)
  percentage=$(echo "($percentage*100)/1" | bc)
  echo $percentage
}

powerprofile() {
  mode=$(busctl get-property \
    org.freedesktop.UPower.PowerProfiles \
    /org/freedesktop/UPower/PowerProfiles \
    org.freedesktop.UPower.PowerProfiles \
    ActiveProfile)
  echo ${mode:3: -1} 
}

