#Being Sure That Choco is Installed
$choco = Get-Command choco -ErrorAction SilentlyContinue

#Installing If Chocolatey is not Installed 
if (-not $choco) {
    Write-Host "Chocolatey Package Manager is not installed!"
    Write-Host "Chocolatey Package Manager is installing..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    
    $choco = Get-Command choco -ErrorAction SilentlyContinue
    if (-not $choco) {
        Write-Host "An error occured due to misinstallation of Chocolatey Package Manager!"
    }
    else {
        Write-Host "Chocolatey Package manager is installed Chocolatey App Installer is starting..."
        Set-ExecutionPolicy Bypass -Scope Process -Force; irm https://raw.githubusercontent.com/Usta-Cagri/Chocolatey-App-Installer/main/Chocolatey-App-Installer.ps1 | iex
    }
}

elseif (choco) {
    Write-Host "Chocolatey Package Manager is detected!"
    Write-Host "Chocolatey App Installer is starting..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; irm https://raw.githubusercontent.com/Usta-Cagri/Chocolatey-App-Installer/main/Chocolatey-App-Installer.ps1 | iex
}

else {
    Write-Host "An error occured nothing is done"
    exit
}

