# Choco App Installer

This PowerShell script is designed to simplify application management using Chocolatey.  
With this script, you can:
1. Install a predefined list of recommended applications.
2. Update all Chocolatey-installed applications.
3. Install a single application based on user input.

---

## About the Creator

Hi there! 👋 I’m an amateur developer with limited experience in scripting and coding. This project is one of my first attempts at creating something useful for others. Since I have a busy schedule, I might not be able to update or improve this script regularly.  

However, I’m very open to feedback, suggestions, and contributions! If you find any bugs or have ideas for improvements, feel free to open an issue or submit a pull request. Your support means a lot! 😊

---

## How to Use
1. Ensure that Chocolatey is installed on your system.
2. Open an elevated Powershell window.
3. Run the code "Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass".
4. Go to the location of **.ps1** file and run ".\Chocolatey-App-Installer.ps1" command.
5. Choose a number and follow the instructions.
6. Or you can easily type: 
```Set-ExecutionPolicy Bypass -Scope Process -Force; irm https://raw.githubusercontent.com/Usta-Cagri/Chocolatey-App-Installer/main/Chocolatey-App-Installer.ps1 | iex ```
on an elevated powershell window if you've installed chocolatey package manager but soon this script will automate that. (This is the recommended way because it doesn't install anything to your disk and if you have a bit of terminal knowledge you can add this to you $PROFILE folder) 

---

## Features
- **Install recommended apps:** Downloads a predefined list of applications in bulk.
- **Update all applications:** Keeps all your installed apps up-to-date.
- **Install a single app:** Allows the user to specify an app for installation.

---

## Requirements
- Chocolatey installed on your system.
- Windows operating system.

---

## Contributing
This project is a work in progress. If you'd like to help me improve it, here’s how you can contribute:
- Report bugs via the **Issues** section.
- Suggest features or improvements.
- Submit a pull request with your changes.

Thank you for checking out my project! 💙

---

## License
This project is licensed under the MIT License. Feel free to use, modify, and distribute it.
