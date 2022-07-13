Get-ADUser -Filter * -SearchBase "" | 
ForEach-Object {
    Set-ADUser $_.SamAccountName -Add @{ProxyAddresses="smtp:$($_.SamAccountName)@dovista.com"} -WhatIf
}