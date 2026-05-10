
Set-Location D:\Cthis
Write-Host ""
Write-Host "進入 Codex 後請貼上："
Write-Host ""
Write-Host "進入 Codex 後可以輸入："
Write-Host ""
Write-Host "Clear-Content "$env:USERPROFILE\.codex\history.jsonl""
Write-Host ""
Write-Host "Get-Item "$env:USERPROFILE\.codex\history.jsonl" | Select-Object Name, Length"
Write-Host ""
Write-Host "Codex CLI history.jsonl 已清空。"
Write-Host ""







codex --sandbox workspace-write --ask-for-approval on-request