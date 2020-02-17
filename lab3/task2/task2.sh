#!/bin/bash

cp tcpdump.service /usr/lib/systemd/system/tcpdump.service
cp tcpdump.conf /etc/logrotate.d/tcpdump.conf
systemctl daemon-reload
systemctl restart tcpdump.service
crontab logrotate_hourly
