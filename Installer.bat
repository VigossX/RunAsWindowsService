@echo off
echo install begin

@REM %1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

sc create ShipMaintenanceService binPath= "\"C:\program files\dotnet\dotnet.exe\" \"%~dp0%\App\Trawind.ShipMaintenance.HttpApi.Host.dll\"" DisplayName= "ShipMaintenanceService" start= auto

sc start ShipMaintenanceService

pause
exit