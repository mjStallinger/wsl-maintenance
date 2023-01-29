# Restores the most recent backup of the personal wsl instance (mjUbuntu) to $env:USERPROFILE ??
param ($distro = 'mjUbuntu')
# restore path (by convention) 
$restorePath = Join-Path -Path $([System.Environment]::GetFolderPath('MyDocuments')) -ChildPath 'wsl'
$importFileName = 'findLatestTARfileWithDistroNameInPath';

# remove distro, if exists AND IF IMPORT-FILE FOUND!
# wsl --unregister $distro

# run import
Write-Output "Importing from '$importFileName' to ..."

# wsl --import $distro 

# set default
# wsl --setdefault $distro
