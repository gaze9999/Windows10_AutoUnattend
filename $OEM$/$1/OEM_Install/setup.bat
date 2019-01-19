@echo off
title Installing Application [Windows 10 64-bit]

ECHO.
ECHO =================== Installing Google Chrome ====================
ECHO.
%SYSTEMDRIVE%\OEM_Install\chromeStandaloneSetup64.exe /silent /install
timeout /t 3 /nobreak

ECHO.
ECHO ====================== Installing JAVA8 =========================
ECHO.
%SYSTEMDRIVE%\OEM_Install\jre-8u201-windows-x64.exe /s
timeout /t 3 /nobreak

ECHO.
ECHO ==================== Installing Pot Player =======================
ECHO.
%SYSTEMDRIVE%\OEM_Install\PotPlayerSetup64.exe /S /D /quiet
timeout /t 3 /nobreak 

ECHO.
ECHO ======== Installing Visual C++ Redistributable Packages =========
ECHO.
%SYSTEMDRIVE%\OEM_Install\vc_redist_x64.exe /S /install /quiet /norestart
timeout /t 3 /nobreak

ECHO.
ECHO ======== Installing .Net 4.7.2 Redistributable Packages =========
ECHO.
%SYSTEMDRIVE%\OEM_Install\dotNetFx472_Full_x86-x64.exe /S /install /quiet /norestart
timeout /t 3 /nobreak

ECHO.
ECHO ====================== Installing BANDIZIP ========================
ECHO.
%SYSTEMDRIVE%\OEM_Install\BANDIZIP-SETUP.exe /S
timeout /t 3 /nobreak

ECHO.
ECHO ====================== Installing 7z ========================
ECHO.
%SYSTEMDRIVE%\OEM_Install\7z1806-x64.exe /S
timeout /t 3 /nobreak

ECHO.
ECHO ================== Installing Adobe Reader DC ===================
ECHO. 
%SYSTEMDRIVE%\OEM_Install\AcroRdrDC1900820071_zh_TW.exe /msi EULA_ACCEPT=YES /quiet /qn -noreboot