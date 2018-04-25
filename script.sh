#!/bin/bash

head -n 2 vmstat.log > vmstat.head
tail -n 1 vmstat.desc > vmstat.head.csv
cat vmstat.log | grep '^ [0-9]' > vmstat.body
cat vmstat.body | tr -s ' ' | tr ' ' ',' | cut -b 2- > vmstat.body.csv

head -n 3 pidstat.log | tail -n 1 > pidstat.head
head pidstat.head | tr -s '  ' | tr ' ' ',' | cut -d ',' -f 2- > pidstat.head.csv 
cat pidstat.log | grep  '^ ' > pidstat.body
cat pidstat.body | tr -s ' ' | tr ', ' '.,' | cut -b 2- | sed -r 's/([a-zA-Z]),([a-zA-Z])/\1 \2/g' > pidstat.body.csv

cat vmstat.head.csv vmstat.body.csv > vmstat.csv
cat pidstat.head.csv pidstat.body.csv > pidstat.csv 

