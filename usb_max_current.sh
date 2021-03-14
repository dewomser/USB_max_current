#!/bin/bash
wert=$(lsusb -v 2>&1 | grep MaxPower | sed 's/MaxPower//;s/mA//') 
echo "$(dc <<< '[+]sa[z2!>az2!>b]sb'"${wert[*]}lbxp")" mA
