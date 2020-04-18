@echo off
::Author Khurram 

:::The Loop and the Option for the User starts here.
:loop
Title "AD and other Info Check Script"
color  0A
echo  *****************************************
echo  *****************************************
echo  *************Helpful Scripts*************
echo  *****************************************
echo  ************* Batch file ****************
echo  *****************************************
echo  *****************************************
echo  *****************************************
echo: ****************************************

echo 1  For Password Information
echo 2  For AD User Information
echo 3  Routing Table Information
echo 4  WLAN_Profiles und driver info
echo 5  WLAN_Info
echo 6  Account Active Check in the Active Directory
echo 7  IPConfig Check and export to Clipboard
echo 8  System File Checker  (Scan system files for Problems) - You must have Admin rights to execute that.
echo 9  Flush DNS
echo 10 Disable AD Account
echo 11 Netstat
echo 12 Power Efficiency Diagnosis Report
echo 13 SystemInfo
echo 14 Applicable Group Policies - Will be saved to Clipboard
echo 15 Performance Monitor
echo 16 Display the Folder Structure
echo 17 Tasklist

echo 99 exit 

:::The Options variable. All set of options will be defined here.
set /p variablename= 
if %variablename% == 1 goto case1
if %variablename% == 2 goto case2
if %variablename% == 3 goto case3
if %variablename% == 4 goto case4
if %variablename% == 5 goto case5
if %variablename% == 6 goto case6
if %variablename% == 7 goto case7
if %variablename% == 8 goto case8
if %variablename% == 9 goto case9
if %variablename% == 10 goto case10
if %variablename% == 11 goto case11
if %variablename% == 12 goto case12
if %variablename% == 13 goto case13
if %variablename% == 14 goto case14
if %variablename% == 15 goto case15
if %variablename% == 16 goto case16
if %variablename% == 17 goto case17

if %variablename% == 99 goto case99

::The case or the statements starts here
:case1
echo "Give User Name for the password check"
setlocal
set /p var1= 
net user %var1% /domain | find "Password expires"
net user %var1% /domain | find "Password"
endlocal
pause
::exit
echo:
goto loop
:case2
echo "User Name for AD Check"
echo:
setlocal
set /p var2=
net user %var2% /domain 
endlocal
pause  
goto loop

:case3
echo "Routing Table Information is as follows"
netstat -rn 
goto loop


:case4
echo "Profiles for WLAN are as follows"
echo:
netsh WLAN show profiles
echo "************"
Netsh WLAN show drivers
echo "************"
Netsh WLAN show interfaces
goto loop

:case5
echo "WLAN Info"
echo "Give WLAN name"
echo:
setlocal
set /p var3=
netsh wlan show profile name=%var3% key=clear
goto loop

:case6
echo "Account Active Check"
echo "User Name for AD Account Active Check"
setlocal
set /p var4=
net user %var4% /domain  | find "Account active"
net user %var4% /domain  | find "Full Name"
endlocal
pause  
goto loop

:case7
echo "IP Config Export"
ipconfig | clip
echo "Config exported"
pause
goto loop

:case8
echo" Scanning system files for problems"
sfc /scannow
goto loop

:case9
echo "Flushing DNS"
ipconfig /flushdns

::case10
::echo "Username for password set"
::setlocal
::SET /P usr=
::net user %usr%  abc /domain
:case 10
echo "Disable AD account"
Disable -ADAccount -Identity %variablename%
pause 
endlocal
goto loop

:case 11
echo "Netstat"
netstat | clip
goto loop

:case 12 
echo "Power Efficiency Diagnosis Report on Windows"
powercfg -energy
goto loop

:case 13 
echo "SystemInformation"
SystemInfo
goto loop

:case 14
echo "Applicable Group Policies - Will be saved to Clipboard"
gpresult /R | clip

goto loop

:case 15
echo "Performance Monitor"
perfmon
goto loop


:case 16 
echo "Display the Folder Structure"
tree 
pause 
goto loop

:case 17
echo "Tasklist"
Tasklist

::case 14 
:echo" Map the Drive Again"
::: Net use S:"\\DeviceName\SHARE"/persistent:yes

::case 15
:::CHDSK /f

::case 16
:::SChTasks

::case 17
::echo" Operating System Version"
::ver


:case99 
echo "Exiting"
pause 
exit /b cmd



