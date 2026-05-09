#!/bin/bash
echo ""
echo -e "\e[1;4m ## Maximal current allowed from all USB Devices"
zaehl=$(lsusb -s 001|wc -l)
for (( i=1; i <= zaehl; i++ ))
do
  wert=$(lsusb -v -s "$i": 2>&1 | grep MaxPower | sed 's/MaxPower//;s/mA//')
  total=$(echo "$wert" | awk '{sum+=$1} END {print sum}')
  echo -e "\e[0m Bus $i $total mA"
done
echo "---------------------------"
wert=$(lsusb -v 2>&1 | grep MaxPower | sed 's/MaxPower//;s/mA//')
total=$(echo "$wert" | awk '{sum+=$1} END {print sum}')
echo "Bus ∑ $total mA"
echo ""
echo -e "\e[1;4m ## All USB devices, maximal current"
wert=$(lsusb -v 2>&1 | grep '\(id[PV]\|MaxPower\)' | sed 's/idProduct// ; s/idVendor//' | sed 's/^[ \t]*// ; s/0x[A-Za-z0-9]*//' | sed 's/mA/mA\n/' | sed 's/^[[:blank:]]*$/ not defined/')
echo -e "\e[0m $wert"
echo ""
