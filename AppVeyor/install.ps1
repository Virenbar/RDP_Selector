$content = Get-Content "RDP_Selector\My Project\AssemblyInfo.vb"
$match = [regex]::Match($content, 'AssemblyVersion\(\"(.+?)\"\)')
if ($match.Success)
{
    $env:AppVersion = $match.Groups[1].Value
    Update-AppveyorBuild -Version "$env:AppVersion-$env:APPVEYOR_BUILD_NUMBER"
}
else
{
    $env:AppVersion = "1.0.0"
}