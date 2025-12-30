@echo off

net file 1>NUL 2>NUL
if not '%errorlevel%' == '0' (
    powershell Start-Process -FilePath "%0" -ArgumentList "%cd%" -verb runas >NUL 2>&1
    exit /b
)

cd /d "%~dp0"

curl -L -o EmsisoftEmergencyKit.exe https://dl.emsisoft.com/EmsisoftEmergencyKit.exe
7z x EmsisoftEmergencyKit.exe -oD:\EEK -y

regedit /s "emsi_cmd.reg"


& pause & exit
