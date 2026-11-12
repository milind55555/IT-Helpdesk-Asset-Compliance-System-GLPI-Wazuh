<#
.SYNOPSIS
    Collects basic Windows endpoint inventory into a CSV file.
.DESCRIPTION
    Read-only inventory collector for a lab. It does not install software,
    change configuration, or transmit data. Review the CSV before importing it
    into GLPI because serial numbers, hostnames, and network details can be sensitive.
.PARAMETER OutputPath
    Destination CSV file. Defaults to .\endpoint-inventory.csv
#>
[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$OutputPath = ".\endpoint-inventory.csv"
)

$ErrorActionPreference = 'Stop'

try {
    $computer = Get-CimInstance -ClassName Win32_ComputerSystem
    $os = Get-CimInstance -ClassName Win32_OperatingSystem
    $bios = Get-CimInstance -ClassName Win32_BIOS
    $processor = Get-CimInstance -ClassName Win32_Processor | Select-Object -First 1
    $disks = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
    $network = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Filter "IPEnabled=True"

    $ipv4 = @(
        $network | ForEach-Object {
            $_.IPAddress | Where-Object { $_ -match '^\d{1,3}(\.\d{1,3}){3}$' }
        }
    ) -join ';'

    $diskSummary = @(
        $disks | ForEach-Object {
            "{0}: {1:N1}GB total / {2:N1}GB free" -f $_.DeviceID, ($_.Size / 1GB), ($_.FreeSpace / 1GB)
        }
    ) -join '; '

    $record = [PSCustomObject]@{
        CollectedAt       = (Get-Date).ToString('o')
        Hostname          = $env:COMPUTERNAME
        Domain            = $computer.Domain
        Manufacturer      = $computer.Manufacturer
        Model             = $computer.Model
        SerialNumber      = $bios.SerialNumber
        OperatingSystem   = $os.Caption
        OSVersion         = $os.Version
        BuildNumber       = $os.BuildNumber
        LastBoot          = $os.LastBootUpTime
        CPU               = $processor.Name
        LogicalProcessors = $computer.NumberOfLogicalProcessors
        TotalMemoryGB     = [Math]::Round($computer.TotalPhysicalMemory / 1GB, 2)
        IPv4Addresses     = $ipv4
        Disks             = $diskSummary
    }

    $parent = Split-Path -Parent $OutputPath
    if ($parent -and -not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }

    $record | Export-Csv -LiteralPath $OutputPath -NoTypeInformation -Encoding UTF8
    Write-Host "Inventory exported to: $((Resolve-Path -LiteralPath $OutputPath).Path)" -ForegroundColor Green
    Write-Warning 'Review and redact serial numbers, hostnames, and network details before sharing or committing this file.'
}
catch {
    Write-Error "Inventory collection failed: $($_.Exception.Message)"
    exit 1
}
