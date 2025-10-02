:: Drive Folder Creation

D:
md "7-Zip" "Audacity" "GameDev" "Game Launchers" "Krita" "OBS" "Revo Uninstaller" "Visual Studio" "Winrar" "Brave" "iTunes" "Discord" "Github" "TranslucentTB" "Gimp" "Razer" "HyperX"

cd D:\Game Launchers\
md "Steam" "Epic Games"
cd..

cd D:\GameDev
md "Unity" "Unreal Engine"
cd..

cd D:\Github
md "Github Desktop"
cd..

cd D:\Razer
md "Cortex" "Synapse"
cd..

Y:
md "Unity"
cd Y:\Unity\Unity Versions
cd..

set "iconFolder=D:\Ico-Folder\Icons\Other"

:: Set icons
for %%F in (
    "7-Zip"
    "Audacity"
    "GameDev"
    "GameDev\Unity"
    "GameDev\Unreal Engine"
    "Game Launchers"
    "Game Launchers\Steam"
    "Game Luachers\Epic Games"
    "OBS"
    "Revo Uninstaller"
    "Visual Studio"
    "Winrar"
    "Brave"
    "iTunes"
    "Discord"
    "Github"
    "Github\Github Desktop"
    "Razer"
    "Razer\Cortex"
    "Razer\Synapse"
    "HyperX"
    "TranslucentTB"
) do (
    set "folderPath=%base%\%%~F"
    (
        echo [.ShellClassInfo]
        echo IconResource=%iconFolder%\%%~F.ico,0
    ) > "%base%\%%~F\desktop.ini"

    attrib +s +h "%base%\%%~F\desktop.ini"
    attrib +r "%base%\%%~F"
)