@echo off
::In order to use this tool, you must have the following:
::GTA V Folder with a fresh install,
::GTA V FiveM folder with your FiveM Files, and
::GTA V LSPDFR folder with your LSPDFR Files.
::
::This is the location of your GTA Directory 
::HIGHLIGHT THE QUOTED CODE AND SELECT CHANGE ALL OCCURENCES "C:\Program Files (x86)\steam\steamapps\common" 
::This is the location of your FiveM Directory
::HIGHLIGHT THE QUOTED CODE AND SELECT CHANGE ALL OCCURENCES "%userprofile%\AppData\Local\FiveM"
::
::Lastly, Create the following text files and place them in the following directories:
::GTA5.TXT --> GTA V Root
::FiveM.TXT --> GTA V FiveM Root
::LSPDFR.TXT --> GTA V LSPDFR Root
::
::PREREQUISITES
title Grand Theft Auto V Launcher Tool
set count=0
goto check

:check
tasklist | find /i "RAGEPluginHook.exe" && goto wait
tasklist | find /i "GTA5.exe" && goto wait
tasklist | find /i "FiveM.exe" && goto wait
goto :start

:wait
if %count% GEQ 3 (
    goto message1
)
cls
echo.
echo.
echo Waiting to verify games are closed...
timeout 5
goto :count

:count
set /a count=%count%+1
goto check

:message1
if %count% GEQ 5 (
    goto message2
)
cls
echo.
echo.
echo This seems to be taking awhile...
timeout 5
goto count

:message2
cls
echo.
echo.
echo An error has occured.
echo.
echo Please verify your games are closed before running this tool.
echo.
pause
goto EOF 

:nevermind
goto EOF

::BEGIN CODE
:start
cls
echo.
echo Hello %username%, Which Game would you like to play today?
echo.
echo 1: FiveM
echo 2: LSPDFR
echo 3: Grand Theft Auto V Single Player
echo 4: Nevermind, I don't want to play these anymore.
set choice=
echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
::To Remove an option, comment out (::) the line and update the numbers below and above to match.
if '%choice%'=='1' goto FiveM
if '%choice%'=='2' goto LSPDFR
if '%choice%'=='3' goto GTA5
if '%choice%'=='4' goto nevermind
echo Please select a valid option and try again.
pause
goto start

:FiveM
echo.
if exist "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V" (
    cd "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V"
    if exist "GTA5.txt" (
        cd "C:\Program Files (x86)\steam\steamapps\common" & move "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V" "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V Clean"
        if exist "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V FiveM" (
            cd "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V FiveM"
            if exist "FiveM.txt" (
               cd "C:\Program Files (x86)\steam\steamapps\common" & move "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V FiveM" "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V" 
               start /b "" "%userprofile%\AppData\Local\FiveM\FiveM.exe"
               goto EOF
            )
        )
    )
    if exist "fivem.txt" (
        start /b "" "%userprofile%\AppData\Local\FiveM\FiveM.exe\FiveM.exe"
        goto EOF
    )
    if exist "LSPDFR.txt" (
        cd "C:\Program Files (x86)\steam\steamapps\common" & move "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V" "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V LSPDFR"
        if exist "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V FiveM" (
            cd "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V FiveM"
            if exist "fivem.txt" (
                cd "C:\Program Files (x86)\steam\steamapps\common" & move "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V FiveM" "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V"
                start /b "" "%userprofile%\AppData\Local\FiveM\FiveM.exe\FiveM.exe"
                goto EOF
            )
        )
    )
 ) else (
     goto error
 )

:LSPDFR
echo.
if exist "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V" (
    cd "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V"
    if exist "GTA5.txt" (
        cd "C:\Program Files (x86)\steam\steamapps\common" & move "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V" "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V Clean"
        if exist "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V LSPDFR" (
            cd "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V LSPDFR"
            if exist "LSPDFR.txt" (
               cd "C:\Program Files (x86)\steam\steamapps\common" & move "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V LSPDFR" "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V" 
               cd "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V"
               start /b "" "RAGEPluginHook.exe"
               goto EOF
            )
        )
    )
    if exist "LSPDFR.txt" (
        cd "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V"
        start /b "" "RAGEPluginHook.exe"
        goto EOF
    )
    if exist "fivem.txt" (
        cd "C:\Program Files (x86)\steam\steamapps\common" & move "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V" "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V FiveM"
        if exist "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V LSPDFR" (
            cd "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V LSPDFR"
            if exist "LSPDFR.txt" (
                cd "C:\Program Files (x86)\steam\steamapps\common" & move "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V LSPDFR" "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V"
                cd "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V"
                start /b "" "RAGEPluginHook.exe"
                goto EOF
            )
        )
    )
 ) else (
     goto error
 )

:GTA5
echo.
if exist "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V" (
    cd "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V"
    if exist "fivem.txt" (
        cd "C:\Program Files (x86)\steam\steamapps\common" & move "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V" "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V FiveM"
        if exist "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V Clean" (
            cd "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V Clean"
            if exist "GTA5.txt" (
               cd "C:\Program Files (x86)\steam\steamapps\common" & move "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V Clean" "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V" 
               start /b "" "steam://rungameid/271590"
               goto EOF
            )
        )
    )
    if exist "GTA5.txt" (
        start /b "" "steam://rungameid/271590"
        goto EOF
    )
    if exist "LSPDFR.txt" (
        cd "C:\Program Files (x86)\steam\steamapps\common" & move "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V" "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V LSPDFR"
        if exist "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V Clean" (
            cd "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V Clean"
            if exist "GTA5.txt" (
                cd "C:\Program Files (x86)\steam\steamapps\common" & move "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V Clean" "C:\Program Files (x86)\steam\steamapps\common\Grand Theft Auto V"
                start /b "" "steam://rungameid/271590"
                goto EOF
            )
        )
    )
 ) else (
     goto error
 )

:error
echo An error has occured. Please try again. 
echo.
echo If this issue persists, please make sure your GTA Folders are as follows:
echo Grand Theft Auto V (Contains GTA5.txt)
echo Grand Theft Auto V FiveM (Contains FiveM.txt)
echo Grand Theft Auto LSPDFR (Contains LSPDFR.txt)
echo.
echo If the problem persists after checking your folders are correct, please contact the author for assistance.
echo.
pause
goto start
