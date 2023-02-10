<#
    .SYNOPSIS
        WSL info script.
    .DESCRIPTION
        Provides information about wsl instances in format of PowerShell objects.
#>


<#
    .SYNOPSIS
        Invokes the scriptblock passed.
    .DESCRIPTION
        As of 2023-02-10, wsl stdout is encoded in 'BigEndianUnicode'.
        Therefor, this function executes wsl commands within modified output encoding.
#>
function Invoke-Wsl() {
    param (
        [scriptblock]
        # Scriptblock to be invoked within changed encoding.
        $scriptBlock
    )
    # temporarily set OutputEncoding
    $consoleEncoding = ([console]::OutputEncoding)
    [console]::OutputEncoding = New-Object System.Text.UnicodeEncoding
    $output = Invoke-Command($scriptBlock)
    [console]::OutputEncoding = $consoleEncoding
    Write-Output $output
}

<#
    .SYNOPSIS
        Returns data object containing info about wsl distributions.
    .DESCRIPTION
        Table-format: DEFAULT, NAME, STATUS, VERSION;
#>
function Get-DistributionInfo() {
    # verbose list all installed distributions
    $content = Invoke-Wsl({ wsl -l -v })
    if ($null -ne $content) {
        $firstLine = $true
        $output = $content | ForEach-Object {
            if ($_.Trim()) {
                $line = $_ -replace '(\s)+', ',' # replaces multiple spaces by commas
                if ($firstLine) {
                    $line = "DEFAULT$line" # append Header for 'DEFAULT'
                    $firstLine = $false
                }
                return $line
            }
        }
        return $output | ConvertFrom-Csv
    } else {
        return $null
    }
}

$test = Get-DistributionInfo
Write-Output $test
