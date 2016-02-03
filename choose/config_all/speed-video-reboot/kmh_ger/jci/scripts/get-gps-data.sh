#!/bin/sh
dbus-send --print-reply --address=unix:path=/tmp/dbus_service_socket --type=method_call --dest=com.jci.lds.data /com/jci/lds/data com.jci.lds.data.GetPosition > /tmp/root/GPS_data

# cat /tmp/root/GPS_data | awk 'NR==3{print $2}' > /tmp/root/GPStimestamp
cat /tmp/root/GPS_data | awk 'NR==4{print $2}' > /tmp/root/GPSlatitude
cat /tmp/root/GPS_data | awk 'NR==5{print $2}' > /tmp/root/GPSlongitude
cat /tmp/root/GPS_data | awk 'NR==6{print $2}' > /tmp/root/GPSaltitude
cat /tmp/root/GPS_data | awk 'NR==7{print $2}' > /tmp/root/GPSheading
cat /tmp/root/GPS_data | awk 'NR==8{print $2}' > /tmp/root/GPSvelocity
