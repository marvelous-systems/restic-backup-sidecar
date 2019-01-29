#!/bin/sh
echo "Starting backup..."
for path in $(echo $BACKUP_PATHS | sed "s/,/ /g")
do
	./restic \
		-r "sftp::${SFTP_PATH}" \
		-o sftp.command="ssh ${SFTP_USER}@${SFTP_HOST} -p ${SFTP_PORT} -o StrictHostKeyChecking=no -i /restic/key -s sftp" \
		--verbose \
		backup "$path"
done
