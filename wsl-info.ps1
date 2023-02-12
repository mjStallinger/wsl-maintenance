<#
    .SYNOPSIS
        WSL info script.
    .DESCRIPTION
        Provides information about wsl instances in format of PowerShell object tables.
#>


<#
    .SYNOPSIS
        Invokes wsl with the params passed.
    .DESCRIPTION
        As of 2023-02-10, wsl stdout is encoded in 'BigEndianUnicode'.
        Therefor, this function executes wsl commands within temporarily modified output encoding.
#>
function Invoke-WslUnicodeEncoded() {
    param (
        [String[]]
        # Params to be passed to wsl when invoked.
        $params
    )
    # temporarily set OutputEncoding
    $consoleEncoding = [Console]::OutputEncoding
    [Console]::OutputEncoding = [System.Text.Encoding]::Unicode
    try {
        $output = wsl $params
    } finally {
        [Console]::OutputEncoding = $consoleEncoding
    }
    Write-Output $output
}

<#
    .SYNOPSIS
        Returns an object table containing info about wsl distributions.
    .DESCRIPTION
        Table-format: DEFAULT, NAME, STATUS, VERSION;
#>
function Get-WslDistributionInfo() {
    # verbose list all installed distributions
    $content = Invoke-WslUnicodeEncoded(@('-l', '-v'))
    $fixHeader = $true
    $output = $content | ForEach-Object {
        if (![String]::IsNullOrWhitespace($_)) {
            $row = $_ -replace '(\s)+', ',' # replaces multiple spaces by commas
            if ($fixHeader) {
                $row = "DEFAULT$row" # append Header for 'DEFAULT'
                $fixHeader = $false
            }
            return $row
        }
    }
    return $output | ConvertFrom-Csv
}

Get-WslDistributionInfo
