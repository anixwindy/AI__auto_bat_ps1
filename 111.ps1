<#
.SYNOPSIS
    Antigravity CLI Fixed Target Launcher
    強制錨定 D:\Cthis 空間並喚醒官方 agy 終端
#>

# 1. 鋼鐵鎖定目標路徑
$TargetDir = "D:\Cthis"

# 2. 防禦性編程：如果目錄不存在則自動建立，防止載入崩潰
if (-not (Test-Path -Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir | Out-Null
}

# 3. 空間強行切換：將工作目錄鎖死在 D:\Cthis
Set-Location -Path $TargetDir

# 4. 清理環境視窗痕跡
Clear-Host

# 5. 正式呼叫 Google Antigravity CLI 核心
# 第一次執行會自動彈出瀏覽器進行 Google 認證，之後便會常駐在該目錄
& agy