@echo off
color a

::Check for permission

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

::If error flag set, we do not have admin.

if '%errorlevel%' NEQ '0' (
	goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
	echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	set params = %*:"="
	echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
	"%temp%\getadmin.vbs"
	del "%temp%\getadmin.vbs"
	exit /B
	
:gotAdmin
	pushd "%CD%"
	CD /D "%~dp0"

goto MainMenu

:MainMenu
	::Display ASCII art
	echo " ,                 _                 o   , __                                     ";
	echo "/|   |            | |                /  /|/  \                     |  o           ";
	echo " |___|  __,   __  | |   _   ,_    ,      |___/ __,   ,_    __,   __|      ,   _   ";
	echo " |   |\/  |  /    |/_) |/  /  |  / \_    |    /  |  /  |  /  |  /  |  |  / \_|/   ";
	echo " |   |/\_/|_/\___/| \_/|__/   |_/ \/     |    \_/|_/   |_/\_/|_/\_/|_/|_/ \/ |__/ ";
	::Main Menu
	echo(
	echo Options
	echo 1. Getting Administrator Privileges
	echo 2. Learning Batch Basics
	echo 3. Blue Screen of Death
	echo 4. Installing WSL
	echo 5. Rickroll
	echo 6. Exit
	echo(
	echo This script is only intended for Windows 11.
	echo Use on Windows 10 is untested.
	echo Depending on which tutorial you follow, you will need another Windows 11 device or an Internet connection.
	echo(
	goto TakeInput
	
::Take user input

:TakeInput
	set /p input=Enter your choice: 

	if "%input%"=="1" (
		goto GettingAdministratorPrivileges
	) 
	if "%input%"=="2" (
		goto LearningBatchBasics
	) 
	if "%input%"=="3" (
		goto BSOD
	)
	if "%input%"=="4" (
		goto InstallingWSL
	)
	if "%input%"=="5" (
		goto Rickroll
	)
	if "%input%"=="6" (
		exit
	)

:: If invalid input, ask again

echo Invalid input. Please enter a listed option.
goto TakeInput                                                             

::Actual Tutorials
::----------------

::Admin Privileges

:GettingAdministratorPrivileges
	cls
	echo(
	echo(
	echo This is a tutorial to give yourself administrator privileges on your school or work computer.
	echo Following this tutorial is absolutely a terrible idea.
	echo It's quite fun though, and it will get you a lot of respect from friends at school.
	pause
	cls
	echo(
	echo(
	echo Find another Windows 11 device to run this script on, or to follow these steps.
	echo When you have your device ready, press any key.
	pause
	cls
	echo(
	echo(
	echo Hold Shift and click Restart in the Start Menu.
	echo The Start Menu can be found by pressing the Windows Logo Key, but you already knew that, didn't you?
	pause
	cls
	echo(
	echo(
	echo Keep holding Shift until the device restarts.
	echo You will see your computer's BIOS splash screen, and then it will say "Please Wait."
	echo Your computer will now be in the Advanced Boot Options menu.
	pause
	cls
	echo(
	echo(
	echo Navigate to Advanced Options > Troubleshoot > Advanced Options > Command Prompt
	echo Now you will use specific commands to give yourself administrator privileges.
	pause
	cls
	echo(
	echo(
	echo Type C:
	echo Then type cd C:\Windows\System32
	echo Type ren sethc.exe suckit.exe
	echo Type ren cmd.exe sethc.exe
	echo Type exit
	pause
	cls
	echo(
	echo(
	echo For context, sethc.exe is the program behind Sticky Keys.
	echo cmd.exe is the Command Prompt, which is running this script.
	echo Renaming cmd.exe to sethc.exe will allow you to run the Command Prompt on the Windows Lock Screen.
	pause
	cls
	echo(
	echo(
	echo Now choose Exit and Continue to Windows 11.
	echo When you reach the Lock Screen, press Shift 5 times rapidly.
	echo You will see the Command Prompt again.
	echo Type net localgroup administrators /add [your username]
	pause
	cls
	echo(
	echo(
	echo Now you have administrator privileges on a device that you shouldn't have them on.
	echo Have fun, but please don't do anything illegal.
	pause
	cls
	goto MainMenu
	
::Batch Basics

:LearningBatchBasics
	cls
	echo(
	echo(
	echo So you want to learn the basics of the Batch scripting language, huh.
	echo Well, I'm not an expert on it.
	echo In fact, I am learning Batch as I write this script.
	pause
	cls
	echo(
	echo(
	echo So instead of teaching you Batch, I will give you a video tutorial series.
	echo Also check out Stack Overflow if you ever get stuck.
	pause
	cls
	start https://www.youtube.com/playlist?list=PLAC038703B07D976B
	cls
	goto MainMenu
	
::BSOD

:BSOD
	cls
	powershell wininit
	pause
	cls
	goto MainMenu

::Installing WSL

:InstallingWSL
	cls
	echo(
	echo(
	echo WSL is the Windows Subsystem for Linux.
	echo It allows you to run Bash scripts on a Windows machine, whereas without it, you would need to use Linux.
	echo Bash is the scripting language used in the Linux Terminal.
	echo WSL will now be installed.
	pause
	wsl --install
	echo Now you can use Bash scripts on Windows, like the Rickroll on the Main Menu!
	pause
	cls
	goto MainMenu

::Rickroll

:Rickroll
	cls
	bash ASCII_Rickroll.sh
	cls
	goto MainMenu