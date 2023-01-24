# RunAsWindowsService

I had encountered some weird requirements so that I had to run my web application as a windows service.
I don't know whether there will be some disadvantages.
Luckily, I have solved another problem with this solution coincidentally, that is making a hangfire web application be always running.


The script below can install 'ShipMaintenanceService' on windows service, and start it.
You may replace it with your own projectname and project dll path.

```
@echo off
echo install begin

@REM %1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

sc create YourServiceName binPath= "\"C:\program files\dotnet\dotnet.exe\" \"YourServicePath\"" DisplayName= "YourServiceName" start= auto

sc start YourServiceName

pause
exit
```

If you want to stop or delete service, run command below:
```
sc stop YourServiceName

sc delete YourServiceName
```
