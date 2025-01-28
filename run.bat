@echo off
:: PowerShell komutu ile doğru İndirilenler klasörünü bul
for /f "tokens=*" %%a in ('powershell -NoProfile -Command "[System.Environment]::GetFolderPath('UserProfile') + '\Downloads'"') do set downloadsPath=%%a

:: Eğer OneDrive varsa, OneDrive içinde olduğunu kontrol et
if defined OneDrive (
    for /f "tokens=*" %%a in ('powershell -NoProfile -Command "[System.Environment]::GetFolderPath('UserProfile') + '\OneDrive\Downloads'"') do set downloadsPath=%%a
)

:: Dosyayı çalıştır
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File \"%downloadsPath%\Chocolatey-App-Installer\Chocolatey-App-Installer.ps1\"' -Verb RunAs"
pause

