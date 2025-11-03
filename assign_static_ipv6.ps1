# assign_static_ipv6.ps1
# Purpose: Assign static IPv6 addresses to Hyper-V adapters based on MAC-derived identity
# Author: Lee + Copilot
# Semantic Tag: ipv6-static-mapping

# Define adapter MAC-to-IPv6 mapping
$adapterMap = @{
    "<MAC-ADDRESS-1>" = "<STATIC-IPV6-ADDRESS-1>"
    "<MAC-ADDRESS-2>" = "<STATIC-IPV6-ADDRESS-2>"
    "<MAC-ADDRESS-3>" = "<STATIC-IPV6-ADDRESS-3>"
}

# Loop through all network adapters
Get-NetAdapter | ForEach-Object {
    $mac = ($_.MacAddress).ToUpper()
    if ($adapterMap.ContainsKey($mac)) {
        $ipv6 = $adapterMap[$mac]
        Write-Host "Assigning $ipv6 to adapter $($_.Name) with MAC $mac"
        New-NetIPAddress -InterfaceAlias $_.Name -IPAddress $ipv6 -PrefixLength 64 -AddressFamily IPv6
    } else {
        Write-Host "No static IPv6 mapping found for adapter $($_.Name) with MAC $mac"
    }
}
#############################################################################################################
#🧠 Notes for Contributors
#Replace <MAC-ADDRESS-X> with your adapter’s MAC in uppercase (e.g., 00-11-22-33-44-55)

#Replace <STATIC-IPV6-ADDRESS-X> with your desired static IPv6 (e.g., fd00::1)

#Run with admin privileges

#Optionally tag each run in your semantic trust ledger