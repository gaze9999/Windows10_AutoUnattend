@echo off
wmic useraccount where "Name='User'" set PasswordExpires=FALSE

ECHO.
ECHO ================== Change Power Plan ==================
ECHO.
powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -x -monitor-timeout-ac 0
powercfg -x -monitor-timeout-dc 0
regedit -s "C:\Buffer\Disable_Sleep.reg"

ECHO.
ECHO ================== Enable Desktop Icon ==================
ECHO.
regedit -s "C:\Buffer\Add_All_Desktop_Icon_All_Users.reg"
regedit -s "C:\Buffer\Show_Seconds_In_System_Clock.reg"

ECHO.
ECHO ================== Remove Temp Folder ===================
ECHO.
RD "C:\Driver" /s /q
RD "C:\OEM_Install" /s /q
RD "C:\Windows\ConfigSetRoot" /s /q
RD "C:\Buffer" /s /q