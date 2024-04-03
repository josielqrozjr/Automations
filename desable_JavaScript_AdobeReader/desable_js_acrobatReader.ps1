#-----------------------------------------------------------------------------
# Script to disable JavaScript execution in Acrobat Reader DC through .pdf files
# Developer by: Queiroz JR
# Date: 4/2/2024
#-----------------------------------------------------------------------------
  
# Program path
$programLocation = "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe"

# Check if the program exists in the specified path
if (Test-Path $programLocation)
{
    # Data name to be changed
    $labelName = "bEnableJS"

    # Store current value
    $currentValue = Get-ItemProperty -Path "HKCU:SOFTWARE\Adobe\Acrobat Reader\DC\JSPrefs" -Name $labelName

    # Check if it is disabled
    if ($currentValue.$labelName -eq 0)
    {
        Write-Host "A opção já está desabilitada. Finalizando o programa!"
        Start-Sleep -Seconds 3
    }
    else
    {
        # Change value to 0
        Set-ItemProperty -Path "HKCU:SOFTWARE\Adobe\Acrobat Reader\DC\JSPrefs" -Name $labelName -Value 0

        Write-Host "Valor modificado para 0, JS desabilitado no Adobe Reader."
        Start-Sleep -Seconds 3
    }
}
else
{Write-Host "O arquivo não foi encontrado! Verifique o caminho do arquivo."}
