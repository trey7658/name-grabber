@echo off
:: start of code
set cho=n
set drivefound=0
set permission=0
echo Welcome!
for /F "tokens=1*" %%a in ('fsutil fsinfo drives') do (
   for %%c in (%%b) do (
      for /F "tokens=3" %%d in ('fsutil fsinfo drivetype %%c') do (
         if %%d equ Removable (
            set drivefound=1
            if %cho% equ n (
               cls
               echo Found usb/sd card %%c. To not use drive, please unplug it and try again.
               echo.
               echo Press any key to use drive %%c
               pause > NUL
               cls
               echo This will not work if you have renamed your namegrabber folder, so change it back if you havent yet.
               pause
               cls
               cd /d %%cnamegrabber
               echo Checking for permission...
               FOR /F %%i IN (creator.txt) DO if %%i equ %username% set permission=1
               FOR /F %%i IN (admins.txt) DO if %%i equ %username% set permission=1
               if %permission% equ 1 notepad %%cnamegrabber\names.txt
               exit
            )
         )
      )
   )
)
cls
if %drivefound% equ 0 echo No removable drives found
if %drivefound% equ 1 echo No other removable drives found
pause
exit