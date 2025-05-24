@echo off
echo Mission: Extracting IP address from whatismyip.com
echo =================================================
echo.
curl -s https://www.whatismyip.com/ > temp.html
if %errorlevel% neq 0 (
    echo Error: Failed to download the webpage
    goto :end
)
powershell -Command "$content = Get-Content temp.html -Raw; if ($content -match 'class=\"the-ipv4\">((?:\d{1,3}\.){3}\d{1,3})') { Write-Output $matches[1] } else { Write-Output 'No match found' }"
:end
if exist temp.html del temp.html
echo.
echo Press any key to exit...
pause > nul