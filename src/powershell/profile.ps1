Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme wopian

Set-Alias vi vim
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

