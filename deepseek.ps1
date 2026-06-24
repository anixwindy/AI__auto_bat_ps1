# 設定終端機編碼
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# 定義加密通行證的存放路徑
$KEY_FILE = "$env:USERPROFILE\.ds_key.enc"

# 1. 檢查加密金鑰是否存在
if (-not (Test-Path $KEY_FILE)) {
    Write-Host "[!] 首次執行，請貼入你的 DeepSeek API Key (sk-...):" -ForegroundColor Cyan
    $key = Read-Host -AsSecureString
    $key | ConvertFrom-SecureString | Out-File $KEY_FILE
    Clear-Host
}

try {
    Write-Host "[+] 正在進行作業系統硬體級安全解密..." -ForegroundColor Yellow
    
    # 2. 內部記憶體安全解密 (絕不外洩至進程外部)
    $sec = Get-Content $KEY_FILE | ConvertTo-SecureString
    $BSTR = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($sec)
    $plainKey = [Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
    
    # 3. 注入環境變數 (限縮在目前視窗的生命週期內)
    $env:DEEPSEEK_API_KEY = $plainKey
    $env:API_KEY = $plainKey

    # 核心安全清理：還原完成立刻粉碎明文指針，縮短記憶體暴露窗口
    $plainKey = $null
    $BSTR = $null
    [GC]::Collect()

    Write-Host "[+] 憑證安全注入成功！" -ForegroundColor Green
    Write-Host "[+] 目前工作目錄 (CWD): D:\Cthis" -ForegroundColor Green
    Write-Host "==================================================="
    Write-Host "   [+] 671B 大腦已接管終端機，開始你的 CTF 刷題吧！"
    Write-Host "==================================================="
    Write-Host ""
    
    # 4. 強行切換目錄並啟動 deepcode
    Set-Location "D:\Cthis"
    deepcode

} catch {
    Write-Host "[X] 核心執行失敗: $($_.Exception.Message)" -ForegroundColor Red
    Read-Host "按下 Enter 結束..."
}