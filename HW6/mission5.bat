@echo off
echo Mission 5: Extracting first tutorial name from JMeter.apache.org
echo ===========================================================
echo.

curl -s https://jmeter.apache.org > temp.html
if %errorlevel% neq 0 (
    echo Error: Failed to download the webpage
    goto :end
)

powershell -Command "$content = Get-Content temp.html -Raw; if ($content -match 'class=\"menu-title\">Tutorials(?:.|\s)*?href=\"\.\/usermanual\/(.*)\.html') { Write-Output $matches[1] } else { Write-Output 'No match found' }"

:end
if exist temp.html del temp.html
echo.
echo Press any key to exit...
pause > nul 