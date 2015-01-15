#v1.02
#https://github.com/texhex/xteq5/wiki/_fwLinkScript


#This script requires PowerShell 4.0 or higher 
#requires -version 4.0

#Guard against common code errors
Set-StrictMode -version 2.0

#Terminate script on errors 
$ErrorActionPreference = 'Stop'

   if ($events -is [array]) { #if the return is no array, there was only one single event found
       
       if ($events.Count -gt 5) { 
          $Result.Data="Fail"
          $Result.Text="More than five errors were reported since the last boot"

          #Add the last entry to outoput
          write-output ($Result.Text)
          
          $event=Get-EventLog -LogName System -After $boottime -EntryType Error -Newest 1
          
          write-output "Newest error entry:"
          write-output ($event.Source + ": " + $event.Message)
       }

    }
   
} else {
