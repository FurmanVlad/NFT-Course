#!/bin/bash

echo "Mission 7: Extracting NFT jobs from linkedin.com"
echo "============================================="
echo

# Download LinkedIn job search page (note: JS content won’t be included)
curl -s "https://www.linkedin.com/jobs/search/?keywords=non+functional+test" -o temp.html
if [[ $? -ne 0 ]]; then
    echo "Error: Failed to download the webpage"
    exit 1
fi

# Attempt to extract first job title (if content is server-rendered or saved)
job_title=$(grep -oP 'class="[^"]*job-card[^>]*>\s*.*?<span aria-hidden="true"><strong><!---->\K.*?(?=<!----></strong></span>)' temp.html | head -n 1)

if [[ -n "$job_title" ]]; then
    echo "NFT Job Title Found:"
    echo "$job_title"
else
    echo "No match found (content may be dynamic or blocked)"
fi

# Cleanup
rm -f temp.html

echo
echo "Press any key to exit..."
read -n 1 -s
