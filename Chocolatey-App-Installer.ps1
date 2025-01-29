#Options:
Write-Output "Please Choose One of the Options:"
Write-Output "1: Install the Recommended Apps"
Write-Output "2: Update All Chocolatey Apps "
Write-Output "3: Install an App(whatever you want)"
$choice = Read-Host "Please Choose One of the Options: 1/2/3"

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
    Update-All 
} elseif ($choice -eq "3") {
    Install-ChocoApp
} else {
    Write-Output "Invalid choice. Please restart the script and choose a valid option."
}
