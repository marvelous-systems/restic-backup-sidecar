#!/bin/sh

echo "Hello, Restic!"

echo "Setting up crontab..."
/restic/setup_crontab.sh
cat /etc/crontab
echo ""

if ! pgrep -x "crond" > /dev/null
then
	echo "Starting crond..."
	crond
fi

exec "$@"