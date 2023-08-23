###Here is an example how to export a large mailbox into three different PST-files based on dates.


###This one will export all mails before 2019
New-MailboxExportRequest -ContentFilter {(Received -lt '01/01/2019')} -Mailbox "NAME" -Filepath \\server\pst\export1.pst -
###This one will export all mails between 2019-2021
New-MailboxExportRequest -ContentFilter {(Received -gt '01/01/2019')-and (Received -lt '01/01/2021')} -Mailbox "NAME" -Filepath \\server\pst\export2.pst 
###This one will export all mails after 2021
New-MailboxExportRequest -ContentFilter {(Received -gt '01/01/2021')} -Mailbox "NAME" -Filepath \\server\pst\export3.pst 
