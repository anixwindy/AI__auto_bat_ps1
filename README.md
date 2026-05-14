ddd.bat 是系統內建的；把xxx資料夾 +到環境變數；win+R => ddd=> enter 即可<br>codex<br>
-----------------------------------;<br>
@echo off<br>
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\CodexStudy\start_codex.ps1"<br>
pause<br>
-----------------------------------;<br>
用bat開ps1；<br>
Set-Location D:\CodexStudy<br>
Write-Host "進入 Codex 後請貼上："<br>
Write-Host ""<br>
Write-Host "/sandbox-add-read-dir D:\Cthis"<br>
Write-Host ""<br>
Write-Host "/status"<br>
codex --sandbox workspace-write --ask-for-approval on-request<br>
-----------------------------------;<br>
