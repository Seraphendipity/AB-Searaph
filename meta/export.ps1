# Set Location to Project Base
Set-Location (Split-Path (Split-Path $MyInvocation.MyCommand.Path))

# Use Factorio Mod Directory (WIP)
#	Grabs the directory name from a file named 'factorioModDir.txt`
#	in the meta directory (same as this script).
#$factorioModDirFile = ./meta/factorioModDir.txt
#if (./meta)
#$factorioModDir = Get-Content ./meta/factorioModDir.txt

# Create Zip Name
#	Generates dynamically from info.json (due to need of version no.)
$info = (Get-Content ./main/info.json) | ConvertFrom-Json -AsHashtable
$exportName = $info["name"] + "_" + $info["version"]
$exportNameZip = $exportName + ".zip"

# Archive to Releases
#	The generated .zip file contains what is actually uploaded to
#	Factorio's mod portal:
#	https://mods.factorio.com/mods/new
#	https://mods.factorio.com/mod/MODNAME/downloads/edit
git archive -o $exportNameZip HEAD
#Copy-Item -Path $exportNameZip -Destination $factorioModDir
Move-Item -Path $exportNameZip -Destination ./releases/