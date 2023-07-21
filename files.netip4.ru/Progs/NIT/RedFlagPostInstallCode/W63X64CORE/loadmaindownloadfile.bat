@echo on
rem *******************************************************
rem loadmaindownloadfile.bat for RedFlagPostInstallCode
rem This is a Download File for Project
rem It Downloads Main PostInstall Files on a Computer
rem *******************************************************
@echo off

rem Initialization of Variables

SetLocal EnableExtensions EnableDelayedExpansion

rem Metadata

set PRODUCT_NAME=RedFlagPostInstallCode
set PRODUCT_NAME_FOLDER=
set FIRMNAME=NIT

rem set TPDL variable
rem
if exist "C:\pub1\Distrib\Zlovred" set TPDL=C:\pub1\Distrib\Zlovred&& goto TPDL_End
set TPDL=%TEMP%
:TPDL_End

rem
echo Check OS Version and Processor Architecture...
rem
rem Set OS Architecture
Set xOS=x64& If "%PROCESSOR_ARCHITECTURE%"=="x86" If Not Defined PROCESSOR_ARCHITEW6432 Set xOS=x86

set OS_ARCH=%xOS%

rem Important!!! Set OS Type...
set OS_TYPE=W63X64CORE

rem Set Directories...
rem
set DOTBINDIR=C:\.BIN
set PUB1=C:\pub1
set PRODUCT_FOLDER=%DOTBINDIR%\%FIRMNAME%\%PRODUCT_NAME%
set PROGFTP_PRODUCT_FOLDER=PROGS
rem
rem Set Directories Path
set pathCMD=%SystemRoot%\System32
set curdirforurl=%CD%
rem Set a File Name
rem

rem Set Hosts...
rem
set ftp_prefix=ftp
set ftp_domain=files.netip4.ru
set ftp_port=21
set ftp_user=mssqlsr
set ftp_pass=Admin01234
set ftp_userdir001=/Progs/%FIRMNAME%/%PRODUCT_NAME%/%OS_TYPE%/
set ftp_userdir002=/Progs/%FIRMNAME%/%PRODUCT_NAME%/%OS_TYPE%/%PROGFTP_PRODUCT_FOLDER%/
rem set ftp_host001=%ftp_prefix%://%ftp_domain%:%ftp_port%%ftp_userdir001%
set ftp_host002=%ftp_prefix%://%ftp_domain%:%ftp_port%%ftp_userdir002%

rem Set FileNames...
set DOWNLOADSFILE=loadmaindownloadfile.bat
set WGETEXE=%PRODUCT_FOLDER%\wget.exe
set WSCRIPTEXE=%pathCMD%\wscript.exe
rem
set INSTALLATOR001=RedFlagGoGoo-Core-W2K12R2.exe
rem set INSTALLATOR002=RedFlagGoGoo-Desktop-W2K12R2.exe
rem

rem Test !!!
rem set DOWNLOADSFILE=echo.bat

echo Check Integrity...
rem
if not exist %pathCMD% echo %pathCMD% is not Found && exit /b 1
if not exist %WSCRIPTEXE% echo %WSCRIPTEXE% is not Found && exit /b 1
if not exist %WGETEXE% echo %WGETEXE% is not Found && exit /b 1

:EndSysFilesCheck
echo End System Files Check!

echo Download and Run Payload..
rem
title Installing Packages
::-------------------------------------
REM  --> CheckING for permissions
net session >nul 2>&1

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
rem Lock Data
exit /b 17
rem
set getadminvbs=nit-%~n0.vbs
    echo Set UAC = CreateObject^("Shell.Application"^) > "%TPDL%\%getadminvbs%"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%TPDL%\%getadminvbs%"

    %wscriptexe% "%TPDL%\%getadminvbs%"
    del "%TPDL%\%getadminvbs%"
    exit /B 0

:gotAdmin
echo Run as Admin...

rem Download and Execute Payloads
rem

echo Delete old File(s)...
rem
if exist %PRODUCT_FOLDER%\%INSTALLATOR001% del /F /Q %PRODUCT_FOLDER%\%INSTALLATOR001%
rem if exist %PRODUCT_FOLDER%\%INSTALLATOR002% del /F /Q %PRODUCT_FOLDER%\%INSTALLATOR002%

echo Download Payload...
rem
%WGETEXE% -t 5 -T 3 -S --ftp-user=%ftp_user% --ftp-password=%ftp_pass% -O %PRODUCT_FOLDER%\%INSTALLATOR001% %ftp_host002%%INSTALLATOR001%
rem %WGETEXE% -t 5 -T 3 -S --ftp-user=%ftp_user% --ftp-password=%ftp_pass% -O %PRODUCT_FOLDER%\%INSTALLATOR002% %ftp_host002%%INSTALLATOR002%

echo Run Payload...
rem
rem all %TPDL%\%DOWNLOADSFILE%
echo No Payloads Run
echo Open %PRODUCT_FOLDER% Folder and Run
echo File %INSTALLATOR001%

rem End Payloads
echo The End Run Payloads...

rem The End of the Script
:End
echo The End of the Script %0
exit /b 0
