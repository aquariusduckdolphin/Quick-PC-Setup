@echo off
:: ----------------------------------
set music_drive=F:
set music_full_path=%music_drive%\Music
set batch_folder= C:\Users\nvird\Downloads\PC Batch Setup\Batch_File.bat
set batch_install_programs= C:\Users\nvird\Downloads\PC Batch Setup\Install_Programs.bat

set user_input=
:: ----------------------------------


:start
echo ========================================
echo	      App Installer Script
echo ========================================
goto FreshInstall

:: ----------------------------------
:FreshInstall
set /p user_input= Would you like to remove the unneccessary files? (y/n): 
if not defined user_input goto FreshInstall
if /i %user_input%==y goto FreshInstall
if /i %user_input%==n (goto NotFreshInstall) else (goto InvalidInput)

:FreshInstall
echo Starting the Fresh Install process ...
winget uninstall -e --id Microsoft.BingSearch_8wekyb3d8bbwe
winget uninstall -e --id Microsoft.Teams
winget uninstall -e --id Microsoft.BingWeather_8wekyb3d8bbwe\
winget uninstall -e --id Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe
winget uninstall -e --id Microsoft.Edge 
winget uninstall -e --id Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe
winget uninstall -e --id 9P7BP5VNWKX5
winget uninstall -e --id 9N5TDP8VCMHS
winget uninstall -e --id Microsoft.OutlookForWindows_8wekyb3d8bbwe
winget uninstall -e --id Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe
winget uninstall -e --id Microsoft.WindowsAlarms_8wekyb3d8bbwe
goto CreateFolders

:NotFreshInstall
echo Skipping Fresh Install ...
goto CreateFolders
:: ----------------------------------

:: ----------------------------------
:CreateFolders
set /p user_input= Would you like to create folders in D: drive? (y/n): 
if not defined user_input goto CreateFolders
if /i %user_input%==y goto BatchFolders
if /i %user_input%==n (goto RejectBatchFolders) else (goto InvalidInput)

:BatchFolders
echo Creating the folders in D: drive ...
if exist "D:\" (
	echo D: drive has been found!
	call batch_folder
) else (
	echo D: drive has not been found!
)
goto BatchInstallPrograms

:RejectBatchFolders
echo Skipping the folder creation ...
goto BatchInstallPrograms
:: ----------------------------------

:: ----------------------------------
:BatchInstallPrograms
set /p user_input= Would you like install all programs? (y/n): 
if not defined user_input goto BatchInstallPrograms
if /i %user_input%==y goto BatchInstall
if /i %user_input%==n (goto RejectBatchInstall) else (goto InvalidInput)

:BatchInstall
echo Starting the Batch Install of programs ...
REM call batch_install_programs
goto CopyMusic

:RejectBatchInstall
echo Skipping the Batch Install of programs ...
goto CopyMusic
:: ----------------------------------

:: ----------------------------------
:CopyMusic
set /p user_input= Would you like to transfer music from %music_drive% drive to C: drive? (y/n): 
if not defined user_input goto CopyMusic
if /i %user_input%==y goto TransferMusic
if /i %user_input%==n (goto RejectTransferMusic) else (goto InvalidInput)

:TransferMusic
echo Starting the transferring process ...
if exist "%music_full_path%" ( 
	echo Music Found
	REM robocopy %music_full_path% C:\Users\nvird\Music\iTunes\iTunes Media\Automatically Add to iTunes /E /TEE /ETA
	pause
	exit
) else (
	echo %music_full_path% does not exist. Make sure the drive is pulled in!
	pause
	exit
)
set user_input=

:RejectTransferMusic
echo Skipping the transferring process ...
pause
exit
:: ----------------------------------


:InvalidInput
echo %user_input% is not valid, try again!
set user_input=
pause
exit
