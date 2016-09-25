#!/bin/bash
zaehl=$(lsusb -s 001|wc -l)
for (( i=1; i <= $zaehl; i++ ))
do
wert=$(lsusb -v -s $i: 2>&1 | grep MaxPower | sed 's/MaxPower//;s/mA//') 
echo Bus $i $(dc <<< '[+]sa[z2!>az2!>b]sb'"${wert[*]}lbxp") mA 
done
