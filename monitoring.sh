#!/bin/bash

pidstat -h 1 3600 > pidstat.log &
vmstat -t 1 3600 > vmstat.log &

sleep 5
tail -f *.log &

