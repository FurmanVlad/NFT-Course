#!/bin/bash

echo "Mission 8: Extracting software non-functional testing books from amazon.com"
echo "================================================"
echo
echo "Downloading the webpage from amazon.com..."
echo

# Run Node.js script
node mission8.js
if [[ $? -ne 0 ]]; then
    echo "Error: Failed to execute the Node.js script"
    exit 1
fi

echo
echo "Extracting software non-functional testing books"
echo

# Extract book titles from HTML
grep -oP 'class="a-size-medium a-spacing-none a-color-base a-text-normal"><span>\K.*?(?=</span>)' temp.html

# Cleanup
rm -f temp.html

echo
echo "Press any key to exit..."
read -n 1 -s
