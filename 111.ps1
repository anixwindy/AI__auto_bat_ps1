# 1. 鋼鐵鎖定目標路徑
$TargetDir = "D:\Cthis"
if (-not (Test-Path -Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir | Out-Null
}
Set-Location -Path $TargetDir

# 2. 清除干擾
Clear-Host

# 3. 暴力製程交接 (Bypass PowerShell TTY Interception)
# 利用 cmd /c 強制剝離 PowerShell 的流攔截，讓 agy 直接綁定最底層的 Windows Terminal
cmd /c agy -i "載入 Antigravity.md"