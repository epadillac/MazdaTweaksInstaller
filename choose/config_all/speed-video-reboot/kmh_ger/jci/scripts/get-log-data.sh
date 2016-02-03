#!/bin/sh
dbus-send --print-reply --address=unix:path=/tmp/dbus_service_socket --type=method_call --dest=com.jci.lds.data /com/jci/lds/data com.jci.lds.data.GetPosition > /tmp/root/GPS.txt
smdb-read -n vdm_vdt_current_data -e VehicleSpeed > /tmp/root/7.txt
smdb-read -n vdm -e Drv1AvlFuelE > /tmp/root/8.txt

cat /tmp/root/GPS.txt | awk 'NR==3{print $2}' > /tmp/root/1.txt
cat /tmp/root/GPS.txt | awk 'NR==4{print $2}' > /tmp/root/2.txt
cat /tmp/root/GPS.txt | awk 'NR==5{print $2}' > /tmp/root/3.txt
cat /tmp/root/GPS.txt | awk 'NR==6{print $2}' > /tmp/root/4.txt
cat /tmp/root/GPS.txt | awk 'NR==7{print $2}' > /tmp/root/5.txt
cat /tmp/root/GPS.txt | awk 'NR==8{print $2}' > /tmp/root/6.txt
cat /tmp/root/1.txt /tmp/root/2.txt /tmp/root/3.txt /tmp/root/4.txt /tmp/root/5.txt /tmp/root/6.txt /tmp/root/7.txt /tmp/root/8.txt | sed -n -e 'H;${x;s/\n/,/g;s/^,//;p;}' >> /tmp/root/DataLog.csv
