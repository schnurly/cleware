#!/bin/bash

# written by lars falk-petersen, dev@falk-petersen.no

#clewarecontrol device id (this should be moved to separate config file)
ID=7778

case $1 in
   config)
        cat <<'EOM'
graph_title Temperature And Humidity
graph_vlabel C / %
graph_category sensors
temp.label Temperature
hum.label Humidity
graph_order temp hum
graph_args --base 1000

EOM
        exit 0;;
esac

clewarecontrol -ag > /dev/null 2>&1

echo -n "temp.value "
clewarecontrol -d $ID -b -rt

echo -n "hum.value "
clewarecontrol -d $ID -b -rh

