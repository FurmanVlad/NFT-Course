@echo off
echo Mission 1: Extracting date from timeanddate.com
echo ============================================
echo.

curl -s https://www.timeanddate.com > temp.html
if %errorlevel% neq 0 (
    echo Error: Failed to download the webpage
    goto :end
)

powershell -Command "$content = Get-Content temp.html -Raw; if ($content -match 'id=\"ij2\">([A-Z][a-z]{2}\s\d{2},\s\d{4})') { Write-Output $matches[1] } else { Write-Output 'No match found' }"

:end
if exist temp.html del temp.html
echo.
echo Press any key to exit...
pause > nul 