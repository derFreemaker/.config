. .\utils.ps1

Write-Host "setting up enviorment variables..."

# user config folder
$env:USERCONFIG_FREEMAKER = "$env:USERPROFILE\.config"
Set-ENV -VariableName "USERCONFIG_FREEMAKER" -Value $env:USERCONFIG_FREEMAKER

# user scripts
# Add-ENV -VariableName "Path" -Value "$env:USERCONFIG_FREEMAKER\scripts"
# $env:PATH = "$env:PATH;$env:USERCONFIG_FREEMAKER\scripts"

. ".\pwsh\setup.ps1"

. ".\glazewm\setup.ps1"

# . ".\nvim\setup.ps1"

Write-Host "reloading profile..."
Invoke-Expression ". $PROFILE"
