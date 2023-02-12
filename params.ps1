<#
    .SYNOPSIS
        Params validator for WSL maintenance scripts.
    .DESCRIPTION
        Provides param prompts and validation based on data.
#>


. $PSScriptRoot\wsl-info.ps1

<#
    .SYNOPSIS
        Validats the distribution provided.
    .DESCRIPTION
        If distro is not set or does not exist, the user is prompted to choose one.
#>
function Confirm-WslDistro {
    param (
        # Name of the distribution to be processed.
        [string] $distro
    )
    $distros = Get-WslDistributionInfo | Select-Object 'NAME'
    if ([String]::IsNullOrWhitespace($distro) -or !$distros.Contains($distro)) {


    }
    return $distro
}
function Get-RestoreToPath {
    <#
        .SYNOPSIS
            Returns the location of the a path, the wsl distro should be restored to ().
    #>
    return 'test'
}

# fixme: remove!
$distros = Confirm-WslDistro($distro)
Write-Output $distros