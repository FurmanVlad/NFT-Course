#!/bin/bash

echo "Mission 6: Extracting NFT course student from moodle.sce.ac.il"
echo "==========================================================="
echo

# Download page
if ! curl -s "https://moodle.sce.ac.il/user/index.php?id=32326" -o temp.html; then
    echo "Error: Failed to download the webpage"
    exit 1
fi

# Flatten HTML into a single line
content=$(tr -d '\n' < temp.html)

# Correct Bash-compatible regex (quoted string, no `+`, no `?`, no `<` or `>` unescaped)
if [[ "$content" =~ id=\"user-index-participants-32326_r[0-9]*_c1\"[^>]*\>[[:space:]]*<a[^>]*\>([^<]+)</a> ]]; then
    echo "First student name found:"
    echo "${BASH_REMATCH[1]}"
else
    echo "No match found"
fi

# Cleanup
# rm -f temp.html

echo
echo "Press any key to exit..."
read -n 1 -s
