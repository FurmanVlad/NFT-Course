@echo off
echo Mission 8: Extracting software non functional testing books from amazon.com
echo ===================================================================
echo.

curl -s https://www.amazon.com/s?k=software+non+functional+testing+books > temp.html
if %errorlevel% neq 0 (
    echo Error: Failed to download the webpage
    goto :end
)

powershell -Command "$content = Get-Content temp.html -Raw; if ($content -match 'class=\"a-size-medium a-spacing-none a-color-base a-text-normal\"><span>(.*?)<\/span>') { Write-Output $matches[1] } else { Write-Output 'No match found' }"

:end
if exist temp.html del temp.html
echo.
echo Press any key to exit...
pause > nul 