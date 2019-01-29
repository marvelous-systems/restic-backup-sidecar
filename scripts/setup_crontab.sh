#!/bin/sh

sed -i "s|SCHEDULE_MINUTE|${SCHEDULE_MINUTE}|g" /etc/crontab
sed -i "s|SCHEDULE_HOUR|${SCHEDULE_HOUR}|g" /etc/crontab
sed -i "s|SCHEDULE_DAY|${SCHEDULE_DAY}|g" /etc/crontab
sed -i "s|SCHEDULE_MONTH|${SCHEDULE_MONTH}|g" /etc/crontab
sed -i "s|SCHEDULE_WEEKDAY|${SCHEDULE_WEEKDAY}|g" /etc/crontab
touch /restic/setup.done