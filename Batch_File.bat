:: Drive Folder Creation
@echo off
set base=D:
set iconFolder=D:\Ico-Folder\Icons\Other

echo ========================================
echo	      Batch Folder Script
echo ========================================

:: Create Base Folder
pushd %base%
md "7-Zip" "Audacity" "GameDev" "Game Launchers" "Krita" "OBS" "Revo Uninstaller" "Visual Studio" "Winrar" "Brave" "iTunes" "Discord" "Github" "TranslucentTB" "Gimp" "Razer" "HyperX"


:: Nested Folders
md "Game Launchers\Steam" "Game Launchers\Epic Games"
md "GameDev\Unity" "GameDev\Unreal Engine"
md "Github\Github Desktop"
md "Razer\Cortex" "Razer\Synapse"
popd


:: Y: Drive Folders
pushd Y:
md "Unity\Unity Versions"
popd


:: Assign icons using desktop.ini
for %%F in (
    "7-Zip"
    "Audacity"
    "Brave"
    "Discord"
    "GameDev"
    "GameDev\Unity"
    "GameDev\Unreal Engine"
    "Game Launchers"
    "Game Luachers\Epic Games"
    "Game Launchers\Steam"
    "Github"
    "Github\Github Desktop"
    "HyperX"
    "iTunes"
    "OBS"
    "Razer"
    "Razer\Cortex"
    "Razer\Synapse"
    "Revo Uninstaller"
    "TranslucentTB"
    "Visual Studio"
    "Winrar"
) do (
	set "folderPath=%base%\%%~F"
	
)

:: Function to set folder icon
:SetIcon
setlocal
set folder=%~1
set icon=%iconFolder%\%~2

:: Ensure the folder exists
if not exist "%folder%" (
	echo Folder not found: %folder%
	goto :eof
)


:: Set the folder as system to allow desktop.ini to take effect
attrib +s "%folder%"

:: Write desktop.ini
(
	echo [.ShellClassInfo]
	echo IconResource=%icon%, 0
) > "%folder%\desktop.ini"

endlocal
exit /b