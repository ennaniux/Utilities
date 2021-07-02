#!/bin/bash

# Usage: ./template_example.sh template_data.csv


FILE=$1

# FILE2=$2

# Number of rows in $FILE
ROWS=$(cat $1 | wc -l)


TITLE="This is Just an Example"

# The counter starts from the second row (assuming headers in template_data.csv)
for id in  `seq 2 $ROWS`; do

echo "$id"
    
NAME=$(awk -F"," 'NR=='$id' {print $1}' $FILE)
SURNAME=$(awk -F"," 'NR=='$id' {print $2}' $FILE)
EMAIL=$(awk -F"," 'NR=='$id' {print $3}' $FILE)

# In case you have your template in a file
# REPORT="$(cat ${FILE2})"
# REPORT=$(eval "echo \"${REPORT}\"")

REPORT="
$TITLE

Dear $NAME $SURNAME

This is a test for a report that will be sent to your email:
$EMAIL

I can also send you the following function output:
$(echo \"Hello test\")

Best wishes,
the sender.

"


echo "$REPORT"


# This code if you want the email to be created, ready to click send.
# evolution mailto:"$EMAIL"?cc=""\&subject="$TITLE"\&body="$REPORT"

done 

