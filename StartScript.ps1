Param ($action)

Switch ($action){
    "audioSwitch" { $script=$(Get-Location).Path+"\scripts\SwitchAudioOutput.ps1" }
}

Start-Process -FilePath powershell.exe $script -WindowStyle Hidden