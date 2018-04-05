@echo off
title Installing MotherBoard Drivers [64-bit]

ECHO.
ECHO ================= Installing Intel Chipset Drivers =================
ECHO.
%SYSTEMDRIVE%\Driver\Chipset\SetupChipset.exe -s -norestart
timeout /t 3 /nobreak

ECHO.
ECHO ================= Installing AMD Chipset Drivers =================
ECHO.
%SYSTEMDRIVE%\Driver\AMD\Setup.exe -install
timeout /t 3 /nobreak

ECHO.
ECHO ============== Installing Intel ME Drivers ===================
ECHO.
%SYSTEMDRIVE%\Driver\MEI\SetupME.exe -s
timeout /t 3 /nobreak

ECHO.
ECHO ================ Installing Intel VGA Drivers ================
ECHO.
%SYSTEMDRIVE%\Driver\VGA_Intel\Setup.exe -s
timeout /t 3 /nobreak

ECHO.
ECHO =============== Installing nVidia VGA Drivers ================
ECHO.
%SYSTEMDRIVE%\Driver\VGA_nVidia\setup.exe -s -noreboot -clean
timeout /t 3 /nobreak

ECHO.
ECHO ================ Installing AMD VGA Drivers ==================
ECHO.
%SYSTEMDRIVE%\Driver\VGA_AMD\64-bit\Setup.exe -INSTALL
timeout /t 3 /nobreak

ECHO.
ECHO ============ Installing Realtek Audio Drivers ================
ECHO.
%SYSTEMDRIVE%\Driver\Audio_Realtek\Setup.exe -s
timeout /t 3 /nobreak

ECHO.
ECHO ============== Installing Intel LAN Drivers ==================
ECHO.
%SYSTEMDRIVE%\Driver\LAN_Intel\PROWinx64\APPS\SETUP\SETUPBD\Winx64\SetupBD.exe /s /nr
timeout /t 3 /nobreak

ECHO.
ECHO ============= Installing Realtek LAN Drivers =================
ECHO.
%SYSTEMDRIVE%\Driver\LAN_Realtek\Setup.exe -s
timeout /t 3 /nobreak

ECHO.
ECHO ============== Installing Killer LAN Drivers =================
ECHO.
pnputil -a %SYSTEMDRIVE%\Driver\LAN_Killer\e2xw10x64.inf
timeout /t 3 /nobreak

ECHO.
ECHO ============== Installing Intel Rapid Storage Technology Driver ===================
ECHO.
%SYSTEMDRIVE%\Driver\Intel_RST\SetupRST.exe -s
timeout /t 3 /nobreak

ECHO.
ECHO ============== Installing Intel Serial IO Drivers ===================
ECHO.
%SYSTEMDRIVE%\Driver\Intel_Serial_IO\SetupSerialIO.exe -s
timeout /t 3 /nobreak