@echo off

wt ^
  new-tab ^
  --title "Codex" ^
  --suppressApplicationTitle ^
powershell.exe -NoExit -NoProfile -ExecutionPolicy Bypass -File "D:\Cthis\start_codex.ps1"
