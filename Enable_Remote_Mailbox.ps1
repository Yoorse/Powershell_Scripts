$Username = Read-Host -Prompt "Enter the username"

$RemoteRoutingAddress = $username + "@domain.mail.on.microsoft.com"

Enable-RemoteMailbox $Username -RemoteRoutingAddresse $RemoteRoutingAddress

$PrimarySMTP = Read-Host -Prompt "Enter the primary STMP"

Set-RemoteMailbox $Username -PrimarySmtpAddress $PrimarySMTP

$NewPwd = Read-Host -AsSecureString -Prompt "Type password for user"

Set-ADAccountPassword -Identity $Username -NewPassword $NewPwd -Reset 

Write-Host "The user is enabled as remotemailbox and password has been reset." 




