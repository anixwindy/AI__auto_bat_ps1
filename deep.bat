@echo off
title DeepCode 導航啟動器
cls

echo [+] 正在啟動 PowerShell 並切換至 D:\Cthis...

:: 呼叫 Windows 原生 PowerShell，自動執行切換目錄並拉起 deepcode
powershell -NoExit -Command "Set-Location 'D:\Cthis'; deepcode"