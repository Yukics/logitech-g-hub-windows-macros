# Create macro like: C:\Program Files\PowerShell\7\pwsh.exe
# args: -file "C:\Users\yuki\Documents\repos\windows-macros\SwitchAudioOutput.ps1"
#       -WindowStyle hidden

# Import module if not installs it: https://github.com/frgnca/AudioDeviceCmdlets 
try{
   Import-Module -Name AudioDeviceCmdlets   
}
catch {
   Install-PackageProvider NuGet -Force
   Set-PSRepository PSGallery -InstallationPolicy Trusted
   Install-Module -Name AudioDeviceCmdlets -Repository PSGallery -Force
   Import-Module -Name AudioDeviceCmdlets
}


$listOfAudioOutput = $(Get-AudioDevice -list | Where-Object { $_.Type -eq "Playback" })
$currentAudioOutput = $(Get-AudioDevice -playback)
$indexAudioOutput = $([array]::indexof($listOfAudioOutput.Index, $currentAudioOutput.Index) + 1)

if ($indexAudioOutput -eq $listOfAudioOutput.Count) {
   Set-AudioDevice -Index 1
}
else {
   Set-AudioDevice -Index $([int]$indexAudioOutput + 1)
}