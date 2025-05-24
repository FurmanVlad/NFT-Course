@echo off
echo Mission 3: Extracting headline from ynet.co.il
echo ===========================================
echo.

curl -s https://www.ynet.co.il/home/0,7340,L-8,00.html > temp.html
if %errorlevel% neq 0 (
    echo Error: Failed to download the webpage
    goto :end
)

powershell -Command "$content = Get-Content temp.html -Raw; if ($content -match 'Top story.*?slotTitle.*?<span[^>]*>(.*?)<\/span>') { Write-Output $matches[1] } else { Write-Output 'No match found' }"

:end
if exist temp.html del temp.html
echo.
echo Press any key to exit...
pause > nul 