# restore_adapter_identity.ps1
# Purpose: Restore adapter names based on MAC address mapping to ensure consistent identity across reboots
# Author: Lee + Copilot
# Semantic Tag: adapter-identity-restore

# Define MAC-to-name mapping
$adapterMap = @{
    "<MAC-ADDRESS-1>" = "<DESIRED-ADAPTER-NAME-1>"
    "<MAC-ADDRESS-2>" = "<DESIRED-ADAPTER-NAME-2>"
    "<MAC-ADDRESS-3>" = "<DESIRED-ADAPTER-NAME-3>"
}

# Loop through all network adapters
Get-NetAdapter | ForEach-Object {
    $mac = ($_.MacAddress).ToUpper()
    if ($adapterMap.ContainsKey($mac)) {
        $desiredName = $adapterMap[$mac]
        if ($_.Name -ne $desiredName) {
            Write-Host "Renaming adapter $($_.Name) with MAC $mac to $desiredName"
            Rename-NetAdapter -Name $_.Name -NewName $desiredName
        } else {
            Write-Host "Adapter $($_.Name) with MAC $mac already has correct name"
        }
    } else {
        Write-Host "No mapping found for adapter $($_.Name) with MAC $mac"
    }
}
######################################################################################################
#🧠 Notes for Contributors
#Replace <MAC-ADDRESS-X> with your adapter’s MAC in uppercase (e.g., 00-11-22-33-44-55)

#Replace <DESIRED-ADAPTER-NAME-X> with your preferred adapter name (e.g., WG-External, LAN-Primary)

#Run with admin privileges

#Use this script after reboots or interface reshuffles to restore adapter roles

#Optionally log each rename as a semantic trust event