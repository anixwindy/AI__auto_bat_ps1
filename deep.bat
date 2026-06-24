@echo off
:: 強制鎖定當前發射器標題
title deepseek_launcher
cls

echo [+] 正在透過 Windows Terminal 核心拉起滿血獨立環境...

:: 呼叫 wt 開啟新分頁，--suppressApplicationTitle 徹底剥奪後續程式改標題的權限
:: 指向同資料夾下的 deepseek.ps1 執行檔
wt --title "deepseek" --suppressApplicationTitle powershell -NoProfile -ExecutionPolicy Bypass -File "D:\Cthis\deepseek.ps1"

exit