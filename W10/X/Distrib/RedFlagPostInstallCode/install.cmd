@echo on
rem *******************************************************
rem install.cmd for RedFlagPostInstallCode
rem This is an Installation File for Project
rem It Copies Files on a Computer, Creates Directories,
rem Downloads and Execute Main PostInstall Files
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

rem Set Directories...
rem
set DOTBINDIR=C:\.BIN
set PUB1=C:\pub1
set PUB1DISTRIB=C:\pub1\Distrib
set ZLOVRED=%PUB1DISTRIB%\Zlovred

rem
rem Set Directories Path
set pathCMD=%SystemRoot%\System32
set curdirforurl=%CD%
rem Set a File Name
rem
set WGETSOURCE=%~dp0wget.exe
set OPENEXPLORER=OpenExplorerThisAsAdmin.cmd
set OPENTERMINAL=OpenTerminalThisAsAdmin.cmd
set DOWNLOADSFILE=downloads.cmd
set OPENDOTBINDIR=open.dotBIN.dir.cmd
set WSCRIPTEXE=%pathCMD%\WScript.exe


echo Check Integrity...
rem
if not exist %pathCMD% echo %pathCMD% is not Found && exit /b 1
if not exist %WSCRIPTEXE% echo %WSCRIPTEXE% is not Found && exit /b 1
if not exist "%WGETSOURCE%" echo %WGETSOURCE% is not Found && exit /b 1
if not exist "%~dp0%OPENEXPLORER%" echo %~dp0%OPENEXPLORER% is not Found && exit /b 1
if not exist "%~dp0%OPENTERMINAL%" echo %~dp0%OPENTERMINAL% is not Found && exit /b 1
if not exist "%~dp0%DOWNLOADSFILE%" echo %~dp0%DOWNLOADSFILE% is not Found && exit /b 1
if not exist "%~dp0%OPENDOTBINDIR%" echo %~dp0%OPENDOTBINDIR% is not Found && exit /b 1

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

echo Run Payloads...

rem
echo Make Directories...
rem
md %DOTBINDIR%
md %DOTBINDIR%\%FIRMNAME%
md %DOTBINDIR%\%FIRMNAME%\%PRODUCT_NAME%
rem
md %PUB1%
md %PUB1DISTRIB%
md %ZLOVRED%

echo Copy Files...
rem
copy /Y /V /Z "%WGETSOURCE%" %DOTBINDIR%\%FIRMNAME%\%PRODUCT_NAME%\
copy /Y /V /Z "%~dp0%OPENEXPLORER%" %DOTBINDIR%\%FIRMNAME%\%PRODUCT_NAME%\
copy /Y /V /Z "%~dp0%OPENTERMINAL%" %DOTBINDIR%\%FIRMNAME%\%PRODUCT_NAME%\
copy /Y /V /Z "%~dp0%DOWNLOADSFILE%" %DOTBINDIR%\%FIRMNAME%\%PRODUCT_NAME%\
copy /Y /V /Z "%~dp0%OPENEXPLORER%" %DOTBINDIR%\
copy /Y /V /Z "%~dp0%OPENTERMINAL%" %DOTBINDIR%\
copy /Y /V /Z "%~dp0%OPENDOTBINDIR%" C:\

rem echo Open Directory %DOTBINDIR%...
rem %~dp0%OPENDOTBINDIR%

rem End Payloads
echo The End Run Payloads...

rem The End of the Script
:End
echo The End of the Script %0
exit /b 0
