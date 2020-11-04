#!/bin/bash
# here the battery capacity /sys/class/power_supply/BAT0/capacity

export XDG_RUNTIME_DIR="/run/user/1000"
export DISPLAY=:0

BAT=$(/usr/bin/cat /sys/class/power_supply/BAT0/capacity)
STAT=$(/usr/bin/cat /sys/class/power_supply/BAT0/status)

if [ $BAT -lt 15 ] && [ $STAT == "Discharging" ] 
then
    /usr/bin/notify-send -t 2 "Battery low!!"
    /usr/bin/aplay /home/necros/scripts/crons/batteryStatusKeyboard/anyonethere.wav >> /dev/null 2>&1
fi

if [ $BAT -lt 10 ] && [ $STAT == "Discharging" ]
then
    /usr/bin/notify-send -t 2 "Battery really low!!"
    /usr/bin/aplay /home/necros/scripts/crons/batteryStatusKeyboard/hello.wav >> /dev/null 2>&1
fi

if [ $BAT -lt 5 ] && [ $STAT == "Discharging" ]
then
    /usr/bin/notify-send "Suspending!!"
    /usr/bin/systemctl suspend
    /usr/bin/aplay /home/necros/scripts/crons/batteryStatusKeyboard/shutdown.wav >> /dev/null 2>&1
fi
