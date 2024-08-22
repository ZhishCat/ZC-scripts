cd /d "%~DP0"
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c pushd ""%~DP0"" && ""%~S0"" ::","","runas",1)(window.close)&&exit
powercfg /s 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg /x monitor-timeout-ac 10
powercfg /x monitor-timeout-dc 10
powercfg /x standby-timeout-ac 0
powercfg /x standby-timeout-dc 0
powercfg /setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg /setdcvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg /h off
bcdedit /deletevalue useplatformclock
bcdedit /set {current} quietboot yes
netsh interface ipv4 set dnsservers "Ethernet" static 8.8.8.8 primary
netsh interface ipv4 add dnsservers "Ethernet" 8.8.4.4 index=2
for /f "skip=2 tokens=1,2*" %%I in ('%SystemRoot%\System32\reg.exe query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName 2^>nul') do if /i "%%I" == "ProductName" set "WindowsProduct=%%K"
if "%WindowsProduct%"=="Windows 7 Professional" (reg import "Win7 Professional.reg")
if "%WindowsProduct%"=="Windows Embedded 8.1 Industry Pro" (
reg import "Win8 Embedded Industry Pro.reg"
cscript %WINDIR%\System32\slmgr.vbs /ipk M9Q9P-WNJJT-6PXPY-DWX8H-6XWKK
cscript %WINDIR%\System32\slmgr.vbs /skms kms8.msguides.com
cscript %WINDIR%\System32\slmgr.vbs /ato
)
if "%WindowsProduct%"=="Windows 10 Enterprise LTSC 2021" (reg import "Win10 Enterprise LTSC 2021.reg")