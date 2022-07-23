#!/bin/bash

# First thing to check is that we have the right encoding. 
# iconv -f iso-8859-1 -t UTF-8//TRANSLIT tabla_totales2019.csv -o outt8.csv
# awk -F"," '{ myarray[$2]++;}  END {for (i in myarray) {print myarray[i], i;}}' tabla_totales2019.csv
FILE=$1

for VAR in {1..16}
do
    if [ $VAR -eq 1 ]
then
awk -v k=$VAR 'BEGIN {FPAT = "([^,]+)|(\"[^\"]+\")"; OFS=","}
NR==1 {i = 3*k+1; val[$i]; print "\"EDAD\"", "\"CVE\"", "\"DESCRIP\"", "\"TOTAL\""} 
NR>1 {for (j in val) { print j, $(i-2), $(i-1), $i} }
' $FILE
else
awk -v k=$VAR 'BEGIN {FPAT = "([^,]+)|(\"[^\"]+\")"; OFS=","}
NR==1 {i = 3*k+1; val[$i]} 
NR>1 {for (j in val) { print j, $(i-2), $(i-1), $i} }
' $FILE
fi	   
done






