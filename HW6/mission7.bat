@echo off
echo Mission 7: Extracting NFT jobs from linkedin.com
echo =============================================
echo.

curl -s https://www.linkedin.com/jobs/search/?keywords=non+functional+test > temp.html
if %errorlevel% neq 0 (
    echo Error: Failed to download the webpage
    goto :end
)

powershell -Command "$content = Get-Content temp.html -Raw; if ($content -match 'class=\"[^\"]*job-card[^>]*>\s*.*?<span aria-hidden=\"true\"><strong><!---->(.*?)<!----><\/strong><\/span>') { Write-Output $matches[1] } else { Write-Output 'No match found' }"

:end
if exist temp.html del temp.html
echo.
echo Press any key to exit...
pause > nul 