#!/bin/sh
echo "Preparing repository..."
./restic \
	-r "sftp::${SFTP_PATH}" \
	-o sftp.command="ssh ${SFTP_USER}@${SFTP_HOST} -p ${SFTP_PORT} -i /restic/key -s sftp" \
	init