#!/bin/bash

FILE_URL="https://raw.githubusercontent.com/saidur-rahman-alif/tunnel/refs/heads/main/tunnel"
FILE_NAME="tunnel"
TARGET="$PREFIX/bin/$FILE_NAME"

# Check if file exists
if [ -f "$TARGET" ]; then
    echo "File already exist"
    echo "Done ✅"
    exit 0
else
    echo "File doesn't exist"
fi

echo "Downloading file..."
curl -fLo "$FILE_NAME" "$FILE_URL" || { echo "Download failed"; exit 1; }

echo "Moving file..."
mv "$FILE_NAME" "$TARGET" || { echo "Move failed"; exit 1; }

echo "Giving permission..."
chmod +x "$TARGET" || { echo "Permission failed"; exit 1; }

echo "Done ✅"9
