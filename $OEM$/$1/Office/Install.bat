@echo off
title Call Office Install

call :Resume
goto %current%
goto :eof

:one
::Add script to Run key
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v "%~n0" /d "%~dpnx0" /f
echo two >%~dp0current.txt
goto :eof

:two
IF EXIST %TEMP%\oitplog RMDIR /s /q %TEMP%\oitplog
MKDIR %TEMP%\oitplog

ECHO ^<Configuration^> > %~dp0oitp_configure.xml
ECHO. >> %~dp0oitp_configure.xml
ECHO   ^<Add SourcePath="%~dp0oitpinstall\" OfficeClientEdition="32" Channel="Monthly" ^> >> %~dp0oitp_configure.xml
ECHO     ^<Product ID="HomeStudentRetail"^> >> %~dp0oitp_configure.xml
ECHO        ^<Language ID="zh-tw" /^> >> %~dp0oitp_configure.xml
ECHO     ^</Product^> >> %~dp0oitp_configure.xml
ECHO   ^</Add^> >> %~dp0oitp_configure.xml
ECHO. >> %~dp0oitp_configure.xml
ECHO     ^<Property Name="SharedComputerLicensing" Value="0" /^> >> %~dp0oitp_configure.xml
ECHO     ^<Property Name="PinIconsToTaskbar" Value="TRUE" /^> >> %~dp0oitp_configure.xml
ECHO     ^<Property Name="SCLCacheOverride" Value="0" /^> >> %~dp0oitp_configure.xml
ECHO     ^<Updates Enabled="TRUE" Channel="Monthly" /^> >> %~dp0oitp_configure.xml
ECHO     ^<RemoveMSI All="TRUE" /^> >> %~dp0oitp_configure.xml
ECHO     ^<Display Level="None" AcceptEULA="FALSE" /^> >> %~dp0oitp_configure.xml
ECHO     ^<Logging Name="OfficeSetup.txt" Path="%TEMP%\oitplog\" /^> >> %~dp0oitp_configure.xml
ECHO. >> %~dp0oitp_configure.xml
ECHO ^</Configuration^> >> %~dp0oitp_configure.xml
CLS

ECHO ==========INSTALLING OFFICE==========
CALL C:\office\Setup.exe /configure %~dp0oitp_configure.xml
goto complete

:complete
del /F /S %~dp0oitp_configure.xml
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v "%~n0" /f
del %~dp0current.txt
RD "C:\Office" /s /q
shutdown -r -t 0
goto :eof

:resume
if exist %~dp0current.txt (
    set /p current=<%~dp0current.txt
) else (
    set current=one
)