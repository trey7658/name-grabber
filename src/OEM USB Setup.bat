@echo off
:: start of code
set cho=n
echo Welcome!
cls
echo This will setup namegrabber on this usb. To move somewhere else, move this file where you want to install. (mostly on a USB/SD card)
echo.
pause
cls
echo This will copy files into a folder on your drive called namegrabber. This will not format the drive. Make sure you have a stable internet connection
echo anyone with this usb can see your windows username which is: %username%
pause
cls
md %0\..\namegrabber
echo downloading required files...
if not EXIST Main.bat curl -o %0\..\namegrabber\rename.bat -S -s https://raw.githubusercontent.com/trey7658/name-grabber/main/src/Main.bat?avoid=%random%%random%
if EXIST Main.bat copy src\Main.bat %0\..\namegrabber\rename.bat
echo This is the file used for storing names of people > %0\..\namegrabber\names.txt 
attrib +H +S %0\..\namegrabber\names.txt
echo %username% > %0\..\namegrabber\creator.txt
attrib +H +S %0\..\namegrabber\creator.txt
echo NotActuallyARealUsername > %0\..\namegrabber\usernames.txt
attrib +H +S %0\..\namegrabber\usernames.txt
echo NotActuallyARealUsername > %0\..\namegrabber\admins.txt
attrib +H +S %0\..\namegrabber\admins.txt
echo NotActuallyARealDomain > %0\..\namegrabber\pc.txt
attrib +H +S %0\..\namegrabber\pc.txt
echo Logs start here > %0\..\namegrabber\logs.txt
attrib +H +S %0\..\namegrabber\logs.txt
cls
echo done
pause
cls
if %drivefound% equ 0 echo No removable drives found
if %drivefound% equ 1 call (
echo Would you like to test the USB/SD card? (y/n)
set/p "cho=>"
if %cho% equ y %0\..\namegrabber\rename.bat
if %cho% equ n exit
if %cho% equ Y %0\..\namegrabber\rename.bat
if %cho% equ N exit
)
pause
exit