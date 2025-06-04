#!/bin/bash

echo "Mission 4: Extracting download link from bugzilla.org"
echo "================================================="
echo

# Download the webpage
if ! curl -s https://www.bugzilla.org/download/ > temp.html; then
    echo "Error: Failed to download the webpage"
    exit 1
fi

# Read content and flatten into one line (remove all newlines)
content=$(tr -d '\n' < temp.html)

# Bash-compatible regex (no +, no ?, no PCRE)
if [[ $content =~ Stable\ Release[[:space:]]*\(5\.2\)[[:space:]]*\<\/h3\>[[:space:]]*\<a[[:space:]]href=\"([^\"]*) ]]; then
    echo "Download link found:"
    echo "${BASH_REMATCH[1]}"
else
    echo "No match found"
fi

# Cleanup
rm -f temp.html

echo
echo "Press any key to exit..."
read -n 1 -s
