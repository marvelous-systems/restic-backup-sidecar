#!/bin/sh
echo "Checking repository..."

./restic \
	-r "sftp::${SFTP_PATH}" \
	-o sftp.command="ssh ${SFTP_USER}@${SFTP_HOST} -p ${SFTP_PORT} -o StrictHostKeyChecking=no -i /ssh/key -s sftp" \
	snapshots > /dev/null

ret=$?
if [[ $ret != 0 ]]
then
	# something went wrong, repo possibly doesn't exist
	echo "Creating repository..."
	./restic \
		-r "sftp::${SFTP_PATH}" \
		-o sftp.command="ssh ${SFTP_USER}@${SFTP_HOST} -p ${SFTP_PORT} -o StrictHostKeyChecking=no -i /ssh/key -s sftp" \
		init
fi

rc=$?
if [[ $rc != 0 ]]
then 
	echo "Can't recover, aborting."
	exit 10
fi
