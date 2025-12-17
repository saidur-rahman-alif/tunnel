#!/bin/bash

# Configuration
BASE_URL="https://raw.githubusercontent.com/saidur-rahman-alif/tunnel/refs/heads/main/"
Arab_Emirates="tunnel-ae"
DEST_FOLDER="/local/usr/bin"
DEST_FILE="$DEST_FOLDER/$Arab_Emirates"  # Named after the endpoint

# Display menu
echo "Tunnel Location:"
echo "1. Arab Emirates"
echo "0. Exit"
echo -n "Select [0-1]: "
read choice

# Process selection
if [ "$choice" = "1" ]; then
    sudo mkdir -p "$DEST_FOLDER"
    sudo curl -L "${BASE_URL}${Arab_Emirates}" -o "$DEST_FILE"
    sudo chmod 755 "$DEST_FILE"
    echo "Successfully setup!"
    echo "File installed at: $DEST_FILE"
    exit 0
elif [ "$choice" = "0" ]; then
    echo "Exiting"
    exit 0
else
    echo "Invalid choice"
    exit 1
fi
