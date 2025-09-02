#Options:
Write-Output "Please Choose One of the Options:"
Write-Output "1: Install the Recommended Apps(You will be seeing them before installing if you choose this!)"
Write-Output "2: Install Gaming Stuff(You will be seeing them before installing if you choose this!)"
Write-Output "3: Update All Chocolatey Apps "
Write-Output "4: Install an App(whatever you want)"
$choice = Read-Host "Please Choose One of the Options: 1/2/3/4"

#Functions:
function Install-RecommendedApps {
    param (
        [string[]]$AppList          
    )
    $request = Read-Host "$AppList apps are going to be installed, if you want that please write 'yes'"
    if ($request -eq "yes") {
        foreach ($app in $AppList) {
            Write-Output "$app is Downloading..."
            choco install $app -y
            Write-Output "Installation is finished!"
        }
 }
    else {
        Write-Host "Apps are not going to be installed!"
        
        # Restart the script in a new PowerShell window
        $scriptPath = $PSCommandPath
        if ($scriptPath) {
            try {
                if (Get-Command pwsh -ErrorAction SilentlyContinue) {
                    # PowerShell 7
                    Start-Process pwsh -ArgumentList "-NoExit", "-File `"$scriptPath`""
                } else {
                    # Windows PowerShell 5.1
                    Start-Process powershell -ArgumentList "-NoExit", "-File `"$scriptPath`""
                }
            } catch {
                Write-Error "Error starting new PowerShell window: $_"
            }
        } else {
            Write-Host "Script path not found. Cannot restart."
        }

        # Exit current script
        exit   
    }

    
    # Stop Current Procces 
    exit
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
    $PredefinedApps = @("vscodium", "Onlyoffice", "Firefox")
    Install-RecommendedApps -AppList $PredefinedApps
} elseif ($choice -eq "2") {
    $PredefinedGameApps = @("steam", "ea-app", "ubisoft-connect", "heroic-games-launcher", "msiafterburner")
    Install-RecommendedApps -Applist $PredefinedGameApps
} elseif ($choice -eq "3") {
    Update-ChocoApps 
} elseif ($choice -eq "4") {
    Install-ChocoApp
} else {
    Write-Output "Invalid choice. Please restart the script and choose a valid option."
}