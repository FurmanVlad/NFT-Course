#!/bin/bash

echo "Mission 3: Extracting headline from ynet.co.il"
echo "================================================="
echo
echo "Downloading the webpage from ynet.co.il..."
echo

# Execute Node.js script
if ! node mission3.js; then
    echo "Error: Failed to execute the Node.js script"
    exit 1
fi

echo "Extracting headline from ynet.co.il via regex..."
echo

# Extract headline using bash regex matching
content=$(cat temp.html)
if [[ $content =~ data-tb-region=\"Top\ story\".*slotTitle.*\<span[^\>]*data-tb-title[^\>]*\>([^<]*)\<\/span\> ]]; then
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
