@echo off

CALL :Header
    
IF not EXIST temp ( 
    mkdir temp 
) ELSE ( 
    rmdir /Q /S temp
    mkdir temp
)

cd temp

CALL :Header
echo ----------------------------------
echo      Downloading h-encore 2    
echo ----------------------------------
..\bin\wget https://github.com/TheOfficialFloW/h-encore-2/releases/download/v1.0/h-encore-2.zip -O h-encore-2.zip
..\bin\7za x h-encore-2.zip
del h-encore-2.zip

CALL :Header
echo ----------------------------------
echo      Downloading psvimgtools
echo ----------------------------------
IF not EXIST psvimgtools ( mkdir psvimgtools ) 
cd psvimgtools
..\..\bin\wget https://github.com/yifanlu/psvimgtools/releases/download/v0.1/psvimgtools-0.1-win32.zip -O psvimgtools.zip
..\..\bin\7za x psvimgtools.zip 
del psvimgtools.zip

cd ..

CALL :Header
echo ----------------------------------
echo        Downloading pkg2zip    
echo ----------------------------------
IF not EXIST pkg2zip ( mkdir pkg2zip ) 
cd pkg2zip
..\..\bin\wget https://github.com/mmozeiko/pkg2zip/releases/download/v1.8/pkg2zip_32bit.zip -O pkg2zip.zip
..\..\bin\7za x pkg2zip.zip
del pkg2zip.zip

cd ..

CALL :Header
echo ----------------------------------
echo      Downloading Bitter Smile     
echo ----------------------------------
..\bin\wget http://ares.dl.playstation.net/cdn/JP0741/PCSG90096_00/xGMrXOkORxWRyqzLMihZPqsXAbAXLzvAdJFqtPJLAZTgOcqJobxQAhLNbgiFydVlcmVOrpZKklOYxizQCRpiLfjeROuWivGXfwgkq.pkg -O bitter-smile.pkg

CALL :Header
echo ----------------------------------
echo       Extracting Bitter Smile    
echo ----------------------------------

IF not EXIST extracted-game ( 
    mkdir extracted-game 
) ELSE ( 
    rmdir /Q /S extracted-game
    mkdir extracted-game
)

cd extracted-game
..\pkg2zip\pkg2zip -x ..\bitter-smile.pkg

CALL :Header
echo ----------------------------------
echo    Patching game with h-encore
echo ----------------------------------

..\..\bin\robocopy.exe /e app\PCSG90096 ..\h-encore-2\app\ux0_temp_game_PCSG90096_app_PCSG90096

CALL :Header
echo ----------------------------------
echo    Patching game with h-encore
echo ----------------------------------

copy /y app\PCSG90096\sce_sys\package\temp.bin ..\h-encore-2\license\ux0_temp_game_PCSG90096_license_app_PCSG90096\6488b73b912a753a492e2714e9b38bc7.rif

cd ..\..

CALL :Header
echo ----------------------------------
echo                QCMA
echo ----------------------------------

bin\wget https://github.com/codestation/qcma/releases/download/v0.4.1/Qcma_setup-0.4.1.exe -O Qcma_setup.exe

CALL :Header
echo ----------------------------------
echo                QCMA
echo ----------------------------------
echo "1 - Install QCMA"
echo "2 - Start qcma and within the qcma settings set the option Use this version for updates to FW 0.00 (Always up-to-date) to spoof the System Software check."
echo "3 - Launch Content Manager on your PS Vita and connect it to your computer, where you then need to select PC -> PS Vita System, and after that you select Applications. If you see an error message about System Software, you should simply reboot your device to solve it (if this doesn't solve, then put your device into airplane mode and reboot). If this does still not work, then alternatively set DNS to 212.47.229.76 to block updates."
echo "4 - This should create a folder at PS Vita/APP/xxxxxxxxxxxxxxxx on your computer (see qcma settings where this folder is), where the folder xxxxxxxxxxxxxxxx represents the AID (account ID that is 16 characters long) that you need to insert ( http://cma.henkaku.xyz/ ). If the AID is valid, it will yield a key that you can now use to encrypt the demo."
set /p decryptKey=Enter your key here:

cd temp

cd h-encore-2

..\psvimgtools\psvimg-create -n app -K %decryptKey% app PCSG90096/app
..\psvimgtools\psvimg-create -n appmeta -K %decryptKey% appmeta PCSG90096/appmeta
..\psvimgtools\psvimg-create -n license -K %decryptKey% license PCSG90096/license
..\psvimgtools\psvimg-create -n savedata -K %decryptKey% savedata PCSG90096/savedata

..\..\bin\robocopy.exe /e  PCSG90096 ..\..\PCSG90096

cd ..\..
rmdir /Q /S temp

CALL :Header
echo ----------------------------------
echo                QCMA
echo ----------------------------------
echo "1 - Copy the folder PCSG90096 to PS Vita/APP/xxxxxxxxxxxxxxxx/PCSG90096 and then select Refresh database in qcma."
echo "2 - he h-encore² bubble with a size of around 243 MB should now appear in the Content Manager and that's what you finally need to transfer to your PS Vita. If the size does not match or you get the error C2-12858-4, then it's because you did not do it correctly! Please re-read the instructions more carefully then. If you get the error You can only copy applications that your account is the owner of, then it's because you have used an AID that is not of your account."
echo "3 - Launch h-encore² to exploit your device (if a message about trophies appears, simply click yes). The screen should first flash white, then purple, and finally open a menu called h-encore bootstrap menu where you can download VitaShell and install HENkaku."
echo "4 - Enjoy. Note that you have to relaunch the exploit everytime you reboot or shutdown your device. Of course if you only put your device into standby mode, you don't need to relaunch." 

pause 

:Header
    cls
    echo =================================================
    echo          h-encore 2 Maker - R4z0r ../        
    echo =================================================
goto:eof