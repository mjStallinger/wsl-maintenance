# Restores the most recent backup of the personal wsl instance (mjUbuntu) to $env:USERPROFILE ??
param ($distro = 'mjUbuntu')
# restore path (by convention) 
$restorePath = Join-Path -Path $([System.Environment]::GetFolderPath('MyDocuments')) -ChildPath 'wsl'
$importFileName = 'findLatestTARfileWithDistroNameInPath';

# remove distro, if exists AND IF IMPORT-FILE FOUND!
# wsl --unregister $distro

# run import
Write-Output "Importing from '$importFileName' to ..."

# wsl --import Ubuntu c:\Users\mj\AppData\Local\wsl c:\Users\mj\OneDrive\Data\wsl\2023-01-29_Maja_Ubuntu.tar

# set default
# wsl --setdefault $distro
