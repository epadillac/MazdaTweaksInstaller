AIO - All-In-One tweaks V1.34, 2016-01-31
For Mazda MZD System (Mazda 2 (DJ), Mazda 3 (BM), Mazda 6 (GJ), Mazda CX-3 (DK), Mazda CX-5 (KE), Mazda MX-5 Roadster (ND) and new 2017 Mazda CX-9 (TC))
For >= v55 (tested on v56.00.230 EU)

-----------------------------------------------------------------------------------------------------------------------------------------------------

IMPORTANT: All changes happen at your own risk!
Anyone who is unsure should leave it alone, ask someone with experience to help or ask in the forum for now.

What is 'All-in-one tweaks'?
After copying all files from different tweaks together, I thought, it would certainly be helpful if you could previously choose what you want to apply actually.
Since I unfortunately do not have so much experience with modern Windows scripting languages, I did it as a CMD file, sure it's not so elegant, but it works.


First start 'choose.cmd' to generate your individual tweaks.sh file (only possible with Windows - sorry!)

Then copy all files from folder '_copy_content_to_root_of_fat32_usb_stick' to the root of a blank FAT32 USB flash drive, unplug any other USB drives from the car except this flash drive.
For installation of speedcam patch (see below), the NAVI SD card must remain in the car, because speedcam file will be copied directly to SD card.

For an individual background image, replace the file 'background.png' inside 'config' folder with your own, must be 800x480 pixel and png format.
See some examples inside folder 'choose\more_background-images'.

Plugin USB drive, turn on car and wait for the "All-in-one tweaks applied" window to appear (should take some time, so be patient!).
After that, the system must be restarted to apply the tweaks by holding down mute+nav for about 10 seconds.

-----------------------------------------------------------------------------------------------------------------------------------------------------

WICHTIG: Alle Veränderungen geschehen auf eigenes Risiko!
Wer sich unsicher ist, sollte die Finger davon lassen, jemand mit Erfahrung zu Hilfe bitten oder im Forum erst mal nachfragen.

Was ist 'All-in-one tweaks'?
Nach zusammenkopieren aller Dateien für die unterschiedlichen Tweaks dachte ich, es wäre bestimmt hilfreich, wenn man sich vorher aussuchen
könnte, was man davon eigentlich anwenden möchte.
Da ich leider mit mordernen Windows Script Sprachen nicht so viel Erfahrung habe, wurde das ganze kurzerhand als CMD-Datei zusammen gebastelt,
sicher geht es eleganter, aber es funktioniert.


Zuerst 'choose.cmd' starten, um eine individuelle tweaks.sh Datei zu erstellen (nur unter Windows möglich - sorry!)

Dann alle Dateien des Ordners '_copy_content_to_root_of_fat32_usb_stick' auf einen leeren, FAT32 formatierten USB Stick kopieren und alle anderen USB Sticks im Auto entfernen.
Für die Installation des Speedcam Patches (siehe unten) muss die NAVI SD Karte im Auto eingesteckt bleiben, da die speedcam-Datei direkt auf die SD Karte kopiert wird.

Für ein individuelles Hintergrundbild bitte die Datei 'background.png' im 'config' Ordner durch ein eigenes im PNG-Format und 800x480 Pixel ersetzen.
Einige Beispiele sind im Ordner 'choose\more_background-images' zu finden.

Den USB-Stick im Auto in einen freien Slot stecken und auf das Fenster "All-in-one tweaks applied" warten, (kann etwas dauern, also bitte Geduld!).
Danach muss das System durch Drücken von mute+nav für mind. 10 Sekunden neu gestartet werden, damit die Änderungen wirksam werden.

-----------------------------------------------------------------------------------------------------------------------------------------------------

What's inside / was ist enthalten:

"Tweaks Master Bundle (v55)" by miket0429
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/57714-infotainment-project-258.html#post1442746
-reduce disclaimer time (actually no longer necessary, because it can be completely disabled by "No_More_Disclaimer" tweak)
-enable the touchscreen while moving
-turn on wi-fi (not necessary with EU versions)
-change the background image: replace background.png inside config folder with own 800x480 .png
-remove the safety warning label from the reverse camera (updated for german too)
-remove the blank album art frame


"Speedo-Compass-Video_Tweak_v3.5" by_Diginix
Based on mod by Trookam (which is based on mod by anderml1955 I think)
Media player by Waisky2 of course!
First version of speedometer by serezhka
mph changes first done by windwalker
http://www.mazda6-forum.info/index.php?page=Thread&postID=329244#post329244
https://dl.orangedox.com/pbnRlEewGyqUJ3lBvn
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/57714-infotainment-project-373.html#post1537450
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/57714-infotainment-project-384.html#post1548834
- speedometer (better graphics and icons, graphic compass, installation for german /english text and kmh / mph possible)
- video player (looks for movies in USB "/Movies" directory like with Mazda Media Player by skalsiu88)
- reboot button


"Date_to_statusbar_mod_by_diginix_v2.1" by Diginix, base by ForeverYoung (icons and date smaller just above the clock)
https://dl.orangedox.com/Vlyi3jrJIPfOdFiRFc
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/57714-infotainment-project-370.html#post1533778


Custom infotainment colors (blue, green, orange, pink, purple, silver, yellow) by mrnerdbanger
Info: a color matching background image will be replaced too and the speedometer graphics also, if you install speedometer.
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/92330-custom-infotainment-colors.html


"Pause on mute" by jimmyfergus, USB script by ForeverYoung
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/57714-infotainment-project-331.html#post1484922
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/57714-infotainment-project-349.html#post1517210


Semi-transparent_parking_sensors_mod_by_diginix_v1 (folders "HorizontalSensors" and "VerticalSensors" (for german) used)
original patch by vic_bam85 not working on V 56.00.230A german version, because only folder "HorizontalSensors" used
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/57714-infotainment-project-346.html#post1515386
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/57714-infotainment-project-376.html#post1540882


"Improved list loop" by yuikjh with additional shorter delay mod by yuikjh too
https://dl.orangedox.com/L5RB5oE6mlFANzyPAe
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/57714-infotainment-project-342.html#post1507786
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/57714-infotainment-project-332.html#post1486914


"Main menu loop" by ForeverYoung
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/57714-infotainment-project-344.html#post1510946


"No_more_disclaimer" by bob12x ("bling" boot animation is gone too on my system)
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/117850-way-remove-disclaimer-boot.html


"Track ordering" by diorcety
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/117162-media-flac-support-track-ordering.html
http://dl.free.fr/getfile.pl?file=/rfIWhre7
http://dl.free.fr/getfile.pl?file=/giB5cD8i (newer version?)


"Change order of the audio source list" to this new order (often used inputs shifted upward)
  'FMRadio'
  'DAB'
  'USB_A'
  'USB_B'
  'BTAudio'
  'CD'
  'SatRadio' (not visible in Germany)
  'AhaRadio'
  'Pandora' (not visible in Germany)
  'Stitcher'
  'AuxIn'
  'AMRadio'
  'DVD' (not visible in Germany, only Japan?)
  'TV'  (not visible in Germany, only Japan?)
http://www.mazda3hacks.com/doku.php?id=hacks:sourcelistorder


Speedcam patch (for 56.00.230A) and speedcam.txt for Germany or Europe, with or without mobile cameras (4 different databases!)
https://github.com/diorcety/mazda3/wiki/NNG-Speedcam-patching
http://poiplaza.com/index.php?p=download&d=788&lstpg2=sdb&lstpg=ds&lsts=616
NGG-Patcher for Windows by bob12x:
http://mazda3revolution.com/forums/2014-2016-mazda-3-skyactiv-audio-electronics/112465-sd-card-cloning-tutorial-6.html#post1538306
https://mega.nz/#!ndoggY5b!5CSFRRDeD0VJbY5tgnBAujF4b_UZkMEhYnNnUEZw5g4


-----------------------------------------------------------------------------------------------------------------------------------------------------

Changelog:

- V1.34 - 2016-01-31
  Problem with color scheme uninstaller fixed, should go back to red now
  Problem with uninstaller for semi-transparent parking sensor graphics fixed, should work now
  Problem with uninstaller for restore_audio_order_and_disclaimer fixed, should work now
  New folder "_copy_content_to_root_of_fat32_usb_stick" for easier manual copying to USB drive (thanks for tip to remizik!)
  Prepared for more languages, english and german strings outsourced in files, more languages now possible!
  
- V1.33 - 2016-01-29
  Copy only selected tweaks to config (for installation) or config_org (for deinstallation) folder, copying to SD Card should be much faster now depending on what you've selected
  Additional question whether a full backup of MZD System will be copied to USB drive before applying the tweaks
  Problem of sometimes not deleted fps.js fixed (FPS was counter shown in the corner)
  Problem of date-to-statusbar uninstaller fixed, should work now
  Automatic detection of correct compass installation (if no valid NAV SD Card is inserted during installation of speedometer, it will change necessary file)
  Copy of files to USB drive can be done after selection of tweaks

- V1.32 - 2016-01-27
  Problem with color scheme installer fixed, should work now
  After only hitting return (enter), now the shown tweak will not be installed (same like "n", before it was like "y")
  A summary of the selected tweaks will be displayed after selection for installation and uninstallation part
  Both languages were displayed for english uninstaller - fixed now

- V1.31 - 2016-01-26
  New version of "Date_to_statusbar_mod_by_diginix_v2.1"
  New version of "Speedo-Compass-Video_Tweak_v3.5"

- V1.3 - 2016-01-25
  Too many bugfixes :(
  Text output in german language too with automatic language detection for german, otherwise english
  README_All-in-one_tweaks.txt updated with german descriptions too
  Officially released

- V1.2x
  Create 'choose.cmd' to generate individual tweaks.sh file
  Bugfixes after testing by some daring users! ;)

- V1.1x
  Some own testing and bugfixes
  Create README_All-in-one_tweaks.txt

- V1.0
  Only put together all tweaks in one folder to copy at once for myself
  