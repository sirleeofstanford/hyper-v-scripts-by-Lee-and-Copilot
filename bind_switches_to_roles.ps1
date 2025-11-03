# bind_switches_to_roles.ps1
# Purpose: Ensure Hyper-V virtual switches are bound to the correct physical adapters based on MAC identity
# Author: Lee + Copilot
# Semantic Tag: switch-role-binding

# Define switch-to-adapter MAC mapping
$switchMap = @{
    "<VIRTUAL-SWITCH-NAME-1>" = "<MAC-ADDRESS-1>"
    "<VIRTUAL-SWITCH-NAME-2>" = "<MAC-ADDRESS-2>"
    "<VIRTUAL-SWITCH-NAME-3>" = "<MAC-ADDRESS-3>"
}

# Loop through each switch mapping
foreach ($switch in $switchMap.Keys) {
    $targetMac = $switchMap[$switch].ToUpper()

    # Find the adapter with the matching MAC
    $adapter = Get-NetAdapter | Where-Object { $_.MacAddress.ToUpper() -eq $targetMac }

    if ($adapter) {
        Write-Host "Binding switch '$switch' to adapter '$($adapter.Name)' with MAC $targetMac"
        Set-VMSwitch -Name $switch -NetAdapterName $adapter.Name
    } else {
        Write-Host "No adapter found with MAC $targetMac for switch '$switch'"
    }
}
#################################################################################################
#🧠 Notes for Contributors
#Replace <VIRTUAL-SWITCH-NAME-X> with your Hyper-V switch names (e.g., External, Internal, Management)

#Replace <MAC-ADDRESS-X> with your adapter’s MAC in uppercase (e.g., 00-11-22-33-44-55)

#Run with admin privileges

#Use this script after adapter reshuffles or switch misbindings

#Optionally log each binding as a semantic trust event