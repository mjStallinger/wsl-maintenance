<#
    .SYNOPSIS
        WSL restore script.
    .DESCRIPTION
        Restores the most recent backup of the personal wsl instance (default: Ubuntu) to $env:LOCALAPPDATA.
        Requires wsl to be installed.
    .EXAMPLE
        PS> wsl-restore myUbuntu
        Will restore the most recent backup file for distro instance named 'myUbuntu'.
#>
param (
    # Name of the distribution to be restored.
    [string] $distro
)
# check for default param (ToDo: remove redundancy)
. $PSScriptRoot\params.ps1

Confirm-Distro($distro)

# restore path (by convention)
# mkDir
$restorePath = Join-Path -Path $([System.Environment]::GetFolderPath('MyDocuments')) -ChildPath "wsl + $distro"
$importFileName = 'findLatestTARfileWithDistroNameInPath'

# remove distro, if exists AND IF IMPORT-FILE FOUND!
# wsl --unregister $distro

# run import
Write-Output "Importing from '$importFileName' to $restorePath"

# wsl --import Ubuntu c:\Users\mj\AppData\Local\wsl c:\Users\mj\OneDrive\Data\wsl\2023-01-29_Maja_Ubuntu.tar

# set default
# wsl --setdefault $distro
