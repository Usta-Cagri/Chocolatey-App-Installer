#Chocolatey Check
$choco = choco 2>null
if (choco -match "Chocolatey") {
	Write-Output "Chocolatey Package Manager is detected!"


#Options:
Write-Output "Please Choose One of the Options:"
Write-Output "1: Install the Recommended Apps"
Write-Output "2: Install Gaming Stuff"
Write-Output "3: Update All Chocolatey Apps "
Write-Output "4: Install an App(whatever you want)"
$choice = Read-Host "Please Choose One of the Options: 1/2/3/4"

#Functions:
function Install-RecommendedApps {
    param (
        [string[]]$AppList          
    )
    foreach ($app in $AppList) {
        Write-Output "$app is Downloading..."
        choco install $app -y
    }
    Write-Output "The Installation is Finished!"
}

function Update-ChocoApps {
    Write-Output "Chocolatey Apps are Updating, Be Patient..."
    choco upgrade all -y
    Write-Output "It's Done!"
}

function Install-ChocoApp {
    $AppName = Read-Host "Write the Name of the App that You Want to Install:"
    Write-Output "$AppName is Downloading..."
    choco install $AppName -y
    Write-Output "The Installation is Finished!"
}

#Logic to call functions based on user's choice::
if ($choice -eq "1") {
    # Predefined apps to install (you can modify this list as needed)
    $PredefinedApps = @("vscode", "Onlyoffice", "Firefox")
    Install-RecommendedApps -AppList $PredefinedApps
} elseif ($choice -eq "2") {
    $PredefinedApps ? @("steam", "ea-app", "ubisoft-connect", "heroic-games-launcher", "msiafterburner",)
} elseif ($choice -eq "3") {
    Update-ChocoApps 
} elseif ($choice -eq "4") {
    Install-ChocoApp
} else {
    Write-Output "Invalid choice. Please restart the script and choose a valid option."
}
}

else {

#Chocolatey Package Manager Installation:
$defaultexecutionpolicy = Get-ExecutionPolicy
Write-Output "Chocolatey Package Manager is installing..."
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

if ((choco) -match "Chocolatey") {
	Write-Output "Chocolatey Package Manager is succesfully installed!"
	Write-Output "Please re-run the script if you want it to work!"
}

else {
	Write-Output "Chocolatey is not installed because of an error😢(exiting...)"
	exit
}

Set-ExecutionPolicy $defaultexecutionpolicy -Scope LocalMachine
$defaultnewexecutionpolicy = Get-ExecutionPolicy

if ($defaultnewexecutionpolicy -eq $defaultexecutionpolicy) {
	Write-Output "Your Execution Policy before the installation hasn't changed!"
}

else {
	Write-Output "Your Execution Policy might be have changed and it can cause some security problems!"
}
}
