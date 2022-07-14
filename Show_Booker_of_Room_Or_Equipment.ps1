##Ask administrator is they have logged in to the Cloud Exchange

Write-Host "Have you connected to Cloud Exchange?"

##if_else statement in lack of solution/laziness for checking for connection status. O for not connected and 1 for already connected

$Connection = Read-Host -Prompt "Enter 0 for not connected or 1 for connected"

if ($Connection -eq 0 ) {

##Connect to Exchange Session
 
Connect-EXOPsession

##Please use the Alias for the room/equipment 

$Mailbox = Read-Host -Prompt "Enter the Alias of the mailbox.","Example: MeetingRoom2"

$Calendar = $Mailbox + ":\calendar"

Write-host "Setting the user Default to review the calendar"

##The final one-liner to enable some rights to the user Default.
 
Set-MailboxFolderPermission -Identity $Calendar -User Default -AccessRights reviewer

Write-Host "User who has book the calendar is now visible for" $Calendar

}

else {


##The same commands as above. Only you don't have to connect to a session first.

$Mailbox = Read-Host -Prompt "Enter the Alias of the mailbox.","Example: MeetingRoom2"

$Calendar = $Mailbox + ":\calendar"

Write-host "Setting the user Default to review the calendar"
 
Set-MailboxFolderPermission -Identity $Calendar -User Default -AccessRights reviewer

Write-Host "User who has book the calendar is now visible for" $Calendar


}

Pause
