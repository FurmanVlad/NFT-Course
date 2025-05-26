@echo off

echo Mission 8: Extracting software non functional testing books from amazon.com
echo =================================================
echo.
echo Downloading the webpage from amazon.com...
echo.

node mission8.js

if %errorlevel% neq 0 (
    echo Error: Failed to execute the Node.js script
    goto :end
)

echo Extracting software non functional testing books
echo.

powershell -Command "$content = Get-Content temp.html -Raw -Encoding UTF8; [regex]::Matches($content, 'class=\"a-size-medium a-spacing-none a-color-base a-text-normal\"><span>(.*?)<\/span>') | ForEach-Object { $_.Groups[1].Value }"
:end
if exist temp.html del temp.html
echo.
echo Press any key to exit...
pause > nul