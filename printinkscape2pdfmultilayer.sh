#!/bin/bash
# print inkscape to pdf multiple layers
# www.github.com/ennaniux/Utilities

FILE=$1



UL=$(inkscape --query-all $FILE | grep layer | awk -F"," 'END{print NR}')

echo $UL

for id in `seq 1 $UL`; do echo "$FILE -jC -i layer$id -e layer$id.pdf"; done | inkscape --shell

pdfjam layer*.pdf -o "newfile$ULlayers.pdf"

rm layer*pdf

