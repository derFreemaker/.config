function Get-GitStatus { & git status -sb $args }
function Get-GitCommit { & git commit -ev $args }
function Get-GitAdd { & git add --all $args }
function Get-GitTree { & git log --graph --oneline --decorate $args }
function Get-GitPush { & git push $args }
function Get-GitPull { & git pull --rebase $args }
function Get-GitFetch { & git fetch $args }
function Get-GitCheckout { & git checkout $args }
function Get-GitBranch { & git branch $args }
function Get-GitRemote { & git remote -v $args }
function Update-GitSubmodules { & git submodule update --remote --recursive $args }
function Restore-Git { & git restore $args }
function Git-Cherry-Pick { & git cherry-pick $args }
New-Alias -Name gs -Value Get-GitStatus -Force
New-Alias -Name gc -Value Get-GitCommit -Force
New-Alias -Name ga -Value Get-GitAdd -Force
New-Alias -Name gt -Value Get-GitTree -Force
New-Alias -Name gps -Value Get-GitPush -Force
New-Alias -Name gpl -Value Get-GitPull -Force
New-Alias -Name gf -Value Get-GitFetch -Force
New-Alias -Name gco -Value Get-GitCheckout -Force
New-Alias -Name gb -Value Get-GitBranch -Force
New-Alias -Name gr -Value Get-GitRemote -Force
New-Alias -Name gsmu -Value Update-GitSubmodules -Force
New-Alias -Name grst -Value Restore-Git -Force
New-Alias -Name gcp -Value Git-Cherry-Pick -Force

# bazel
function Bazel-Build { & bazel build $args }
function Bazel-Run { & bazel run $args }
function Bazel-Clean { & bazel clean $args }
New-Alias -Name bbuild -Value Bazel-Build -Force
New-Alias -Name brun -Value Bazel-Run -Force
New-Alias -Name bclean -Value Bazel-Clean -Force

# Neovim
New-Alias -Name vim -Value nvim -Force

Import-Module -Name Terminal-Icons

if ($null -eq (Get-Module PSReadLine)) {
    Import-Module -Name PSReadLine
}

if ([System.IO.File]::Exists("C:\Program Files\PowerToys\WinUI3Apps\..\WinGetCommandNotFound.psd1")) {
    Import-Module "C:\Program Files\PowerToys\WinUI3Apps\..\WinGetCommandNotFound.psd1"
}

oh-my-posh init pwsh --config "$env:USERCONFIG_FREEMAKER/pwsh/oh-my-posh.toml" | Invoke-Expression
