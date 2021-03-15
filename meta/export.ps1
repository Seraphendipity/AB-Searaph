Set-Location (Split-Path $MyInvocation.MyCommand.Path -Parent)
$info = (Get-Content ../info.json) | ConvertFrom-Json -AsHashtable
$factorioModDir = Get-Content factorioModDir.txt
$exportName = $info["name"] + "_" + $info["version"]
$exportNameZip = $exportName + ".zip"
Set-Location ../releases/
git archive -o $exportNameZip HEAD | Copy-Item -Destination $factorioModDir