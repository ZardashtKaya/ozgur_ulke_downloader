#!/bin/bash
for i in $(cat links3.txt)
    do first=$(echo $i | cut -d ":" -f1)
    day=$(echo $i | cut -d "/" -f2)
    filename=$(echo $i | cut -d "/" -f3)
    mkdir -p $day
    mv ./Downloads/$filename $day/$first$day.jpg
    done
