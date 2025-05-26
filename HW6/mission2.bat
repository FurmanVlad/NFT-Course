@echo off

echo Mission: Extracting IP address from whatismyip.com
echo =================================================
echo.
echo Downloading the webpage from whatismyip.com...
echo.

node mission2.js

if %errorlevel% neq 0 (
    echo Error: Failed to execute the Node.js script
    goto :end
)

echo Extracting IP address via regex...
echo.

powershell -Command "$content = Get-Content temp.html -Raw; if ($content -match 'class=\"the-ipv4\">((?:\d{1,3}\.){3}\d{1,3})') { Write-Output $matches[1] } else { Write-Output 'No match found' }"
:end
if exist temp.html del temp.html
echo.
echo Press any key to exit...
pause > nul