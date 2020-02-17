#!/bin/bash

date
netstat -t -u | sed '1,2d' | awk '{print $6}' | sort | uniq -c | awk '{ t = $1; $1 = $2; $2 = t; print; }' | tr -s '[:blank:]' ','
