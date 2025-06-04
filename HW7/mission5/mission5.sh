#!/bin/bash

echo "Mission 5: Extracting first tutorial name from jmeter.apache.org"
echo "==========================================================="
echo

# Download the webpage
if ! curl -s https://jmeter.apache.org > temp.html; then
    echo "Error: Failed to download the webpage"
    exit 1
fi

# Flatten HTML into one line
content=$(tr -d '\n' < temp.html)

# Correct Bash-compatible regex (quoted, no ?)
if [[ "$content" =~ class=\"menu-title\"\>Tutorials\<\/div\>.*href=\"\.\/usermanual\/([^\"]+)\.html ]]; then
    echo "First tutorial name found:"
    echo "${BASH_REMATCH[1]}"
else
    echo "No match found"
fi

# Cleanup
rm -f temp.html

echo
echo "Press any key to exit..."
read -n 1 -s
