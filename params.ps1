<#
    .SYNOPSIS
        Params validator for WSL maintenance scripts.
    .DESCRIPTION
        Provides param prompts and validation based on data.
#>
function Confirm-Distro {
    <#
        .SYNOPSIS
            Validats the distribution provided.
    #>
    param (
        # Name of the distribution to be processed.
        [string] $distro
    )
    return $distro
}
function Get-RestoreToPath {
    <#
        .SYNOPSIS
            Returns the location of the a path, the wsl distro should be restored to ().
    #>
    return 'test'
}
