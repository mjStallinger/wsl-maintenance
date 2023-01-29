# Creates a backup for the personal wsl instance (Ubuntu).
# Requires wsl to be installed.
param ($distro = 'Ubuntu')
# export path (by convention) 
$exportPath = Join-Path -Path $([System.Environment]::GetFolderPath('MyDocuments')) -ChildPath 'wsl'
# file name including date, host and distro
$tarFileName = "$($(Get-Date).ToString('yyyy-MM-dd'))_$(hostname)_$($distro).tar"
$exportFileName = Join-Path -Path $exportPath -ChildPath $tarFileName;
# run export
Write-Output "Exporting to '$exportFileName'..."
wsl --export $distro $exportFileName
