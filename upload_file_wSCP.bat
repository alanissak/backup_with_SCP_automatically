@echo off
setlocal

REM Define variables
set SOURCE_FILE=<LOCATION OF FILE TO UPLOAD TO BACKUP SERVER>
set DESTINATION_USER=<SCP USER SET ON BACKUP SERVER>
set DESTINATION_SERVER=<BACKUP SERVER IP.
set DESTINATION_PATH=<PATH TO SAVE UPLOADED FILE TO IN BACKUP SERVER>

REM Execute SCP command
scp -i <SSH KEY LOCATION - LOCATED ON COMPUTER SENDING THE FILE TO THE BACKUP SERVER> %SOURCE_FILE% %DESTINATION_USER%@%DESTINATION_SERVER%:%DESTINATION_PATH%

REM Check SCP exit code
if %errorlevel% equ 0 (
    echo File transferred successfully.
) else (
    echo SCP command failed with exit code %errorlevel%.
)

endlocal
