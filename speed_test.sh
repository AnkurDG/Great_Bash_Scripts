#!/bin/bash

# USAGE:
# ./speed_test.sh /path/to/my/file /path/to/destination number_of_tests

NUM_TESTs=$3
SUM=0
for i in $(seq 1 $NUM_TESTs); do

        REC=$(dd if=$1 of=$2 2>some_random_file_ ; cat some_random_file_ | cut -d " " -f8 | tail -1)

        SUM=$(echo $SUM + $REC | bc)

done

RESULT=$(echo $SUM / $NUM_TESTs | bc | awk '{ str1=str1 $0 }END{ print str1 }')

echo $RESULT MB/s

#clean up
rm some_random_file_
rm $2
