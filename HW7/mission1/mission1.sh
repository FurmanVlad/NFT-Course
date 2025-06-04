#!/bin/bash

echo "Mission 1: Extracting date from timeanddate.com"
echo "============================================"
echo

# Download webpage
if ! curl -s https://www.timeanddate.com > temp.html; then
    echo "Error: Failed to download the webpage"
    exit 1
fi

# Extract date using bash regex matching
content=$(cat temp.html)
if [[ $content =~ id=\"ij2\"\>([A-Z][a-z]{2}[[:space:]][0-9]{1,2},[[:space:]][0-9]{4}) ]]; then
    echo "${BASH_REMATCH[1]}"
else
    echo "No match found"
fi

# Cleanup
if [ -f temp.html ]; then
    rm temp.html
fi

echo
echo "Press any key to exit..."
read -n 1 -s
