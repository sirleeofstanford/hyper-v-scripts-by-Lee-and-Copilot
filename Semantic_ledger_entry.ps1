# semantic_ledger_entry.ps1
# Purpose: Log semantic recovery events to a local ledger file
# Author: Lee + Copilot
# Semantic Tag: ledger-entry

param (
    [Parameter(Mandatory=$true)]
    [string]$EventType,           # e.g., ipv6-static-mapping, adapter-identity-restore

    [Parameter(Mandatory=$true)]
    [string]$Description,         # e.g., "MAC-pinned IPv6 assigned to Hyper-V adapters"

    [Parameter(Mandatory=$false)]
    [string]$Actor = "<your-name-here>",  # e.g., Lee, Copilot, or team name

    [Parameter(Mandatory=$false)]
    [string]$LedgerPath = "$PSScriptRoot\semantic_ledger.txt"
)

# Generate timestamp
$timestamp = Get-Date -Format "yyyy-MM-ddTHH:mm:ss"

# Format entry
$entry = "$timestamp | semantic-event:$EventType | $Description | $Actor"

# Append to ledger
Add-Content -Path $LedgerPath -Value $entry

Write-Host "Logged semantic event:"
Write-Host $entry
#######################################
#.\semantic_ledger_entry.ps1 `
#  -EventType "ipv6-static-mapping" `
#  -Description "MAC-pinned IPv6 #assigned to Hyper-V adapters" `
#  -Actor "<Replace with yourself>"
#
#
#
#