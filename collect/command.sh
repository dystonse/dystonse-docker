#!/bin/sh
set -e
mkdir -p /files/$GTFS_DATA_SOURCE_ID

# Create the log file to be able to run tail
touch /var/log/cron.log
touch /files/$GTFS_DATA_SOURCE_ID/schedule.log
touch /files/$GTFS_DATA_SOURCE_ID/rt.log

# Taken from https://stackoverflow.com/questions/37458287/how-to-run-a-cron-job-inside-a-docker-container
printenv | grep -v "no_proxy" >> /etc/environment
/collect_schedule.sh
cron
tail -f /var/log/cron.log -f /files/$GTFS_DATA_SOURCE_ID/schedule.log -f /files/$GTFS_DATA_SOURCE_ID/rt.log