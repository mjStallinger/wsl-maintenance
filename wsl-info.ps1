<#
    .SYNOPSIS
        WSL info script.
    .DESCRIPTION
        Provides information about wsl instances in format of PowerShell objects.
#>
function Get-DistributionInfo() {
    # verbose list all installed distributions (as of 2023-02-10, this is 'BigEndianUnicode'),
    #   therefor, replace the BOM
    $content = (wsl -l -v) -replace '\x00', ''
    $firstLine = $true
    $output = $content | ForEach-Object {
        if ($_.Trim()) {
            $line = $_ -replace '(\s)+', ','
            if ($firstLine) {
                $line = "DEFAULT$line"
                $firstLine = $false
            }
            $line
        }
    }
    Write-Output '--------------'
    Write-Output $output
}

# MORE SECURE VARIANT!
# $console = ([console]::OutputEncoding)
# [console]::OutputEncoding = New-Object System.Text.UnicodeEncoding
# $distroArray = (wsl -l -v | Select-String <#-SimpleMatch 'Ubuntu'#>) #-split '\s+'
# [console]::OutputEncoding = $console
# Write-Output $distroArray

Get-DistributionInfo
