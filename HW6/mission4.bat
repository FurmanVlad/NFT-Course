@echo off
echo Mission 4: Extracting download link from bugzilla.org
echo =================================================
echo.

curl -s https://www.bugzilla.org/download/ > temp.html
if %errorlevel% neq 0 (
    echo Error: Failed to download the webpage
    goto :end
)

powershell -Command "$content = Get-Content temp.html -Raw; if ($content -match 'Stable Release\s*\(5\.2\)(?:.|\s)*?<a href=\"(.*?)\"') { Write-Output $matches[1] } else { Write-Output 'No match found' }"

:end
if exist temp.html del temp.html
echo.
echo Press any key to exit...
pause > nul 