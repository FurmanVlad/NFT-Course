@echo off
echo Mission 6: Extracting NFT course students from moodle.sce.ac.il
echo ===========================================================
echo.

curl -s https://moodle.sce.ac.il/user/index.php?id=32326 > temp.html
if %errorlevel% neq 0 (
    echo Error: Failed to download the webpage
    goto :end
)

powershell -Command "$content = Get-Content temp.html -Raw; if ($content -match 'class=\"cell c1\" id=\"user-index-participants-32326_r\d+_c1\"[^>]*?>\s*<a[^>]*?>.*?(?:<[^>]*>)*\s*([^<>]+?)\s*<\/a>') { Write-Output $matches[1] } else { Write-Output 'No match found' }"

:end
@REM if exist temp.html del temp.html
echo.
echo Press any key to exit...
pause > nul 