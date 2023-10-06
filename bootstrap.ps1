# Windows Teminal Config
New-Item -ItemType SymbolicLink -Path "$HOME\\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "$PSScriptRoot\\terminal.json" -Force

# Oh My Posh
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1')) # Download & Install
oh-my-posh font install # NerdFont
New-Item -ItemType Directory -Path (Split-Path -Parent $PROFILE) -Force # Create Profile Directory
New-Item -ItemType SymbolicLink -Path "$PROFILE" -Target "$PSScriptRoot\\profile.ps1" -Force # Link profile.ps1

New-Item -ItemType SymbolicLink -Path "$HOME\\.gitconfig" -Target "$PSScriptRoot\\.gitconfig" -Force # Link .gitconfig

Write-Host -NoNewLine "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho, IncludeKeyDown")
