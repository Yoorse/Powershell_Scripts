Add-Type -AssemblyName System.Windows.Forms
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.Filter = "CSV files (*.csv)|*.csv|All files (*.*)|*.*"
$OpenFileDialog.Title = "Choose your CSV-File"
$null = $OpenFileDialog.ShowDialog()
$csvPath = $OpenFileDialog.FileName


###filtrates empty columns. Add or remove columns. Should be enclosed by '' ex: ($_.'apples') 
$filfiltrering = Import-Csv -Path $csvPath -Delimiter ";" -Encoding UTF8 | Where-Object { 
    ($_.(insert_column_here) -match '^\s*$') -or 
    ($_.(insert_column_here) -match '^\s*$') -or
    ($_.(insert_column_here) -match '^\s*$')
} 
    

###Show empty columns or 
if ($filfiltrering.Count -gt 0) {
    Write-Host "These rows needs to be filled.:"
    $filfiltrering | Format-table | Out-Host 

} else {
    
    Write-Host -ForegroundColor Green "All rows are filled."

}
