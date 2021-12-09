#!/bin/bash
# print inkscape to pdf multiple layers
# www.github.com/ennaniux/Utilities

FILE=$1



UL=$(inkscape --query-all $FILE | grep layer | awk -F"," '{print $1}')

echo $UL

for id in $UL; do inkscape $FILE -jC -i $id -o $id.pdf ; done

pdfjam layer*.pdf -o "${FILE:0: -3}_pout.pdf"

rm layer*.pdf

