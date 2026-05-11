
Set-Location D:\Cthis
Write-Host ""
Write-Host ""
Write-Host "進入 Claude後可以輸入："
Write-Host ""
Write-Host "Clear-Content "$env:USERPROFILE\.codex\history.jsonl""
Write-Host ""
Write-Host "Get-Item "$env:USERPROFILE\.codex\history.jsonl" | Select-Object Name, Length"
Write-Host ""
Write-Host ""




claude --permission-mode default --add-dir D:\Cthis
