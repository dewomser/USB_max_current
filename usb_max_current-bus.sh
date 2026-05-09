#!/bin/bash
zaehl=$(lsusb -s 001|wc -l)
#echo $zaehl
for (( i=1; i <= zaehl; i++ ))
do
  wert=$(lsusb -v -s $i: 2>&1 | grep MaxPower | sed 's/MaxPower//;s/mA//' | tr -d ' ')
  total=$(echo "$wert" | awk '{sum+=$1} END {print sum}')
  echo "Bus $i $total mA"
done
