#!/bin/bash

function die() {
	echo "Failed"
	exit
}

PACKAGE_PATH=$1
NEW_VERSION=$2
TEMP_DIR=$(mktemp -d) || die
TEMP_DIR2=$(mktemp -d) || die

mkdir -p /aethir-node/log
touch /aethir-node/log/server.log
echo -e "Update triggered:\n${NEW_VERSION}\n${PACKAGE_PATH}" >> /aethir-node/log/server.log
tar -xvf "$PACKAGE_PATH" -C "${TEMP_DIR}" --strip-components 1 || die
cp -R "${TEMP_DIR}/*" /aethir-node/ || die

cat << EOF > update.sh
#!bin/bash
./docker_update.sh
EOF

echo "Restarting..." >> /aethir-node/log/server.log
pgrep Checker |xargs kill

