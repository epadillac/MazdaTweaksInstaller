@echo off & setlocal
set version=V1.34
set date=2016-01-31
wmic os get CountryCode,Locale,OSLanguage,Codeset /value>%temp%\CInfo.txt 
for /f "delims=" %%i in ('type %temp%\CInfo.txt') do set "%%i" 
del %temp%\CInfo.txt 
set leer=       

:: for not yet translated languages, the recognized CountryCode has to be changed, so that text will be displayed in english
if %CountryCode%==02 set CountryCode=01		& :: if CountryCode is 02 for canadian-french, set language to english
if %CountryCode%==31 set CountryCode=01		& :: if CountryCode is 31 for dutch, set language to english
if %CountryCode%==33 set CountryCode=01		& :: if CountryCode is 33 for french, set language to english
if %CountryCode%==34 set CountryCode=01		& :: if CountryCode is 34 for spanish, set language to english
if %CountryCode%==52 set CountryCode=01		& :: if CountryCode is 52 for spanish mexico, set language to english
if %CountryCode%==36 set CountryCode=01		& :: if CountryCode is 36 for hungarian, set language to english
if %CountryCode%==39 set CountryCode=01		& :: if CountryCode is 39 for italian, set language to english
if %CountryCode%==41 set CountryCode=01		& :: if CountryCode is 41 for swiss, set language to english
if %CountryCode%==42 set CountryCode=01		& :: if CountryCode is 42 for czech, set language to english
if %CountryCode%==44 set CountryCode=01		& :: if CountryCode is 44 for UK, set language to english
if %CountryCode%==45 set CountryCode=01		& :: if CountryCode is 45 for danish, set language to english
if %CountryCode%==46 set CountryCode=01		& :: if CountryCode is 46 for swedish, set language to english
if %CountryCode%==47 set CountryCode=01		& :: if CountryCode is 47 for norwegian, set language to english
if %CountryCode%==48 set CountryCode=01		& :: if CountryCode is 48 for polish, set language to english
if %CountryCode%==61 set CountryCode=01		& :: if CountryCode is 61 for int. english, set language to english

:: Remove the two colons before following 'set CountryCode=01' to use this installation script in english,
:: if there are problems with automatic detection
::
:: Die beiden Doppelpunkte vor folgendem 'set CountryCode=01' entfernen, um das Script in englisch zu nutzen,
:: falls es Probleme mit der automatischen Erkennung geben sollte (oder Du es gerne in englisch nutzen moechtest)
::
::
set CountryCode=01

mode 80,25
color 09      
echo %leer%#####################################################################
echo %leer%####              All-in-one tweak %version% by Siutsch              ####
echo %leer%####              =================================              ####
echo %leer%####                         (%date%)                        ####
for /F "delims=" %%t in (choose\lang\%CountryCode%\start.txt) do echo %%t
echo.
set asw=0
set /p asw=" 1 / 2  /  3 / 4? "
if /I %asw%==1 goto INST_01
if /I %asw%==3 goto INST_01
if /I %asw%==2 goto DEINST_01
if /I %asw%==4 goto DEINST_01


:: ******************************************************************
:: *
:: * Begin installation
:: *
:: ******************************************************************
:INST_01
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_01--1.txt) do echo %%t
for %%f in (choose\01.txt) do type %%f > tweaks.txt
if %asw%==2 for %%f in (choose\00.txt) do type %%f >> tweaks.txt
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_01--2.txt) do echo %%t
if exist config for /D %%a in ("config") do rd /q /s "%%a" >NUL
if exist config_org for /D %%a in ("config_org") do rd /q /s "%%a" >NUL
if exist _copy_content_to_root_of_fat32_usb_stick for /D %%a in ("_copy_content_to_root_of_fat32_usb_stick") do rd /q /s "%%a" >NUL
md config >nul
ping -4 127.0.0.1 > NUL
echo. >> tweaks.txt


:: ******************************************************************
:: * Touchscreen enable
:: ******************************************************************
:INST_02_01
cls
mode 80,45
color 0a
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_01--1.txt) do echo %%t
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_01--2.txt) do echo %%t
set asw_02_1=0
echo.
set /p asw_02_1="(y)es / (j)a / (n)o? "
if /I %asw_02_1%==0 goto INST_02_02
if /I %asw_02_1%==n goto INST_02_02
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_01--3.txt) do echo %%t
ping -3 127.0.0.1 > NUL
for %%f in (choose\02_01.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt


:: ******************************************************************
:: * Reduce Disclaimer time
:: ******************************************************************
:INST_02_02
echo.
echo.
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_02--1.txt) do echo %%t
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_02--2.txt) do echo %%t
echo.
set asw_02_2=0
echo.
set /p asw_02_2="(y)es / (j)a / (n)o? "
if /I %asw_02_2%==0 goto INST_02_03
if /I %asw_02_2%==n goto INST_02_03
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_02--3.txt) do echo %%t
ping -3 127.0.0.1 > NUL
for %%f in (choose\02_02.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt


:: ******************************************************************
:: * Remove the safety warning label from the reverse camera
:: ******************************************************************
:INST_02_03
echo.
echo.
echo.
set INST_02_03_name="safety-warning-reverse-camera"
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_03--1.txt) do echo %%t
set asw_02_3=0
echo.
set /p asw_02_3="(y)es / (j)a / (n)o? "
if /I %asw_02_3%==0 goto INST_02_04
if /I %asw_02_3%==n goto INST_02_04
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_03--2.txt) do echo %%t
ping -3 127.0.0.1 > NUL
for %%f in (choose\02_03.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_02_03_name%" "config\%INST_02_03_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Remove the blank album art frame
:: ******************************************************************
:INST_02_04
echo.
echo.
echo.
set INST_02_04_name="remove-blank-album-art-frame"
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_04--1.txt) do echo %%t
set asw_02_4=0
echo.
set /p asw_02_4="(y)es / (j)a / (n)o? "
if /I %asw_02_4%==0 goto INST_03
if /I %asw_02_4%==n goto INST_03
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_04--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_04.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_02_04_name%" "config\%INST_02_04_name%" >nul
echo. >> tweaks.txt
goto INST_03


:: ******************************************************************
:: * Change of background image - will be done after custom infotainment colors after INST_05
:: ******************************************************************
:INST_02_05
echo.
echo.
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_05--1.txt) do echo %%t
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_05--2.txt) do echo %%t
echo.
echo.
if /I %asw_05%==0 for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_05--3.txt) do echo %%t
if /I %asw_05%==n for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_05--3.txt) do echo %%t
echo.
set asw_02_5=0
echo.
set /p asw_02_5="(y)es / (j)a / (n)o? "
if /I %asw_02_5%==0 goto INST_06
if /I %asw_02_5%==n goto INST_06
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_02_05--4.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_05.txt) do type %%f >> tweaks.txt
xcopy /Y "choose\config_all\background.png" "config\" >nul
echo. >> tweaks.txt
goto INST_06


:: ******************************************************************
:: * Install speed-video-reboot_tweak_mod_by_diginix
:: ******************************************************************
:INST_03
cls
mode 80,50
color 0c
set asw_03b==0
set asw_03what==0
set INST_03_name="speed-video-reboot"
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_03--1.txt) do echo %%t
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_03--2.txt) do echo %%t
set asw_03=0
echo.
set /p asw_03="(y)es / (j)a / (n)o? "
if /I %asw_03%==0 goto INST_04
if /I %asw_03%==n goto INST_04
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_03--3.txt) do echo %%t
ping -4 127.0.0.1 > NUL
echo.
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_03--4.txt) do echo %%t
echo.
:ONCEMORE
set asw_03b=0
echo.
set /p asw_03b=" (g) / (e) / (m) ? "
if /I %asw_03b%==0 goto ONCEMORE2
if /I %asw_03b%==j goto ONCEMORE2
if /I %asw_03b%==y goto ONCEMORE2
if /I %asw_03b%==n goto ONCEMORE2
if /I %asw_03b%==g goto INST_03gk
if /I %asw_03b%==d goto INST_03gk
if /I %asw_03b%==e goto INST_03ek
if /I %asw_03b%==m goto INST_03em
goto INST_03gk
:ONCEMORE2
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_03--5.txt) do echo %%t
echo.
goto ONCEMORE

:INST_03gk
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_03--6.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\03gk.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_03_name%" "config\%INST_03_name%" >nul
xcopy /E /Y /I "choose\config_all\bin" "config\bin" >nul
echo. >> tweaks.txt
goto INST_03what

:INST_03ek
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_03--7.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\03gk.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_03_name%" "config\%INST_03_name%" >nul
xcopy /E /Y /I "choose\config_all\bin" "config\bin" >nul
echo. >> tweaks.txt
for %%f in (choose\03ek.txt) do type %%f >> tweaks.txt
goto INST_03what

:INST_03em
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_03--8.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\03gk.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_03_name%" "config\%INST_03_name%" >nul
xcopy /E /Y /I "choose\config_all\bin" "config\bin" >nul
echo. >> tweaks.txt
for %%f in (choose\03em.txt) do type %%f >> tweaks.txt

:INST_03what
echo.
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_03--9.txt) do echo %%t
echo.
:NOCHMAL
set asw_03what=0
echo.
set /p asw_03what=" (b) / (s)speedometer / (m)edia player ? "
if /I %asw_03what%==0 goto NOCHMAL2
if /I %asw_03what%==j goto NOCHMAL2
if /I %asw_03what%==y goto NOCHMAL2
if /I %asw_03what%==n goto NOCHMAL2
if /I %asw_03what%==b goto INST_03b
if /I %asw_03what%==s goto INST_03s
if /I %asw_03what%==m goto INST_03p
if /I %asw_03what%==p goto INST_03p
goto INST_04
:NOCHMAL2
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_03--10.txt) do echo %%t
echo.
goto NOCHMAL

:INST_03b
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_03--11.txt) do echo %%t
ping -4 127.0.0.1 > NUL
echo. >> tweaks.txt
goto INST_04

:: Only speedometer
:INST_03s
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_03--12.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\03s.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
goto INST_04

:: Only media player
:INST_03p
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_03--13.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\03p.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
goto INST_04


:: ******************************************************************
:: * Install date_to_statusbar_mod_by_diginix_v2.1
:: ******************************************************************
:INST_04
cls
mode 80,10
color 0a
set INST_04_name="date-to-statusbar_mod"
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_04--1.txt) do echo %%t
set asw_04=0
echo.
set /p asw_04="(y)es / (j)a / (n)o? "
if /I %asw_04%==0 goto INST_05
if /I %asw_04%==n goto INST_05
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_04--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\04.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_04_name%" "config\%INST_04_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Install custom infotainment colors
:: ******************************************************************
:INST_05
cls
mode 80,50
color 0c
set asw_05f=0
set INST_05_name="color-schemes"
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--1.txt) do echo %%t
set asw_05=0
echo.
set /p asw_05="(y)es / (j)a / (n)o? "
if /I %asw_05%==0 goto INST_02_05
if /I %asw_05%==n goto INST_02_05
echo.
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--2.txt) do echo %%t
echo.
:AGAIN
set asw_05f=0
set /p asw_05f="1 / 2 / 3 / 4 / 5 / 6 / 7: "
if /I %asw_05f%==0 goto AGAIN2
if /I %asw_05f%==j goto AGAIN2
if /I %asw_05f%==y goto AGAIN2
if /I %asw_05f%==n goto AGAIN2
if /I %asw_05f%==b goto AGAIN2
if /I %asw_05f%==g goto AGAIN2
if /I %asw_05f%==o goto AGAIN2
if /I %asw_05f%==p goto AGAIN2
if /I %asw_05f%==l goto AGAIN2
if /I %asw_05f%==s goto AGAIN2
if /I %asw_05f%==1 goto INST_05f1
if /I %asw_05f%==2 goto INST_05f2
if /I %asw_05f%==3 goto INST_05f3
if /I %asw_05f%==4 goto INST_05f4
if /I %asw_05f%==5 goto INST_05f5
if /I %asw_05f%==6 goto INST_05f6
if /I %asw_05f%==7 goto INST_05f7
goto INST_06
:AGAIN2
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--3.txt) do echo %%t
goto AGAIN

:: Blue
:INST_05f1
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--4.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--5.txt) do echo %%t
xcopy /E /Y /I "choose\config_all\%INST_05_name%\blue" "config\%INST_05_name%\blue" >nul
echo # Blue scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/blue/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_blue.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_blue.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05

:: Green
:INST_05f2
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--6.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--5.txt) do echo %%t
xcopy /E /Y /I "choose\config_all\%INST_05_name%\green" "config\%INST_05_name%\green" >nul
echo # Green scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/green/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_green.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_green.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05

:: orange
:INST_05f3
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--7.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--5.txt) do echo %%t
xcopy /E /Y /I "choose\config_all\%INST_05_name%\orange" "config\%INST_05_name%\orange" >nul
echo # Orange scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/orange/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_orange.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_orange.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05

:: pink
:INST_05f4
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--8.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--5.txt) do echo %%t
xcopy /E /Y /I "choose\config_all\%INST_05_name%\pink" "config\%INST_05_name%\pink" >nul
echo # Pink scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/pink/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_pink.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_pink.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05

:: purple
:INST_05f5
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--9.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--5.txt) do echo %%t
xcopy /E /Y /I "choose\config_all\%INST_05_name%\purple" "config\%INST_05_name%\purple" >nul
echo # Purple scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/purple/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_purple.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_purple.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05

:: silver
:INST_05f6
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--10.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--9.txt) do echo %%t
xcopy /E /Y /I "choose\config_all\%INST_05_name%\silver" "config\%INST_05_name%\silver" >nul
echo # Silver scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/silver/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_silver.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_silver.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05

:: yellow
:INST_05f7
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--11.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_05--5.txt) do echo %%t
xcopy /E /Y /I "choose\config_all\%INST_05_name%\yellow" "config\%INST_05_name%\yellow" >nul
echo # Yellow scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/yellow/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_yellow.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_yellow.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05


:: ******************************************************************
:: * Install pause on mute
:: ******************************************************************
:INST_06
cls
mode 80,10
color 0a
set INST_06_name="pause-on-mute"
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_06--1.txt) do echo %%t
set asw_06=0
set /p asw_06="(y)es / (j)a / (n)o? "
if /I %asw_06%==0 goto INST_07
if /I %asw_06%==n goto INST_07
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_06--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\06.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_06_name%" "config\%INST_06_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Install semi-transparent parking sensor graphics
:: ******************************************************************
:INST_07
cls
mode 80,10
color 0c
set INST_07_name="transparent-parking-sensor"
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_07--1.txt) do echo %%t
set asw_07=0
echo.
set /p asw_07="(y)es / (j)a / (n)o? "
if /I %asw_07%==0 goto INST_08
if /I %asw_07%==n goto INST_08
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_07--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\07.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_07_name%" "config\%INST_07_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Install list loop
:: ******************************************************************
:INST_08
cls
mode 80,10
color 0a
set INST_08_name="list-loop"
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_08--1.txt) do echo %%t
set asw_08=0
echo.
set /p asw_08="(y)es / (j)a / (n)o? "
if /I %asw_08%==0 goto INST_09
if /I %asw_08%==n goto INST_09
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_08--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\08.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_08_name%" "config\%INST_08_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Install main menu loop
:: ******************************************************************
:INST_09
cls
mode 80,10
color 0c
set INST_09_name="main-menu-loop"
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_09--1.txt) do echo %%t
set asw_09=0
echo.
set /p asw_09="(y)es / (j)a / (n)o? "
if /I %asw_09%==0 goto INST_10
if /I %asw_09%==n goto INST_10
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_09--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\09.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_09_name%" "config\%INST_09_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Install no more disclaimer
:: ******************************************************************
:INST_10
cls
mode 80,10
color 0a
set INST_10_name="no_More_Disclaimer"
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_10--1.txt) do echo %%t
set asw_10=0
echo.
set /p asw_10="(y)es / (j)a / (n)o? "
if /I %asw_10%==0 goto INST_11
if /I %asw_10%==n goto INST_11
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_10--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\10.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_10_name%" "config\%INST_10_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Install media order patching
:: ******************************************************************
:INST_11
cls
mode 80,10
color 0c
set INST_11_name="media-order-patching"
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_11--1.txt) do echo %%t
set asw_11=0
echo.
set /p asw_11="(y)es / (j)a / (n)o? "
if /I %asw_11%==0 goto INST_12
if /I %asw_11%==n goto INST_12
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_11--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\11.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_11_name%" "config\%INST_11_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Change order of the audio source list
:: ******************************************************************
:INST_12
cls
mode 80,10
color 0a
set INST_12_name="change_audio_order"
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_12--1.txt) do echo %%t
set asw_12=0
echo.
set /p asw_12="(y)es / (j)a / (n)o? "
if /I %asw_12%==0 goto INST_13
if /I %asw_12%==n goto INST_13
if /I %asw_10%==0 goto INST_12b
if /I %asw_10%==n goto INST_12b

:: with no-more-disclaimer tweak
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_12--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\12a.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_12_name%" "config\%INST_12_name%" >nul
echo. >> tweaks.txt
goto INST_13

:: without no-more-disclaimer tweak
:INST_12b
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_12--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\12b.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_12_name%" "config\%INST_12_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Install speedcam patch
:: ******************************************************************
:INST_13
cls
mode 80,30
color 0c
set INST_13_name="german_speedcams"
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_13--1.txt) do echo %%t
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_13--2.txt) do echo %%t
:REPEAT
set asw_13=0
echo.
set /p asw_13=" (1) / (2) / (3) / (4)   or (n)o? "
if /I %asw_13%==0 goto REPEAT2
if /I %asw_13%==j goto REPEAT2
if /I %asw_13%==y goto REPEAT2
if /I %asw_13%==n goto END
if /I %asw_13%==1 goto INST_13a
if /I %asw_13%==2 goto INST_13b
if /I %asw_13%==3 goto INST_13c
if /I %asw_13%==4 goto INST_13e
goto END
:REPEAT2
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_13--3.txt) do echo %%t
echo.
goto REPEAT

:INST_13a
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_13--4.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\13a.txt) do type %%f >> tweaks.txt
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_13--5.txt) do echo %%t
xcopy /E /Y /I "choose\config_all\%INST_13_name%" "config\%INST_13_name%" >nul
echo. >> tweaks.txt
goto END

:INST_13b
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_13--6.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\13b.txt) do type %%f >> tweaks.txt
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_13--5.txt) do echo %%t
xcopy /E /Y /I "choose\config_all\%INST_13_name%" "config\%INST_13_name%" >nul
echo. >> tweaks.txt
goto END

:INST_13c
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_13--7.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\13c.txt) do type %%f >> tweaks.txt
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_13--5.txt) do echo %%t
xcopy /E /Y /I "choose\config_all\%INST_13_name%" "config\%INST_13_name%" >nul
echo. >> tweaks.txt
goto END

:INST_13e
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_13--8.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\13e.txt) do type %%f >> tweaks.txt
for /F "delims=" %%t in (choose\lang\%CountryCode%\INST_13--5.txt) do echo %%t
xcopy /E /Y /I "choose\config_all\%INST_13_name%" "config\%INST_13_name%" >nul
echo. >> tweaks.txt
goto END




:: ******************************************************************
:: *
:: * Begin deinstallations
:: *
:: ******************************************************************
:DEINST_01
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_01--1.txt) do echo %%t
for %%f in (choose\01b.txt) do type %%f > tweaks.txt
if %asw%==4 for %%f in (choose\00.txt) do type %%f >> tweaks.txt
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_01--2.txt) do echo %%t
if exist config for /D %%a in ("config") do rd /q /s "%%a" >NUL
if exist config_org for /D %%a in ("config_org") do rd /q /s "%%a" >NUL
if exist _copy_content_to_root_of_fat32_usb_stick for /D %%a in ("_copy_content_to_root_of_fat32_usb_stick") do rd /q /s "%%a" >NUL
md config_org >nul
ping -4 127.0.0.1 > NUL
echo. >> tweaks.txt


:: ******************************************************************
:: * Touchscreen disable
:: ******************************************************************
:DEINST_02_01
cls
mode 80,57
color 0b
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_02_01--1.txt) do echo %%t
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_02_01--2.txt) do echo %%t
set asw_02_1=0
echo.
set /p asw_02_1="(y)es / (j)a / (n)o? "
if /I %asw_02_1%==0 goto DEINST_02_02
if /I %asw_02_1%==n goto DEINST_02_02
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_02_01--3.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_01d.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt

:: ******************************************************************
:: * Restore disclaimer time to normal
:: ******************************************************************
:DEINST_02_02
echo.
echo.
set DEINST_02_02_name="restore_audio_order_and_disclaimer"
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_02_02--1.txt) do echo %%t
echo.
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_02_02--2.txt) do echo %%t
set asw_02_2=0
echo.
set /p asw_02_2="(y)es / (j)a / (n)o? "
if /I %asw_02_2%==0 goto DEINST_02_03
if /I %asw_02_2%==n goto DEINST_02_03
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_02_02--3.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_02d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_02_02_name%" "config_org\%DEINST_02_02_name%" >nul
echo. >> tweaks.txt

:: ******************************************************************
:: * Restore the safety warning label from the reverse camera
:: ******************************************************************
:DEINST_02_03
echo.
echo.
set DEINST_02_03_name="safety-warning-reverse-camera"
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_02_03--1.txt) do echo %%t

set asw_02_3=0
echo.
set /p asw_02_3="(y)es / (j)a / (n)o? "
if /I %asw_02_3%==0 goto DEINST_02_04
if /I %asw_02_3%==n goto DEINST_02_04
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_02_03--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_03d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_02_03_name%" "config_org\%DEINST_02_03_name%" >nul
echo. >> tweaks.txt

:: ******************************************************************
:: * Restore the blank album art frame
:: ******************************************************************
:DEINST_02_04
echo.
echo.
set DEINST_02_04_name="restore-blank-album-art-frame"
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_02_04--1.txt) do echo %%t
set asw_02_4=0
echo.
set /p asw_02_4="(y)es / (j)a / (n)o? "
if /I %asw_02_4%==0 goto DEINST_02_05
if /I %asw_02_4%==n goto DEINST_02_05
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_02_04--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_04d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_02_04_name%" "config_org\%DEINST_02_04_name%" >nul
echo. >> tweaks.txt

:: ******************************************************************
:: * Change the background image back to original
:: ******************************************************************
:DEINST_02_05
echo.
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_02_05--1.txt) do echo %%t
set asw_02_5=0
echo.
set /p asw_02_5="(y)es / (j)a / (n)o? "
if /I %asw_02_5%==0 goto DEINST_03
if /I %asw_02_5%==n goto DEINST_03
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_02_05--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_05d.txt) do type %%f >> tweaks.txt
xcopy /Y "choose\config_org_all\background.png" "config_org\" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Remove speed-Video-Reboot_Tweak_mod_by_diginix
:: ******************************************************************
:DEINST_03
cls
mode 80,25
color 0d
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_03--1.txt) do echo %%t
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_03--2.txt) do echo %%t
set asw_03=0
echo.
set /p asw_03="(y)es / (j)a / (n)o? "
if /I %asw_03%==0 goto DEINST_04
if /I %asw_03%==n goto DEINST_04
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_03--3.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\03d.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt


:: ******************************************************************
:: * Remove Date_to_statusbar_mod_by_diginix
:: ******************************************************************
:DEINST_04
cls
mode 80,10
color 0b
set DEINST_04_name="date-to-statusbar_mod"
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_04--1.txt) do echo %%t
set asw_04=0
echo.
set /p asw_04="(y)es / (j)a / (n)o? "
if /I %asw_04%==0 goto DEINST_05
if /I %asw_04%==n goto DEINST_05
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_04--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\04d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_04_name%" "config_org\%DEINST_04_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Remove custom infotainment colors
:: ******************************************************************
:DEINST_05
cls
mode 80,10
color 0d
set DEINST_05_name="color-schemes"
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_05--1.txt) do echo %%t
set asw_05=0
echo.
set /p asw_05="(y)es / (j)a / (n)o? "
if /I %asw_05%==0 goto DEINST_06
if /I %asw_05%==n goto DEINST_06
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_05--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\05d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_05_name%" "config_org\%DEINST_05_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Remove pause on mute
:: ******************************************************************
:DEINST_06
cls
mode 80,10
color 0b
set DEINST_06_name="pause-on-mute"
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_06--1.txt) do echo %%t
set asw_06=0
echo.
set /p asw_06="(y)es / (j)a / (n)o? "
if /I %asw_06%==0 goto DEINST_07
if /I %asw_06%==n goto DEINST_07
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_06--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\06d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_06_name%" "config_org\%DEINST_06_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Remove semi-transparent parking sensor graphics for the proximity sensors
:: ******************************************************************
:DEINST_07
cls
mode 80,10
color 0d
set DEINST_07_name="transparent-parking-sensor"
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_07--1.txt) do echo %%t
set asw_07=0
echo.
set /p asw_07="(y)es / (j)a / (n)o? "
if /I %asw_07%==0 goto DEINST_08
if /I %asw_07%==n goto DEINST_08
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_07--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\07d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_07_name%" "config_org\%DEINST_07_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Remove list loop
:: ******************************************************************
:DEINST_08
cls
mode 80,10
color 0b
set DEINST_08_name="list-loop"
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_08--1.txt) do echo %%t
set asw_08=0
echo.
set /p asw_08="(y)es / (j)a / (n)o? "
if /I %asw_08%==0 goto DEINST_09
if /I %asw_08%==n goto DEINST_09
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_08--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\08d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_08_name%" "config_org\%DEINST_08_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Remove main menu loop
:: ******************************************************************
:DEINST_09
cls
mode 80,10
color 0d
set DEINST_09_name="main-menu-loop"
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_09--1.txt) do echo %%t
set asw_09=0
echo.
set /p asw_09="(y)es / (j)a / (n)o? "
if /I %asw_09%==0 goto DEINST_11
if /I %asw_09%==n goto DEINST_11
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_09--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\09d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_09_name%" "config_org\%DEINST_09_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Remove media order patching
:: ******************************************************************
:DEINST_11
cls
mode 80,10
color 0b
set DEINST_11_name="media-order-patching"
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_11--1.txt) do echo %%t
set asw_11=0
echo.
set /p asw_11="(y)es / (j)a / (n)o? "
if /I %asw_11%==0 goto DEINST_13
if /I %asw_11%==n goto DEINST_13
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_11--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\11d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_11_name%" "config_org\%DEINST_11_name%" >nul
echo. >> tweaks.txt


:: ******************************************************************
:: * Remove speedcam patch (56.00.230A)
:: ******************************************************************
:DEINST_13
cls
mode 80,10
color 0d
set DEINST_13_name="german_speedcams"
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_13--1.txt) do echo %%t
set asw_13=0
echo.
set /p asw_13="(y)es / (j)a / (n)o? "
if /I %asw_13%==0 goto END2
if /I %asw_13%==n goto END2
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\DEINST_13--2.txt) do echo %%t
ping -4 127.0.0.1 > NUL
for %%f in (choose\13d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_13_name%" "config_org\%DEINST_13_name%" >nul
echo. >> tweaks.txt
goto END2



:: ******************************************************************
:: * End installation
:: ******************************************************************
:END
for %%f in (choose\14.txt) do type %%f >> tweaks.txt
choose\dos2unix -n tweaks.txt tweaks.sh
del tweaks.txt
cls
mode 80,55
color 09
for /F "delims=" %%t in (choose\lang\%CountryCode%\end--inst.txt) do echo %%t
echo.
echo.
if %asw%==3 for /F "delims=" %%t in (choose\lang\%CountryCode%\end--1.txt) do echo %%t
if %asw%==3 echo.

if /I %asw_02_1%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--2.txt) do echo %%t
if /I %asw_02_1%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--2.txt) do echo %%t
if /I %asw_02_1%==j echo.
if /I %asw_02_1%==y echo.

if /I %asw_02_2%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--3.txt) do echo %%t
if /I %asw_02_2%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--3.txt) do echo %%t
if /I %asw_02_2%==j echo.
if /I %asw_02_2%==y echo.

if /I %asw_02_3%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--4.txt) do echo %%t
if /I %asw_02_3%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--4.txt) do echo %%t
if /I %asw_02_3%==j echo.
if /I %asw_02_3%==y echo.

if /I %asw_02_4%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--5.txt) do echo %%t
if /I %asw_02_4%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--5.txt) do echo %%t
if /I %asw_02_4%==j echo.
if /I %asw_02_4%==y echo.

if /I %asw_02_5%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--6.txt) do echo %%t
if /I %asw_02_5%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--6.txt) do echo %%t
if /I %asw_02_5%==j echo.
if /I %asw_02_5%==y echo.

if /I %asw_03%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--7.txt) do echo %%t
if /I %asw_03%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--7.txt) do echo %%t
if /I %asw_03b%==g for /F "delims=" %%t in (choose\lang\%CountryCode%\end--7a.txt) do echo %%t
if /I %asw_03b%==d for /F "delims=" %%t in (choose\lang\%CountryCode%\end--7a.txt) do echo %%t
if /I %asw_03b%==e for /F "delims=" %%t in (choose\lang\%CountryCode%\end--7b.txt) do echo %%t
if /I %asw_03b%==m for /F "delims=" %%t in (choose\lang\%CountryCode%\end--7c.txt) do echo %%t
if /I %asw_03what%==b for /F "delims=" %%t in (choose\lang\%CountryCode%\end--7d.txt) do echo %%t
if /I %asw_03what%==s for /F "delims=" %%t in (choose\lang\%CountryCode%\end--7e.txt) do echo %%t
if /I %asw_03what%==m for /F "delims=" %%t in (choose\lang\%CountryCode%\end--7f.txt) do echo %%t
if /I %asw_03what%==p for /F "delims=" %%t in (choose\lang\%CountryCode%\end--7f.txt) do echo %%t
if /I %asw_03%==j echo.
if /I %asw_03%==y echo.

if /I %asw_04%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--8.txt) do echo %%t
if /I %asw_04%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--8.txt) do echo %%t
if /I %asw_04%==j echo.
if /I %asw_04%==y echo.

if /I %asw_05%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--9.txt) do echo %%t
if /I %asw_05%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--9.txt) do echo %%t
if /I %asw_05f%==1 for /F "delims=" %%t in (choose\lang\%CountryCode%\end--9a.txt) do echo %%t
if /I %asw_05f%==2 for /F "delims=" %%t in (choose\lang\%CountryCode%\end--9b.txt) do echo %%t
if /I %asw_05f%==3 for /F "delims=" %%t in (choose\lang\%CountryCode%\end--9c.txt) do echo %%t
if /I %asw_05f%==4 for /F "delims=" %%t in (choose\lang\%CountryCode%\end--9d.txt) do echo %%t
if /I %asw_05f%==5 for /F "delims=" %%t in (choose\lang\%CountryCode%\end--9e.txt) do echo %%t
if /I %asw_05f%==6 for /F "delims=" %%t in (choose\lang\%CountryCode%\end--9f.txt) do echo %%t
if /I %asw_05f%==7 for /F "delims=" %%t in (choose\lang\%CountryCode%\end--9g.txt) do echo %%t
if /I %asw_05%==j echo.
if /I %asw_05%==y echo.

if /I %asw_06%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--10.txt) do echo %%t
if /I %asw_06%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--10.txt) do echo %%t
if /I %asw_06%==j echo.
if /I %asw_06%==y echo.

if /I %asw_07%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--11.txt) do echo %%t
if /I %asw_07%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--11.txt) do echo %%t
if /I %asw_07%==j echo.
if /I %asw_07%==y echo.

if /I %asw_08%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--12.txt) do echo %%t
if /I %asw_08%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--12.txt) do echo %%t
if /I %asw_08%==j echo.
if /I %asw_08%==y echo.

if /I %asw_09%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--13.txt) do echo %%t
if /I %asw_09%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--13.txt) do echo %%t
if /I %asw_09%==j echo.
if /I %asw_09%==y echo.

if /I %asw_10%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--14.txt) do echo %%t
if /I %asw_10%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--14.txt) do echo %%t
if /I %asw_10%==j echo.
if /I %asw_10%==y echo.

if /I %asw_11%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--15.txt) do echo %%t
if /I %asw_11%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--15.txt) do echo %%t
if /I %asw_11%==j echo.
if /I %asw_11%==y echo.

if /I %asw_12%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end--16.txt) do echo %%t
if /I %asw_12%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end--16.txt) do echo %%t
if /I %asw_12%==j echo.
if /I %asw_12%==y echo.

if /I %asw_13%==1 for /F "delims=" %%t in (choose\lang\%CountryCode%\end--17a.txt) do echo %%t
if /I %asw_13%==2 for /F "delims=" %%t in (choose\lang\%CountryCode%\end--17b.txt) do echo %%t
if /I %asw_13%==3 for /F "delims=" %%t in (choose\lang\%CountryCode%\end--17c.txt) do echo %%t
if /I %asw_13%==4 for /F "delims=" %%t in (choose\lang\%CountryCode%\end--17d.txt) do echo %%t
if /I %asw_13%==j echo.
if /I %asw_13%==y echo.
echo.
echo.
pause
goto END_copy



:: ******************************************************************
:: *
:: * End deinstallation
:: *
:: ******************************************************************
:END2
for %%f in (choose\14d.txt) do type %%f >> tweaks.txt
choose\dos2unix -n tweaks.txt tweaks.sh
del tweaks.txt
cls
mode 80,55
color 09
for /F "delims=" %%t in (choose\lang\%CountryCode%\end--deinst.txt) do echo %%t
echo.
echo.
if %asw%==4 for /F "delims=" %%t in (choose\lang\%CountryCode%\end--1.txt) do echo %%t
if %asw%==4 echo.

if /I %asw_02_1%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--2.txt) do echo %%t
if /I %asw_02_1%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--2.txt) do echo %%t
if /I %asw_02_1%==j echo.
if /I %asw_02_1%==y echo.

if /I %asw_02_2%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--3.txt) do echo %%t
if /I %asw_02_2%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--3.txt) do echo %%t
if /I %asw_02_2%==j echo.
if /I %asw_02_2%==y echo.

if /I %asw_02_3%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--4.txt) do echo %%t
if /I %asw_02_3%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--4.txt) do echo %%t
if /I %asw_02_3%==j echo.
if /I %asw_02_3%==y echo.

if /I %asw_02_4%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--5.txt) do echo %%t
if /I %asw_02_4%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--5.txt) do echo %%t
if /I %asw_02_4%==j echo.
if /I %asw_02_4%==y echo.

if /I %asw_02_5%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--6.txt) do echo %%t
if /I %asw_02_5%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--6.txt) do echo %%t
if /I %asw_02_5%==j echo.
if /I %asw_02_5%==y echo.

if /I %asw_03%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--7.txt) do echo %%t
if /I %asw_03%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--7.txt) do echo %%t
if /I %asw_03%==j echo.
if /I %asw_03%==y echo.

if /I %asw_04%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--8.txt) do echo %%t
if /I %asw_04%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--8.txt) do echo %%t
if /I %asw_04%==j echo.
if /I %asw_04%==y echo.

if /I %asw_05%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--9.txt) do echo %%t
if /I %asw_05%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--9.txt) do echo %%t
if /I %asw_05%==j echo.
if /I %asw_05%==y echo.

if /I %asw_06%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--10.txt) do echo %%t
if /I %asw_06%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--10.txt) do echo %%t
if /I %asw_06%==j echo.
if /I %asw_06%==y echo.

if /I %asw_07%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--11.txt) do echo %%t
if /I %asw_07%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--11.txt) do echo %%t
if /I %asw_07%==j echo.
if /I %asw_07%==y echo.

if /I %asw_08%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--12.txt) do echo %%t
if /I %asw_08%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--12.txt) do echo %%t
if /I %asw_08%==j echo.
if /I %asw_08%==y echo.

if /I %asw_09%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--13.txt) do echo %%t
if /I %asw_09%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--13.txt) do echo %%t
if /I %asw_09%==j echo.
if /I %asw_09%==y echo.

if /I %asw_11%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--15.txt) do echo %%t
if /I %asw_11%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--15.txt) do echo %%t
if /I %asw_11%==j echo.
if /I %asw_11%==y echo.

if /I %asw_13%==j for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--17.txt) do echo %%t
if /I %asw_13%==y for /F "delims=" %%t in (choose\lang\%CountryCode%\end2--17.txt) do echo %%t
if /I %asw_13%==j echo.
if /I %asw_13%==y echo.

echo.
echo.
pause


:: ******************************************************************
:: * End copy to _copy_content_to_root_of_fat32_usb_stick
:: ******************************************************************
:END_copy
cls
for /F "delims=" %%t in (choose\lang\%CountryCode%\end_copy--1.txt) do echo %%t
set asw_END_copy=0
echo.
echo.
set /p asw_END_copy="(y)es / (j)a / (n)o? "
if %asw_END_copy%==0 goto READY
if /I %asw_END_copy%==n goto READY
echo.
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\end_copy--2.txt) do echo %%t
echo.
wmic logicaldisk where drivetype=2 get deviceid, description
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\end_copy--3.txt) do echo %%t
echo.
set asw_END_copy_lw=0
echo.
set /p asw_END_copy_lw="?: "
echo.
echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\end_copy--4.txt) do echo %%t
:: Check if input was done with or without colon - both possible
echo %asw_END_copy_lw% | findstr /C:":" >nul
set obj_errorlevel=%errorlevel%

if %obj_errorlevel%==1 (
if %asw%==1 xcopy /E /Y /I "config" "%asw_END_copy_lw%:\config" >nul
if %asw%==1 xcopy /Y "choose\root\*" "%asw_END_copy_lw%:\" >nul
if %asw%==1 xcopy /Y tweaks.sh "%asw_END_copy_lw%:" >nul
) else (
if %asw%==1 xcopy /E /Y /I "config" "%asw_END_copy_lw%\config" >nul
if %asw%==1 xcopy /Y "choose\root\*" "%asw_END_copy_lw%\" >nul
if %asw%==1 xcopy /Y tweaks.sh "%asw_END_copy_lw%" >nul
)

if %obj_errorlevel%==1 (
if %asw%==3 xcopy /E /Y /I "config" "%asw_END_copy_lw%:\config" >nul
if %asw%==3 xcopy /Y "choose\root\*" "%asw_END_copy_lw%:\" >nul
if %asw%==3 xcopy /Y tweaks.sh "%asw_END_copy_lw%:" >nul
) else (
if %asw%==3 xcopy /E /Y /I "config" "%asw_END_copy_lw%\config" >nul
if %asw%==3 xcopy /Y "choose\root\*" "%asw_END_copy_lw%\" >nul
if %asw%==3 xcopy /Y tweaks.sh "%asw_END_copy_lw%" >nul
)

if %obj_errorlevel%==1 (
if %asw%==2 xcopy /E /Y /I "config_org" "%asw_END_copy_lw%:\config_org" >nul
if %asw%==2 xcopy /Y "choose\root\*" "%asw_END_copy_lw%:\" >nul
if %asw%==2 xcopy /Y tweaks.sh "%asw_END_copy_lw%:" >nul
) else (
if %asw%==2 xcopy /E /Y /I "config_org" "%asw_END_copy_lw%\config_org" >nul
if %asw%==2 xcopy /Y "choose\root\*" "%asw_END_copy_lw%\" >nul
if %asw%==2 xcopy /Y tweaks.sh "%asw_END_copy_lw%" >nul
)

if %obj_errorlevel%==1 (
if %asw%==4 xcopy /E /Y /I "config_org" "%asw_END_copy_lw%:\config_org" >nul
if %asw%==4 xcopy /Y "choose\root\*" "%asw_END_copy_lw%:\" >nul
if %asw%==4 xcopy /Y tweaks.sh "%asw_END_copy_lw%:" >nul
) else (
if %asw%==4 xcopy /E /Y /I "config_org" "%asw_END_copy_lw%\config_org" >nul
if %asw%==4 xcopy /Y "choose\root\*" "%asw_END_copy_lw%\" >nul
if %asw%==4 xcopy /Y tweaks.sh "%asw_END_copy_lw%" >nul
)

echo.
for /F "delims=" %%t in (choose\lang\%CountryCode%\ready.txt) do echo %%t


:: ******************************************************************
:: * READY to copy to USB drive
:: ******************************************************************
:READY
md _copy_content_to_root_of_fat32_usb_stick

if %asw%==1 move /Y "config" "_copy_content_to_root_of_fat32_usb_stick\" >nul
if %asw%==1 xcopy /Y "choose\root\*" "_copy_content_to_root_of_fat32_usb_stick" >nul
if %asw%==1 move /Y tweaks.sh "_copy_content_to_root_of_fat32_usb_stick" >nul

if %asw%==3 move /Y "config" "_copy_content_to_root_of_fat32_usb_stick\" >nul
if %asw%==3 xcopy /Y "choose\root\*" "_copy_content_to_root_of_fat32_usb_stick" >nul
if %asw%==3 move /Y tweaks.sh "_copy_content_to_root_of_fat32_usb_stick" >nul

if %asw%==2 move /Y "config_org" "_copy_content_to_root_of_fat32_usb_stick\" >nul
if %asw%==2 xcopy /Y "choose\root\*" "_copy_content_to_root_of_fat32_usb_stick" >nul
if %asw%==2 move /Y tweaks.sh "_copy_content_to_root_of_fat32_usb_stick" >nul

if %asw%==4 move /Y "config_org" "_copy_content_to_root_of_fat32_usb_stick\" >nul
if %asw%==4 xcopy /Y "choose\root\*" "_copy_content_to_root_of_fat32_usb_stick" >nul
if %asw%==4 move /Y tweaks.sh "_copy_content_to_root_of_fat32_usb_stick" >nul

echo.
echo.
if %asw_END_copy%==n for /F "delims=" %%t in (choose\lang\%CountryCode%\ready2.txt) do echo %%t
echo.
echo.
pause
exit
