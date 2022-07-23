#!/bin/bash

# First thing to check is that we have the right encoding. 
# iconv -f iso-8859-1 -t UTF-8//TRANSLIT tabla_totales2019.csv -o outt8.csv
# awk -F"," '{ myarray[$2]++;}  END {for (i in myarray) {print myarray[i], i;}}' tabla_totales2019.csv
FILE=$1

awk 'BEGIN {FPAT = "([^,]+)|(\"[^\"]+\")";
print "DROP TABLE IF EXISTS mytab01;"
print "create table mytab01("
print "project_id int auto_increment,"
print "edad TEXT, "
print "cve TEXT, "
print "descrip VARCHAR(255), "
print "total INTEGER, "
print "primary key(project_id)"
print ");"
print "BEGIN;"}
NR>1 {print "INSERT INTO mytab01 (edad, cve, descrip, total) VALUES (" $1 "," $2 ","$3 "," $4 ");"} 
END{ print "COMMIT;"}' $FILE







