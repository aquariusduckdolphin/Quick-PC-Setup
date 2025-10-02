:: Programs to install on pc


:start
cls
echo ========================================
echo	      App Installer Script
echo ========================================
echo
set /p user_input= Would you like to download all apps all together or separately? (1=All/2=Individually): 
if not defined user_input goto start
if %user_input%==1 (
	set install_all=true
) else if %user_input%==2 (
	set install_all=false
) else (
	echo Invalid input. Please type 1 or 2.
	goto start
)


:: Essential Programs
call :InstallApp "RevoUninstaller.RevoUninstaller" "D:\Revo Uninstaller"
call :InstallApp "CharlesMilette.TranslucentTB" "D:\TranslucentTB"
call :InstallApp "Microsoft.PowerToys" "D:\PowerToys"
call :InstallApp "OBSProject.OBSStudio" "D:\OBS"
call :InstallApp "Discord.Discord" "D:\Discord"
call :InstallApp "Apple.iTunes" "D:\iTunes"

:: Game Launchers
call :InstallApp "Valve.Steam" "D:\Game Launchers\Steam"
call :InstallApp "EpicGames.EpicGamesLauncher" "D:\Game Launchers\Epic Games"

:: Browsers
call :InstallApp "Brave.Brave" "D:\Brave"

:: Keyboard & Mouse
call :InstallApp "9PK9W5QV2PKX" "D:\Razer\Razer Cortex"
call :InstallApp "RazerInc.RazerInstaller.Synapse4" "D:\Razer\Razer Synapse"
call :InstallApp "9P1TBXR6QDCX" "D:\HyperX"

:: Game Dev Apps
call :InstallApp "Microsoft.VisualStudio.2022.Community" "D:\Visual Stuio"
call :InstallApp "GitHub.GitHubDesktop" "D:\GitHub\GitHub Desktop"
call :InstallApp "Audacity.Audacity" "D:\Audacity"
call :InstallApp "Unity.UnityHub" "D:\GameDev\Unity"
call :InstallApp "Unity.Unity.2020" "Y:\Unity"
call :InstallApp "Unity.Unity.6000" "Y:\Unity"

:: Creative Apps
call :InstallApp "9PNSJCLXDZ0V" "D:\Gimp"
call :InstallApp "KDE.Krita" "D:\Krita"

:: Zip Utilities
call :InstallApp "7zip.7zip" "D:\7-Zip"
call :InstallApp "RARLab.WinRAR" "D:\Winrar"


:: -----------------------------------
:: Function: Install App
:: Arguments:
:: 	%1 = App ID (from winget)
::	%2 = Installation Location
:: -----------------------------------
:InstallApp
set app_id=%~1
set installation_path=%~2

if "%install_all%"=="true"(
	goto :do_install
) else (
	choice /M "Do you want to install %app_id%?"
	if errorlevel 2 (
		echo Skipped %app_id%
		goto: eof
	)
)

:do_install
echo Installing %app_id% to %installation_path% ...
winget install -e --id %app_id% --accept-package-agreements --accept-source-agreements --location "%installation_path%" --silent
echo
exit /b

:end
echo
echo All selected installations are complete!
pause
exit
