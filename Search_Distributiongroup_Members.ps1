###Exhange søgning. Script 1.0 Eerli Semsen
###Det kræver at du installerer modulerne for Exchange Online først.



###Check om man er tilsluttet til Exchange Online

Write-host "Exchange Online krævet, tislutter til Exchange Online..."

if(Get-ConnectionInformation){

Write-Host "Allerede tilsluttet til Exchange Online"

}

Else {
 
Connect-ExchangeOnline

Write-Host "Tilsluttet til Exchange Online"

}




###Loop. Så længe opgave ikke er 3 (afslut), så vil loop køre. 
while ($opgave -ne 3) {

###Tekst over valg af opgaver

###Du ændre farven efter dine ønsker
Write-host -ForegroundColor Green @"

1. Søg distributionsgruppe-medlemmer
2. Søg og gem distributiongruppe-medlemmer som csv 
3. Afslut 

"@

###Input fra bruger

$opgave = Read-Host -Prompt "vælg opgave"


switch ($opgave)

{

###Søgning. Efter Select kan du tilføje flere parametre. Separeres med komma. Hvis du vil have alle parametre synlige, så skriver du bare "fl" efter pipe og intet andet.

1 { write-host "Skriv navn på distributionsgruppe"

$tekst = Read-Host "Skriv navn på gruppe"

$result = Get-DistributionGroupMember -Identity $tekst | select FirstName, LastName, DisplayName, PrimarySmtpAddress

$result | Out-Host




}

###Søgning igen, men gem i CSV. Skriv den fulde sti og navn hvor du vil gemme den.

2 { write-host "Skriv navn på distributionsgruppe"

$tekst = Read-Host "Skriv navn på gruppe"

$result = Get-DistributionGroupMember -Identity $tekst | select FirstName, LastName, DisplayName, PrimarySmtpAddress 

$result | Out-Host

$path = Read-Host "Hvor vil du gemmme? Husk filformatet csv til sidst. Ex: C:\temp\test.csv"

$result |  Export-Csv -Encoding UTF8 -Path $path

Write-Host -ForegroundColor Green "Filen er nu gemt i destinationen"



 }


###Afslut

3 {write-host -ForegroundColor Cyan "Afslutter script"}

###Advarsel hvis man ikke vælger noget fra listen

default{ Write-Warning "vælg noget fra listen"}

}


}


###End of Loop. resetter value

$opgave = 0



