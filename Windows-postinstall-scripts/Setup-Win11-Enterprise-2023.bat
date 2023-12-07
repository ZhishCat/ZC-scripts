cd /d "%~DP0"
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c pushd ""%~DP0"" && ""%~S0"" ::","","runas",1)(window.close)&&exit
powercfg /s 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg /x monitor-timeout-ac 15
powercfg /x monitor-timeout-dc 15
powercfg /x standby-timeout-ac 0
powercfg /x standby-timeout-dc 0
powercfg /setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg /setdcvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg /h off
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\MareBackup"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\PcaPatchDbTask"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\SdbinstMergeDbTask"
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\StartupAppTask"
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
schtasks /change /disable /tn "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
schtasks /change /disable /tn "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup"
schtasks /change /disable /tn "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"
schtasks /change /disable /tn "\Microsoft\Windows\Windows Defender\Windows Defender Verification"
bcdedit /deletevalue useplatformclock
bcdedit /set {current} quietboot yes
setx TEMP C:\TEMP & setx TEMP C:\TEMP /m & setx TMP C:\TEMP & setx TMP C:\TEMP /m
netsh interface ipv4 set dnsservers "Ethernet" static 8.8.8.8 primary
netsh interface ipv4 add dnsservers "Ethernet" 8.8.4.4 index=2
takeown /f "%WINDIR%\System32\smartscreen.exe"
icacls "%WINDIR%\System32\smartscreen.exe" /Grant Administrators:f
ren "%WINDIR%\System32\smartscreen.exe" smartscreenDisabled.exe
reg import Win11-Enterprise-2023-settings.reg