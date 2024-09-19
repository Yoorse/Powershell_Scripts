###Azure søgning. Script 1.0 Eerli Semsen
###Det kræver at du installerer modulerne for azuread først.



###Check om man er tilsluttet til AzureAD Online

If(!$connection){$connection = connect-azuread}


Else {
 
Connect-AzureAD

Write-Host "Tilsluttet til AzureAD"

}




###Loop. Så længe opgave ikke er 3 (afslut), så vil loop køre. 
while ($opgave -ne 3) {

###Tekst over valg af opgaver

Write-host -ForegroundColor Green @"

1. Søg i Azure
2. Søg og gem som csv 
3. Afslut 

"@

###Input fra bruger

$opgave = Read-Host -Prompt "vælg opgave"

switch ($opgave)

{

###Søgning. Efter Select kan du tilføje flere parametre. Separeres med komma. Her har jeg bare valgt Displayname, UPN, Jobtitle og afdeling.

1 { write-host "Skriv navn, afdeling eller andet"

$tekst = Read-Host "Hvad vil du søge?"

$result = Get-AzureADUser -SearchString $tekst | Select DisplayName, UserPrincipalName, Jobtitle, Department

$result | Out-Host


}

###Søgning igen, men gem i CSV. Skriv den fulde sti og navn hvor du vil gemme den.

2 { write-host "Skriv navn, afdeling eller andet"

$tekst = Read-Host "Hvad vil du søge?"

$result = Get-AzureADUser -SearchString $tekst | Select DisplayName, UserPrincipalName, Jobtitle, Department 

$result | Out-Host 

$path = Read-Host "Hvor vil du gemmme? Husk filformatet csv til sidst. Ex: C:\temp\test.csv"

$result |  Export-Csv -Encoding UTF8 -Path $path

Write-Host -ForegroundColor Green "Filen er nu gemt i destinationen"



 }


###Afslut

3 {write-host -ForegroundColor Cyan "Afslutter script"}


default{ Write-Warning "vælg noget fra listen"}

}


}


###End of Loop. resetter value

$opgave = 0



