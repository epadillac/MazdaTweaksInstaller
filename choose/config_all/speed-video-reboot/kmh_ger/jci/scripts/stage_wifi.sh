#!/bin/sh

# v3.2
# Removed requirement for rw, MLA 20151203
# mount -o rw,remount /

# Added additional parameters for display
watch -n 1 /jci/scripts/get-vehicle-speed.sh &
watch -n 5 /jci/scripts/get-vehicle-data-other.sh &
watch -n 1 /jci/scripts/get-gps-data.sh &

# Need to set defaults for options
cp /jci/gui/addon-player/myVideoList /tmp/root
cp /jci/gui/addon-player/playbackAction /tmp/root
cp /jci/gui/addon-player/playbackOption /tmp/root
cp /jci/gui/addon-player/playbackStatus /tmp/root
chmod 666 /tmp/root/playback*
chmod 666 /tmp/root/myVideoList

# Video player action watch
watch -n 1 /jci/gui/addon-player/playback-action.sh &

# Log data collection
# If you want to log collected data then remove the comment '#' on the "watch ..." line below. Data is collected in the 
# file '/tmp/root/DataLog.csv' every five seconds. All data and files in this directory are cleared out on shutdown of the 
# CMU so you must collect it via SSH while car is still running or use a data collection script to save it to a flash 
# drive before turning off the car. 
# File layout is as follows: GPS Timestamp, Lat, Lon, Elev. Meter, Heading, Velocity, Speed, MPG

# To convert the GPS Timestamp to local time in Excel use the following function where the GPS Timestamp is in cell B1 and 
# the local Time Zone value is substituted for 'TimeZone' in the formula and the formula cell is formated as date/time.
# '=(B1/86400)+(DATEVALUE("1/1/1970")-(3600*TimeZone)/86400)'
# 

#watch -n 5 /jci/scripts/get-log-data.sh &
