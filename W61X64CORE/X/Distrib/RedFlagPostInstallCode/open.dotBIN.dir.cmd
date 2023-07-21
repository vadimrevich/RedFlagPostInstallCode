@echo on
rem *******************************************************
rem open.dotBIN.dir.cmd
rem This Command File Opens an C:\.BIN\
rem directory at Explorer and Terminal
rem file for Load a platform-independent adjustments
rem *******************************************************
@echo off

rem Set the Variables...
rem
set CMDFOLDER=C:\.BIN
set CMDFILE01=%CMDFOLDER%\OpenExplorerThisAsAdmin.cmd
set CMDFILE02=%CMDFOLDER%\OpenTerminalThisAsAdmin.cmd
set EXPLOREREXE=%SystemRoot%\explorer.exe

echo Check Integrity...
rem
if not exist %CMDFOLDER% echo %CMDFOLDER% is not Found && exit /b 1
if not exist %CMDFILE01% echo %CMDFILE01% is not Found && exit /b 1
if not exist %CMDFILE02% echo %CMDFILE02% is not Found && exit /b 1

echo Run Payload...
rem
if exist %EXPLOREREXE% call %CMDFILE01%
call %CMDFILE02%

:End
echo The End of the Script %0
exit /b 0