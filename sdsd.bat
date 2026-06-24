# 2>nul & @cls & @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((Get-Content '%~f0') -join [Environment]::NewLine)" & cmd /k

$strTitle = "DeepSeek 密鑰安全自動化工具 (終極不閃退混合版)"
$host.UI.RawUI.WindowTitle = $strTitle
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# 定義加密金鑰儲存的路徑
$KEY_FILE = "$env:USERPROFILE\.ds_key.enc"

# 1. 檢查加密金鑰檔案是否存在，若不存在則進行第一次初始化
if (-not (Test-Path $KEY_FILE)) {
    Write-Host "[!] 偵測到首次執行，正在啟動 Windows DPAPI 安全加密程序..."
    Write-Host "---------------------------------------------------"
    Write-Host "請在下方貼入你的 DeepSeek API Key (sk-...):"
    Write-Host "(注意：輸入時畫面會完全隱形，貼上後直接按 Enter)"
    Write-Host "---------------------------------------------------"
    
    $key = Read-Host -AsSecureString
    $key | ConvertFrom-SecureString | Out-File $KEY_FILE
    
    Write-Host ""
    Write-Host "[+] 成功！金鑰已透過 Windows DPAPI 加密儲存。"
    Start-Sleep -Seconds 2
    Clear-Host
}

Write-Host "==================================================="
Write-Host "      DeepSeek 671B 滿血大腦 CLI 全自動啟動"
Write-Host "==================================================="
Write-Host ""
Write-Host "[+] 正在安全解密並發送雲端 API 請求..."
Write-Host ""

# 2. 核心邏輯：在純淨的 PowerShell 環境下，徹底免疫 CMD 語法崩潰
try {
    $sec = Get-Content $KEY_FILE | ConvertTo-SecureString
    $BSTR = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($sec)
    $plainKey = [Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
    
    $headers = @{ 
        'Authorization' = 'Bearer ' + $plainKey
        'Content-Type' = 'application/json' 
    }
    
    $body = @{ 
        model = 'deepseek-reasoner'
        messages = @( @{ role = 'user'; content = '你好，這是一次來自 Windows 終極混合架構的不閃退測試。' } )
        max_tokens = 50 
    } | ConvertTo-Json -Compress
    
    $res = Invoke-RestMethod -Uri 'https://api.deepseek.com/chat/completions' -Method Post -Headers $headers -Body ([System.Text.Encoding]::UTF8.GetBytes($body))
    
    Write-Host "---------------------------------------------------"
    Write-Host $res.choices[0].message.content
    Write-Host "---------------------------------------------------"
} catch {
    Write-Host "[X] 雲端大腦回傳錯誤: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "==================================================="
Write-Host "[+] 執行完畢！環境已就緒。"
Write-Host "==================================================="
Write-Host ""

# 3. 安全清理記憶體
$plainKey = $null
$BSTR = $null
[GC]::Collect()