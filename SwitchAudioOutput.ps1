# Import module if not installs it 
try{
    Import-Module -Name AudioDeviceCmdlets
} catch {
    Install-PackageProvider NuGet -Force
    Set-PSRepository PSGallery -InstallationPolicy Trusted
    Install-Module -Name AudioDeviceCmdlets -Repository PSGallery
    Import-Module -Name AudioDeviceCmdlets
}

$listOfAudioOutput = $(Get-AudioDevice -list | Where-Object {$_.Type -eq "Playback"})
$currentAudioOutput = $(Get-AudioDevice -playback)
$indexAudioOutput = $([array]::indexof($listOfAudioOutput.Index,$currentAudioOutput.Index)+1)

if($indexAudioOutput -eq $listOfAudioOutput.Count){
   Set-AudioDevice -Index 1
} else {
   Set-AudioDevice -Index $([int]$indexAudioOutput+1)
}
