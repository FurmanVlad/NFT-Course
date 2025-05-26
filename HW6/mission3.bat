@echo off

echo Mission 3: Extracting headline from ynet.co.il
echo =================================================
echo.
echo Downloading the webpage from ynet.co.il...
echo.

node mission3.js

if %errorlevel% neq 0 (
    echo Error: Failed to execute the Node.js script
    goto :end
)

echo Extracting headline from ynet.co.il via regex...
echo.

powershell -Command "$content = Get-Content temp.html -Raw -Encoding UTF8; if ($content -match 'Top story.*?slotTitle.*?<span[^>]*>(.*?)<\/span>') { Write-Output $matches[1] } else { Write-Output 'No match found' }"
:end
if exist temp.html del temp.html
echo.
echo Press any key to exit...
pause > nul