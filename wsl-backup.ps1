<#
    .SYNOPSIS
        WSL backup script.
    .DESCRIPTION
        Creates a backup for the personal wsl instance (default: Ubuntu).
        Requires wsl to be installed.
    .EXAMPLE
        PS> wsl-backup myUbuntu
        Will backup the distro instance named 'myUbuntu'.
#>
param (
    # Name of the distribution to be backed up.
    [string] $distro
)
# check for default param (ToDo: remove redundancy)
if (!$distro) {
    $choice = Read-Host "Param '-distro' not provideed. Continue wirh default (Ubuntu)? [y/n]"
    if ($choice -eq 'y') {
        $distro = 'Ubuntu'
    } else {
        return
    }
}

# export path (by convention)
$exportPath = Join-Path -Path $([System.Environment]::GetFolderPath('MyDocuments')) -ChildPath 'wsl'
# file name including date, host and distro
$tarFileName = "$($(Get-Date).ToString('yyyy-MM-dd'))_$(hostname)_$($distro).tar"
$exportFileName = Join-Path -Path $exportPath -ChildPath $tarFileName
# run export
Write-Output "Exporting to '$exportFileName'..."
wsl --export $distro $exportFileName

# ToDo: keep only the last xxx per Hostname & Distro
