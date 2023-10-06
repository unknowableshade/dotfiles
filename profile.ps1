oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/catppuccin_frappe.omp.json" | Invoke-Expression

Import-Module "C:\Development\Microsoft Visual Studio\2022\Community\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
Enter-VsDevShell e0c7de85 -SkipAutomaticLocation -DevCmdArguments "-arch=x64 -host_arch=x64"
