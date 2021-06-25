Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
iwr -useb get.scoop.sh | iex

scoop install pwsh vim git sudo

Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

[Environment]::SetEnvironmentVariable('DOTFILES_ROOT', $env:DOTFILES_ROOT, 'User')
New-Item -ItemType SymbolicLink -Path ${env:DOTFILES_ROOT}\src\powershell\Microsoft.PowerShell_profile.ps1 -Target $PROFILE
New-Item -ItemType SymbolicLink -Path ${env:DOTFILES_ROOT}\src\git\gitconfig -Target $HOME\.gitconfig
New-Item -ItemType SymbolicLink -Path ${env:DOTFILES_ROOT}\src\git\gitmessage.txt -Target $HOME\.gitmessage.txt
New-Item -ItemType SymbolicLink -Path ${env:DOTFILES_ROOT}\src\vim\vimrc -Target $HOME\.vimrc
