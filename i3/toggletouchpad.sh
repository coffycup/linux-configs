#!/bin/bash

device="DELL073C:00 06CB:7E7E Touchpad"
state=`xinput list-props "$device"|grep 'Device Enabled'|awk '{print $4}'`

if [ $state -eq 1 ]
then
    xinput disable "$device"
else
    xinput enable "$device"
fi
