cd /d "%~dp0"
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c pushd ""%~dp0"" && ""%~s0"" ::","","runas",1)(window.close)&&exit
for /f "skip=2 tokens=1,2*" %%I in ('%SystemRoot%\System32\reg.exe query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName 2^>nul') do if /i "%%I" == "ProductName" set "WindowsProduct=%%K"
if "%WindowsProduct%"=="Windows 7 Professional" (goto Win7Pro)
if "%WindowsProduct%"=="Windows Embedded 8.1 Industry Pro" (goto Win8EmbeddedIndustryPro)
if "%WindowsProduct%"=="Windows 10 Enterprise LTSC 2021" (goto Win10LTSC21H2)
if "%WindowsProduct%"=="Windows 10 Enterprise LTSC 2021 Evaluation" (goto Win10LTSC21H2)

:Win7Pro
powercfg /s 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg /x monitor-timeout-ac 15
powercfg /x monitor-timeout-dc 15
powercfg /x standby-timeout-ac 0
powercfg /x standby-timeout-dc 0
powercfg /setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg /setdcvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg /h off
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\AitAgent"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
bcdedit /deletevalue useplatformclock
bcdedit /set {current} quietboot yes
setx TEMP C:\TEMP & setx TEMP C:\TEMP /m & setx TMP C:\TEMP & setx TMP C:\TEMP /m
netsh interface ipv4 set dnsservers "Ethernet" static 8.8.8.8 primary
netsh interface ipv4 add dnsservers "Ethernet" 8.8.4.4 index=2
reg import Win7-Pro-settings.reg
exit

:Win8EmbeddedIndustryPro
powercfg /s 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg /x monitor-timeout-ac 15
powercfg /x monitor-timeout-dc 15
powercfg /x standby-timeout-ac 0
powercfg /x standby-timeout-dc 0
powercfg /setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg /setdcvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg /h off
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\AitAgent"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\StartupAppTask"
schtasks /change /disable /tn "Microsoft\Windows\Customer Experience Improvement Program\BthSQM"
schtasks /change /disable /tn "Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
schtasks /change /disable /tn "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
schtasks /change /disable /tn "Microsoft\Windows\Customer Experience Improvement Program\ScheduleWepCEIP"
schtasks /change /disable /tn "Microsoft\Windows\Customer Experience Improvement Program\Uploader"
schtasks /change /disable /tn "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
bcdedit /deletevalue useplatformclock
bcdedit /set {current} quietboot yes
setx TEMP C:\TEMP & setx TEMP C:\TEMP /m & setx TMP C:\TEMP & setx TMP C:\TEMP /m
netsh interface ipv4 set dnsservers "Ethernet" static 8.8.8.8 primary
netsh interface ipv4 add dnsservers "Ethernet" 8.8.4.4 index=2
reg import Win8-Embedded-Industry-Pro-settings.reg
cscript %windir%\System32\slmgr.vbs /ipk M9Q9P-WNJJT-6PXPY-DWX8H-6XWKK
cscript %windir%\System32\slmgr.vbs /skms kms8.msguides.com
cscript %windir%\System32\slmgr.vbs /ato
exit

:Win10LTSC21H2
powercfg /s 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg /x monitor-timeout-ac 15
powercfg /x monitor-timeout-dc 15
powercfg /x standby-timeout-ac 0
powercfg /x standby-timeout-dc 0
powercfg /setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg /setdcvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg /h off
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\PcaPatchDbTask"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\StartupAppTask"
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
bcdedit /deletevalue useplatformclock
bcdedit /set {current} quietboot yes
setx TEMP C:\TEMP & setx TEMP C:\TEMP /m & setx TMP C:\TEMP & setx TMP C:\TEMP /m
netsh interface ipv4 set dnsservers "Ethernet" static 8.8.8.8 primary
netsh interface ipv4 add dnsservers "Ethernet" 8.8.4.4 index=2
reg import Win10-LTSC-21H2-settings.reg
xcopy /e skus %WINDIR%\System32\spp\tokens\skus
cscript %WINDIR%\System32\slmgr.vbs /rilc
cscript %WINDIR%\System32\slmgr.vbs /upk >nul 2>&1
cscript %WINDIR%\System32\slmgr.vbs /ckms >nul 2>&1
cscript %WINDIR%\System32\slmgr.vbs /cpky >nul 2>&1
cscript %WINDIR%\System32\slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D
cscript %WINDIR%\System32\slmgr.vbs /skms kms.teevee.asia
cscript %WINDIR%\System32\slmgr.vbs /ato
exit