@echo off & setlocal
set version=V1.33
set date=2016-01-29
wmic os get CountryCode,Locale,OSLanguage,Codeset /value>%temp%\CInfo.txt 
for /f "delims=" %%i in ('type %temp%\CInfo.txt') do set "%%i" 
del %temp%\CInfo.txt 

:: Remove the two colons before 'set CountryCode==01' to use this installation script in english,
:: if there are problems with automatic detection
::
:: Die beiden Doppelpunkte vor 'set CountryCode==01' entfernen, um das Script in englisch zu nutzen,
:: falls es Probleme mit der automatischen Erkennung geben sollte (oder Du es gerne in Englisch nutzen moechtest)
::
:: set CountryCode==01

mode 80,25
color 09
set leer=       
if %CountryCode%==49 goto start_de
echo %leer%#####################################################################
echo %leer%####              All-in-one tweak %version% by  Siutsch             ####
echo %leer%####              ==================================             ####
echo %leer%####                         (%date%)                        ####
echo %leer%####                                                             ####
echo %leer%####                        Make a choice:                       ####
echo %leer%####                                                             ####
echo %leer%####  [1] Create USB drive f. installation                       ####
echo %leer%####  [2] Create USB drive f. deinstallation                     ####
echo %leer%####                                                             ####
echo %leer%####  [3] Create USB drive for installation   with full backup   ####
echo %leer%####  [4] Create USB drive for deinstallation with full backup   ####
echo %leer%####                                                             ####
echo %leer%#####################################################################
goto start_en
:start_de
echo %leer%#####################################################################
echo %leer%####              All-in-one tweak %version% von  Siutsch            ####
echo %leer%####              ===================================            ####
echo %leer%####                         (%date%)                        ####
echo %leer%####                                                             ####
echo %leer%####                     Triff Deine Auswahl:                    ####
echo %leer%####                                                             ####
echo %leer%####  [1] Erzeuge USB Stick fuer Installation                    ####
echo %leer%####  [2] Erzeuge USB Stick fuer Deinstallation                  ####
echo %leer%####                                                             ####
echo %leer%####  [3] Erzeuge USB Stick f. Installation   inkl. Voll-Backup  ####
echo %leer%####  [4] Erzeuge USB Stick f. Deinstallation inkl. Voll-Backup  ####
echo %leer%####                                                             ####
echo %leer%#####################################################################
:start_en
echo.
xcopy /E /Y /I "choose\root\*" >nul
set asw=0
set /p asw=" 1 / 2  /  3 / 4? "
if /I %asw%==1 goto INST_01
if /I %asw%==3 goto INST_01
if /I %asw%==2 goto DEINST_01
if /I %asw%==4 goto DEINST_01



:: ******************************************************************
:: Beginn Installation
:: ******************************************************************

:INST_01
echo.
if %CountryCode%==49 goto 01_de
echo %leer%OK. Here are my questions ...
goto 01_en
:01_de
echo %leer%OK. Hier sind meine Fragen ...
:01_en
for %%f in (choose\01.txt) do type %%f > tweaks.txt
if %asw%==2 for %%f in (choose\00.txt) do type %%f >> tweaks.txt
echo.
echo %leer%Clear up config folder first / Bereinige zuerst config Ordner ...
ping -4 127.0.0.1 > NUL
for /D %%a in ("config") do rd /q /s "%%a" >NUL
for /D %%a in ("config_org") do rd /q /s "%%a" >NUL
md config >nul
echo. >> tweaks.txt


:INST_02_01
cls
mode 80,45
color 0a
echo %leer%########################################
echo %leer%####                                ####
echo %leer%####   Tweaks Master Bundle (v55)   ####
echo %leer%####         Installation           ####
echo %leer%####                                ####
echo %leer%########################################
echo.
if %CountryCode%==49 goto 02_01de1
echo Enable the touchscreen while moving?
goto 02_01en1
:02_01de1
echo Touchscreen waehrend der Fahrt aktivieren?
:02_01en1
set asw_02_1=0
echo.
set /p asw_02_1="(y)es / (j)a / (n)o? "
if /I %asw_02_1%==0 goto INST_02_02
if /I %asw_02_1%==n goto INST_02_02
echo.
if %CountryCode%==49 goto 02_01de2
echo %leer%Touchscreen will be always enabled
goto 02_01en2
:02_01de2
echo %leer%Der Touchscreen wird dauerhaft aktiviert
:02_01en2
ping -3 127.0.0.1 > NUL
for %%f in (choose\02_01.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt

:INST_02_02
echo.
echo.
echo.
if %CountryCode%==49 goto 02_02de1
echo Reduce disclaimer time?
echo.
echo (You can completely remove the disclaimer with another tweak, if you want ...)
goto 02_02en1
:02_02de1
echo Die Disclaimer-Zeit reduzieren?
echo.
echo (Der Disclaimer kann mit einem weiteren Tweak auch komplett entfernt werden ...)
:02_02en1
echo.
set asw_02_2=0
echo.
set /p asw_02_2="(y)es / (j)a / (n)o? "
if /I %asw_02_2%==0 goto INST_02_03
if /I %asw_02_2%==n goto INST_02_03
echo.
if %CountryCode%==49 goto 02_02de2
echo %leer%Disclaimer time will be reduced from 3,5 seconds to 0,5 seconds
goto 02_02en2
:02_02de2
echo %leer%Der Disclaimer wird nur 0,5 Sekunden, statt 3,5 Sekunden eingeblendet.
:02_02en2
ping -3 127.0.0.1 > NUL
for %%f in (choose\02_02.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt

:INST_02_03
echo.
echo.
echo.
set INST_02_03_name="safety-warning-reverse-camera"
if %CountryCode%==49 goto 02_03de1
echo Remove the safety warning label from the reverse camera?
goto 02_03en1
:02_03de1
echo Soll die Sicherheitswarnung der Rueckfahrkamera entfernet werden?
:02_03en1
set asw_02_3=0
echo.
set /p asw_02_3="(y)es / (j)a / (n)o? "
if /I %asw_02_3%==0 goto INST_02_04
if /I %asw_02_3%==n goto INST_02_04
echo.
if %CountryCode%==49 goto 02_03de2
echo %leer%Now you have a bigger rear view screen
goto 02_03en2
:02_03de2
echo %leer%Nun ist Dein Bildausschnitt der Rueckfahr-Kamera groesser.
:02_03en2
ping -3 127.0.0.1 > NUL
for %%f in (choose\02_03.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_02_03_name%" "config\%INST_02_03_name%" >nul
echo. >> tweaks.txt

:INST_02_04
echo.
echo.
echo.
set INST_02_04_name="remove-blank-album-art-frame"
if %CountryCode%==49 goto 02_04de1
echo Remove the blank album art frame?
goto 02_04en1
:02_04de1
echo Soll der leere Album-Cover Rahmen entfernt werden?
:02_04en1
set asw_02_4=0
echo.
set /p asw_02_4="(y)es / (j)a / (n)o? "
if /I %asw_02_4%==0 goto INST_03
if /I %asw_02_4%==n goto INST_03
echo.
if %CountryCode%==49 goto 02_04de2
echo %leer%No unnecessary empty frame anymore ...
goto 02_04en2
:02_04de2
echo %leer%Es wird kein unnoetiger leerer Cover-Rahmen mehr angezeigt.
:02_04en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_04.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_02_04_name%" "config\%INST_02_04_name%" >nul
echo. >> tweaks.txt
goto INST_03


:: Change of background image will be done after custom infotainment colors after INST_05
:INST_02_05
echo.
echo.
echo.
if %CountryCode%==49 goto 02_05de1
echo Change to an individual background image?
echo.
echo (Please change file 'background.png' in folder 'config' before)
if /I %asw_05%==0 goto 02_05en1
if /I %asw_05%==n goto 02_05en1
echo.
echo.
echo The one from custom infotainment colors will be overwritten again!
goto 02_05en1
:02_05de1
echo Moechtest Du ein individuelles Hintergrundbild kopieren?
echo.
echo (Bitte im Verzeichnis 'config' vorher die Datei 'background.png' austauschen)
if /I %asw_05%==0 goto 02_05en1
if /I %asw_05%==n goto 02_05en1
echo.
echo.
echo Das des individuellen Farbschemas wird dadurch nun wieder ueberschrieben!
:02_05en1
echo.
set asw_02_5=0
echo.
set /p asw_02_5="(y)es / (j)a / (n)o? "
if /I %asw_02_5%==0 goto INST_06
if /I %asw_02_5%==n goto INST_06
echo.
if %CountryCode%==49 goto 02_05de2
echo %leer%I hope you have selected a beautiful one
goto 02_05en2
:02_05de2
echo %leer%Ich hoffe, Du hast Dir ein schoenes ausgesucht
:02_05en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_05.txt) do type %%f >> tweaks.txt
xcopy /Y "choose\config_all\background.png" "config\" >nul
echo. >> tweaks.txt
goto INST_06


:INST_03
cls
mode 80,50
color 0c
set asw_03b==0
set asw_03what==0
set INST_03_name="speed-video-reboot"
if %CountryCode%==49 goto 03de1
echo %leer%########################################################
echo %leer%####                                                ####
echo %leer%####  Speed-video-reboot_tweak_v3.5_mod_by_diginix  ####
echo %leer%####                                                ####
echo %leer%####       different installation types for         ####
echo %leer%####         german / english / kph / mph           ####
echo %leer%####                                                ####
echo %leer%####      - speedometer  (individually possible)    ####
echo %leer%####      - media player (individually possible)    ####
echo %leer%####      - reboot button                           ####
echo %leer%####                                                ####
echo %leer%########################################################
goto 03en1
:03de1
echo %leer%########################################################
echo %leer%####                                                ####
echo %leer%####  Speed-video-reboot_tweak_v3.5_mod_by_diginix  ####
echo %leer%####                                                ####
echo %leer%####   Verschiedene Installationen moeglich fuer    ####
echo %leer%####         deutsch / englisch / kph / mph         ####
echo %leer%####                                                ####
echo %leer%####     - Speedometer  (auch einzeln moeglich)     ####
echo %leer%####     - Media player (auch einzeln moeglich)     ####
echo %leer%####     - Reboot button                            ####
echo %leer%####                                                ####
echo %leer%########################################################
:03en1
echo.
if %CountryCode%==49 goto 03de2
echo Install "speed-video-reboot_tweak_mod_by_diginix"?
goto 03en2
:03de2
echo "Speed-video-reboot_tweak_mod_by_diginix" installieren?
:03en2
set asw_03=0
echo.
set /p asw_03="(y)es / (j)a / (n)o? "
if /I %asw_03%==0 goto INST_04
if /I %asw_03%==n goto INST_04
echo.
if %CountryCode%==49 goto 03de3
echo %leer%Yeah! Good choice! Now, which version do you want?
goto 03en3
:03de3
echo %leer%Jo! Gute Wahl. Welche Version soll installiert werden?
:03en3
ping -4 127.0.0.1 > NUL
echo.
echo.
if %CountryCode%==49 goto 03de4
echo %leer%########################################################
echo %leer%####                                                ####
echo %leer%####   [g]  german  version (km per hour)           ####
echo %leer%####   [e]  english version (km per hour)           ####
echo %leer%####   [m]  english version (miles per hour)        ####
echo %leer%####                                                ####
echo %leer%####   (reboot button is always visible)            ####
echo %leer%####                                                ####
echo %leer%########################################################
goto 03en4
:03de4
echo %leer%########################################################
echo %leer%####                                                ####
echo %leer%####   [g]  Deutsche Version (km pro Stunde)        ####
echo %leer%####   [e]  Englisch Version (km pro Stunde)        ####
echo %leer%####   [m]  Englisch Version (Meilen pro Stunde)    ####
echo %leer%####                                                ####
echo %leer%####   (Der Reboot Button ist immer sichtbar)       ####
echo %leer%####                                                ####
echo %leer%########################################################
:03en4
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
if /I %asw_03b%==e goto INST_03ek
if /I %asw_03b%==m goto INST_03em
goto INST_03gk
:ONCEMORE2
if %CountryCode%==49 goto 03de5
echo No! Please choose the right version!
goto 03en5
:03de5
echo Nein! Bitte waehle die richtige Version!
:03en5
echo.
goto ONCEMORE

:INST_03gk
echo.
if %CountryCode%==49 goto 03gkde
echo %leer%You get: german version (kmh)
goto 03gken
:03gkde
echo %leer%Du bekommst: deutsche Version (kmh)
:03gken
ping -4 127.0.0.1 > NUL
for %%f in (choose\03gk.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_03_name%" "config\%INST_03_name%" >nul
xcopy /E /Y /I "choose\config_all\bin" "config\bin" >nul
echo. >> tweaks.txt
goto INST_03what

:INST_03ek
echo.
if %CountryCode%==49 goto 03ekde
echo %leer%You get: english version (kmh)
goto 03eken
:03ekde
echo %leer%Du bekommst: englische Version (kmh)
:03eken
ping -4 127.0.0.1 > NUL
for %%f in (choose\03gk.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_03_name%" "config\%INST_03_name%" >nul
xcopy /E /Y /I "choose\config_all\bin" "config\bin" >nul
echo. >> tweaks.txt
for %%f in (choose\03ek.txt) do type %%f >> tweaks.txt
goto INST_03what

:INST_03em
echo.
if %CountryCode%==49 goto 03emde
echo %leer%You get: english version (mph)
goto 03emen
:03emde
echo %leer%Du bekommst: englische Version (mph)
:03emen
ping -4 127.0.0.1 > NUL
for %%f in (choose\03gk.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_03_name%" "config\%INST_03_name%" >nul
xcopy /E /Y /I "choose\config_all\bin" "config\bin" >nul
echo. >> tweaks.txt
for %%f in (choose\03em.txt) do type %%f >> tweaks.txt

:INST_03what
echo.
echo.
if %CountryCode%==49 goto 03whatde1
echo %leer%#######################################
echo %leer%####                               ####
echo %leer%####  [b] both                     ####
echo %leer%####  [s] speedometer only         #### 
echo %leer%####  [m] media player only        ####
echo %leer%####                               ####
echo %leer%#######################################
goto 03whaten1
:03whatde1
echo %leer%#######################################
echo %leer%####                               ####
echo %leer%####  [b] Beide                    ####
echo %leer%####  [s] Nur Speedometer          #### 
echo %leer%####  [m] Nur Media Player         ####
echo %leer%####                               ####
echo %leer%#######################################
:03whaten1
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
if %CountryCode%==49 goto 03whatde2
echo No! Take the right choice!
goto 03whaten2
:03whatde2
echo Nein! Triff die richtige Wahl!
:03whaten2
echo.
goto NOCHMAL

:INST_03b
echo.
if %CountryCode%==49 goto 03de
echo %leer%You get everything!
goto 03en
:03de
echo %leer%Du bekommst alles!
:03en
ping -4 127.0.0.1 > NUL
echo. >> tweaks.txt
goto INST_04

:INST_03s
echo.
if %CountryCode%==49 goto 03sde
echo %leer%Only the speedometer, as you command, Sir!
goto 03sen
:03sde
echo %leer%Nur den Speedometer, ganz wie Du wuenscht!
:03sen
ping -4 127.0.0.1 > NUL
for %%f in (choose\03s.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
goto INST_04

:INST_03p
echo.
if %CountryCode%==49 goto 03pde
echo %leer%Only the Media Player, as you like!
goto 03pen
:03pde
echo %leer%Nur den Media Player, so soll es sein!
:03pen
ping -4 127.0.0.1 > NUL
for %%f in (choose\03p.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
goto INST_04


:INST_04
cls
mode 80,10
color 0a
set INST_04_name="date-to-statusbar_mod"
if %CountryCode%==49 goto 04de1
echo Install "date_to_statusbar_mod_by_diginix_v2.1"?
goto 04en1
:04de1
echo "Date_to_statusbar_mod_by_diginix_v2.1" installieren?
:04en1
set asw_04=0
echo.
set /p asw_04="(y)es / (j)a / (n)o? "
if /I %asw_04%==0 goto INST_05
if /I %asw_04%==n goto INST_05
echo.
if %CountryCode%==49 goto 04de2
echo %leer%It looks so much better!
goto 04en2
:04de2
echo %leer%Das sieht wirklich sehr viel besser aus!
:04en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\04.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_04_name%" "config\%INST_04_name%" >nul
echo. >> tweaks.txt


:INST_05
cls
mode 80,50
color 0c
set asw_05f=0
set INST_05_name="color-schemes"
if %CountryCode%==49 goto 05de1
echo %leer%#######################################
echo %leer%####                               ####
echo %leer%####  Custom infotainment colors   #### 
echo %leer%####             with              ####
echo %leer%#### own background image inside   ####
echo %leer%####                               ####
echo %leer%####  blue, green, orange, pink,   ####
echo %leer%####  purple, silver, wellow       ####
echo %leer%####                               ####
echo %leer%#######################################
goto 05en1
:05de1
echo %leer%#########################################
echo %leer%####                                 ####
echo %leer%####   Individuelle Farb Schemas     #### 
echo %leer%####             inkl.               ####
echo %leer%#### farblich passendem Hintergrund  ####
echo %leer%####                                 ####
echo %leer%####  Blau, Gruen, Orange, Pink      ####
echo %leer%####  Lila, Silber, Gelb             ####
echo %leer%####                                 ####
echo %leer%#########################################
:05en1
echo.
set asw_05=0
echo.
set /p asw_05="(y)es / (j)a / (n)o? "
if /I %asw_05%==0 goto INST_02_05
if /I %asw_05%==n goto INST_02_05
echo.
if %CountryCode%==49 goto 05de2
echo %leer%###############################
echo %leer%####                       ####
echo %leer%####  Which color?         ####
echo %leer%####                       ####
echo %leer%####  [1] Blue             ####
echo %leer%####  [2] Green            ####
echo %leer%####  [3] Orange           ####
echo %leer%####  [4] Pink             ####
echo %leer%####  [5] Purple           ####
echo %leer%####  [6] Silver           ####
echo %leer%####  [7] Yellow           ####
echo %leer%####                       ####
echo %leer%###############################
goto 05en2
:05de2
echo %leer%###############################
echo %leer%####                       ####
echo %leer%####  Welche Farbe?        ####
echo %leer%####                       ####
echo %leer%####  [1] Blau             ####
echo %leer%####  [2] Gruen            ####
echo %leer%####  [3] Orange           ####
echo %leer%####  [4] Pink             ####
echo %leer%####  [5] Lila             ####
echo %leer%####  [6] Silber           ####
echo %leer%####  [7] Gelb             ####
echo %leer%####                       ####
echo %leer%###############################
:05en2
echo.
:AGAIN
set asw_05f=0
if %CountryCode%==49 goto 05de3
set /p asw_05f="Please choose color scheme: "
goto 05en3
:05de3
set /p asw_05f="Bitte waehle ein Farb-Schema: "
:05en3
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
if %CountryCode%==49 goto 05de4
echo No! Please choose from 1 to 7 for color scheme!
goto 05en4
:05de4
echo Nein! Bitte waehle zwischen 1 und 7 fuer das Farb-Schema!
:05en4
echo.
goto AGAIN

:INST_05f1
echo.
if %CountryCode%==49 goto 05f1de
echo %leer%Blue, what I nice color!
goto 05f1en
:05f1de
echo %leer%Blau, was fuer eine schoene Farbe!
:05f1en
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
echo Please wait, copying 1200 files with 30 MB ...
xcopy /E /Y /I "choose\config_all\%INST_05_name%\blue" "config\%INST_05_name%\blue" >nul
echo # Blue scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/blue/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_blue.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_blue.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05

:INST_05f2
echo.
if %CountryCode%==49 goto 05f2de
echo %leer%Green? You're a golfer, right?
goto 05f2en
:05f2de
echo %leer%Gruen? Du bist Golfer, oder?
:05f2en
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
echo Please wait, copying 1200 files with 30 MB ...
xcopy /E /Y /I "choose\config_all\%INST_05_name%\green" "config\%INST_05_name%\green" >nul
echo # Green scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/green/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_green.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_green.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05

:INST_05f3
echo.
if %CountryCode%==49 goto 05f3de
echo %leer%Orange, really? Huh ...
goto 05f3en
:05f3de
echo %leer%Orange, wirklich? Huh ...
:05f3en
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
echo Please wait, copying 1200 files with 30 MB ...
xcopy /E /Y /I "choose\config_all\%INST_05_name%\orange" "config\%INST_05_name%\orange" >nul
echo # Orange scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/orange/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_orange.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_orange.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05

:INST_05f4
echo.
if %CountryCode%==49 goto 05f4de
echo %leer%This was your girlfriends wish, be honest!
goto 05f4en
:05f4de
echo %leer%Das war der Wunsch Deiner Freundin, sei ehrlich!
:05f4en
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
echo Please wait, copying 1200 files with 30 MB ...
xcopy /E /Y /I "choose\config_all\%INST_05_name%\pink" "config\%INST_05_name%\pink" >nul
echo # Pink scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/pink/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_pink.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_pink.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05

:INST_05f5
echo.
if %CountryCode%==49 goto 05f5de
echo %leer%Purple. At your service.
goto 05f5en
:05f5de
echo %leer%Lila. Steht's zu Diensten.
:05f5en
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
echo Please wait, copying 1200 files with 30 MB ...
xcopy /E /Y /I "choose\config_all\%INST_05_name%\purple" "config\%INST_05_name%\purple" >nul
echo # Purple scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/purple/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_purple.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_purple.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05

:INST_05f6
echo.
if %CountryCode%==49 goto 05f6de
echo %leer%Silver. Same color as your car, or not?
goto 05f6en
:05f6de
echo %leer%Silber. Dein Auto ist bestimmt auch Silber, oder nicht?
:05f6en
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
echo Please wait, copying 1200 files with 30 MB ...
xcopy /E /Y /I "choose\config_all\%INST_05_name%\silver" "config\%INST_05_name%\silver" >nul
echo # Silver scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/silver/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_silver.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_silver.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05

:INST_05f7
echo.
if %CountryCode%==49 goto 05f7de
echo %leer%Yellow. I think that you'll swap again, yes I do!
goto 05f7en
:05f7de
echo %leer%Gelb. Ich glaube, das wirst Du bald bereuen! Doch, glaube ich wirklich!
:05f7en
ping -4 127.0.0.1 > NUL
for %%f in (choose\05.txt) do type %%f >> tweaks.txt
echo Please wait, copying 1200 files with 30 MB ...
xcopy /E /Y /I "choose\config_all\%INST_05_name%\yellow" "config\%INST_05_name%\yellow" >nul
echo # Yellow scheme >> tweaks.txt
echo cp -R /mnt/sd*/config/color-schemes/yellow/jci / >> tweaks.txt
if /I %asw_03what%==b for %%f in (choose\05_yellow.txt) do type %%f >> tweaks.txt
if /I %asw_03what%==s for %%f in (choose\05_yellow.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt
echo. >> tweaks.txt
goto INST_02_05


:INST_06
cls
mode 80,10
color 0a
set INST_06_name="pause-on-mute"
if %CountryCode%==49 goto 06de1
echo Install "Pause on mute"?
goto 06en1
:06de1
echo "Pause on mute" installieren?
:06en1
set asw_06=0
set /p asw_06="(y)es / (j)a / (n)o? "
if /I %asw_06%==0 goto INST_07
if /I %asw_06%==n goto INST_07
echo.
if %CountryCode%==49 goto 06de2
echo %leer%"Pause on mute" will be installed.
echo %leer%(Why has Mazda not managed this themselves?)
goto 06en2
:06de2
echo %leer%"Pause on mute" wird installiert werden.
echo.
echo %leer%(Warum hat Mazda das eigentlich nicht selbst hin bekommen?)
:06en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\06.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_06_name%" "config\%INST_06_name%" >nul
echo. >> tweaks.txt


:INST_07
cls
mode 80,10
color 0c
set INST_07_name="transparent-parking-sensor"
if %CountryCode%==49 goto 07de1
echo Install "Semi-transparent parking sensor graphics"?
goto 07en1
:07de1
echo Halbtransparente Park-Sensor-Grafiken fuer Naeherungssensoren installieren?
:07en1
set asw_07=0
echo.
set /p asw_07="(y)es / (j)a / (n)o? "
if /I %asw_07%==0 goto INST_08
if /I %asw_07%==n goto INST_08
echo.
if %CountryCode%==49 goto 07de2
echo %leer%Semi-transparent parking sensor graphics will be installed. Good choice!
goto 07en2
:07de2
echo %leer%Halbtransparente Park-Sensor-Grafiken fuer Naeherungssensoren
echo %leer%werden installiert. Gute Wahl!
:07en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\07.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_07_name%" "config\%INST_07_name%" >nul
echo. >> tweaks.txt


:INST_08
cls
mode 80,10
color 0a
set INST_08_name="list-loop"
if %CountryCode%==49 goto 08de1
echo Install "Improved list loop"?
goto 08en1
:08de1
echo "Improved list loop" installieren?
:08en1
set asw_08=0
echo.
set /p asw_08="(y)es / (j)a / (n)o? "
if /I %asw_08%==0 goto INST_09
if /I %asw_08%==n goto INST_09
echo.
if %CountryCode%==49 goto 08de2
echo %leer%Jumps from the end to the beginning end and vice versa now!
goto 08en2
:08de2
echo %leer%Springt nun am Ende wieder zum Anfang und umgekehrt!
:08en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\08.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_08_name%" "config\%INST_08_name%" >nul
echo. >> tweaks.txt


:INST_09
cls
mode 80,10
color 0c
set INST_09_name="main-menu-loop"
if %CountryCode%==49 goto 09de1
echo Install "Main menu loop"?
goto 09en1
:09de1
echo "Main menu loop" installieren?
:09en1
set asw_09=0
echo.
set /p asw_09="(y)es / (j)a / (n)o? "
if /I %asw_09%==0 goto INST_10
if /I %asw_09%==n goto INST_10
echo.
if %CountryCode%==49 goto 09de2
echo %leer%Jumps from left to right and vice versa now!
goto 09en2
:09de2
echo %leer%Springt nun von links nach rechts und umgekehrt!
:09en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\09.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_09_name%" "config\%INST_09_name%" >nul
echo. >> tweaks.txt


:INST_10
cls
mode 80,10
color 0a
set INST_10_name="no_More_Disclaimer"
if %CountryCode%==49 goto 10de1
echo Install "No more disclaimer"?
goto 10en1
:10de1
echo "No more disclaimer" installieren?
:10en1
set asw_10=0
echo.
set /p asw_10="(y)es / (j)a / (n)o? "
if /I %asw_10%==0 goto INST_11
if /I %asw_10%==n goto INST_11
echo.
if %CountryCode%==49 goto 10de2
echo %leer%Yes, away with it!
goto 10en2
:10de2
echo %leer%Jawoll, weg damit!
:10en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\10.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_10_name%" "config\%INST_10_name%"
echo. >> tweaks.txt


:INST_11
cls
mode 80,10
color 0c
set INST_11_name="media-order-patching"
if %CountryCode%==49 goto 11de1
echo Enable "Media order patching"?
goto 11en1
:11de1
echo "Media order patching" aktivieren?
:11en1
set asw_11=0
echo.
set /p asw_11="(y)es / (j)a / (n)o? "
if /I %asw_11%==0 goto INST_12
if /I %asw_11%==n goto INST_12
echo.
if %CountryCode%==49 goto 11de2
echo %leer%Your files should now be sorted alphabetically.
goto 11en2
:11de2
echo %leer%Deine Dateien sollten nun alphabetisch sortiert werden.
:11en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\11.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_11_name%" "config\%INST_11_name%"
echo. >> tweaks.txt


:INST_12
cls
mode 80,10
color 0a
set INST_12_name="change_audio_order"
if %CountryCode%==49 goto 12de1
echo Change order of the audio source list?
goto 12en1
:12de1
echo Die Reihenfolge der Audio Quell Liste sinnvoll anordnen?
:12en1
set asw_12=0
echo.
set /p asw_12="(y)es / (j)a / (n)o? "
if /I %asw_12%==0 goto INST_13
if /I %asw_12%==n goto INST_13
if /I %asw_10%==0 goto INST_12b
if /I %asw_10%==n goto INST_12b
:: with no-more-disclaimer tweak
echo.
if %CountryCode%==49 goto 12de2
echo %leer%Audio source list will be rearranged and sorted useful now.
goto 12en2
:12de2
echo %leer%Die Audio Quell Liste wird nun sinnvoll sortiert.
:12en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\12a.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_12_name%" "config\%INST_12_name%" >nul
echo. >> tweaks.txt
goto INST_13

:INST_12b
:: without no-more-disclaimer tweak
echo.
if %CountryCode%==49 goto 12bde
echo %leer%Audio list will be sorted useful now.
goto 12ben
:12bde
echo %leer%Die Audio Quell Liste wird nun sinnvoll sortiert.
:12ben
ping -4 127.0.0.1 > NUL
for %%f in (choose\12b.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_all\%INST_12_name%" "config\%INST_12_name%" >nul
echo. >> tweaks.txt


:INST_13
cls
mode 80,30
color 0c
set INST_13_name="german_speedcams"
if %CountryCode%==49 goto 13de1
echo %leer%########################################################
echo %leer%####                                                ####
echo %leer%####      Speedcam patch (only for 56.00.230A)      ####
echo %leer%####                                                ####
echo %leer%####                  Databases for                 ####
echo %leer%####                Europe or Germany               ####
echo %leer%####                                                ####
echo %leer%####                 with or without                ####
echo %leer%####                 mobile cameras                 ####
echo %leer%####                                                ####
echo %leer%####   [n] do not install                           ####
echo %leer%####   [1] install for Europe with mobile cameras   ####
echo %leer%####   [2] install for Europe without mob. cameras  ####
echo %leer%####   [3] install for Germany with mobile cameras  ####
echo %leer%####   [4] install for Germany without mob. cameras ####
echo %leer%####                                                ####
echo %leer%########################################################
goto 13en1
:13de1
echo %leer%##############################################################
echo %leer%####                                                      ####
echo %leer%####        Speedcam Patch (nur fuer 56.00.230A)          ####
echo %leer%####                                                      ####
echo %leer%####                  Datenbanken fuer                    ####
echo %leer%####              Europa oder Deutschland                 ####
echo %leer%####                                                      ####
echo %leer%####                   mit oder ohne                      ####
echo %leer%####                   mobile Kameras                     ####
echo %leer%####                                                      ####
echo %leer%####  [n] Nicht installieren                              ####
echo %leer%####  [1] Installieren f. Europa mit mobilen Kameras      ####
echo %leer%####  [2] Installieren f. Europa ohne mobile Kameras      ####
echo %leer%####  [3] Installieren f. Deutschland mit mobilen Kameras ####
echo %leer%####  [4] Installieren f. Deutschland ohne mobile Kameras ####
echo %leer%####                                                      ####
echo %leer%##############################################################
:13en1
echo.
if %CountryCode%==49 goto 13de2
echo Install "speedcam patch (for 56.00.230A)"?
goto 13en2
:13de2
echo "Speedcam Patch (fuer 56.00.230A)" installieren?
:13en2
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
if %CountryCode%==49 goto 13de3
echo No! Please choose from 1 to 4 for different databases!
goto 13en3
:13de3
echo Nein! Bitte waehle zwischen 1 und 4 fuer versch. Datenbanken!
:13en3
echo.
goto REPEAT

:INST_13a
echo.
if %CountryCode%==49 goto 13ade
echo %leer%Speedcam data for Europe with mobile cameras will be installed.
echo.
echo %leer%Please remain SD card in car during installation!
goto 13aen
:13ade
echo %leer%Speedcam Daten fuer Europa mit mobilen Kameras wird installiert.
echo.
echo %leer%Bitte die SD Karte waehrend der Installation im Auto lassen!
:13aen
ping -4 127.0.0.1 > NUL
for %%f in (choose\13a.txt) do type %%f >> tweaks.txt
echo Please wait, copying 35 MB ...
xcopy /E /Y /I "choose\config_all\%INST_13_name%" "config\%INST_13_name%" >nul
echo. >> tweaks.txt
goto END

:INST_13b
echo.
if %CountryCode%==49 goto 13bde
echo %leer%Speedcam data for Europe without mobile cameras will be installed.
echo.
echo %leer%Please remain SD card in car during installation!
goto 13ben
:13bde
echo %leer%Speedcam Daten fuer Europa ohne mobile Kameras wird installiert.
echo.
echo %leer%Bitte die SD Karte waehrend der Installation im Auto lassen!
:13ben
ping -4 127.0.0.1 > NUL
for %%f in (choose\13b.txt) do type %%f >> tweaks.txt
echo Please wait, copying 35 MB ...
xcopy /E /Y /I "choose\config_all\%INST_13_name%" "config\%INST_13_name%" >nul
echo. >> tweaks.txt
goto END

:INST_13c
echo.
if %CountryCode%==49 goto 13cde
echo %leer%Speedcam data only for Germany with mobile cameras will be installed.
echo.
echo %leer%Please remain SD card in car during installation!
goto 13cen
:13cde
echo %leer%Speedcam Daten fuer Deutschland mit mobilen Kameras wird installiert.
echo.
echo %leer%Bitte die SD Karte waehrend der Installation im Auto lassen!
:13cen
ping -4 127.0.0.1 > NUL
for %%f in (choose\13c.txt) do type %%f >> tweaks.txt
echo Please wait, copying 35 MB ...
xcopy /E /Y /I "choose\config_all\%INST_13_name%" "config\%INST_13_name%" >nul
echo. >> tweaks.txt
goto END

:INST_13e
echo.
if %CountryCode%==49 goto 13ede
echo %leer%Speedcam data only for Germany without mobile cameras will be installed.
echo.
echo %leer%Please remain SD card in car during installation!
goto 13een
:13ede
echo %leer%Speedcam Daten fuer Deutschland ohne mobile Kameras wird installiert.
echo.
echo %leer%Bitte die SD Karte waehrend der Installation im Auto lassen!
:13een
ping -4 127.0.0.1 > NUL
for %%f in (choose\13e.txt) do type %%f >> tweaks.txt
echo Please wait, copying 35 MB ...
xcopy /E /Y /I "choose\config_all\%INST_13_name%" "config\%INST_13_name%" >nul
echo. >> tweaks.txt
goto END




:: ******************************************************************
:: Beginn Deinstallationen
:: ******************************************************************

:DEINST_01
echo.
if %CountryCode%==49 goto DE01de
echo %leer%So you want to get rid of some tweaks? Which one exactly?
goto DE01en
:DE01de
echo %leer%Du moechtest also einige Tweaks wieder los werden? Welche denn genau?
:DE01en
ping -4 127.0.0.1 > NUL
for %%f in (choose\01b.txt) do type %%f > tweaks.txt
if %asw%==4 for %%f in (choose\00.txt) do type %%f >> tweaks.txt
echo Clear up some folder first / Bereinige zuerst einige Ordner ...
for /D %%a in ("config_org") do rd /q /s "%%a"
for /D %%a in ("config") do rd /q /s "%%a"
md config_org >nul
echo. >> tweaks.txt


:DEINST_02_01
cls
mode 80,57
color 0b
echo %leer%########################################
echo %leer%####                                ####
echo %leer%####   Tweaks master bundle (v55)   ####
echo %leer%####        Deinstallation          ####
echo %leer%####                                ####
echo %leer%########################################
echo.
echo.
if %CountryCode%==49 goto DE02_01de1
echo Disable the touchscreen while moving?
goto DE02_01en1
:DE02_01de1
echo Den Touchscreen waehrend der Fahrt wieder deaktivieren?
:DE02_01en1
set asw_02_1=0
echo.
set /p asw_02_1="(y)es / (j)a / (n)o? "
if /I %asw_02_1%==0 goto DEINST_02_02
if /I %asw_02_1%==n goto DEINST_02_02
echo.
if %CountryCode%==49 goto DE02_01de2
echo %leer%Touchscreen will be disabled during driving now.
goto DE02_01en2
:DE02_01de2
echo Der Touchscreen ist nun waehrend der Fahrt wieder inaktiv.
:DE02_01en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_01d.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt

:DEINST_02_02
echo.
echo.
set DEINST_02_02_name="restore_audio_order_and_disclaimer"
if %CountryCode%==49 goto DE02_02de1
echo %leer%########################################################
echo %leer%####                                                ####
echo %leer%####  Restore disclaimer time to normal (3,5 sec.)  ####
echo %leer%####                                                ####
echo %leer%####                 together with                  ####
echo %leer%####                                                ####
echo %leer%####     Change order of the audio source list      ####
echo %leer%####               back to original                 ####
echo %leer%####                                                ####
echo %leer%#### (both in /jci/gui/apps/system/js/systemApp.js) ####
echo %leer%####                                                ####
echo %leer%########################################################
goto DE02_02en1
:DE02_02de1
echo %leer%############################################################
echo %leer%####                                                    ####
echo %leer%####  Disclaimer Zeit wieder auf 3,5 Sek. zuruecksetzen ####
echo %leer%####                                                    ####
echo %leer%####                   zusammen mit                     ####
echo %leer%####                                                    ####
echo %leer%####   Aendern der Reihenfolge der Audio Quell Liste    ####
echo %leer%####          zurueck zur Original-Reihenfolge          ####
echo %leer%####                                                    ####
echo %leer%####  (beides in /jci/gui/apps/system/js/systemApp.js)  ####
echo %leer%####                                                    ####
echo %leer%############################################################
:DE02_02en1
echo.
echo.
if %CountryCode%==49 goto DE02_02de2
echo Restore disclaimer time and audio source list?
goto DE02_02en2
:DE02_02de2
echo Disclaimer-Zeit und Audio Quell Liste zuruecksetzen?
:DE02_02en2
set asw_02_2=0
echo.
set /p asw_02_2="(y)es / (j)a / (n)o? "
if /I %asw_02_2%==0 goto DEINST_02_03
if /I %asw_02_2%==n goto DEINST_02_03
echo.
if %CountryCode%==49 goto DE02_02de3
echo %leer%Disclaimer enabled with 3,5 seconds and audio list back to original.
goto DE02_02en3
:DE02_02de3
echo %leer%Disclaimer aktiv mit 3,5 Sek. u. Audio Quell Liste mit orig. Reihenfolge
:DE02_02en3
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_02d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_02_02_name%" "config_org\%DEINST_02_02_name%" >nul
echo. >> tweaks.txt

:DEINST_02_03
echo.
echo.
set DEINST_02_03_name="safety-warning-reverse-camera"
if %CountryCode%==49 goto DE02_03de1
echo Restore the safety warning label from the reverse camera?
goto DE02_03en1
:DE02_03de1
echo Sicherheitswarnung der Rueckfahrkamera wieder einblenden?
:DE02_03en1
set asw_02_3=0
echo.
set /p asw_02_3="(y)es / (j)a / (n)o? "
if /I %asw_02_3%==0 goto DEINST_02_04
if /I %asw_02_3%==n goto DEINST_02_04
echo.
if %CountryCode%==49 goto DE02_03de2
echo %leer%Annoying text at the bottom will be there again.
goto DE02_03en2
:DE02_03de2
echo Der nervige Text am unteren Rand wird wieder eingeblendet.
:DE02_03en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_03d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_02_03_name%" "config_org\%DEINST_02_03_name%" >nul
echo. >> tweaks.txt

:DEINST_02_04
echo.
echo.
set DEINST_02_04_name="restore-blank-album-art-frame"
if %CountryCode%==49 goto DE02_04de1
echo Restore the blank album art frame?
goto DE02_04en1
:DE02_04de1
echo Den leeren Rahmen fuer das Album-Cover wieder einblenden?
:DE02_04en1
set asw_02_4=0
echo.
set /p asw_02_4="(y)es / (j)a / (n)o? "
if /I %asw_02_4%==0 goto DEINST_02_05
if /I %asw_02_4%==n goto DEINST_02_05
echo.
if %CountryCode%==49 goto DE02_04de2
echo %leer%Empty square will be there again! What was so nice about it?
goto DE02_04en2
:DE02_04de2
echo %leer%Das leere Quadrat wird wieder da sein! Was war daran so schoen?
:DE02_04en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_04d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_02_04_name%" "config_org\%DEINST_02_04_name%" >nul
echo. >> tweaks.txt

:DEINST_02_05
echo.
echo.
if %CountryCode%==49 goto DE02_05de1
echo Change the background image back to original?
goto DE02_05en1
:DE02_05de1
echo Den Hintergrund wieder auf das original Bild aendern?
:DE02_05en1
set asw_02_5=0
echo.
set /p asw_02_5="(y)es / (j)a / (n)o? "
if /I %asw_02_5%==0 goto DEINST_03
if /I %asw_02_5%==n goto DEINST_03
echo.
if %CountryCode%==49 goto DE02_05de2
echo %leer%Not that bad, the original background, right?
goto DE02_05en2
:DE02_05de2
echo %leer%Der war doch nicht so schlecht, oder?
:DE02_05en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\02_05d.txt) do type %%f >> tweaks.txt
xcopy /Y "choose\config_org_all\background.png" "config_org\" >nul
echo. >> tweaks.txt


:DEINST_03
cls
mode 80,25
color 0d
echo %leer%########################################################
echo %leer%####                                                ####
echo %leer%####  Speed-Video-Reboot_Tweak_v3.4_mod_by_diginix  ####
echo %leer%####                                                ####
echo %leer%####               Deinstallation                   ####
echo %leer%####                                                ####
echo %leer%####              - Speedometer                     ####
echo %leer%####              - Media player                    ####
echo %leer%####              - Reboot button                   ####
echo %leer%####                                                ####
echo %leer%########################################################
echo.
if %CountryCode%==49 goto DE03de1
echo Remove "Speed-Video-Reboot_Tweak_mod_by_diginix"?
goto DE03en1
:DE03de1
echo "Speed-Video-Reboot_Tweak_mod_by_diginix" entfernen?
:DE03en1
set asw_03=0
echo.
set /p asw_03="(y)es / (j)a / (n)o? "
if /I %asw_03%==0 goto DEINST_04
if /I %asw_03%==n goto DEINST_04
echo.
if %CountryCode%==49 goto DE03de2
echo %leer%Everything back to the roots. You know, you can do it again, don't you?
goto DE03en2
:DE03de2
echo %leer%Alles zurueck zum Anfang. Du weisst, Du kannst das jederzeit wiederholen?
:DE03en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\03d.txt) do type %%f >> tweaks.txt
echo. >> tweaks.txt


:DEINST_04
cls
mode 80,10
color 0b
set DEINST_04_name="date-to-statusbar_mod"
if %CountryCode%==49 goto DE04de1
echo Remove "date_to_statusbar_mod_by_diginix"?
goto DE04en1
:DE04de1
echo "Date_to_statusbar_mod_by_diginix" entfernen?
:DE04en1
set asw_04=0
echo.
set /p asw_04="(y)es / (j)a / (n)o? "
if /I %asw_04%==0 goto DEINST_05
if /I %asw_04%==n goto DEINST_05
echo.
if %CountryCode%==49 goto DE04de2
echo %leer%The time is again constantly obscured by advertisements ...
goto DE04en2
:DE04de2
echo %leer%Die Zeit wird nun wieder staendig von Einblendungen verdeckt werden ...
:DE04en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\04d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_04_name%" "config_org\%DEINST_04_name%" >nul
echo. >> tweaks.txt


:DEINST_05
cls
mode 80,10
color 0d
set DEINST_05_name="color-schemes"
if %CountryCode%==49 goto DE05de1
echo Remove "custom infotainment colors" (back to red color scheme)?
goto DE05en1
:DE05de1
echo "Custom infotainment colors" entfernen (zurueck zum Rot)?
:DE05en1
set asw_05=0
echo.
set /p asw_05="(y)es / (j)a / (n)o? "
if /I %asw_05%==0 goto DEINST_06
if /I %asw_05%==n goto DEINST_06
echo.
if %CountryCode%==49 goto DE05de2
echo %leer%So red again ...
goto DE05en2
:DE05de2
echo %leer%Also wieder Rot ...
:DE05en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\05d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_05_name%" "config_org\%DEINST_05_name%" >nul
echo. >> tweaks.txt


:DEINST_06
cls
mode 80,10
color 0b
set DEINST_06_name="pause-on-mute"
if %CountryCode%==49 goto DE06de1
echo Remove "pause on mute"?
goto DE06en1
:DE06de1
echo "Pause on mute" entfernen?
:DE06en1
set asw_06=0
echo.
set /p asw_06="(y)es / (j)a / (n)o? "
if /I %asw_06%==0 goto DEINST_07
if /I %asw_06%==n goto DEINST_07
echo.
if %CountryCode%==49 goto DE06de2
echo %leer%Who would want to have something like that again?
goto DE06en2
:DE06de2
echo %leer%Wer wuerde das denn wiederhaben wollen?
:DE06en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\06d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_06_name%" "config_org\%DEINST_06_name%" >nul
echo. >> tweaks.txt


:DEINST_07
cls
mode 80,10
color 0d
set DEINST_07_name="transparent-parking-sensor"
if %CountryCode%==49 goto DE07de1
echo Remove semi-transparent parking sensor graphics for the proximity sensors?
goto DE07en1
:DE07de1
echo Halbtransparente Park-Sensor-Grafiken fuer Naeherungssensoren zuruecksetzen?
:DE07en1
set asw_07=0
echo.
set /p asw_07="(y)es / (j)a / (n)o? "
if /I %asw_07%==0 goto DEINST_08
if /I %asw_07%==n goto DEINST_08
echo.
if %CountryCode%==49 goto DE07de2
echo %leer%Did you not like it?
goto DE07en2
:DE07de2
echo %leer%Du mochtest das doch nicht?
:DE07en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\07d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_07_name%" "config_org\%DEINST_07_name%" >nul
echo. >> tweaks.txt


:DEINST_08
cls
mode 80,10
color 0b
set DEINST_08_name="list-loop"
if %CountryCode%==49 goto DE08de1
echo Remove "improved list loop"?
goto DE08en1
:DE08de1
echo "Improved list loop" entfernen?
:DE08en1
set asw_08=0
echo.
set /p asw_08="(y)es / (j)a / (n)o? "
if /I %asw_08%==0 goto DEINST_09
if /I %asw_08%==n goto DEINST_09
echo.
if %CountryCode%==49 goto DE08de2
echo %leer%No more jumps from the end to the beginning and vice versa.
goto DE08en2
:DE08de2
echo %leer%Keine direkten Sprünge mehr vom Ende zum Anfang und umgekehrt.
:DE08en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\08d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_08_name%" "config_org\%DEINST_08_name%" >nul
echo. >> tweaks.txt


:DEINST_09
cls
mode 80,10
color 0d
set DEINST_09_name="main-menu-loop"
if %CountryCode%==49 goto DE09de1
echo Remove "main menu loop"?
goto DE09en1
:DE09de1
echo "Main menu loop" entfernen?
:DE09en1
set asw_09=0
echo.
set /p asw_09="(y)es / (j)a / (n)o? "
if /I %asw_09%==0 goto DEINST_11
if /I %asw_09%==n goto DEINST_11
echo.
if %CountryCode%==49 goto DE09de2
echo %leer%No more jumps from left to right and vice versa.
goto DE09en2
:DE09de2
echo %leer%Keine direkten Sprünge mehr vom linken Rand nach rechts und umgekehrt.
:DE09en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\09d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_09_name%" "config_org\%DEINST_09_name%" >nul
echo. >> tweaks.txt


:DEINST_11
cls
mode 80,10
color 0b
set DEINST_11_name="media-order-patching"
if %CountryCode%==49 goto DE11de1
echo Remove "media order patching"?
goto DE11en1
:DE11de1
echo "Media order patching" entfernen?
:DE11en1
set asw_11=0
echo.
set /p asw_11="(y)es / (j)a / (n)o? "
if /I %asw_11%==0 goto DEINST_13
if /I %asw_11%==n goto DEINST_13
echo.
if %CountryCode%==49 goto DE11de2
echo %leer%Sort by date again.
goto DE11en2
:DE11de2
echo %leer%Es wird wieder nach Datum sortiert.
:DE11en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\11d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_11_name%" "config_org\%DEINST_11_name%" >nul
echo. >> tweaks.txt


:DEINST_13
cls
mode 80,10
color 0d
set DEINST_13_name="german_speedcams"
if %CountryCode%==49 goto DE13de1
echo Remove "speedcam patch (for 56.00.230A)"?
goto DE13en1
:DE13de1
echo "Speedcam Patch (fuer 56.00.230A)" wieder entfernen?
:DE13en1
set asw_13=0
echo.
set /p asw_13="(y)es / (j)a / (n)o? "
if /I %asw_13%==0 goto END2
if /I %asw_13%==n goto END2
echo.
if %CountryCode%==49 goto DE13de2
echo %leer%Please drive carefully anyway!
echo.
echo %leer%Please remain SD card in car during deinstallation!
goto DE13en2
:DE13de2
echo %leer%Bitte fahre trotzdem weiterhin vorsichtig!
echo.
echo %leer%Waehrend der Deinstallation bitte die SD Karte im Auto lassen!
:DE13en2
ping -4 127.0.0.1 > NUL
for %%f in (choose\13d.txt) do type %%f >> tweaks.txt
xcopy /E /Y /I "choose\config_org_all\%DEINST_13_name%" "config_org\%DEINST_13_name%" >nul
echo. >> tweaks.txt
goto END2




:END
for %%f in (choose\14.txt) do type %%f >> tweaks.txt
choose\dos2unix -n tweaks.txt tweaks.sh
del tweaks.txt
cls
mode 80,55
color 09
if %CountryCode%==49 goto ENDde
echo %leer%########################################################
echo %leer%####                                                ####
echo %leer%####  Build individual file for installation        ####
echo %leer%####  according to your selection                   ####
echo %leer%####                                                ####
echo %leer%####  Please copy content to a USB drive            ####
echo %leer%####  to install the selected tweaks                ####
echo %leer%####                                                ####
echo %leer%########################################################
echo.
echo %leer%You have choosen to install the following tweaks:
echo %leer%-------------------------------------------------
echo.
echo.
if %asw%==3 echo %leer%First, a full backup of the system will be copied to the SD Card!
if %asw%==3 echo.

if /I %asw_02_1%==j echo %leer%Touchscreen will be always enabled
if /I %asw_02_1%==y echo %leer%Touchscreen will be always enabled
if /I %asw_02_1%==j echo.
if /I %asw_02_1%==y echo.
echo %asw_02_2%
if /I %asw_02_2%==j echo %leer%Disclaimer time will be reduced from 3,5 seconds to 0,5 seconds
if /I %asw_02_2%==y echo %leer%Disclaimer time will be reduced from 3,5 seconds to 0,5 seconds
if /I %asw_02_2%==j echo.
if /I %asw_02_2%==y echo.

if /I %asw_02_3%==j echo %leer%Remove the safety warning label from the reverse camera
if /I %asw_02_3%==y echo %leer%Remove the safety warning label from the reverse camera
if /I %asw_02_3%==j echo.
if /I %asw_02_3%==y echo.

if /I %asw_02_4%==j echo %leer%Remove the blank album art frame
if /I %asw_02_4%==y echo %leer%Remove the blank album art frame
if /I %asw_02_4%==j echo.
if /I %asw_02_4%==y echo.

if /I %asw_02_5%==j echo %leer%Change to an individual background image
if /I %asw_02_5%==y echo %leer%Change to an individual background image
if /I %asw_02_5%==j echo.
if /I %asw_02_5%==y echo.

if /I %asw_03%==j echo %leer%speed-video-reboot_tweak_mod_by_diginix
if /I %asw_03%==y echo %leer%speed-video-reboot_tweak_mod_by_diginix
if /I %asw_03b%==g echo %leer%%leer%- you get: german version (kmh)
if /I %asw_03b%==e echo %leer%%leer%- you get: english version (kmh)
if /I %asw_03b%==m echo %leer%%leer%- you get: english version (mph)
if /I %asw_03what%==b echo %leer%%leer%- with speedometer and media player
if /I %asw_03what%==s echo %leer%%leer%- only speedometer
if /I %asw_03what%==m echo %leer%%leer%- only media player
if /I %asw_03what%==p echo %leer%%leer%- only media player
if /I %asw_03%==j echo.
if /I %asw_03%==y echo.

if /I %asw_04%==j echo %leer%Date_to_statusbar_mod_by_diginix
if /I %asw_04%==y echo %leer%Date_to_statusbar_mod_by_diginix
if /I %asw_04%==j echo.
if /I %asw_04%==y echo.

if /I %asw_05%==j echo %leer%Custom infotainment colors
if /I %asw_05%==y echo %leer%Custom infotainment colors
if /I %asw_05f%==1 echo %leer%%leer%- Blue scheme
if /I %asw_05f%==2 echo %leer%%leer%- Green scheme
if /I %asw_05f%==3 echo %leer%%leer%- Orange scheme
if /I %asw_05f%==4 echo %leer%%leer%- Pink scheme
if /I %asw_05f%==5 echo %leer%%leer%- Purple scheme
if /I %asw_05f%==6 echo %leer%%leer%- Silver scheme
if /I %asw_05f%==7 echo %leer%%leer%- Yellow scheme
if /I %asw_05%==j echo.
if /I %asw_05%==y echo.

if /I %asw_06%==j echo %leer%Pause on mute
if /I %asw_06%==y echo %leer%Pause on mute
if /I %asw_06%==j echo.
if /I %asw_06%==y echo.

if /I %asw_07%==j echo %leer%Semi-transparent parking sensor graphics
if /I %asw_07%==y echo %leer%Semi-transparent parking sensor graphics
if /I %asw_07%==j echo.
if /I %asw_07%==y echo.

if /I %asw_08%==j echo %leer%Improved list loop
if /I %asw_08%==y echo %leer%Improved list loop
if /I %asw_08%==j echo.
if /I %asw_08%==y echo.

if /I %asw_09%==j echo %leer%Main menu loop
if /I %asw_09%==y echo %leer%Main menu loop
if /I %asw_09%==j echo.
if /I %asw_09%==y echo.

if /I %asw_10%==j echo %leer%No more disclaimer
if /I %asw_10%==y echo %leer%No more disclaimer
if /I %asw_10%==j echo.
if /I %asw_10%==y echo.

if /I %asw_11%==j echo %leer%Media order patching
if /I %asw_11%==y echo %leer%Media order patching
if /I %asw_11%==j echo.
if /I %asw_11%==y echo.

if /I %asw_12%==j echo %leer%Change order of the audio source list
if /I %asw_12%==y echo %leer%Change order of the audio source list
if /I %asw_12%==j echo.
if /I %asw_12%==y echo.

if /I %asw_13%==1 echo %leer%Speedcam patch (for 56.00.230A), Europe with mobile cams
if /I %asw_13%==2 echo %leer%Speedcam patch (for 56.00.230A), Europe w/o mobile cams
if /I %asw_13%==3 echo %leer%Speedcam patch (for 56.00.230A), Germany with mobile cams
if /I %asw_13%==4 echo %leer%Speedcam patch (for 56.00.230A), Germany w/o mobile cams
if /I %asw_13%==j echo.
if /I %asw_13%==y echo.
goto ENDen

:ENDde
echo %leer%########################################################
echo %leer%####                                                ####
echo %leer%####  Individuelle Installations-Datei              ####
echo %leer%####  nach Deiner Zusammenstellung erzeugt          ####
echo %leer%####                                                ####
echo %leer%####  Bitte den Inhalt auf einen USB Stick kopieren ####
echo %leer%####  um die ausgewaehlten Tweaks zu installieren   ####
echo %leer%####                                                ####
echo %leer%########################################################
echo.
echo %leer%Du hast folgende Tweaks ausgewaehlt:
echo %leer%------------------------------------
echo.
echo.
if %asw%==3 echo %leer%Zuerst wird ein Voll-Backup des Systems auf die SD-Karte kopiert!
if %asw%==3 echo.

if /I %asw_02_1%==j echo %leer%Touchscreen wird dauerhaft aktiviert
if /I %asw_02_1%==y echo %leer%Touchscreen wird dauerhaft aktiviert
if /I %asw_02_1%==j echo.
if /I %asw_02_1%==y echo.

if /I %asw_02_2%==j echo %leer%Disclaimer wird nur 0,5 Sekunden, statt 3,5 Sekunden eingeblendet
if /I %asw_02_2%==y echo %leer%Disclaimer wird nur 0,5 Sekunden, statt 3,5 Sekunden eingeblendet.
if /I %asw_02_2%==j echo.
if /I %asw_02_2%==y echo.

if /I %asw_02_3%==j echo %leer%Sicherheitswarnung der Rueckfahrkamera wird entfernt
if /I %asw_02_3%==y echo %leer%Sicherheitswarnung der Rueckfahrkamera wird entfernt
if /I %asw_02_3%==j echo.
if /I %asw_02_3%==y echo.

if /I %asw_02_4%==j echo %leer%Der leere Album-Cover Rahmen wird entfernt
if /I %asw_02_4%==y echo %leer%Der leere Album-Cover Rahmen wird entfernt
if /I %asw_02_4%==j echo.
if /I %asw_02_4%==y echo.

if /I %asw_02_5%==j echo %leer%Ein individuelles Hintergrundbild wird kopiert
if /I %asw_02_5%==y echo %leer%Ein individuelles Hintergrundbild wird kopiert
if /I %asw_02_5%==j echo.
if /I %asw_02_5%==y echo.

if /I %asw_03%==j echo %leer%Speed-video-reboot_tweak_mod_by_diginix
if /I %asw_03%==y echo %leer%Speed-video-reboot_tweak_mod_by_diginix
if /I %asw_03b%==g echo %leer%%leer%- Du bekommst: deutsche Version (kmh)
if /I %asw_03b%==e echo %leer%%leer%- Du bekommst: englische Version (kmh)
if /I %asw_03b%==m echo %leer%%leer%- Du bekommst: englisch Version (mph)
if /I %asw_03what%==b echo %leer%%leer%- sowohl Speedometer als auch Media Player
if /I %asw_03what%==s echo %leer%%leer%- nur Speedometer
if /I %asw_03what%==m echo %leer%%leer%- nur media player
if /I %asw_03what%==p echo %leer%%leer%- nur Media Player
if /I %asw_03%==j echo.
if /I %asw_03%==y echo.

if /I %asw_04%==j echo %leer%Date_to_statusbar_mod_by_diginix
if /I %asw_04%==y echo %leer%Date_to_statusbar_mod_by_diginix
if /I %asw_04%==j echo.
if /I %asw_04%==y echo.

if /I %asw_05%==j echo %leer%Individuelle Farb Schemas:
if /I %asw_05%==y echo %leer%Individuelle Farb Schemas:
if %asw_05f%==1 echo %leer%%leer%- Blaues Schema
if %asw_05f%==2 echo %leer%%leer%- Gruenes Schema
if %asw_05f%==3 echo %leer%%leer%- Oranges Schema
if %asw_05f%==4 echo %leer%%leer%- Pinkes Schema
if %asw_05f%==5 echo %leer%%leer%- Lila Schema
if %asw_05f%==6 echo %leer%%leer%- Silber Schema
if %asw_05f%==7 echo %leer%%leer%- Gelbes Schema
if /I %asw_05%==j echo.
if /I %asw_05%==y echo.

if /I %asw_06%==j echo %leer%Pause on mute
if /I %asw_06%==y echo %leer%Pause on mute
if /I %asw_06%==j echo.
if /I %asw_06%==y echo.

if /I %asw_07%==j echo %leer%Halbtransparente Park-Sensor-Grafiken fuer Naeherungssensoren
if /I %asw_07%==y echo %leer%Halbtransparente Park-Sensor-Grafiken fuer Naeherungssensoren
if /I %asw_07%==j echo.
if /I %asw_07%==y echo.

if /I %asw_08%==j echo %leer%Improved list loop
if /I %asw_08%==y echo %leer%Improved list loop
if /I %asw_08%==j echo.
if /I %asw_08%==y echo.

if /I %asw_09%==j echo %leer%Main menu loop
if /I %asw_09%==y echo %leer%Main menu loop
if /I %asw_09%==j echo.
if /I %asw_09%==y echo.

if /I %asw_10%==j echo %leer%Disclaimer wird deaktiviert
if /I %asw_10%==y echo %leer%Disclaimer wird deaktiviert
if /I %asw_10%==j echo.
if /I %asw_10%==y echo.

if /I %asw_11%==j echo %leer%Alphabetische Sortierung Deiner Dateien
if /I %asw_11%==y echo %leer%Alphabetische Sortierung Deiner Dateien
if /I %asw_11%==j echo.
if /I %asw_11%==y echo.

if /I %asw_12%==j echo %leer%Die Reihenfolge der Audio Quell Liste wird optimiert
if /I %asw_12%==y echo %leer%Die Reihenfolge der Audio Quell Liste wird optimiert
if /I %asw_12%==j echo.
if /I %asw_12%==y echo.

if %asw_13%==1 echo %leer%Speedcam patch (fuer 56.00.230A), Europa mit mobilen Kameras
if %asw_13%==2 echo %leer%Speedcam patch (fuer 56.00.230A), Europa ohne mobile Kameras
if %asw_13%==3 echo %leer%Speedcam patch (fuer 56.00.230A), Deutschland mit mobilen Kameras
if %asw_13%==4 echo %leer%Speedcam patch (fuer 56.00.230A), Deutschland ohne mobile Kameras
if %asw_13%==j echo.
if %asw_13%==y echo.

:ENDen
echo.
echo.
pause
goto END_copy


:END2
for %%f in (choose\14d.txt) do type %%f >> tweaks.txt
choose\dos2unix -n tweaks.txt tweaks.sh
del tweaks.txt
cls
mode 80,55
color 09
if %CountryCode%==49 goto END2de
echo %leer%########################################################
echo %leer%####                                                ####
echo %leer%####  Build individual file for deinstallation      ####
echo %leer%####  according to your selection                   ####
echo %leer%####                                                ####
echo %leer%####  Please copy content to a USB drive            ####
echo %leer%####  to remove the selected tweaks                 ####
echo %leer%####                                                ####
echo %leer%########################################################
echo.
echo %leer%You have choosen to remove the following tweaks:
echo %leer%-------------------------------------------------
echo.
echo.
if %asw%==4 echo %leer%First, a full backup of the system will be copied to the SD Card!
if %asw%==4 echo.

if /I %asw_02_1%==j echo %leer%Touchscreen will be disabled during drive
if /I %asw_02_1%==y echo %leer%Touchscreen will be disabled during drive
if /I %asw_02_1%==j echo.
if /I %asw_02_1%==y echo.

if /I %asw_02_2%==j echo %leer%Disclaimer enabled with 3,5 seconds and audio list back to original
if /I %asw_02_2%==y echo %leer%Disclaimer enabled with 3,5 seconds and audio list back to original.
if /I %asw_02_2%==j echo.
if /I %asw_02_2%==y echo.

if /I %asw_02_3%==j echo %leer%Restore the safety warning label from the reverse camera
if /I %asw_02_3%==y echo %leer%Restore the safety warning label from the reverse camera
if /I %asw_02_3%==j echo.
if /I %asw_02_3%==y echo.

if /I %asw_02_4%==j echo %leer%Restore the blank album art frame
if /I %asw_02_4%==y echo %leer%Restore the blank album art frame
if /I %asw_02_4%==j echo.
if /I %asw_02_4%==y echo.

if /I %asw_02_5%==j echo %leer%Change the background image back to original
if /I %asw_02_5%==y echo %leer%Change the background image back to original
if /I %asw_02_5%==j echo.
if /I %asw_02_5%==y echo.

if /I %asw_03%==j echo %leer%Remove "speed-Video-Reboot_Tweak_mod_by_diginix"
if /I %asw_03%==y echo %leer%Remove "speed-Video-Reboot_Tweak_mod_by_diginix"
if /I %asw_03%==j echo.
if /I %asw_03%==y echo.

if /I %asw_04%==j echo %leer%Remove "date_to_statusbar_mod_by_diginix"
if /I %asw_04%==y echo %leer%Remove "date_to_statusbar_mod_by_diginix"
if /I %asw_04%==j echo.
if /I %asw_04%==y echo.

if /I %asw_05%==j echo %leer%Remove "custom infotainment colors" (back to red color scheme)
if /I %asw_05%==y echo %leer%Remove "custom infotainment colors" (back to red color scheme)
if /I %asw_05%==j echo.
if /I %asw_05%==y echo.

if /I %asw_06%==j echo %leer%Remove "pause on mute"
if /I %asw_06%==y echo %leer%Remove "pause on mute"
if /I %asw_06%==j echo.
if /I %asw_06%==y echo.

if /I %asw_07%==j echo %leer%Remove "semi-transp. parking sensor graphics for the proximity sensors"
if /I %asw_07%==y echo %leer%Remove "semi-transp. parking sensor graphics for the proximity sensors"
if /I %asw_07%==j echo.
if /I %asw_07%==y echo.

if /I %asw_08%==j echo %leer%Remove "improved list loop"
if /I %asw_08%==y echo %leer%Remove "improved list loop"
if /I %asw_08%==j echo.
if /I %asw_08%==y echo.

if /I %asw_09%==j echo %leer%Remove "main menu loop"
if /I %asw_09%==y echo %leer%Remove "main menu loop"
if /I %asw_09%==j echo.
if /I %asw_09%==y echo.

if /I %asw_11%==j echo %leer%Remove "media order patching"
if /I %asw_11%==y echo %leer%Remove "media order patching"
if /I %asw_11%==j echo.
if /I %asw_11%==y echo.

if /I %asw_13%==j echo %leer%Remove "speedcam patch (for 56.00.230A)"
if /I %asw_13%==y echo %leer%Remove "speedcam patch (for 56.00.230A)"
if /I %asw_13%==j echo.
if /I %asw_13%==y echo.
goto END2en

:END2de
echo %leer%########################################################
echo %leer%####                                                ####
echo %leer%####  Individuelle Deinstallations-Datei            ####
echo %leer%####  nach Deiner Zusammenstellung erzeugt          ####
echo %leer%####                                                ####
echo %leer%####  Bitte den Inhalt auf einen USB Stick kopieren ####
echo %leer%####  um die ausgewaehlten Tweaks zu entfernen      ####
echo %leer%####                                                ####
echo %leer%########################################################
echo.
echo %leer%Du moechtest folgende tweaks entfernen:
echo %leer%---------------------------------------
echo.
echo.
if %asw%==4 echo %leer%Zuerst wird ein Voll-Backup des Systems auf die SD-Karte kopiert!
if %asw%==4 echo.

if /I %asw_02_1%==j echo %leer%Touchscreen wird waehrend der Fahrt wieder deaktiviert
if /I %asw_02_1%==y echo %leer%Touchscreen wird waehrend der Fahrt wieder deaktiviert
if /I %asw_02_1%==j echo.
if /I %asw_02_1%==y echo.

if /I %asw_02_2%==j echo %leer%Disclaimer-Zeit und Audio Quell Liste wird zurueckgesetzt
if /I %asw_02_2%==y echo %leer%Disclaimer-Zeit und Audio Quell Liste wird zurueckgesetzt
if /I %asw_02_2%==j echo.
if /I %asw_02_2%==y echo.

if /I %asw_02_3%==j echo %leer%Sicherheitswarnung der Rueckfahrkamera wird wieder eingeblendet
if /I %asw_02_3%==y echo %leer%Sicherheitswarnung der Rueckfahrkamera wird wieder eingeblendet
if /I %asw_02_3%==j echo.
if /I %asw_02_3%==y echo.

if /I %asw_02_4%==j echo %leer%Leerer Rahmen fuer das Album-Cover wird wieder eingeblendet
if /I %asw_02_4%==y echo %leer%Leerer Rahmen fuer das Album-Cover wird wieder eingeblendet
if /I %asw_02_4%==j echo.
if /I %asw_02_4%==y echo.

if /I %asw_02_5%==j echo %leer%Der Hintergrund wird wieder auf das original Bild geaendert
if /I %asw_02_5%==y echo %leer%Der Hintergrund wird wieder auf das original Bild geaendert
if /I %asw_02_5%==j echo.
if /I %asw_02_5%==y echo.

if /I %asw_03%==j echo %leer%"Speed-Video-Reboot_Tweak_mod_by_diginix" wird entfernt
if /I %asw_03%==y echo %leer%"Speed-Video-Reboot_Tweak_mod_by_diginix" wird entfernt
if /I %asw_03%==j echo.
if /I %asw_03%==y echo.

if /I %asw_04%==j echo %leer%"Date_to_statusbar_mod_by_diginix" wird entfernt
if /I %asw_04%==y echo %leer%"Date_to_statusbar_mod_by_diginix" wird entfernt
if /I %asw_04%==j echo.
if /I %asw_04%==y echo.

if /I %asw_05%==j echo %leer%"Individuelles Farb Schema" wird entfernt (zurueck zum Rot)
if /I %asw_05%==y echo %leer%"Individuelles Farb Schema" wird entfernt (zurueck zum Rot)
if /I %asw_05%==j echo.
if /I %asw_05%==y echo.

if /I %asw_06%==j echo %leer%"Pause on mute" wird entfernt
if /I %asw_06%==y echo %leer%"Pause on mute" wird entfernt
if /I %asw_06%==j echo.
if /I %asw_06%==y echo.

if /I %asw_07%==j echo %leer%Halbtransp. Park-Sensor-Grafiken f. Naeherungssensoren werden entfernt
if /I %asw_07%==y echo %leer%Halbtransp. Park-Sensor-Grafiken f. Naeherungssensoren werden entfernt
if /I %asw_07%==j echo.
if /I %asw_07%==y echo.

if /I %asw_08%==j echo %leer%"Improved list loop" wird entfernt
if /I %asw_08%==y echo %leer%"Improved list loop" wird entfernt
if /I %asw_08%==j echo.
if /I %asw_08%==y echo.

if /I %asw_09%==j echo %leer%"Main menu loop" wird entfernt
if /I %asw_09%==y echo %leer%"Main menu loop" wird entfernt
if /I %asw_09%==j echo.
if /I %asw_09%==y echo.

if /I %asw_11%==j echo %leer%Es wird wieder nach Datum sortiert
if /I %asw_11%==y echo %leer%Es wird wieder nach Datum sortiert
if /I %asw_11%==j echo.
if /I %asw_11%==y echo.

if /I %asw_13%==j echo %leer%"Speedcam patch (fuer 56.00.230A)"" wird entfernt
if /I %asw_13%==y echo %leer%"Speedcam patch (fuer 56.00.230A)" wird entfernt
if /I %asw_13%==j echo.
if /I %asw_13%==y echo.

:END2en
echo.
echo.
pause


:END_copy
cls
if %CountryCode%==49 goto :END_copy_de1
echo #########################################################
echo #                                                       #
echo # Should I copy the data directly to an USB drive card? #
echo #                                                       #
echo #########################################################
echo.
echo %leer%(Please delete SD card previously!)
goto END_copy_en1
:END_copy_de1
echo ###########################################################
echo #                                                         #
echo # Soll ich die Daten direkt auf einen USB Stick kopieren? #
echo #                                                         #
echo ###########################################################
echo.
echo %leer%(Bitter vorher die SD Karte loeschen!)
:END_copy_en1
set asw_END_copy=0
echo.
echo.
set /p asw_END_copy="(y)es / (j)a / (n)o? "
if %asw_END_copy%==0 goto READY_en
if /I %asw_END_copy%==n goto READY_en
if %CountryCode%==49 goto :END_copy_de2
echo.
echo.
echo The followoing removable drives are available:
echo ----------------------------------------------
echo.
wmic logicaldisk where drivetype=2 get deviceid, description
echo.
echo On which drive letter should I copy?
goto END_copy_en2
:END_copy_de2
echo.
echo.
echo Folgende Wechseldatentraeger stehen zur Verfuegung:
echo ---------------------------------------------------
echo.
wmic logicaldisk where drivetype=2 get deviceid, description
echo.
echo Auf welchen Laufwerksbuchstaben soll ich kopieren?
:END_copy_en2
if %CountryCode%==49 goto :END_copy_de3
echo.
set asw_END_copy_lw=0
echo.
echo.
set /p asw_END_copy_lw="Please enter the drive: "
goto END_copy_en3
:END_copy_de3
echo.
set asw_END_copy_lw=0
echo.
echo.
set /p asw_END_copy_lw="Bitte den Laufwerks-Buchstaben angeben: "
:END_copy_en3
if %CountryCode%==49 goto :END_copy_de4
echo.
echo.
echo %leer%Copying now, which can take some time ...
goto END_copy_en4
:END_copy_de4
echo.
echo.
echo %leer%Kopiere jetzt, das kann etwas dauern ...
:END_copy_en4
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


:READY
echo.
if %CountryCode%==49 goto READY_de
echo %leer%All files copied, the USB drive can be removed now.
goto READY_en
:READY_de
echo %leer%Alle Dateien wurden kopiert, der USB-Stick kann nun entfernt werden.
:READY_en
echo.
echo.
echo.
pause
exit
