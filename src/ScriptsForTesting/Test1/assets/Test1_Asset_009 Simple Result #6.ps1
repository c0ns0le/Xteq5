#This script requires PowerShell 4.0 or higher 
#requires -version 4.0

#Guard against common code errors
Set-StrictMode -version 2.0

#Terminate script on errors 
$ErrorActionPreference = 'Stop'


$myReturn = @{Name = "Name of this asset"; Data = "My Result"; Text = "Some explanation"}
$myReturn