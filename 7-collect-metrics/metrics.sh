#!/bin/bash

############################################################
#
# Script to collect metrics to format prometheus
# printMetric name description type value

printMetric () {
    echo "# HELP $1 $2"
    echo "# TYPE $1 $3"
    echo "$1 $4"
}

TEMPERATURE=$(vcgencmd measure_temp | sed s/"\'C"//g | sed s/"temp="//g)
printMetric "pi_temperature" "Temperature from raspberry in celsius" "counter" $TEMPERATURE

